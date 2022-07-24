Config = {}

-- Language settings --
Config.Locale = 'en'                  -- cs = Czech, en = English (You can add more...)

-- Teleport menu Settings --
Config.MenuOpenBind = 'F1'            -- Key to open teleport menu
Config.MenuPosition = 'top-right'     -- Menu position
Config.TeleportWaypoint = true        -- true = enable teleport to waypoint in menu

-- Waypoint keybind settings --
Config.TeleportPressKey = true        -- true = enable teleport to waypoint by pressing key
Config.TeleportKeyBind = 166          -- Teleport key to waypont [166 = F5] https://docs.fivem.net/docs/game-references/controls/#controls

-- Location in teleport menu --
Locations = {                          
    { label = "Ebisu Minami", x = 866.72, y = 1102.51, z = 459.71, h = 338.64},
    { label = "Ebisu Touge", x=-1344.42, y=1320.68, z=828.20, h = 3.43},
    { label = "Deriphill", x=6131.94, y=-552.22,  z=346.70, h = 193.31},
    { label = "Project Touge", x=1960.49, y=416.30,  z=236.92, h = 87.78},
    { label = "Okutama", x=-2408.7534, y=4252.3950, z=17.0154, h=100.3974},
    { label = "Kami Road", x=4763.6343, y=5144.4443, z=25.2439, h=162.4556},
    { label = "Lost Intentions", x=-5889.43, y=-7147.90, z=209.73, h = 258.36},
    { label = "MaxDrift", x=-3035.21, y=2565.79, z=634.01, h = 21.41},
    { label = "Hunter Park", x=1237.79, y=7373.94, z=80.22, h = 48.37},
    { label = "Motorsportland", x=2481.74, y=3048.58, z=545.30, h = 299.67},
    { label = "Drift Playground", x=3820.29, y=19.29, z=14.70, h = 216.18},
    { label = "Los Santos Tuners", x=-2114.22, y=1097.59, z=-27.36, h = 270.37},
    { label = "Nurburgring Nordschleife", x=3713.32, y=-6519.01, z=2190.80, h = 134.70},
}

-- Translations --
Locales['cs'] = {
    ['Menu_title']          = '🎈 Teleport menu',
    ['Locations_element']   = '🏁 Race&Drift Maps',
    ['Waypoint_element']    = '📌 Waypoint Teleport',
    ['TPlocation_notify']   = 'Byl jsi teleportován na',
    ['TPwaypoint_notify']   = 'Byl jsi teleportován na waypoint',
    ['No_waypoint']         = 'Nemáš nastaven žádný waypoint',
}

Locales['en'] = {
    ['Menu_title']          = '🎈 Teleport menu',
    ['Locations_element']   = '🏁 Race&Drift Maps',
    ['Waypoint_element']    = '📌 Waypoint Teleport',
    ['TPlocation_notify']   = 'You have been teleported to',
    ['TPwaypoint_notify']   = 'You been teleported to a waypoint',
    ['No_waypoint']         = 'You have no waypoint set',
}
