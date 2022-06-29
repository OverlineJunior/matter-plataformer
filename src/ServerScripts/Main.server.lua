local ReplicatedStorage = game:GetService('ReplicatedStorage')
local ServerStorage = game:GetService('ServerStorage')

local InitMatter = require(ReplicatedStorage.Shared.InitMatter)
local Components = require(ServerStorage.Server.Components)

local world = InitMatter(ServerStorage.Server.Systems)
