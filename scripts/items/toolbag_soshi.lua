-----------------------------------
-- ID: 5734
-- Toolbag Soshi
-- When used, you will obtain one stack of soshi
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
    target:addItem(xi.item.SOSHI, 99)
end

return itemObject
