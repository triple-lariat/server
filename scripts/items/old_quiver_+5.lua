-----------------------------------
-- ID: 5275
-- Old Quiver +5
-- When used, you will obtain one partial stack of Crude Arrows +5
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
    target:addItem(xi.item.CRUDE_ARROW_P5, math.random(10, 20))
end

return itemObject
