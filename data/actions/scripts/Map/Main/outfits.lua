local config = {
	[15001] = {Name ="Assassin Outfits"			,Female = 156, Male = 152},
	[15002] = {Name ="Barbarian Outfits"		,Female = 147, Male = 143},
	[15003] = {Name ="Citizen Outfits"			,Female = 136, Male = 128},
	[15004] = {Name ="Knight Outfits"			,Female = 139, Male = 131},
	[15005] = {Name ="Nobleman Outfits"			,Female = 140, Male = 132},
	[15006] = {Name ="Pirate Outfits"			,Female = 155, Male = 151},
	[15007] = {Name ="Shaman Outfits"			,Female = 158, Male = 154},
	[15008] = {Name ="Summoner Outfits"			,Female = 141, Male = 133},
	[15009] = {Name ="Warrior Outfits"			,Female = 142, Male = 134},
	[15010] = {Name ="Wizard Outfits"			,Female = 149, Male = 145},
	[15011] = {Name ="Beggar Outfits"			,Female = 157, Male = 153},
	[15012] = {Name ="Druid Outfits"			,Female = 148, Male = 144},
	[15013] = {Name ="Hunter Outfits"			,Female = 137, Male = 129},
	[15014] = {Name ="Mage Outfits"				,Female = 138, Male = 130},
	[15015] = {Name ="Oriental Outfits"			,Female = 150, Male = 146},
	[15016] = {Name ="Norseman Outfits"			,Female = 252, Male = 251},
	[15017] = {Name ="Brotherhood Outfits"		,Female = 279, Male = 278},
	[15018] = {Name ="Nightmare Outfits"		,Female = 269, Male = 268},
	[15019] = {Name ="Yalaharian Outfits"		,Female = 324, Male = 325},
	[15020] = {Name ="Warmaster Outfits"		,Female = 336, Male = 335},
	[15021] = {Name ="Wayfarer Outfits"			,Female = 366, Male = 367},
	[15022] = {Name ="Demon Hunter Outfits"		,Female = 288, Male = 289},
	[15023] = {Name ="Jester Outfits"			,Female = 270, Male = 273},
	[15024] = {Name ="Newly Wed Outfits"		,Female = 329, Male = 328}
	}


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	local Outfits = config[item.uid]
	if not Outfits then
		return true
	end
	
	if (player:getStorageValue(item.uid) == -1) then				
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found some clothes.. you got " .. Outfits.Name)
			player:addOutfit(Outfits.Female, 0)
			player:addOutfit(Outfits.Male, 0)
			player:addOutfitAddon(Outfits.Female, 3)
			player:addOutfitAddon(Outfits.Male, 3)
			player:setStorageValue(item.uid, 1)	
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Is empty.")		
	end
	
	return true
end
