-- Hook Inventaire
VORP = exports.vorp_inventory:vorp_inventoryApi()

-- Hook User
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
	local _source = charid
	local user = VorpCore.getUser(charid)
	local Character = user.getUsedCharacter
	local job = Character.job
	TriggerClientEvent("LeMekap:StartJobs", charid, job, charid)
end)

RegisterNetEvent("LeMekap:BuyItem")
AddEventHandler("LeMekap:BuyItem", function(id, item_id, item_price)
	local source = id
	local user = VorpCore.getUser(source)
	local Character = user.getUsedCharacter
	
	if Character.money >= item_price then
		Character.removeCurrency(0, item_price)
		VORP.addItem(source, item_id, 1)
		TriggerClientEvent("LeMekap:SuccessBuy", source, item_price)
	else
		TriggerClientEvent("LeMekap:TooPoor", source, item_price)
	end
end)

RegisterNetEvent("LeMekap:BuyWeapon")
AddEventHandler("LeMekap:BuyWeapon", function(id,item_id, item_price)
	local source = id
	local user = VorpCore.getUser(source)
	local Character = user.getUsedCharacter
	if Character.money >= item_price then
		Character.removeCurrency(0, item_price)
		VORP.createWeapon(source, item_id, nil, nil)
		TriggerClientEvent("LeMekap:SuccessBuy", source, item_price)
	else
		TriggerClientEvent("LeMekap:TooPoor", source, item_price)
	end
end)