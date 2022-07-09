local ReplicatedStorage = game:GetService('ReplicatedStorage')
local RunService = game:GetService('RunService')
local UserInputService = game:GetService('UserInputService')
local CollectionService = game:GetService('CollectionService')

local Matter = require(ReplicatedStorage.Packages.Matter)
local Rewire = require(ReplicatedStorage.Packages.Rewire)
local Plasma = require(ReplicatedStorage.Packages.Plasma)
local ClientComponents = require(ReplicatedStorage.Client.Components)


local function BuildDebugger(world): any
	local debugger = Matter.Debugger.new(Plasma)

	debugger.authorize = function(player: Player)
		if player.UserId == 93428451 then
			return true
		end
	end

	if RunService:IsClient() then
		debugger.findInstanceFromEntity = function(id)
			if not world:contains(id) then return end

			local model = world:get(id, ClientComponents.Model)

			return if model then model.Instance else nil
		end

		UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.F4 then
				debugger:toggle()
			end
		end)
	end

	return debugger
end


local function StartMatter(container: Instance): (any, {})
	local world = Matter.World.new()
	local debugger = BuildDebugger(world)
	local widgets = debugger:getWidgets()
	local state = {}
	local loop = Matter.Loop.new(world, state, widgets)
	local reloader = Rewire.HotReloader.new()

	debugger:autoInitialize(loop)

	local firstRunSystems = {}
	local systemsByModule = {}

	local function addSystemModule(base: ModuleScript)
		reloader:listen(base, function(module: ModuleScript)
			local system = require(module)

			if firstRunSystems then
				table.insert(firstRunSystems :: {}, system)
			elseif systemsByModule[base] then
				loop:replaceSystem(systemsByModule[base], system)
			else
				loop:scheduleSystem(system)
			end

			systemsByModule[base] = system
		end, function() end)
	end

	local function removeSystemModule(base: ModuleScript)
		if not systemsByModule[base] then return end

		loop:evictSystem(systemsByModule[base])
		systemsByModule[base] = nil
	end

	for _, des in container:GetDescendants() do
		if des:IsA('ModuleScript') then
			addSystemModule(des)
		end
	end

	container.DescendantAdded:Connect(function(des: Instance)
		if CollectionService:HasTag(des, 'RewireClonedModule') then return end

		if des:IsA('ModuleScript') then
			addSystemModule(des)
		end
	end)

	container.DescendantRemoving:Connect(function(des: Instance)
		if CollectionService:HasTag(des, 'RewireClonedModule') then return end

		if des:IsA('ModuleScript') then
			removeSystemModule(des)
		end
	end)

	loop:scheduleSystems(firstRunSystems)
	firstRunSystems = nil

	loop:begin({
		default = RunService.Heartbeat,
		RenderStepped = if RunService:IsClient() then RunService.RenderStepped else nil,
	})

	return world, state
end


return StartMatter
