-----------------------------------
-- ID: 5868
-- Toolbag Shika
-- When used, you will obtain one stack of shikanofuda
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
    target:addItem(xi.item.SHIKANOFUDA, 99)
end

return itemObject
