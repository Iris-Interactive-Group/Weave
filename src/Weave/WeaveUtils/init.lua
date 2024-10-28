--[[

WEAVE UTILITIES

These utilities are an aid in providing functionaliy to this framework.

]]

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScript = game:GetService("ServerScriptService")

local Utils = {}

-- Warn formats for errors and notices
Utils.warnFormatERROR = "Weave%s ERROR: %s" -- first %s is the component, second %s is the error message 
Utils.warnFormatNOTICE = "Weave%s NOTICE: %s" -- first %s is the component, second %s is the notice message

-- This function used to find and return the package
function Utils.findPackage(package: string, location: string)
    -- Validate location
    if location ~= "ReplicatedStorage" and location ~= "ServerScriptService" then return "Location not found"  end

    -- Validate Package folder
    if not game:GetService(location):FindFirstChild("Packages") or not game:GetService(location).Packages:FindFirstChild("ServerPackages") then return "Package folder not found" end

    -- Return package
    if location == "ReplicatedStorage" then
        return game:GetService(location).Packages.ServerPackages:FindFirstChild(package)
    else
        return game:GetService(location).ServerPackages:FindFirstChild(package)
    end
end

return Utils