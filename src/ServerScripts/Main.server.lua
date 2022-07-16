local ServerStorage = game:GetService('ServerStorage')
local CollectionService = game:GetService('CollectionService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local StartMatter = require(ReplicatedStorage.Shared.StartMatter)
local Components = require(ServerStorage.Server.Components)

local BasePart = Components.BasePart
local Damaging = Components.Damaging

local world = StartMatter(ServerStorage.Server.Systems)

world:spawn(
    BasePart {
        Instance = workspace.DamagingPart1,
    },
    Damaging {}
)

CollectionService:AddTag(workspace.DamagingPart1, 'serverEntityId')
