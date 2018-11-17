ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_creature_tidning:sellTidning')                           
AddEventHandler('esx_creature_tidning:sellTidning', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	local tidningQuantity = xPlayer.getInventoryItem('tidning').count
	local randomMoney = math.random(10, 15)         ---- You will get 10 - 15kr when if you sell one tidning! |   	local randomMoney = math.random(25, 50) | Now you will get more money when you sell
	
	if tidningQuantity == 0 then
	sendNotification(_source, 'Du har inga tidningar att sälja', 'error', 2500)
	else
	xPlayer.removeInventoryItem('tidning', tidningQuantity)
	xPlayer.addAccountMoney('bank', tidningQuantity * 13)
	sendNotification(_source, 'Du sålde ' .. tidningQuantity .. ' tidningar för ' .. tidningQuantity * randomMoney .. ' SEK', 'success', 3500)
	end

end)

--notification
function sendNotification(xSource, message, messageType, messageTimeout)
    TriggerClientEvent("pNotify:SendNotification", xSource, {
        text = message,
        type = messageType,
        queue = "lmao",
        timeout = messageTimeout,
        layout = "bottomCenter"
    })
end