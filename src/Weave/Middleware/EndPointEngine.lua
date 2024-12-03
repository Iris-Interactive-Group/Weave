--[[

MIDDLEWARE TEMPLATE

Use this template when creating your own middleware.

There are 2 types of middleware, a Runnable and API middleware. 

Runnable middleware are a type of middleware that will be execute by the builder prior to loading in the handlers and models. 
To define a middleware as runnable, create a Execute() function

API middleware are a type of middleware that will only provide additional functions that will be exposed to selected handlers.

]]
local Weave = script.Parent.Parent

local middlewareTemplate: Weave.Middleware = {
    NAME = "template",
    VERSION = "0.1.0", -- Version of middleware
    AUTHOR = "Azuris", -- Author of middleware
    COMPATIBLE_VERSION = "0.1.0" or "Iris", -- Version of Weave compatible with middleware, for direct version use string 1 for broad use sting 2.
    REALM = "Server" or "Client", -- Server or Client realm
    ----------------------------

    settings = {

    }, -- This is optional and will be ignored by Weave, this will only be used for internal purposes

    ----------------------------
}
middlewareTemplate.__index = middlewareTemplate -- Useful for OOP, this is not necessary

-- Add as many functions as desired.
function middlewareTemplate.someFunction()
    
end

-- function middlewareTemplate.Execute()
--     -- This function will be executed by the builder, including this function will declare the middleware as runnable otherwise this middleware will be treated as API.
-- end


return middlewareTemplate