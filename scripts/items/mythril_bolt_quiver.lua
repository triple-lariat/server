-----------------------------------
-- ID: 4228
-- Mythril Bolt Quiver
-- When used, you will obtain one stack of Mythril Bolts
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
    target:addItem(xi.item.MYTHRIL_BOLT, 99)
end

return itemObject
