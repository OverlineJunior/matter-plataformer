local Players = game:GetService('Players')
local ReplicatedStorage = game:GetService('ReplicatedStorage')

local StartMatter = require(ReplicatedStorage.Shared.StartMatter)
local Components = require(ReplicatedStorage.Client.Components)

local Player = Components.Player
local Camera = Components.Camera
local Model = Components.Model
local JumpPad = Components.JumpPad

local client = Players.LocalPlayer

local world = StartMatter(ReplicatedStorage.Client.Systems)

world:spawn(
    Player {
        Instance = client,
    },
    Camera {
        Instance = workspace.CurrentCamera,
    }
)

local id = world:spawn(
    JumpPad {},
    Model {
        Instance = workspace.JumpPad1,
    }
)

workspace.JumpPad1:SetAttribute('clientEntityId', id)
