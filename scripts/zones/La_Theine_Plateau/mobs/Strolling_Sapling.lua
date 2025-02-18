-----------------------------------
-- Area: La Theine Plateau
--  Mob: Strolling Sapling
-----------------------------------
require("scripts/quests/tutorial")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 5, 1, xi.regime.type.FIELDS)
    xi.tutorial.onMobDeath(player)
end

return entity
