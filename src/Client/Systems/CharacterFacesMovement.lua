local UserInputService = game:GetService('UserInputService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Components = require(ReplicatedStorage.Client.Components)

local Player = Components.Player


local function CharacterFacesMovement(world, _, widgets)
    for _, plr in world:query(Player) do
        local char = plr.Instance.Character
        local hum: Humanoid? = if char then char:FindFirstChild('Humanoid') else nil
        local root: Part? = if hum then hum.RootPart else nil

        if not root or not hum then continue end

        char.Humanoid.AutoRotate = widgets.checkbox('Enable AutoRotate'):checked()

        if UserInputService:IsKeyDown(Enum.KeyCode.A)
            and not UserInputService:IsKeyDown(Enum.KeyCode.D)
            and root.Orientation.Y ~= 90
        then
            root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, math.rad(90), 0)

        elseif UserInputService:IsKeyDown(Enum.KeyCode.D)
            and not UserInputService:IsKeyDown(Enum.KeyCode.A)
            and root.Orientation.Y ~= -90
        then
            root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, math.rad(-90), 0)
        end
    end
end


return CharacterFacesMovement
