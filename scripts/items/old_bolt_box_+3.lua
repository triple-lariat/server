-----------------------------------
-- ID: 5281
-- Old Bolt Box +3
-- When used, you will obtain one partial stack of Dogbolt +3
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
    target:addItem(xi.item.DOGBOLT_P3, math.random(10, 20))
end

return itemObject
