--[[

HANDLER TEMPLATE

Use this template when creating your own handlers.

Handlers are used to provide functionality to models, these will be exposed to use within any script you desire, using GetHandler(). 

You may extend as many models as you wish, this will provide data automatically.
]]

local handlerTemplate = {
    NAME = "template",

    -- Extend values, must be tables as this is where your data will be stored
    extends = {
        someModel = {},
        anotherModel = {}
    },

    -- Import any middleware you want to use, the table will be the import of the middleware 
    middleware = {
        someMiddleware = {},
    }
}
handlerTemplate.__index = handlerTemplate -- Useful for OOP, this is not necessary

-- Add as many functions as desired.
function handlerTemplate.someFunction()
    
end


return table.freeze(handlerTemplate)