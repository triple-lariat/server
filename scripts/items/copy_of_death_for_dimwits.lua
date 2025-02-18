-----------------------------------------
-- ID: 6152
-- Item: Death for Dimwits
-- A guide to the finer points of hacking everything in one's way to pieces with a two-handed axe,
-- written by an anonymous individual.
-- Adventurers note that reading it increases one's great axe skill.
-----------------------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return xi.item_utils.skillBookCheck(target, xi.skill.GREAT_AXE)
end

itemObject.onItemUse = function(target)
    xi.item_utils.skillBookUse(target, xi.skill.GREAT_AXE)
end

return itemObject
