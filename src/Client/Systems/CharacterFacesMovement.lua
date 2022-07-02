local UserInputService = game:GetService('UserInputService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Matter = require(ReplicatedStorage.Packages.Matter)
local Components = require(ReplicatedStorage.Client.Components)

local Player = Components.Player


local function CharacterFacesMovement(world, _, widgets)
    for _, plr in world:query(Player) do
        local char = plr.Instance.Character
        local hum: Humanoid? = if char then char:FindFirstChild('Humanoid') else nil
        local root: Part? = if hum then hum.RootPart else nil

        if not root or not hum then continue end

        char.Humanoid.AutoRotate = widgets.checkbox('Enable AutoRotate'):checked()

        for _, input: InputObject, gameProcessed: boolean in Matter.useEvent(UserInputService, 'InputBegan') do
            if gameProcessed then continue end

            if input.KeyCode == Enum.KeyCode.A then
                root.CFrame = CFrame.lookAt(root.Position + Vector3.xAxis, root.Position)
            elseif input.KeyCode == Enum.KeyCode.D then
                root.CFrame = CFrame.lookAt(root.Position + -Vector3.xAxis, root.Position)
            end
        end
    end
end


return CharacterFacesMovement
