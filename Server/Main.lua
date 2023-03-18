RegisterNetEvent("CR.MuzzleFlash::Server", function(Coords)
    TriggerClientEvent("CR.MuzzleFlash::Client", -1, Coords)
end)