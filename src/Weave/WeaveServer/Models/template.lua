--[[

MODEL TEMPLATE

Use this template when creating your own models for data.

Models provide base data if no present data exist. Models also lay the foundation of how data is stored and structured. 

Functions are not permitted to be defined within models, they will be removed during execution.
]]

local Weave = script.Parent.Parent.Parent

local modelTemplate: Weave.Model  = {
    persistant = true -- Determines if the data will be saveable, when set to false data will be cleared when player leaves
}

modelTemplate.someData = 1 -- Add as much data as you wish


return table.freeze(modelTemplate) -- Make model read only as data must be predefined