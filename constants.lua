-- Game constants
MaxInventory = bj_MAX_INVENTORY ---@type integer
MaxPlayers = bj_MAX_PLAYERS ---@type integer

-- NumberPlayerPassive = PLAYER_NEUTRAL_PASSIVE ---@type integer
-- NumberPlayerAggressive = PLAYER_NEUTRAL_AGGRESSIVE ---@type integer
-- NumberPlayerVictim = bj_PLAYER_NEUTRAL_VICTIM ---@type integer
-- NumberPlayerExtra = bj_PLAYER_NEUTRAL_EXTRA ---@type integer

PlayerNeutralPassive = ClassPlayer:get(PLAYER_NEUTRAL_PASSIVE)
PlayerNeutralAggressive = ClassPlayer:get(PLAYER_NEUTRAL_AGGRESSIVE)
PlayerNeutralVictim = ClassPlayer:get(bj_PLAYER_NEUTRAL_VICTIM)
PlayerNeutralExtra = ClassPlayer:get(bj_PLAYER_NEUTRAL_EXTRA)

MaxSlotsPlayer = bj_MAX_PLAYER_SLOTS ---@type integer
MaxSkeletons = bj_MAX_SKELETONS ---@type integer
MaxItemStockSlots = bj_MAX_STOCK_ITEM_SLOTS ---@type integer
MaxUnitStockSlots = bj_MAX_STOCK_UNIT_SLOTS ---@type integer
MaxItemLevel = bj_MAX_ITEM_LEVEL ---@type integer