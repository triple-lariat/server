-----------------------------------
-- Area: Valkurm Dunes (103)
--   NM: Golden Bat
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 208)
end

return entity
