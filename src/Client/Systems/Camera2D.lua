local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Components = require(ReplicatedStorage.Client.Components)

local Character = Components.Character
local Camera = Components.Camera


local function Camera2D(world)
    for _, char, cam in world:query(Character, Camera) do
        local root = char.Instance.HumanoidRootPart
        cam.Instance.CFrame = CFrame.new(root.Position) * CFrame.new(0, 0, 10)
    end
end


return Camera2D
