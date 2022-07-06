local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Matter = require(ReplicatedStorage.Packages.Matter)


local Components = {
    BasePart = Matter.component('BasePart'),
    Damaging = Matter.component('Damaging'),
}


return Components
