-----------------------------------
-- Brothers
-- Bearclaw Pinnacle ENM, Zephyr Fan
-- !addkeyitem ZEPHYR_FAN
-- !pos 121 -171 758 6
-----------------------------------
local ID = zones[xi.zone.BEARCLAW_PINNACLE]
-----------------------------------

local content = Battlefield:new({
    zoneId           = xi.zone.BEARCLAW_PINNACLE,
    battlefieldId    = xi.battlefield.id.BROTHERS,
    maxPlayers       = 18,
    levelCap         = 75,
    timeLimit        = utils.minutes(30),
    index            = 3,
    entryNpc         = "Wind_Pillar_4",
    exitNpc          = "Wind_Pillar_Exit",
    requiredKeyItems = { xi.ki.ZEPHYR_FAN, message = ID.text.ZEPHYR_RIPS },
    grantXP          = 3500,
})

content.groups =
{
    {
        mobs = { "Eldertaur" },
        mods =
        {
            [xi.mod.DMGMAGIC  ] = -1000,
            [xi.mod.SLEEP_MEVA] = 75,
        },

        mobMods =
        {
            [xi.mobMod.SIGHT_RANGE] = 30,
        },
    },
    {
        mobs = { "Mindertaur" },
        mods =
        {
            [xi.mod.DMGMAGIC    ] = -1000,
            [xi.mod.SILENCE_MEVA] = 75,
            [xi.mod.SLEEP_MEVA  ] = 50,
        },

        mobMods =
        {
            [xi.mobMod.SIGHT_RANGE] = 30,
        }
    },
}

content:addEssentialMobs({ "Eldertaur", "Mindertaur" })

content.loot =
{
    {
        { item = xi.item.NONE,                     weight = xi.loot.weight.VERY_LOW },
        { item = xi.item.SQUARE_OF_ELTORO_LEATHER, weight = xi.loot.weight.NORMAL   },
        { item = xi.item.PIECE_OF_CASSIA_LUMBER,   weight = xi.loot.weight.NORMAL   },
        { item = xi.item.DRAGON_BONE,              weight = xi.loot.weight.NORMAL   },
    },

    {
        { item = xi.item.NONE,         weight = xi.loot.weight.EXTREMELY_HIGH },
        { item = xi.item.CLOUD_EVOKER, weight = xi.loot.weight.LOW            },
    },

    {
        quantity = 2,
        { item = xi.item.NONE,                weight = xi.loot.weight.HIGH },
        { item = xi.item.SCOUTERS_ROPE,       weight = xi.loot.weight.LOW  },
        { item = xi.item.HEDGEHOG_BOMB,       weight = xi.loot.weight.LOW  },
        { item = xi.item.MARTIAL_ANELACE,     weight = xi.loot.weight.LOW  },
        { item = xi.item.MARTIAL_LANCE,       weight = xi.loot.weight.LOW  },
        { item = xi.item.SCROLL_OF_RAISE_III, weight = xi.loot.weight.HIGH },
    },
}

return content:register()
