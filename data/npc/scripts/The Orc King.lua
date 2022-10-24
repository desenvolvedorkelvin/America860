local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local creatures = { 'Slime', 'Slime', 'Slime', 'Orc Warlord', 'Orc Warlord', 'Orc Leader', 'Orc Leader', 'Orc Leader' }
local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.OrcKingGreeting) ~= 1 then
		player:setStorageValue(Storage.OrcKingGreeting, 1)
		for i = 1, #creatures do
			Game.createMonster(creatures[i], Npc():getPosition())
		end
		npcHandler:say('Arrrrgh! A dirty paleskin! To me my children! Kill them my guards!', TALKTYPE_SAY)
		return false
	else
		npcHandler:setMessage(MESSAGE_GREET, 'Harrrrk! You think you are strong now? You shall never escape my wrath! I am immortal!')
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)	
	return true
end

keywordHandler:addKeyword({'immortal'}, StdModule.say, {npcHandler = npcHandler, text = 'I am Charkahn the Slayer! The immortal father of the {orcs} and master of this {hive}.'})
keywordHandler:addKeyword({'orcs'}, StdModule.say, {npcHandler = npcHandler, text = 'The orcs are the bearers of Blogs rage. This makes us the ultimate fighters and the most powerful of all races.'})
keywordHandler:addKeyword({'divine'}, StdModule.say, {npcHandler = npcHandler, text = 'The orcs are the bearers of Blogs rage. This makes us the ultimate fighters and the most powerful of all races.'})
keywordHandler:addKeyword({'hive'}, StdModule.say, {npcHandler = npcHandler, text = 'I can sense the presence and the feelings of my underlings and {minions}. I embrace the rage of the horde.'})
keywordHandler:addKeyword({'minions'}, StdModule.say, {npcHandler = npcHandler, text = 'The orcish horde of this hive is under my control. I sense their emotions and their needs and provide them with the leadership they need to focus their hate and rage'})
keywordHandler:addKeyword({'hate'}, StdModule.say, {npcHandler = npcHandler, text = 'Hate and rage are the true blessings of Blog, since they are powerful weapons. They give the hive strength. I provide them with direction and focus.'})
keywordHandler:addKeyword({'blog'}, StdModule.say, {npcHandler = npcHandler, text = 'The Raging One blessed us with his burning hate. We are truly his children and therefore {divine}.'})
keywordHandler:addKeyword({'direction'}, StdModule.say, {npcHandler = npcHandler, text = 'To conquer, to destroy and to dominate. Orcs are born to rule the {world}.'})
keywordHandler:addKeyword({'world'}, StdModule.say, {npcHandler = npcHandler, text = 'One day I will rule the world, even when turned into a {slime}.'})
keywordHandler:addKeyword({'slime'}, StdModule.say, {npcHandler = npcHandler, text = 'Pah! Don\'t mock me, mortal! This shape is a curse which the evil {djinn} bestowed upon me!'})
keywordHandler:addKeyword({'djinn'}, StdModule.say, {npcHandler = npcHandler, text = 'This cursed djinn king! I set him free from an enchanted {lamp}, and he {cheated} me!'})
keywordHandler:addKeyword({'cheated'}, StdModule.say, {npcHandler = npcHandler, text = 'Because I freed him he granted me three wishes. He was true to his word in the first two {wishes}.'})
keywordHandler:addKeyword({'wishes'}, StdModule.say, {npcHandler = npcHandler, text = 'He built this fortress over Uldrek\'s grave within a single night. Also, he granted me my second wish and gave me immortality. Test it and try to kill me if you want. Har Har!'})
keywordHandler:addKeyword({'third'}, StdModule.say, {npcHandler = npcHandler, text = 'I wished to father more healthy and fertile children as any orc has ever done. But the djinn cheated me and made me a slime! Then he laughed at me and left for his abandoned fortress in the {Deathwish} Mountains.'})
keywordHandler:addKeyword({'deathwish'}, StdModule.say, {npcHandler = npcHandler, text = 'His ancient fortress on Darama was deserted as the evil Djinn fled this world after his imprisonment. Now the time has come for the evil Djinns to return to their master although this will certainly awaken the {good Djinn} too.'})
keywordHandler:addKeyword({'good djinn'}, StdModule.say, {npcHandler = npcHandler, text = 'I will not share anything more about that topic with you {paleskins}.'})
keywordHandler:addKeyword({'paleskins'}, StdModule.say, {npcHandler = npcHandler, text = 'You are as ugly as maggots, although not quite as as tasty.'})


npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
