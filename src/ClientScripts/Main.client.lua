local ReplicatedStorage = game:GetService('ReplicatedStorage')

local InitMatter = require(ReplicatedStorage.Shared.InitMatter)
local Components = require(ReplicatedStorage.Client.Components)

local world = InitMatter(ReplicatedStorage.Client.Systems)
