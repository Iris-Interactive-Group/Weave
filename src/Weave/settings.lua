return table.freeze {
    -- Settings
    versionCheck = true, -- Check and warn developers of new versions of Weave.

    -- Middleware
    middleware = {
        PStoreAbstract = true, -- Abstraction middleware for ProfileStore databases.
        EndPointEngine = true, -- Middleware for handling end points. Disabling this is highly unrecommended as this is the handler of communication between scripts.
    },

    -- Setup function
    -- NOTE: keep the return code as "Disabled" if not in use
    setup = function(player: Player) 
        return "Disabled"
    end
}

