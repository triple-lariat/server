-----------------------------------
-- ID: 13682
-- Ether Tank
-- When used, you will obtain one Ether
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
    target:addItem(xi.item.ETHER, 1)
end

return itemObject
