ESX = exports["es_extended"]:getSharedObject()

local MenuOption = {
    {
        name = "FPS ON",
        funcion = function()
            -- FPS CONFIG
            SetResourceKvpFloat("pedstreaming_max_time", 0.1)
            SetResourceKvpInt("entitystreaming_max_time", 0)
            SetResourceKvpInt("lodscale", 2)
            SetResourceKvpFloat("lodmult", 1.0)
            SetResourceKvpFloat("ShadowDepthBias", 0.01)
            SetResourceKvpFloat("ShadowNearClip", 0.01)
            SetResourceKvpFloat("MaxLightsPerCluster", 50.0)
            SetResourceKvpFloat("grass_quality", 5.0)
            SetResourceKvpFloat("fxaa_quality", 3.0)
            SetResourceKvpFloat("farclip", 2000.0)
            SetResourceKvpFloat("particle_quality", 2.0)
            SetResourceKvpFloat("shadow_quality", 5.0)
            SetResourceKvpFloat("shadowsoftness", 1.0)
            SetResourceKvpFloat("texture_quality", 2.0)
            SetResourceKvpFloat("water_quality", 4.0)
            SetResourceKvpFloat("water_wavelets", 0.0)
            SetResourceKvpFloat("vehicledensity", 0.0)
            SetResourceKvpFloat("vehiclestreaming_priority_multiplier", 0.0)
            SetResourceKvpFloat("StreamingMaxVehicleCullDistanceScale", 0.0)
            SetResourceKvpFloat("MaxVehicleCullDistance", 0.0)
            print("Performance options configured to increase FPS.")
        end
    },
    {
        name = "FPS OFF",
        funcion = function()
            DeleteResourceKvp("pedstreaming_max_time")
            DeleteResourceKvp("entitystreaming_max_time")
            DeleteResourceKvp("lodscale")
            DeleteResourceKvp("lodmult")
            DeleteResourceKvp("maxvehiclerr")
            ESX.ShowNotification("FPS settings restored to their default values.")
        end
    }
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 168) then -- "E" key to open the menu
            OpenMenu(MenuOption)
        end
    end
end)

function OpenMenu(opciones)
    local elements = {}
    for _, opcion in ipairs(opciones) do
        table.insert(elements, {label = opcion.name})
    end
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'opciones', {
        title = 'Menu FPS',
        align = 'bottom-left',
        elements = elements
    }, function(data, menu)
        local opcionSeleccionada = opciones[data.current.index]
        opcionSeleccionada.funcion()
    end, function(data, menu)
        menu.close()
    end)
end