local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Matter = require(ReplicatedStorage.Packages.Matter)

local Components = {
    Player = Matter.component('Player'),
    Camera = Matter.component('Camera'),
    JumpPad = Matter.component('JumpPad'),
    Model = Matter.component('Model'),
    MovementConstraint = Matter.component('MovementConstraint'),
}

return Components
