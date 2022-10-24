local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Any time\'s a good time to buy some furniture!'} }
npcHandler:addModule(VoiceModule:new(voices))


-- Others
npcHandler:setMessage(MESSAGE_GREET, 'Nice to meet you, Mister |PLAYERNAME|! Looking for furniture? You\'ve come to the right place!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'You\'ll come back. They all do.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye.')
npcHandler:setMessage(MESSAGE_SENDTRADE, 'Have a look. Most furniture comes in handy kits. Just use them in your house to assemble the furniture. Do you want to see only a certain type of furniture?')

npcHandler:addModule(FocusModule:new())
