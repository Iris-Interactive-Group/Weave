--[[
AzurisDev and Iris Interactive Tech Team
28/10/2024

Use this script to access the different Weave components. 

]]

-- Types

-- Middleware type
export type Middleware = {
    NAME: string,
    _VERSION: string,
    _AUTHOR: string,
    _COMPATIBLE_VERSION: string,
    [string]: (any) -> any
}

export type Model  = {
    persistant: boolean,
    [string]: any
}



----------------------------------------------
return table.freeze {
    Server = require(script.WeaveServer), 
    Client = script.WeaveClient,
    Utils = script.WeaveUtils
}


