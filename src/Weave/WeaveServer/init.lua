-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScript = game:GetService("ServerScriptService")

-- Modules
local WEAVE = script.Parent -- The Weave module script
local Utils = require(WEAVE.WeaveUtils)

local Weave = {}

function Weave.StartServer()
    -- Warn if the server is already running
    do 
      if ReplicatedStorage:FindFirstChild("Weave") then
            warn(Utils.warnFormatERROR:format("StartServer", "Weave is already running on another instance!"))
            error("Weave [Error 01]: Server instance already running!")
      end  
    end

    local self = setmetatable({}, Weave)

    local settings = require(WEAVE.settings)

    self.settings = settings

    
    -- Do version checks
    do
        if settings.versionCheck then
          Utils.httpVersionChecker(self.settings._BUILD, self.settings.statusWarns)
        end
    end

    local weaveFolder = Instance.new("Folder")
    weaveFolder.Name = "Weave"
    weaveFolder.Parent = ReplicatedStorage
    

  
end

return Weave