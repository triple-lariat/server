-----------------------------------
-- Area: Windurst Woods
--  NPC: Spare One
--  Involved in quest: A Greeting Cardian
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local aGreetingCardian = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.A_GREETING_CARDIAN)
    local agcCs = player:getCharVar("AGreetingCardian_Event")

    if aGreetingCardian == QUEST_ACCEPTED and agcCs == 2 then
        player:startEvent(295) -- A Greeting Cardian step two
    else
        player:startEvent(278) -- standard dialog
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 295 then
        player:setCharVar("AGreetingCardian_Event", 3)
    end
end

return entity
