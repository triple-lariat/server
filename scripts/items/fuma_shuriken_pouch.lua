-----------------------------------
-- ID: 6302
-- Item: Fuma Sh. Pouch
-- When used, you will obtain one stack of Fuma Shurikens
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
    target:addItem(xi.item.FUMA_SHURIKEN, 99)
end

return itemObject
