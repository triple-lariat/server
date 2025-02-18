-----------------------------------
--   ID: 15288
--   Pellet Belt
--   When used, you will obtain 12 Pebbles
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
    target:addItem(xi.item.PEBBLE, 12)
end

return itemObject
