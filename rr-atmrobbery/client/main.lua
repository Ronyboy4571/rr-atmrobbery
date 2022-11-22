local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('rr-rob-atm:start:atm', function()
    if Config.locksystem == "ps" then
        Psui()
    elseif Config.locksystem == "qb" then
        QbLock()
    end
end)

Psui = function ()
    local lockpick = QBCore.Functions.HasItem('lockpick')
    if lockpick then
        exports['ps-ui']:Circle(function(success)
            if success then
                QBCore.Functions.Progressbar('rob_atm', 'Robbing ATM', 15000, false, true, { -- Name  Label  Time 
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                }, {
                    animDict = 'anim@gangops@facility@servers@',
                    anim = 'hotwire',
                    flags = 16,  
                },{}, {}, function()
                    TriggerServerEvent('rr-atm-payout')
                    policeAlert()
                    ClearPedTasks(ped)
                    --atm()
                end, function()
                    ClearPedTasks(ped)
                end)
            else
                QBCore.Functions.Notify('Lockpick Is broken try again', 'error', 7500)
                TriggerServerEvent('rr-rob-atm:removelockpick')
                policeAlert()
            end
        end, 2, 6)
    else
        QBCore.Functions.Notify('You Need A lockpick', 'error', 7500)
    end
end

QbLock = function ()
    local lockpick = QBCore.Functions.HasItem('lockpick')
    if lockpick then
        local time = math.random(7,10) -- customize as you like
        local circles = math.random(2,6) --customize as you like
        local success = exports['qb-lock']:StartLockPickCircle(circles, time, success)
            if success then
                QBCore.Functions.Progressbar('rob_atm', 'Robbing ATM', 15000, false, true, { -- Name  Label  Time 
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                }, {
                    animDict = 'anim@gangops@facility@servers@',
                    anim = 'hotwire',
                    flags = 16,
                }, {}, {}, function() 
                    TriggerServerEvent('rr-atm-payout')
                    ClearPedTasks(ped)
                    TriggerServerEvent('rr-rob-atm:removelockpick')
                    policeAlert()
                    --atm()
                end, function() 
                    ClearPedTasks(ped)
                    end)
                else
                    QBCore.Functions.Notify('Lockpick Is broken try again', 'error', 7500)
                    TriggerServerEvent('rr-rob-atm:removelockpick')
                policeAlert()
            end
    else
        QBCore.Functions.Notify('You Need A lockpick', 'error', 7500)
    end
end



function policeAlert()
    TriggerServerEvent("police:server:policeAlert", 'ATM Robbery In Progress') --configure to your liking this is jus default
end


-- function atm()
--     local ply = PlayerPedId()
--     local plyCoords = GetEntityCoords(ply, 0)
--     for k, v in pairs(Config.ModelHashes) do
--         local atm = GetClosestObjectOfType(plyCoords.x, plyCoords.y, plyCoords.z, 1.5, v, false, 0, 0)
--         SetEntityAsMissionEntity(atm, true, true)
--         DeleteEntity(atm)
--     end    
-- end


CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.Models, {
        options = {
            { 
                type = "client",
                event = "rr-rob-atm:start:atm",
                icon = "fas fa-screwdriver",
                label = "Rob ATM",
            },
        },
        distance = 1.5 
    })
end)