local QBCore = nil 
local ESX = nil

if Config.Framework == 'qb-core' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = exports["es_extended"]:getSharedObject()
end

-- Ped
local pedModel = Config.ped.pedModel-- Ped model name
local pedCoords = Config.ped.pedPosition -- Position on the ped
local pedHeading = Config.ped.pedHeading -- Direction of the ped

-- Load model
Citizen.CreateThread(function()
    local model = GetHashKey(pedModel)  

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(10)
    end

    -- Create Ped
    local ped = CreatePed(4, model, pedCoords.x, pedCoords.y, pedCoords.z - 1.0, pedHeading, false, true)

    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
end)

-- Target
exports.ox_target:addBoxZone({
    coords = Config.Target.position,
    size = vec3(3,3,3),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'box',
            event = 'uggishresources:client:openUI',
            icon = '',
            label = 'Menu'
        },
        {
            name = 'box',
            event = 'uggishresources:client:CollectItems',
            icon = '',
            label = 'Collect Items'
        }
    }
})

local timeout = false 
-- Trigger server event and give you the item 
RegisterNetEvent('uggishresources:client:MissionItem1')
AddEventHandler('uggishresources:client:MissionItem1', function()
    if timeout then 
        lib.notify({ description = Strings.Timeout, type = 'error' })
        return
    end
    TriggerServerEvent('uggishresources:server:MissionItem1')
    startTimeout()
    local alert = lib.alertDialog({
        header = 'Information',
        content = Strings.Goback,
        centered = true,
        cancel = true
    })
    print(alert)
end)

-- Trigger server event and give you the item and start the timeout
RegisterNetEvent('uggishresources:client:MissionItem2')
AddEventHandler('uggishresources:client:MissionItem2', function()
    if timeout then 
        lib.notify({ description = Strings.Timeout, type = 'error' })
        return 
    end
    TriggerServerEvent('uggishresources:server:MissionItem2')
    startTimeout()
    local alert = lib.alertDialog({
        header = 'Information',
        content = Strings.Goback,
        centered = true,
        cancel = true
    })
    print(alert)
end)

-- Trigger server event and give you the item 
RegisterNetEvent('uggishresources:client:MissionItem3')
AddEventHandler('uggishresources:client:MissionItem3', function()
    if timeout then 
        lib.notify({ description = Strings.Timeout, type = 'error' })
        return 
    end
    TriggerServerEvent('uggishresources:server:MissionItem3')
    startTimeout()
    local alert = lib.alertDialog({
        header = 'Information',
        content = Strings.Goback,
        centered = true,
        cancel = true
    })
    print(alert)
end)

-- Trigger server event and give you the item 
RegisterNetEvent('uggishresources:client:MissionItem4')
AddEventHandler('uggishresources:client:MissionItem4', function()
    if timeout then 
        lib.notify({ description = Strings.Timeout, type = 'error' })
        return 
    end
    TriggerServerEvent('uggishresources:server:MissionItem4')
    startTimeout()
    local alert = lib.alertDialog({
        header = 'Information',
        content = Strings.Goback,
        centered = true,
        cancel = true
    })
    print(alert)
end)

-- Function to start the timeout
function startTimeout()
    timeout = true 
    lib.notify({ description = Strings.Timeout, type = 'error' })

    Citizen.SetTimeout(Config.Timeout.timeout, function()
        timeout = false
    lib.notify({ description = Strings.Timeout, type = 'error' }) 
    end)
end
 

-- Open the UI
RegisterNetEvent('uggishresources:client:openUI', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open'
    })
end)

-- Mission Position 1
RegisterNUICallback('mission1', function(data, cb)
    local Item1Coords = Config.Props[1].coords
    SetNewWaypoint(Item1Coords.x, Item1Coords.y)
    lib.notify({ title = 'GPS LOCATION', description = Strings.GPS, type = 'success'})
end)

