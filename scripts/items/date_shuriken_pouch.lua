-----------------------------------
-- ID: 6449
-- Date Suriken Pouch
-- A small leather pouch made for storing Date Suriken.
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
    target:addItem(xi.item.DATE_SHURIKEN, 99)
end

return itemObject
