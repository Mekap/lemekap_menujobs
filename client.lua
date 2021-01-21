-- Script de générations de menu génériques

-- Liste des Jobs
local jobs = {}

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end



function CreateMenu(job,i,id)
	local nbLines = 0
	local title = job.JobMenuTitle
	local jobMenu
	print("Création de menu")
	print(i)
	WarMenu.CreateMenu(i, job.JobMenuTitle)
	local stay = true
	Citizen.CreateThread(function()
	while stay do 
		
		 -- Loop objets
		for i,item in ipairs(job.ItemsBuy) do
			if WarMenu.Button(item.ItemLabel) then
				TriggerServerEvent("LeMekap:BuyItem",id,item.ItemName, item.ItemPrice)
				WarMenu.CloseMenu()
				stay = false
			end
		end
		-- Loops Armes
		for i,weapon in ipairs(job.WeaponsBuy) do
			if WarMenu.Button(weapon.WeaponLabel) then
				TriggerServerEvent("LeMekap:BuyWeapon", id,weapon.WeaponName, weapon.WeaponPrice)
				WarMenu.CloseMenu()
				stay = false
			end
		end
		if WarMenu.IsMenuAboutToBeClosed() then
			stay = false
		end
		WarMenu.Display()
		Citizen.Wait(0)
		if stay == false then
			WarMenu.deleteMenu()
		end
	end
	end)
	--
end

function OpenMenu(job,i,id)
	CreateMenu(job,i,id)
	WarMenu.OpenMenu(i)
	WarMenu.Display()
end

function Start(playerJob,id)

jobs = Config.Jobs
-- Setup nom perso

for i,job in ipairs(Config.Jobs) do
	if job.JobName == playerJob then -- Faudra relancer le jeu pour un changement de job
		Citizen.CreateThread(function()
			-- Boucle de job
			local isMenuOpened = false
			 while true do
				local playerCoords = GetEntityCoords(PlayerPedId())  
				if Vdist(playerCoords, job.MenuCoords) <= job.MenuRadius then
					DrawTxt(job.JobAnnonce, 0.50, 0.85, 0.7, 0.7, true, 255, 255, 255, 255, true)
					if IsControlJustPressed(2, job.KeyboardControl) then -- 0x760A9C6F = G
						OpenMenu(job,i,id)
						Citizen.Wait(5000)           
					end
				end
				Citizen.Wait(1)           
			end 
		end)
	end
end

end

RegisterNetEvent("LeMekap:TooPoor")
AddEventHandler("LeMekap:TooPoor", function(price)
	TriggerEvent("vorp:TipRight", "Il vous faut " .. price .. "$ pour acheter cela !", 5000)
end)

RegisterNetEvent("LeMekap:SuccessBuy")
AddEventHandler("LeMekap:SuccessBuy", function(price)
	TriggerEvent("vorp:TipRight", "Vous venez de dépenser ".. price .."$", 5000)
end)


RegisterNetEvent("LeMekap:StartJobs")
AddEventHandler("LeMekap:StartJobs", function(job, id)
	print("Debut du job")
	Start(job,id)
end)