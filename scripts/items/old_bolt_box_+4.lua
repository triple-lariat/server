-----------------------------------
-- ID: 5282
-- Old Bolt Box +4
-- When used, you will obtain one partial stack of Dogbolt +4
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = xi.msg.basic.ITEM_NO_USE_INVENTORY
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addItem(xi.item.DOGBOLT_P4, math.random(10, 20))
end

return itemObject
