local ServerStorage = game:GetService('ServerStorage')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local StartKnit = require(ReplicatedStorage.Shared.StartKnit)
local StartMatter = require(ReplicatedStorage.Shared.StartMatter)

StartKnit(ServerStorage.Server)
StartMatter(ServerStorage.Server.Systems)
