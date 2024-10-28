--[[
AzurisDev and Iris Interactive Tech Team
28/10/2024

Use this script to access the different Weave components. 

]]

return table.freeze {
    Server = require(script.WeaveServer), 
    Client = script.WeaveClient,
    Utils = script.WeaveUtils
}

