local ContextActionService = game:GetService('ContextActionService')
local UserInputService = game:GetService('UserInputService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Knit = require(ReplicatedStorage.Packages.Knit)


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


local MovementController = Knit.CreateController { Name = 'MovementController' }


function MovementController:KnitStart()
    DisableFowardBackward()
end


function MovementController:KnitInit()
end


return MovementController
