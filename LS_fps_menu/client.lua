ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('lsfps:lsfpsm') 
AddEventHandler('lsfps:lsfpsm', function()
    OpenFPSMenu()
end)

function OpenFPSMenu() 

    local elements = {
      {label = 'FPS Boost #1',		value = 'fps'},
      {label = 'Lights Mode',		value = 'fps5'},       
      {label = 'Graphics',		value = 'fps7'},
      {label = 'Simple/Reset',		value = 'fps2'},		
             
        }
  
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'headbagging',
      {
        title    = 'FPS Menu',
        align    = 'bottom-left',
        elements = elements
        },
  
            function(data2, menu2)
  
              if data2.current.value == 'fps' then
                SetTimecycleModifier('yell_tunnel_nodirect')
              elseif data2.current.value == 'fps2' then
                SetTimecycleModifier()
                ClearTimecycleModifier()
                ClearExtraTimecycleModifier()
              elseif data2.current.value == 'fps5' then
                SetTimecycleModifier('tunnel')
              elseif data2.current.value == 'fps7' then
                SetTimecycleModifier('MP_Powerplay_blend')
                SetExtraTimecycleModifier('reflection_correct_ambient')
              else
              end
            end,
      function(data2, menu2)
        menu2.close()
      end
    )
  end

             

 
                


  
