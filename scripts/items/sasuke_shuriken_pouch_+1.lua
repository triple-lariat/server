-----------------------------------
-- ID: 6448
-- Sasu. Sh. Pouch +1
-- A small leather pouch made for storing sasuke shuriken +1.
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
    target:addItem(xi.item.SASUKE_SHURIKEN_P1, 99)
end

return itemObject