-- Mission Position 2
RegisterNUICallback('mission2', function(data, cb)
    local Item2Coords = Config.Props[2].coords
    SetNewWaypoint(Item2Coords.x, Item2Coords.y)
    lib.notify({ title = 'GPS LOCATION', description = Strings.GPS, type = 'success'})
end)

-- Mission Position 3
RegisterNUICallback('mission3', function(data, cb, coords)
    local Item3Coords = Config.Props[3].coords
    SetNewWaypoint(Item3Coords.x, Item3Coords.y)
    lib.notify({ title = 'GPS LOCATION', description = Strings.GPS, type = 'success'})
end)

-- Mission Position 4
RegisterNUICallback('mission4', function(data, cb)
    local Item4Coords = Config.Props[4].coords
    SetNewWaypoint(Item4Coords.x, Item4Coords.y)
    lib.notify({ title = 'GPS LOCATION', description = Strings.GPS, type = 'success'})
end)

-- Close UI
RegisterNUICallback('closeUI', function(data, cb)
    SetNuiFocus(false, false)
    cb('Ok')
end)

-- Collect Mission Menu
RegisterNetEvent('uggishresources:client:CollectItems', function()
    lib.registerContext({
        id = 'collectitems',
        title  = 'Rewards',
        options = {
            {
                title = 'Collect Rewards',
                description = Strings.Collectrewards,
                icon = {'fa-solid', 'fa-splotch'},
                event = 'uggishresources:client:CollectMissionItem'
            } 
        }
    })
    lib.showContext('collectitems')
end)

-- Trigger server event and give you the money and remove your item from the inventory
RegisterNetEvent('uggishresources:client:CollectMissionItem')
AddEventHandler('uggishresources:client:CollectMissionItem', function()
    TriggerServerEvent('uggishresources:server:CollectMissionItem')
end)

-- Notification when you got your money
RegisterNetEvent('uggishresources:client:noti')
AddEventHandler('uggishresources:client:noti', function(totalmoney)
    local alert = lib.alertDialog({
        header = Strings.Missioncomplete,
        content = Strings.Money .. totalmoney .. ' $ ',
        centered = true,
        cancel = true
    })
     
    print(alert)
end)

-- Blip Function
Citizen.CreateThread(function()
    Wait(10)
    
    for _, blipConfig in pairs(Config.Blip) do 
        if blipConfig.showBlip then 
            local blipCoords = blipConfig.Blip 
            local jobcenterBlip = AddBlipForCoord(blipCoords.x, blipCoords.y, blipCoords.z)

            SetBlipAsShortRange(jobcenterBlip, true)
            SetBlipColour(jobcenterBlip, blipConfig.BlipColour)
            SetBlipSprite(jobcenterBlip, blipConfig.BlipModel)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(blipConfig.TextOnMap)
            EndTextCommandSetBlipName(jobcenterBlip)
        end
    end
end)

local props = {}
local drawZones = false -- set it true if you want to debugg

-- Function to crate props
function spawnProps()
    for i, data in ipairs(Config.Props) do 
        local model = GetHashKey(data.model) 
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(10)
        end
        prop = CreateObject(model, data.coords.x, data.coords.y, data.coords.z, false, true, false)
        SetEntityHeading(prop, data.heading) 
        PlaceObjectOnGroundProperly(prop)
        
        -- Add props to the list 
        props[i] = prop 

        createTargetZone(data.coords, data.event, data.label)
    end
end

 -- Function to remove the props
function removeProps()
    for _, prop in pairs(props) do 
        if DoesEntityExist(prop) then 
        DeleteObject(prop)
        end 
    end
    props = {} 
end
 
-- Create ox_target
function createTargetZone(coords, event, label)
    exports.ox_target:addBoxZone({
        coords = coords,
        size = vec3(3, 3, 3),
        rotation = 0, 
        debug = drawZones,
        options = {
            {
                name = 'pickupitem',
                event = event,
                icon = 'fas fa-box',
                label = label
            }
            
        }
    })
end

CreateThread(function()
    spawnProps()
end)

-- Use command (removeProps) to remove the prop 
RegisterCommand("removeProps", function()
    removeProps()
end, false)

