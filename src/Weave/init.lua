--[[
AzurisDev and Iris Interactive Tech Team
28/10/2024

Use this script to access the different Weave components. 

]]

-- Types

-- Middleware type
export type Middleware = {
    NAME: string,
    VERSION: string,
    AUTHOR: string,
    COMPATIBLE_VERSION: string,
    REALM: string,
    [string]: (any) -> any
}

export type Model  = {  
    persistant: boolean,
    [string]: any
}

export type Handler = {
    NAME: string,
    extends: {
        [string]: Model
    },
    middleware: {
        [string]: Middleware
    },
    [string]: (any) -> any
}


----------------------------------------------
return table.freeze {
    Server = require(script.WeaveServer), 
    Client = require(script.WeaveClient),
    Utils = require(script.WeaveUtils)
}


