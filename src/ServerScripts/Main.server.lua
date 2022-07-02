local ReplicatedStorage = game:GetService('ReplicatedStorage')
local ServerStorage = game:GetService('ServerStorage')

local StartKnit = require(ServerStorage.Server.StartKnitServer)
local StartMatter = require(ReplicatedStorage.Shared.StartMatter)

StartKnit()
StartMatter(ServerStorage.Server.Systems)
