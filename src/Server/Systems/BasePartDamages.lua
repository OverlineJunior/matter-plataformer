local ServerStorage = game:GetService('ServerStorage')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Matter = require(ReplicatedStorage.Packages.Matter)
local Components = require(ServerStorage.Server.Components)

local BasePart = Components.BasePart
local Damaging = Components.Damaging

local DEF_DAMAGE = 10


local function BasePartDamages(world)
    for _, basePart in world:query(BasePart, Damaging) do
        local damage = basePart.Instance:GetAttribute('Damage') or DEF_DAMAGE

        for _, hit: BasePart in Matter.useEvent(basePart.Instance, 'Touched') do
            local mdl = hit:FindFirstAncestorWhichIsA('Model')
            local hum: Humanoid? = if mdl then mdl:FindFirstChildOfClass('Humanoid') else nil

            if hum and Matter.useThrottle(1, hum) then
                hum:TakeDamage(damage)
            end
        end
    end
end


return BasePartDamages
