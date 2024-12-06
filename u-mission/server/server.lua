
local QBCore = nil 
local ESX = nil

if Config.Framework == 'qb-core' then
    QBCore = exports['qb-core']:GetCoreObject() -- Om du använder qb-core, hämta QBCore objektet
elseif Config.Framework == 'esx' then
    ESX = exports["es_extended"]:getSharedObject()
end

-- Mission Item 1
RegisterNetEvent('uggishresources:server:MissionItem1', function()
    local src = source
    -- Item
    local item = Config.Items.Item1.item

    -- ESX
    if Config.Framework == 'esx' then 
        local player = ESX.GetPlayerFromId(src)

        -- Add object to inventory
        if player then 
            player.addInventoryItem(item, 1)
        end



        -- QBCORE
    elseif Config.Framework == 'qb-core' then 
        local Player = QBCore.Functions.GetPlayer(src)

        -- Add object to inventory  
        if Player then
            Player.Functions.AddItem(item, 1)
        end
    end

    -- Send notifiction
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Item',
        description = 'Collected',
        type = 'success',
        duration = 5000
    })
end)

-- Mission Item 2
RegisterNetEvent('uggishresources:server:MissionItem2', function()
    local src = source
    -- Item
    local item = Config.Items.Item2.item

    
    -- esx
    if Config.Framework == 'esx' then 
        local player = ESX.GetPlayerFromId(src)

        -- Add object to inventory
        if player then 
            player.addInventoryItem(item, 1)
        end

    -- qbcore
    elseif Config.Framework == 'qb-core' then 
        local Player = QBCore.Functions.GetPlayer(src)
        
        -- Add object to inventory
        if Player then 
            Player.Functions.AddItem(item, 1)
        end
    end

    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Item',
        description = 'Collected',
        type = 'success',
        duration = 5000
    })
end)

-- Mission Item 3
RegisterNetEvent('uggishresources:server:MissionItem3', function()
    local src = source
    -- Item
    local item = Config.Items.Item3.item

    -- ESX
    if Config.Framework == 'esx' then 
        local player = ESX.GetPlayerFromId(src)

        -- Add object to the inventory
        if player then 
            player.addInventoryItem(item, 1)
        end

        -- QBCore
    elseif Config.Framework == 'qb-core' then 
        local Player = QBCore.Functions.GetPlayer(src)

        -- Add object to the inventory
        if Player then 
            Player.Functions.AddItem(item, 1)
        end
    end

    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Item',
        description = 'Collected',
        type = 'success',
        duration = 5000
    })
end)

-- Mission Item 4
RegisterNetEvent('uggishresources:server:MissionItem4', function()
    local src = source
    -- Item
    local item = Config.Items.Item4.item

    -- ESX
    if Config.Framework == 'esx' then 
        local player = ESX.GetPlayerFromId(src)

        -- Add object to the inventory
        if player then 
            player.addInventoryItem(item, 1)
        end

        -- QBcore
    elseif Config.Framework == 'qb-core' then 
        local Player = QBCore.Functions.GetPlayer(src)

        -- Add object to the inventory
        if Player then 
            Player.Functions.AddItem(item, 1)
        end
    end

    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Item',
        description = 'Collected',
        type = 'success',
        duration = 5000
    })
end)

-- Collect Mission
RegisterNetEvent('uggishresources:server:CollectMissionItem', function()
    local src = source
    -- Remove ItemName
    local itemsRequired =  {Config.Items.Item1.item , Config.Items.Item2.item, Config.Items.Item3.item, Config.Items.Item4.item}
    -- Money
    local totalmoney = 0

    -- ESX
    if Config.Framework == 'esx' then 
        local player = ESX.GetPlayerFromId(src)

        -- Remove object from inventory
        if player then 
            -- Check item
            for _, item in ipairs(itemsRequired) do 
                local playerItem = player.getInventoryItem(item)

                if playerItem and playerItem.count >=1 then 
                    local sellAmount = playerItem.count 
                    local payment = sellAmount * (Config.Prices[item] or 0)
                    totalmoney = totalmoney + payment

                    player.removeInventoryItem(item, sellAmount)
                end
            end
            
            if totalmoney > 0 then 
           -- Money to the player [bank or cash]
            if Config.Money.ChangeMoney == 'bank' then 
                player.addAccountMoney('bank', totalmoney)
            else
                player.addMoney(totalmoney)
            end

            -- Item Success
       TriggerClientEvent('uggishresources:client:noti', src, totalmoney)
    else
            -- Item?????
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Mission',
                description = 'Item?',
                type = 'error',
                duration = 5000
            })
        end
    end

        -- QBCORE
    elseif Config.Framework == 'qb-core' then 
        local Player = QBCore.Functions.GetPlayer(src)

        -- Remove 0bject from inventory
        if Player then 
            -- Check item
            for _, item in ipairs(itemsRequired) do
                local playerItem = Player.Functions.GetItemByName(item)
                if playerItem and playerItem.amount >= 1 then 
                    local sellAmount = playerItem.amount
                    local payment = sellAmount * (Config.Prices[item] or 0)
                    totalmoney = totalmoney + payment

                    Player.Functions.RemoveItem(item, sellAmount)
                end
            end

          if totalmoney > 0 then
        -- Money to player [bank or cash]
            if Config.Money.ChangeMoney == 'bank' then 
                Player.Functions.AddMoney('bank', totalmoney)
            else
                Player.Functions.AddMoney('cash', totalmoney)
            end

            -- Item Success
            TriggerClientEvent('uggishresources:client:noti', src, totalmoney)
    else
            -- Item????
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Mission',
                description = 'Item?',
                type = 'error',
                duration = 5000
            })
        end
     end
   end
end)



