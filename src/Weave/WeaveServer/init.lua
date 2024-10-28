-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScript = game:GetService("ServerScriptService")

-- Modules
local WEAVE = script.Parent -- The Weave module script
local Utils = require(WEAVE.WeaveUtils)

local Weave = {}

function Weave.StartServer()
    -- Warn if the server is already running
end

return Weave