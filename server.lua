ESX = exports["es_extended"]:getSharedObject()

RegisterCommand('fpsmenu', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('lsfps:lsfpsm', _source)
end)

