local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Components = require(ReplicatedStorage.Client.Components)

local Character = Components.Character
local Camera = Components.Camera

local CAMERA_DISTANCE = 25


local function Camera2D(world)
    for _, char, cam in world:query(Character, Camera) do
        local root = char.Instance.HumanoidRootPart
        cam.Instance.CFrame = CFrame.new(root.Position) * CFrame.new(0, 0, CAMERA_DISTANCE)
    end
end


return {
    system = Camera2D,
    event = 'RenderStepped',
}
