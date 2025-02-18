-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Divine Might
--[[ caps:
    7d01, 0, 529, 1, 950, 180, 6, 0, 0 --Neo AA HM
    7d01, 0, 1400, 5, 1400, 180, 11, 0, 0  --Neo DM
    7d01, 1, 405, 1, 1599, 180, 7, 0, 0 -- Neo AA TT
    7d01, 1, 378, 3, 903, 180, 8, 0, 0 -- Neo AA MR
    7d02, 0, 80, 1, 512, 4, 4, 180 -- Neo DM (lose)
]]
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

        if player:getCurrentMission(xi.mission.log_id.ZILART) == xi.mission.id.zilart.ARK_ANGELS then
            player:setLocalVar("battlefieldWin", battlefield:getID())
        end

        local arg8 = (player:hasCompletedMission(xi.mission.log_id.ZILART, xi.mission.id.zilart.ARK_ANGELS)) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 180, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002, 0, 0, 0, 0, 0, battlefield:getArea(), 180)
    end
end

battlefieldObject.onEventUpdate = function(player, csid, option, npc)
end

battlefieldObject.onEventFinish = function(player, csid, option, npc)
    if csid == 32001 then
        if player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.DIVINE_MIGHT) == QUEST_ACCEPTED then
            player:setCharVar("DivineMight", 2) -- Used to use 2 to track completion, so that's preserved to maintain compatibility
        elseif
            player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.DIVINE_MIGHT_REPEAT) == QUEST_ACCEPTED and
            player:hasKeyItem(xi.ki.MOONLIGHT_ORE)
        then
            player:setCharVar("DivineMight", 2)
        end
    end
end

return battlefieldObject
