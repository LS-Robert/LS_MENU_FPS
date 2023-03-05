ESX = nil
if(Config.framework == "esx") then
    ESX = exports["es_extended"]:getSharedObject()
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

RegisterCommand('fpsmenu', function(source)
    OpenFPSMenu()
end)

RegisterNetEvent('lsfps:client:fps', function(data)
    arg = data.arg
    print(arg)
    if arg == 'fps' then
        SetTimecycleModifier('yell_tunnel_nodirect')
    elseif arg == 'fps2' then
        SetTimecycleModifier()
        ClearTimecycleModifier()
        ClearExtraTimecycleModifier()
    elseif arg == 'fps5' then
        SetTimecycleModifier('tunnel')
    elseif arg == 'fps7' then
        SetTimecycleModifier('MP_Powerplay_blend')
        SetExtraTimecycleModifier('reflection_correct_ambient')
    end
end)

function OpenFPSMenu() 
    if(Config.framework == "esx") then
        local elements = {
            {label = 'FPS Boost #1',		value = 'fps' },
            {label = 'Lights Mode',		    value = 'fps5'},       
            {label = 'Graphics',		    value = 'fps7'},
            {label = 'Simple/Reset',		value = 'fps2'},		
        }
        
        ESX.UI.Menu.CloseAll()
        
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'headbagging',
            {
                title    = 'FPS Menu',
                align    = 'bottom-left',
                elements = elements
            },
            function(data2, menu2)
                TriggerEvent('lsfps:client:fps', data2.current.value)
            end,
            function(data2, menu2)
                menu2.close()
            end
        )
    elseif(Config.framework == "qb") then
        exports['qb-menu']:openMenu({
            {
                header = "FPS Menu",
                isMenuHeader = true
            },
            {
                header = 'FPS Boost #1',
                txt = 'fps1',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'lsfps:client:fps',
                    args = {
                        arg = 'fps',
                    }
                }
            },
            {
                header = 'Lights Mode',
                txt = 'fps5',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'lsfps:client:fps',
                    args = {
                        arg = 'fps5',
                    }
                }
            },
            {
                header = 'Graphics',
                txt = 'fps7',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'lsfps:client:fps',
                    args = {
                        arg = 'fps7',
                    }
                }
            },
            {
                header = 'Simple/Reset',
                txt = 'fps2',
                icon = 'fas fa-code-merge',
                params = {
                    event = 'lsfps:client:fps',
                    args = {
                        arg = 'fps2',
                    }
                }
            },
        })
    end
end