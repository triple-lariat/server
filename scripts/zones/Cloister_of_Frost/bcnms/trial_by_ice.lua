-----------------------------------
-- Area: Cloister of Frost
-- BCNM: Trial by Ice
-----------------------------------
local ID = zones[xi.zone.CLOISTER_OF_FROST]
-----------------------------------
local battlefieldObject = {}

battlefieldObject.onBattlefieldTick = function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefieldObject.onBattlefieldRegister = function(player, battlefield)
end

battlefieldObject.onBattlefieldEnter = function(player, battlefield)
end

battlefieldObject.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        local _, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:hasCompletedQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.TRIAL_BY_ICE)) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefieldObject.onEventUpdate = function(player, csid, option, npc)
end

battlefieldObject.onEventFinish = function(player, csid, option, npc)
    if csid == 32001 then
        player:delKeyItem(xi.ki.TUNING_FORK_OF_ICE)
        player:addKeyItem(xi.ki.WHISPER_OF_FROST)
        player:addTitle(xi.title.HEIR_OF_THE_GREAT_ICE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.WHISPER_OF_FROST)
    end
end

return battlefieldObject
