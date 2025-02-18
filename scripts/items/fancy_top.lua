-----------------------------------
-- ID: 25775
-- Fancy Top
-- Dispenses Persikos Snow Cone
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
    target:addItem(xi.item.PERSIKOS_SNOW_CONE)
end

return itemObject
