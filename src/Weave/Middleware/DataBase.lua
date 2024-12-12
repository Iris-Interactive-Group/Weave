--[[
DATABASE MIDDLEWARE

Use this middleware as an abstraction layer for ProfileStore databases. This simplifies the use of ProfileStore and provides a more user-friendly API native to Weave.
]]
-- Imports
local Weave = script.Parent.Parent
local Utils = require(Weave.WeaveUtils)

local DatabaseMiddleware: Weave.Middleware = {
    NAME = "DataBase",
    VERSION = "0.1.0", -- Version of middleware
    AUTHOR = "Azuris", -- Author of middleware
    COMPATIBLE_VERSION = "Iris", -- Compatible with any Iris build. 
    REALM = "Server", -- Server only

    settings = {
        testDataBaseName = "DevBase" -- If you are testing, give this string a value to not override production databases, you may lose data otherwise
    }, -- This is optional and will be ignored by Weave, this will only be used for internal purposes
}

DatabaseMiddleware.__index = DatabaseMiddleware -- Useful for OOP, this is not necessary

-- Add as many functions as desired.
function DatabaseMiddleware.new(_, dataBaseName: string)
    print("This is a dataBase middleware test") 
    --[[
        TODO: 
        Load ProfileService
        Load DataBase from the name, use a composite name if testDataBaseName is set. 
        Cache DataBase in self for use with other functions. 
    ]]

    local self = setmetatable({}, DatabaseMiddleware) 

    local ProfileStore = Utils.findPackage("profilestore") -- Import profile service
    self.compositeName = "" -- Use this for database name

    do 
        if DatabaseMiddleware.settings.testDataBaseName ~= "" then 
            self.compositeName = DatabaseMiddleware.settings.testDataBaseName .. dataBaseName
        else 
            self.compositeName = dataBaseName
        end 
    end
    
    print(ProfileStore)

    return self
end

return setmetatable(DatabaseMiddleware, {
    __call = function(_, dataBaseName: string)
        return DatabaseMiddleware.new(_, dataBaseName)
    end
})