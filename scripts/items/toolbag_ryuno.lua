-----------------------------------
-- ID: 5865
-- Toolbag Ryuno
-- When used, you will obtain one stack of ryuno
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
    target:addItem(xi.item.RYUNO, 99)
end

return itemObject
