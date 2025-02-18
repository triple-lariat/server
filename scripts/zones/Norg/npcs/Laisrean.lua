-----------------------------------
-- Area: Norg
--  NPC: Laisrean
-- Starts and Ends Quest: The Sahagin's Stash
-- !pos -2.251 -1 21.654 252
-----------------------------------
local ID = zones[xi.zone.NORG]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stash = player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.THE_SAHAGINS_STASH)
    local mLvl = player:getMainLvl()

    if
        stash == QUEST_AVAILABLE and
        player:getFameLevel(xi.quest.fame_area.NORG) >= 4 and
        mLvl >= 5
    then
        player:startEvent(33) -- Start quest
    elseif stash == QUEST_ACCEPTED then
        if player:hasKeyItem(xi.ki.SEA_SERPENT_STATUE) then
            player:startEvent(35, xi.ki.SEA_SERPENT_STATUE) -- Finish quest
        else
            player:startEvent(34) -- Reminder Dialogue
        end
    else
        player:startEvent(83) -- Standard Conversation
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 33 and option == 1 then
        player:addQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.THE_SAHAGINS_STASH)
    elseif csid == 35 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.item.SCROLL_OF_UTSUSEMI_ICHI)
        else
            player:delKeyItem(xi.ki.SEA_SERPENT_STATUE)
            player:addItem(xi.item.SCROLL_OF_UTSUSEMI_ICHI) -- Scroll of Utsusemi: Ichi
            player:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.SCROLL_OF_UTSUSEMI_ICHI)
            player:addTitle(xi.title.TREASURE_HOUSE_RANSACKER)
            player:addFame(xi.quest.fame_area.NORG, 75)
            player:completeQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.THE_SAHAGINS_STASH)
        end
    end
end

return entity
