-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Sturm
-- Involved in Quest: A New Dawn (BST AF3)
-----------------------------------
local ID = zones[xi.zone.THE_ELDIEME_NECROPOLIS]
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobDeath = function(mob, player, optParams)
    if
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.A_NEW_DAWN) == QUEST_ACCEPTED and
        player:getCharVar("ANewDawn_Event") == 4
    then
        player:setCharVar("ANewDawn_Event", 5)
    end

    if optParams.isKiller then
        for i = ID.mob.TAIFUN, ID.mob.TROMBE do
            if GetMobByID(i):isSpawned() then
                DespawnMob(i)
            end
        end
    end
end

return entity
