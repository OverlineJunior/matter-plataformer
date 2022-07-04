local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Matter = require(ReplicatedStorage.Packages.Matter)


local Components = {
    BasePart = Matter.component(),
    Damaging = Matter.component(),
}


return Components
