local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Matter = require(ReplicatedStorage.Packages.Matter)

local Components = {
    Player = Matter.component(),
    Camera = Matter.component(),
    JumpPad = Matter.component(),
    Model = Matter.component(),
}

return Components
