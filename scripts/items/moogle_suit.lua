-----------------------------------
-- ID: 10250
-- Moogle Suit
-- Dispense: Mog Missile
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
    target:addItem(xi.item.MOG_MISSILE, 1)
end

return itemObject
