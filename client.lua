ESX = nil
lastlocation = nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(50)
	end

    RegisterCommand(Config.MenuOpenBind, function()
        TriggerEvent('fv_tpmenu:open')
    end, false)
    RegisterKeyMapping(Config.MenuOpenBind, 'Teleport Menu', 'keyboard', Config.MenuOpenBind)

    if Config.TeleportPressKey then
        while true do
            Wait(100)
            if IsControlPressed(0, Config.TeleportKeyBind) then
                TeleportWaypoint()
            end
        end
    end
end)

RegisterNetEvent('fv_tpmenu:open')
AddEventHandler('fv_tpmenu:open', function()
    ESX.UI.Menu.CloseAll()
    local elements = {}

    table.insert(elements, { label = _U('Locations_element'), value= 'loc'})
    if Config.TeleportWaypoint then
        table.insert(elements, { label = _U('Waypoint_element'), value= 'waypoint'})
    end
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'tpmenu',
    {
        title    = _U('Menu_title'),
        align    = Config.MenuPosition,
        elements = elements
    },
    function(data, menu) 
        if data.current.value == "waypoint" then
            ESX.UI.Menu.Close('default', GetCurrentResourceName(), 'tpmenu')
            TeleportWaypoint()
        elseif data.current.value == "loc" then 
            OpenLocationsMenu()
        end
    end,
    function(data, menu)
        ESX.UI.Menu.CloseAll()
    end)
end)


function OpenLocationsMenu()
    local elements = {}

    for k,v in ipairs(Locations) do
        table.insert(elements, { label = v.label, x = v.x, y = v.y, z = v.z, h = v.h })
    end
    
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'tpmenu_locations',
    {
        title    = _U('Locations_element'),
        align    = Config.MenuPosition,
        elements = elements
    },
    function(data, menu) 
        local player = PlayerPedId()
        local coords = { x = data.current.x, y = data.current.y, z = data.current.z}
        local heading = data.current.h
		local vehPlayer = GetVehiclePedIsUsing(player)
        ESX.UI.Menu.CloseAll()
        exports['mythic_notify']:SendAlert('inform', _U('TPlocation_notify')..' '..data.current.label..'')
        if IsPedInAnyVehicle(player, false) then											
            DoScreenFadeOut(1000)
            Wait(1200)
            ESX.Game.Teleport(vehPlayer, coords)
            SetEntityHeading(vehPlayer, heading)
            DoScreenFadeIn(1500)
        else
            DoScreenFadeOut(1000)
            Wait(1200)	
            ESX.Game.Teleport(player, coords) 
            SetEntityHeading(player, heading) 
            DoScreenFadeIn(1500)
        end
    end,
    function(data, menu)
        ESX.UI.Menu.CloseAll()
    end)
end

function TeleportWaypoint()
	local blip = GetFirstBlipInfoId(8)
	if DoesBlipExist(blip) then
		local waypointCoords = GetBlipInfoIdCoord(blip)
		for height = 1, 1000 do
			SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
			local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
			if foundGround then
				SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
				break
			end
			Wait(5)
		end
        exports['mythic_notify']:SendAlert('inform', _U('TPwaypoint_notify'))
	else
        exports['mythic_notify']:SendAlert('warn', _U('No_waypoint'))
	end
end