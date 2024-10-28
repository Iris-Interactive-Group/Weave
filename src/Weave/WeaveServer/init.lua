-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Modules
local WEAVE = script.Parent -- The Weave module script
local Utils = require(WEAVE.WeaveUtils)

local Weave = {}

function Weave.StartServer()
    print("Server Started!")
end

return Weave