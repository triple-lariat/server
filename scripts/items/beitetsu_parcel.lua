-----------------------------------
-- ID: 6181
-- Beitetsu Parcel
-- Breaks up a Beitetsu Parcel
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
    target:addItem(xi.item.BEITETSU, math.random(3, 15))
end

return itemObject
