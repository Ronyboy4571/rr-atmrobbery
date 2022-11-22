local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('rr-atm-payout', function()
    if Config.Cash then
        local amount = math.random(Config.MinCash,Config.MaxCash)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney('cash', amount)
        TriggerClientEvent('QBCore:Notify', src, 'You got $ '..amount..'!', 'success') 
    end
    
    if Config.BlackMoney then
        local amount = math.random(Config.MinMarkedBills,Config.MaxMarkedBills)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem('markedbills', amount)
        TriggerClientEvent('QBCore:Notify', src, 'You got '..amount..' marked bills!', 'success') 
    end      
end)

RegisterNetEvent('rr-rob-atm:removelockpick', function ()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('lockpick', 1)
end)
