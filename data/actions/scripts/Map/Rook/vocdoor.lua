function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local vocationId = player:getVocation():getBase():getId()
	
	if vocationId ~= 0 then
		player:teleportTo(Position(2342, 2285, 7))
		player:sendCancelMessage('You already have a vocation')
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
	
	if player:getPremiumDays() == 0 then
		player:addPremiumDays(25)
	end	
	
	--sorcerer
	if item.actionid == 4531 then
		player:setVocation(1)
		player:addExperience(4200)
		player:teleportTo(Position(2297, 2289, 8))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
	
	--druid
	if item.actionid == 4532 then
		player:setVocation(2)
		player:addExperience(4200)
		player:teleportTo(Position(2330, 2291, 8))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
	
	
	--paladin
	if item.actionid == 4533 then
		player:setVocation(3)
		player:addExperience(4200)
		player:teleportTo(Position(2330, 2260, 8))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
	
	--sorcerer
	if item.actionid == 4534 then
		player:setVocation(4)
		player:addExperience(4200)
		player:teleportTo(Position(2298, 2261, 8))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
	
	
	
	return true
end