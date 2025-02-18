-----------------------------------
-- ID: 16226
-- Pamama Tank
-- When used, you will obtain one Pamama au lait
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
    target:addItem(xi.item.FLASK_OF_PAMAMA_AU_LAIT, 1)
end

return itemObject
