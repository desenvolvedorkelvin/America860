local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local missionProgress = player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission03)
	
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Welcome, human |PLAYERNAME|, to our humble abode.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Farewell, stranger. May Uman open your minds and your hearts to Daraman\'s wisdom!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Farewell, stranger. May Uman open your minds and your hearts to Daraman\'s wisdom!')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local focusModule = FocusModule:new()
focusModule:addGreetMessage('hi')
focusModule:addGreetMessage('hello')
focusModule:addGreetMessage('djanni\'hah')
npcHandler:addModule(focusModule)
