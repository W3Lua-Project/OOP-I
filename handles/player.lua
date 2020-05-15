--============================================================================
-- Player API

---@class player:agent
---@class playercolor:handle
---@class race:handle
---@class playerstate:handle
---@class playerscore:handle
---@class alliancetype:handle
---@class playergameresult:handle

PlayerState = {}
---@param i integer
---@return playerstate
function PlayerState.convert(i)
    return ConvertPlayerState(i)
end
-- current resource levels
--
PlayerState.ResourceGold = PlayerState.convert(1)
PlayerState.ResourceLumber = PlayerState.convert(2)
PlayerState.ResourceHeroTokens = PlayerState.convert(3)
PlayerState.ResourceFoodCap = PlayerState.convert(4)
PlayerState.ResourceFoodUsed = PlayerState.convert(5)
PlayerState.FoodCapCeiling = PlayerState.convert(6)

PlayerState.GivesBounty = PlayerState.convert(7)
PlayerState.AlliedVictory = PlayerState.convert(8)
PlayerState.Placed = PlayerState.convert(9)
PlayerState.OnDeathObserver = PlayerState.convert(10)
PlayerState.Observer = PlayerState.convert(11)
PlayerState.Unfollowable = PlayerState.convert(12)
-- taxation rate for each resource
--
PlayerState.GoldUpkeepRate = PlayerState.convert(13)
PlayerState.LumberUpkeepRate = PlayerState.convert(14)
-- cumulative resources collected by the player during the mission
--
PlayerState.GoldGathered = PlayerState.convert(15)
PlayerState.LumberGathered = PlayerState.convert(16)
PlayerState.NoCreepSleep = PlayerState.convert(25)


Race = {}
---@param i integer
---@return race
function Race.convert(i)
    return ConvertRace(i)
end
Race.Human = Race.convert(1)
Race.Orc = Race.convert(2)
Race.Undead = Race.convert(3)
Race.NightElf = Race.convert(4)
Race.Demon = Race.convert(5)
Race.Other = Race.convert(7)

PlayerColor = {}
---@param i integer
---@return playercolor
function PlayerColor.convert(i)
    return ConvertPlayerColor(i)
end

PlayerColor.Red = PlayerColor.convert(0)
PlayerColor.Blue = PlayerColor.convert(1)
PlayerColor.Cyan = PlayerColor.convert(2)
PlayerColor.Purple = PlayerColor.convert(3)
PlayerColor.Yellow = PlayerColor.convert(4)
PlayerColor.Orange = PlayerColor.convert(5)
PlayerColor.Green = PlayerColor.convert(6)
PlayerColor.Pink = PlayerColor.convert(7)
PlayerColor.LightGray = PlayerColor.convert(8)
PlayerColor.LightBlue = PlayerColor.convert(9)
PlayerColor.Aqua = PlayerColor.convert(10)
PlayerColor.Brown = PlayerColor.convert(11)
PlayerColor.Maroon = PlayerColor.convert(12)
PlayerColor.Navy = PlayerColor.convert(13)
PlayerColor.Turquoise = PlayerColor.convert(14)
PlayerColor.Violet = PlayerColor.convert(15)
PlayerColor.Wheat = PlayerColor.convert(16)
PlayerColor.Peach = PlayerColor.convert(17)
PlayerColor.Mint = PlayerColor.convert(18)
PlayerColor.Lavender = PlayerColor.convert(19)
PlayerColor.Coal = PlayerColor.convert(20)
PlayerColor.Snow = PlayerColor.convert(21)
PlayerColor.Emerald = PlayerColor.convert(22)
PlayerColor.Peanut = PlayerColor.convert(23)

AllianceType = {}
---@param i integer
---@return alliancetype
function AllianceType.convert(i)
    return ConvertAllianceType(i)
end
AllianceType.Passive = AllianceType.convert(0)
AllianceType.HelpRequest = AllianceType.convert(1)
AllianceType.HelpResponse = AllianceType.convert(2)
AllianceType.SharedXP = AllianceType.convert(3)
AllianceType.SharedSpells = AllianceType.convert(4)
AllianceType.SharedVision = AllianceType.convert(5)
AllianceType.SharedControl = AllianceType.convert(6)
AllianceType.SharedAdvancedControl = AllianceType.convert(7)
AllianceType.Rescuable = AllianceType.convert(8)
AllianceType.SharedVisionForced = AllianceType.convert(9)

PlayerGameResult = {}
---@param i integer
---@return playergameresult
function PlayerGameResult.convert(i)
    return ConvertPlayerGameResult(i)
