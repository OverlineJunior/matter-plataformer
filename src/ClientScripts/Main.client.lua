local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local StartKnit = require(ReplicatedStorage.Shared.StartKnit)
local StartMatter = require(ReplicatedStorage.Shared.StartMatter)
local Components = require(ReplicatedStorage.Client.Components)

local Player = Components.Player
local Camera = Components.Camera
local Model = Components.Model
local JumpPad = Components.JumpPad

local client = Players.LocalPlayer

StartKnit(ReplicatedStorage.Client)

local world = StartMatter(ReplicatedStorage.Client.Systems)

world:spawn(
    Player {
        Instance = client,
    },
    Camera {
        Instance = workspace.CurrentCamera,
    }
)

world:spawn(
    JumpPad {},
    Model {
        Instance = workspace.JumpPad1,
    }
)
