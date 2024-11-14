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

-- This function used to find and return the package
function Utils.findPackage(package: string)
   if not ReplicatedStorage.Packages:FindFirstChild(package) then 
       return string.format(Utils.warnFormatERROR, "findPackage Utils", "The package "..package.." is not found!")
    else
       return require(ReplicatedStorage.Packages[package])
       end
end

function Utils.httpVersionChecker(currentVersion: {}, doWarns: boolean)
    local url = "https://raw.githubusercontent.com/AzurisDev/Weave/main/version.json"
    local success, data = pcall(httpService.GetAsync, httpService, url)
    if success then
        local versionInformation = httpService:JSONDecode(data)
        if versionInformation.Stable.Version ~= currentVersion.Version and versionInformation.Stable.VersionFamily ~= currentVersion.VersionFamily then
            if doWarns then
                warn(string.format(Utils.warnFormatNOTICE, "versionChecker Utils", "A new version of Weave is available!"))
            end
        end
    end
end

return Utils