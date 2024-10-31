return table.freeze {
    -- Version Validations  Settings
    versionCheck = true, -- Check and warn developers of new versions of Weave.
    buildTypeWarnings = true, -- Warn the user if the build used is none stable, RC will be classified as stable


    -- Middleware
    middleware = {
        PStoreAbstract = true, -- Abstraction middleware for ProfileStore databases.
        EndPointEngine = true, -- Middleware for handling end points. Disabling this is highly unrecommended as this is the handler of communication between scripts.
    },
    
    -- Setup function
    -- NOTE: keep the return code as "Disabled" if not in use
    setup = function(player: Player) 
        return "Disabled"
    end,

    -- Build information
    _BUILD = {
        version = "0.1.0", -- Direct version of Weave
        versionFamily = "Iris", -- Version family (E.G: 0.x - Iris)
        buildType = "nightly", --[[
            Type of build out of the following: 
            nightly:  Fresh, untested and highly unstable build, 
            dev: Actively worked on and tested build, 
            canary: Used for general user testing,
            rc: Used as final testing, mostly stable candidates that may be released as stable,
            stable: Final, stable and polished version
            ]]

        supported = true -- Wether or not this version will recieve more updates
    }
}

