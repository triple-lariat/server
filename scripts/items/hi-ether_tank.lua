-----------------------------------
-- ID: 13689
-- Hi-Ether Tank
-- When used, you will obtain one hi-ether
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
    target:addItem(xi.item.HI_ETHER, 1)
end

return itemObject
