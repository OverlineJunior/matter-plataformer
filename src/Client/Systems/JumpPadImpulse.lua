local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Matter = require(ReplicatedStorage.Packages.Matter)
local Components = require(ReplicatedStorage.Client.Components)

local JumpPad = Components.JumpPad
local Model = Components.Model

local DEF_POWER = 1500


local function JumpPadImpulse(world)
    for _, model in world:query(Model, JumpPad) do
        local pPart: BasePart = model.Instance.PrimaryPart
        local power = model.Instance:GetAttribute('JumpPadPower') or DEF_POWER

        for _, hit: BasePart in Matter.useEvent(pPart, 'Touched') do
            local mdl = hit:FindFirstAncestorWhichIsA('Model')
            local hum = if mdl then mdl:FindFirstChildOfClass('Humanoid') else nil
            local root: Part? = if hum then hum.RootPart else nil

            if root and Matter.useThrottle(1, root) then
                root:ApplyImpulse(pPart.CFrame.LookVector * power)
            end
        end
    end
end


return JumpPadImpulse
