--[[

WEAVE UTILITIES

These utilities are an aid in providing functionaliy to this framework.

]]

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScript = game:GetService("ServerScriptService")
local httpService = game:GetService("HttpService")

local Utils = {}

-- Warn formats for errors and notices
Utils.warnFormatERROR = "Weave %s ERROR: %s" -- first %s is the component, second %s is the error message 
Utils.warnFormatNOTICE = "Weave %s NOTICE: %s" -- first %s is the component, second %s is the notice message

--  Used to find and return the package
function Utils.findPackage(package: string)
   if not ReplicatedStorage.Packages:FindFirstChild(package) then 
       return string.format(Utils.warnFormatERROR, "findPackage Utils", "The package "..package.." is not found!")
    else
       return require(ReplicatedStorage.Packages[package])
       end
end

-- Used to check for the latest Stable Version and compare it against the current
function Utils.httpVersionChecker(currentVersion: {}, doWarns: boolean)
    local url = "https://raw.githubusercontent.com/Iris-Interactive-Group/Weave/refs/heads/main/version.json"
    local success, data = pcall(httpService.GetAsync, httpService, url)
    if success then
        local versionInformation = httpService:JSONDecode(data)
        if versionInformation["Stable"]["Version"] ~= currentVersion["version"] or versionInformation["Stable"]["VersionFamily"] ~= currentVersion["versionFamily"] then
            if doWarns then
                warn(string.format(Utils.warnFormatNOTICE, "versionChecker Utils", "A new version of Weave is available!"))
            end
        end
    end
end

-- Used to post a warning in the console 
function Utils.warn(message: string, settings: {})
    if settings.statusWarns then
        warn(message) -- Assume this message is formatted
    end
end

return Utils