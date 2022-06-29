local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Matter = require(ReplicatedStorage.Packages.Matter)

local Components = {
    Character = Matter.component(),
    Camera = Matter.component(),
}

return Components
