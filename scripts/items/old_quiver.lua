-----------------------------------
-- ID: 5270
-- Old Quiver
-- When used, you will obtain one partial stack of Crude Arrows
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
    target:addItem(xi.item.CRUDE_ARROW, math.random(10, 20))
end

return itemObject
