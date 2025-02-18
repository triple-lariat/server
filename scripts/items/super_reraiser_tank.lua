-----------------------------------
-- ID: 26272
-- Super Reraiser Tank
-- When used, you will obtain one super reraiser
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
    target:addItem(xi.item.SUPER_RERAISER, 1)
end

return itemObject
