local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Passages to Monterrey, Sunken, Rio, Pirates, Frost Dragons, Dyer, Groenlandia, Sea Serpents, '} }
npcHandler:addModule(VoiceModule:new(voices))

-- Travel
local function addTravelKeyword(keyword, cost, destination, action, condition)
	if condition then
		keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry but I don\'t sail there.'}, condition)
	end

	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination}, nil, action)
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})
end

addTravelKeyword('monterrey', 130, Position(2088, 2207, 6))
addTravelKeyword('sunken', 160, Position(2148, 2249, 7))
addTravelKeyword('rio', 170, Position(2825, 2947, 6))
addTravelKeyword('pirates', 160, Position(2372, 2089, 5))
addTravelKeyword('frost dragons', 180, Position(1993, 1143, 6))
addTravelKeyword('dyer', 180, Position(2593, 1333, 6))
addTravelKeyword('groenlandia', 180, Position(2863, 1485, 6))
addTravelKeyword('sea serpents', 180, Position(2359, 1338, 6))

keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {Monterrey}, {Sunken}, {Rio}, {Pirates}, {Frost Dragons}, {Dyer}, {Groenlandia} or {Sea Serpents}?'})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {Monterrey}, {Sunken}, {Rio}, {Pirates}, {Frost Dragons}, {Dyer}, {Groenlandia} or {Sea Serpents}?'})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {Monterrey}, {Sunken}, {Rio}, {Pirates}, {Frost Dragons}, {Dyer}, {Groenlandia} or {Sea Serpents}?'})
keywordHandler:addKeyword({'town'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {Monterrey}, {Sunken}, {Rio}, {Pirates}, {Frost Dragons}, {Dyer}, {Groenlandia} or {Sea Serpents}?'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {Monterrey}, {Sunken}, {Rio}, {Pirates}, {Frost Dragons}, {Dyer}, {Groenlandia} or {Sea Serpents}?'})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {Monterrey}, {Sunken}, {Rio}, {Pirates}, {Frost Dragons}, {Dyer}, {Groenlandia} or {Sea Serpents}?'})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, text = 'Where do you want to go? To {Monterrey}, {Sunken}, {Rio}, {Pirates}, {Frost Dragons}, {Dyer}, {Groenlandia} or {Sea Serpents}?'})



npcHandler:setMessage(MESSAGE_GREET, 'Welcome on board, |PLAYERNAME|. Where can I {sail} you today?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye. Recommend us if you were satisfied with our service.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye then.')

npcHandler:addModule(FocusModule:new())
