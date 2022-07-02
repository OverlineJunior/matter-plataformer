local UserInputService = game:GetService('UserInputService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Matter = require(ReplicatedStorage.Packages.Matter)
local Components = require(ReplicatedStorage.Client.Components)

local Player = Components.Player

local canJump = true


local function DoubleJump(world)
    for _, plr in world:query(Player) do
        local char = plr.Instance.Character
        local hum: Humanoid? = if char then char:FindFirstChild('Humanoid') else nil

        if not hum then continue end

        for _, input: InputObject, gameProcessed: boolean in Matter.useEvent(UserInputService, 'InputBegan') do
            if gameProcessed then continue end

            if input.KeyCode == Enum.KeyCode.Space
                and hum.FloorMaterial == Enum.Material.Air
                and canJump
            then
                canJump = false
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end

        for _ in Matter.useEvent(hum, hum:GetPropertyChangedSignal('FloorMaterial')) do
            if hum.FloorMaterial ~= Enum.Material.Air then
                canJump = true
            end
        end
    end
end


return DoubleJump