end
PlayerGameResult.Victory = PlayerGameResult.convert(0)
PlayerGameResult.Defeat = PlayerGameResult.convert(1)
PlayerGameResult.Tie = PlayerGameResult.convert(2)
PlayerGameResult.Neutral = PlayerGameResult.convert(3)



---@class ClassPlayer:ClassHandle
---@class Player:Handle
ClassPlayer = newClass(Handle) ---@type ClassPlayer

---@param handle player
function ClassPlayer:new(handle)
    local obj = self.old:new(handle) ---@type Player
    self:instantiate(obj)

    ---@param otherPlayer Player
    ---@return boolean
    function obj.isAlly(otherPlayer)
        return IsPlayerAlly(obj.handle,otherPlayer.handle)
    end

    ---@param otherPlayer Player
    ---@return boolean
    function obj.isEnemy(otherPlayer)
        return IsPlayerEnemy(obj.handle,otherPlayer.handle)
    end

    ---@param whichForce Force
    ---@return boolean
    function obj.inForce(whichForce)
        return IsPlayerInForce(obj.handle,whichForce.handle)
    end

    ---@return boolean
    function obj.isObserver()
        return IsPlayerObserver(obj.handle)
    end

    ---@param x real
    ---@param y real
    ---@return boolean
    function obj.coordsVisible(x,y)
        return IsVisibleToPlayer(x,y,obj.handle)
    end

    ---@param p Point
    ---@return boolean
    function obj.pointVisible(p)
        return obj.coordsVisible(p.x(),p.y())
    end

    ---@param whichLocation LocationHandle
    ---@return boolean
    function obj.locationVisible(whichLocation)
        return IsLocationVisibleToPlayer(whichLocation.handle,obj.handle)
    end

    ---@param x real
    ---@param y real
    ---@return boolean
    function obj.coordsFogged(x,y)
        return IsFoggedToPlayer(x,y,obj.handle)
    end

    ---@param p Point
    ---@return boolean
    function obj.pointFogged(p)
        return obj.coordsFogged(p.x(),p.y())
    end

    ---@param whichLocation LocationHandle
    ---@return boolean
    function obj.locationFogged(whichLocation)
        return IsLocationFoggedToPlayer(whichLocation.handle,obj.handle)
    end

    ---@param x real
    ---@param y real
    ---@return boolean
    function obj.coordsMasked(x,y)
        return IsMaskedToPlayer(x,y,obj.handle)
    end

    ---@param p Point
    function obj.pointMasked(p)
        return obj.coordsMasked(p.x(),p.y())
    end

    ---@param whichLocation LocationHandle
    ---@return boolean
    function obj.locationMasked(whichLocation)
        return IsLocationMaskedToPlayer(whichLocation.handle,obj.handle)
    end

    ---@return race
    function obj.race()
        return GetPlayerRace(obj.handle)
    end

    ---@return integer
    function obj.numberId()
        return GetPlayerId(obj.handle)
    end

    ---@param includeIncomplete boolean
    ---@return integer
    function obj.unitCount(includeIncomplete)
        return GetPlayerUnitCount(obj.handle,includeIncomplete)
    end

    ---@param unitName string
    ---@param includeIncomplete boolean
    ---@param includeUpgrades boolean
    ---@return integer
    function obj.typedUnitCount(unitName,includeIncomplete,includeUpgrades)
        return GetPlayerTypedUnitCount(obj.handle,unitName,includeIncomplete,includeUpgrades)
    end

    ---@param includeIncomplete boolean
    ---@return integer
    function obj.structureCount(includeIncomplete)
        return GetPlayerStructureCount(obj.handle,includeIncomplete)
    end

    ---@param whichPlayerState playerstate
    ---@param value integer|null
    ---@return integer
    function obj.state(whichPlayerState,value)
        if not value then
            return GetPlayerState(obj.handle,whichPlayerState)
        else
            SetPlayerState(obj.handle,whichPlayerState,value)
        end
        return obj
    end

    ---@param whichPlayerScore playerscore
    ---@return integer
    function obj.score(whichPlayerScore)
        return GetPlayerScore(obj.handle,whichPlayerScore)
    end

    ---@param otherPlayer Player
    ---@param whichAllianceSetting alliancetype
    ---@return boolean
    function obj.alliance(otherPlayer,whichAllianceSetting)
        return GetPlayerAlliance(obj.handle,whichAllianceSetting)
    end

    ---@param handicap real|null
    ---@return real|self
    function obj.handicap(handicap)
        if not handicap then
            return GetPlayerHandicap(obj.handle)
        else
            SetPlayerHandicap(obj.handle,handicap)
        end
        return obj
    end

    ---@param handicap real
    ---@return real|self
    function obj.XPHandicap(handicap)
        if not handicap then
            return GetPlayerHandicapXP(obj.handle)
        else
            SetPlayerHandicapXP(obj.handle,handicap)
        end
        return obj
    end

    ---@param techid integer|string
    ---@param maximum integer|null
    ---@return integer|self
    function obj.techMaxAllowed(techid,maximum)
        techid = FormatCC(techid)
        if not maximum then
            return GetPlayerTechMaxAllowed(obj.handle,techid)
        else
            SetPlayerTechMaxAllowed(obj.handle,techid,maximum)
        end
        return obj
    end

    ---@param techid integer|string
    ---@param levels integer
    ---@return self
    function obj.addTechResearched(techid,levels)
        AddPlayerTechResearched(obj.handle,FormatCC(techid),levels)
        return obj
    end

    ---@param techid integer|string
    ---@param levels integer
    ---@return self
    function obj.decTechResearched(techid,levels)
        BlzDecPlayerTechResearched(obj.handle,FormatCC(techid),levels)
        return obj
    end

    ---@param techid integer|string
    ---@param setToLevel_OR_specificonly integer|boolean
    ---@return boolean|self
    function obj.techResearched(techid,setToLevel_OR_specificonly)
        techid = FormatCC(techid)
        if type(setToLevel_OR_specificOnly)=='boolean' then
            return GetPlayerTechResearched(obj.handle,techid,setToLevel_OR_specificonly)
        else
            SetPlayerTechResearched(obj.handle,techid,setToLevel_OR_specificonly)
        end
        return obj
    end

    ---@param techid integer|string
    ---@param specificonly boolean
    ---@return integer
    function obj.techCount(techid,specificonly)
        return GetPlayerTechCount(obj.handle,FormatCC(techid),specificonly)
    end

    ---@param newOwner integer
    ---@return self
    function obj.unitsOwner(newOwner)
        SetPlayerUnitsOwner(obj.handle,newOwner)
        return obj
    end

    ---@param toWhichPlayers Force
    ---@param flag boolean
    ---@return self
    function obj.cripple(toWhichPlayers,flag)
        CripplePlayer(obj.handle,toWhichPlayers,flag)
        return obj
    end

    ---@param abilid integer|string
    ---@param avail boolean
    ---@return self
    function obj.abilityAvailable(abilid,avail)
        SetPlayerAbilityAvailable(obj.handle,FormatCC(abilid),avail)
        return obj
    end

    ---@param gameResult playergameresult
    ---@return self
    function obj.remove(gameResult)
        RemovePlayer(obj.handle,gameResult)
        return obj
    end

    -- Used to store hero level data for the scorescreen
    -- before units are moved to neutral passive in melee games
    --
    ---@return self
    function obj.cacheHeroData()
        CachePlayerHeroData(obj.handle)
        return obj
    end

    ---@param dataType integer
    ---@param param1 string
    ---@param param2 string
    ---@param param3 boolean
    ---@param param4 integer
    ---@param param5 integer
    ---@param param6 integer
    ---@return integer
    function obj.requestExtraIntegerData(dataType,param1,param2,param3,param4,param5,param6)
        return RequestExtraIntegerData(dataType,obj.handle,param1,param2,param3,param4,param5,param6)
    end

    ---@param dataType integer
    ---@param param1 string
    ---@param param2 string
    ---@param param3 boolean
    ---@param param4 integer
    ---@param param5 integer
    ---@param param6 integer
    ---@return boolean
    function obj.requestExtraBooleanData(dataType,param1,param2,param3,param4,param5,param6)
        return RequestExtraBooleanData(dataType,obj.handle,param1,param2,param3,param4,param5,param6)
    end

    ---@param dataType integer
    ---@param param1 string
    ---@param param2 string
    ---@param param3 boolean
    ---@param param4 integer
    ---@param param5 integer
    ---@param param6 integer
    ---@return string
    function obj.requestExtraStringData(dataType,param1,param2,param3,param4,param5,param6)
        return RequestExtraStringData(dataType,obj.handle,param1,param2,param3,param4,param5,param6)
    end

    ---@param dataType integer
    ---@param param1 string
    ---@param param2 string
    ---@param param3 boolean
    ---@param param4 integer
    ---@param param5 integer
    ---@param param6 integer
    ---@return real
    function obj.requestExtraRealData(dataType,param1,param2,param3,param4,param5,param6)
        return RequestExtraRealData(dataType,obj.handle,param1,param2,param3,param4,param5,param6)
    end

    return obj
end

---@param number integer
function ClassPlayer:get(number)
    return self:new(Player(number))
end

function ClassPlayer:Local()
    return self:new(GetLocalPlayer())
end

function ClassPlayer:triggered()
    return self:new(GetTriggerPlayer())
end