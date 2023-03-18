Citizen.CreateThread(function()
    while true do
        Wait(0)


        for _,ped in pairs(GetGamePool("CPed")) do
            if IsPedShooting(ped) and NetworkGetEntityOwner(ped) == PlayerId() then
                local weaponEntity = GetCurrentPedWeaponEntityIndex(ped)
                local boneIndex = GetEntityBoneIndexByName(weaponEntity, "gun_muzzle")
                local boneCoords = GetEntityBonePosition_2(weaponEntity, boneIndex)

                TriggerServerEvent("CR.MuzzleFlash::Server", boneCoords)
            end
        end
    end
end)

RegisterNetEvent("CR.MuzzleFlash::Client", function(Coords)
    DrawLightWithRangeAndShadow(
        Coords[1],
        Coords[2],
        Coords[3],
        255,
        255,
        0,
        3.0,
        0.5,
        0.0
    )
end)