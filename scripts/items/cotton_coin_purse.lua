-----------------------------------
-- ID: 5735
-- Ctn. Purse (Alx.)
-- Breaks up a Cotton Purse
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
    target:addItem(xi.item.ALEXANDRITE, math.random(5, 20))
end

return itemObject
