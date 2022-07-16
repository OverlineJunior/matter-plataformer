local ContextActionService = game:GetService('ContextActionService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Components = require(ReplicatedStorage.Client.Components)

local Player = Components.Player
local MovementConstraint = Components.MovementConstraint


local function DisableFowardBackward()
    ContextActionService:BindActionAtPriority(
        'DisableFowardBackward',
        function()
            return Enum.ContextActionResult.Sink
        end,
        false,
        Enum.ContextActionPriority.High.Value,
        Enum.KeyCode.W,
        Enum.KeyCode.S,
        Enum.KeyCode.Up,
        Enum.KeyCode.Down
    )
end


local function ConstrainMovement(world)
    for id in world:query(Player):without(MovementConstraint) do
        world:insert(id, MovementConstraint {})

        DisableFowardBackward()
    end
end


return ConstrainMovement
