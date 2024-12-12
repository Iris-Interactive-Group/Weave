-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScript = game:GetService("ServerScriptService")

-- Modules
local WEAVE = script.Parent -- The Weave module script
local Utils = require(WEAVE.WeaveUtils)

-- Packages
local promise = Utils.findPackage("promise")

local Weave = {}
Weave.__index = Weave 

function Weave.StartServer(player: Player): any
    -- Warn if the server is already running
    if ReplicatedStorage:FindFirstChild("WeaveHost") then
          warn(Utils.warnFormatERROR:format("StartServer", "Weave is already running on another instance!"))
          error("Weave [Error 01]: Server instance already running!")
    end  

    local self = setmetatable({}, Weave)
    local settings = require(WEAVE.settings)

    self.settings = settings

    -- Do version checks
    if settings.versionCheck then
      Utils.httpVersionChecker(self.settings._BUILD, self.settings.statusWarns)
    end
    
    -- Build Weave folder
    local weaveFolder = Instance.new("Folder")
    weaveFolder.Name = "WeaveHost"
    weaveFolder.Parent = ReplicatedStorage
    
    local serverEvents = Instance.new("Folder")
    serverEvents.Name = "ServerEvents"
    serverEvents.Parent = weaveFolder

    -- Server events
    local getHandler = Instance.new("BindableEvent")
    getHandler.Name = "GetHandler"
    getHandler.Parent = serverEvents

    local getModel = Instance.new("BindableEvent")
    getModel.Name = "GetModel"
    getModel.Parent = serverEvents
    local getMiddleware = Instance.new("BindableEvent")
    getMiddleware.Name = "GetMiddleware"
    getMiddleware.Parent = serverEvents

    local serverStartedBindable = Instance.new("BindableEvent")
    serverStartedBindable.Name = "ServerStarted"
    serverStartedBindable.Parent = serverEvents

    
    -- Remote Events
    local remoteEvents = Instance.new("Folder")
    remoteEvents.Name = "RemoteEvents"
    remoteEvents.Parent = weaveFolder

    local serverStarted = Instance.new("RemoteEvent")
    serverStarted.Name = "ServerStarted"
    serverStarted.Parent = remoteEvents
    
    self.weaveFolder = weaveFolder
    self.serverEvents = serverEvents
    self.remoteEvents = remoteEvents

    -- Store all enabled middleware within this table, this will be stored for the current instance
    self.middleware = {
      runnable = {},
      api = {}
    }

    -- Load middleware and push them into their correct table
    for middlewareName, middleware in pairs(settings.middleware) do
        if middleware then
          if WEAVE.Middleware[middlewareName] then
            local middlewareModule = require(WEAVE.Middleware[middlewareName])

            if middlewareModule["Execute"] or middlewareModule["execute"] then
              self.middleware.runnable[middlewareName] = middlewareModule
            else 
              self.middleware.api[middlewareName] = middlewareModule
            end
          else
              Utils.warn(string.format(Utils.warnFormatERROR, "StartServer", "The middleware "..middlewareName.." is not found! Some functionality might be missing!"), self.settings)
            end
        end
    end

    -- Run runnable middleware 


    return self
end

return Weave