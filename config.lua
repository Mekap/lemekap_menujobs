Config = { }

Config.Jobs = {
{		
	-- BarMan  Valentine
	["JobName"] = "Barman", -- Job check
	["MenuCoords"] = vector3(-311.32,  820.68, 118.81), -- X, y,z
	["MenuRadius"] = 1.0, -- distance d'affiche du menu depuis MenuCoords
	["KeyboardControl"] = 0x760A9C6F, -- Touche -> 0x760A9C6F = G
	["JobAnnonce"] = "Appuyez sur [~e~G~q~] pour accéder à votre [~e~ menu de barman~q~]",			 -- Prompt

	["JobMenuTitle"] = "Réserve du Smithfield", --Menu title
	-- Item List Sold
	["ItemsBuy"] = { 
				{["ItemName"] = "beer", ["ItemLabel"] = "Bière pour 1.0$", ["ItemPrice"] = 1.0},
				{["ItemName"] = "whisky", ["ItemLabel"] = "Whisky pour 1.5$", ["ItemPrice"] = 1.5},
				{["ItemName"] = "water", ["ItemLabel"] = "Eau pour 1.0$", ["ItemPrice"] = 1.0},
				{["ItemName"] = "consumable_crackers", ["ItemLabel"] = "Crackers pour 0.25$", ["ItemPrice"] = 0.25},
				{["ItemName"] = "consumable_coffee", ["ItemLabel"] = "Café pour 0.75$", ["ItemPrice"] = 0.75},
				{["ItemName"] = "consumable_cheese_wedge", ["ItemLabel"] = "Fromage pour 0.5$", ["ItemPrice"] = 0.5}
					
				},
	-- Weapon List Sold
	["WeaponsBuy"] = { 
		{["WeaponName"] = "WEAPON_MELEE_TORCH", ["WeaponLabel"] = "Torche pour 1.0$", ["WeaponPrice"] = 1.0}
	}
}

}