local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Components = require(ReplicatedStorage.Client.Components)

local Player = Components.Player
local Camera = Components.Camera

local CAMERA_DISTANCE = 25


local function Camera2D(world)
    for _, plr, cam in world:query(Player, Camera) do
        local char = plr.Instance.Character
        local root = if char then char:FindFirstChild('HumanoidRootPart') else nil

        if not root then continue end

        cam.Instance.CFrame = CFrame.new(root.Position) * CFrame.new(0, 0, CAMERA_DISTANCE)
    end
end


return {
    system = Camera2D,
    event = 'RenderStepped',
}
