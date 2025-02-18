-----------------------------------
-- ID: 14535
-- onnagimi_yukata
-- Dispense: Datechochin x99
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
    target:addItem(xi.item.DATECHOCHIN, 99)
end

return itemObject
