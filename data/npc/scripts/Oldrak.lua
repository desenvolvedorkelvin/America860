local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 		npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'mission') or msgcontains(msg, 'demon oak') then
		if player:getStorageValue(Storage.DemonOak.Done) == 1 then
			npcHandler:say("Excellent, look for the sanctified grave  (going down from the temple and then going to the right) to get your reward.", cid)
			return true
		end
	
		npcHandler:say("How do you know? Did you go into the infested area?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		npcHandler:say("A demon oak?!? <mumbles some blessings> May the gods be on our side. You'll need a {hallowed axe} to harm that tree. Bring me a simple {axe} and I'll prepare it for you.",cid)
		npcHandler.topic[cid] = 2
	end
	
	if msgcontains(msg, 'axe') then
		if player:getMoney() + player:getBankBalance() >= 1000 then
				if player:removeItem(2386, 1) and player:removeMoneyNpc(1000) then
					npcHandler:say("Let's see....<mumbles a prayer>....here we go. The blessing on this axe will be absorbed by all the demonic energy around here. I presume it will not last very long, so better hurry. Actually, I can refresh the blessing as often as you like.",cid)
					player:addItem(8293, 1)
					player:setStorageValue(Storage.DemonOak.Progress, 1)
					Npc():getPosition():sendMagicEffect(CONST_ME_YELLOWENERGY)
					npcHandler.topic[cid] = 0
				else
					npcHandler:say("There is no axe with you.",cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("There is not enough of money with you.",cid)
				npcHandler.topic[cid] = 0
			end
	end
	
	
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Welcome |PLAYERNAME|! Only rarely I can welcome visitors these days.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good Bye, |PLAYERNAME|')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good Bye, |PLAYERNAME|')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
