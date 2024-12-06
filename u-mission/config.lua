Config = {}

-- Framework
Config.Framework = 'esx' -- esx/qb-core if you use qb

-- Money
Config.Money = {
    ChangeMoney = 'money',
-- [ESX] - cash = money, bank = 'bank'
-- [QB] - cash = cash, bank = 'bank'
    Money = 100
}

 -- Ped
Config.ped = {
    pedPosition = vector3(-263.0980, -963.6921, 31.2234), -- Position
    pedModel = "a_m_y_hipster_01", -- Model Of Ped
    pedHeading = 90.0 -- Direction Of Ped
} 

-- Props
Config.Props = {
    {
        model = 'prop_box_wood01a', -- Model 
        coords = vec3(-1969.6434, -690.4694, 3.1807), -- Position
        heading = 90.0, -- Direction of Model
        event = 'uggishresources:client:MissionItem1', 
        label = 'Pick up the item', -- Name
    },
    {
        model = 'prop_box_wood01a', -- Model  
        coords = vec3(1559.7050, 3199.1982, 40.4741), -- Position
        heading = 90.0, -- Direction of Model
        event = 'uggishresources:client:MissionItem2',
        label = 'Pick up the item', -- Name
    },
    {
        model = 'prop_box_wood01a', -- Model  
        coords = vec3(-1685.2930, -260.4291, 51.8833), -- Position
        heading = 90.0, -- Direction of Model
        event = 'uggishresources:client:MissionItem3',
        label = 'Pick up the item', -- Name 
    },
    {
        model = 'prop_box_wood01a', -- Model 
        coords = vec3(-1149.5753, -1721.8900, 4.1966), -- Position
        heading = 90.0, -- Direction of Model
        event = 'uggishresources:client:MissionItem4',
        label = 'Pick up the wooden box' -- Name
    }
}


-- Items
Config.Items = {
    Item1 = {
        item = 'lockpick', -- Itemname
    },
    Item2 = {
        item = 'phone', -- Itemname
    },
    Item3 = {
        item = 'radio', -- Itemname
    },
    Item4 = {
        item = 'carotool', -- Itemname
        -- [You can add more items if you want]
    }
}

Config.Prices = {
    lockpick = 50, -- Price Of The Item
    phone = 100, -- Price Of The Item
    radio = 150, -- Price Of The Item
    carotool = 200, -- Price Of The Item 
    -- [You can add more prices for the item you want to add]
}

-- Open the menu ui target
Config.Target = {
    position = vector3(-263.45, -963.87, 31.22)
}

-- Blip
Config.Blip = {
    {
        Blip = vector3(-260.4624, -979.6605, 31.2196), -- Position
        TextOnMap = 'Mission', -- Text of the blip 
        BlipModel = 398, -- Blip model
        BlipColour = 2, -- Blip colour
        showBlip = true -- set to false = no blip, true = blip on the map
    }
}

-- Timeout
Config.Timeout = {
    timeout = 50000 -- 5 mins
}

-- https://forge.plebmasters.de/objects (Models)
-- https://docs.fivem.net/docs/game-references/ped-models/ (Peds)