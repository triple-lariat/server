-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Yagudo Avatar
-- Note: PH for Tzee Xicu the Manifest
-- TODO: messages should be zone-wide
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
local ID = zones[xi.zone.CASTLE_OZTROJA]
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
    mob:showText(mob, ID.text.YAGUDO_AVATAR_ENGAGE)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller then
        mob:showText(mob, ID.text.YAGUDO_AVATAR_DEATH)
    end
end

entity.onMobDespawn = function(mob)
    local nqId = mob:getID()

    if nqId == ID.mob.YAGUDO_AVATAR then
        local hqId        = mob:getID() + 3
        local timeOfDeath = GetServerVariable("[POP]Tzee_Xicu_the_Manifest")
        local kills       = GetServerVariable("[PH]Tzee_Xicu_the_Manifest")
        local popNow      = (math.random(1, 5) == 3 or kills > 6)

        if os.time() > timeOfDeath and popNow then
            DisallowRespawn(nqId, true)
            DisallowRespawn(hqId, false)
            UpdateNMSpawnPoint(hqId)
            GetMobByID(hqId):setRespawnTime(math.random(75600, 86400))
        else
            UpdateNMSpawnPoint(nqId)
            mob:setRespawnTime(math.random(75600, 86400))
            SetServerVariable("[PH]Tzee_Xicu_the_Manifest", kills + 1)
        end
    end
end

return entity
