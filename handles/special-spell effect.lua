---@class  effect:agent
---@class  effecttype:handle
---@class  animtype:handle
---@class  subanimtype:handle

AnimType = {}
---@param i integer
---@return animtype
function AnimType.convert(i)
    return ConvertAnimType(i)
end
AnimType.Birth = AnimType.convert(0)
AnimType.Death = AnimType.convert(1)
AnimType.Decay = AnimType.convert(2)
AnimType.Dissipate = AnimType.convert(3)
AnimType.Stand = AnimType.convert(4)
AnimType.Walk = AnimType.convert(5)
AnimType.Attack = AnimType.convert(6)
AnimType.Morph = AnimType.convert(7)
AnimType.Sleep = AnimType.convert(8)
AnimType.Spell = AnimType.convert(9)
AnimType.Portrait = AnimType.convert(10)

SubAnimType = {}
---@param i integer
---@return subanimtype
function SubAnimType.convert(i)
    return ConvertSubAnimType(i)
end
SubAnimType.Rooted = SubAnimType.convert(11)
SubAnimType.AlternateEx = SubAnimType.convert(12)
SubAnimType.Looping = SubAnimType.convert(13)
SubAnimType.Slam = SubAnimType.convert(14)
SubAnimType.Throw = SubAnimType.convert(15)
SubAnimType.Spiked = SubAnimType.convert(16)
SubAnimType.Fast = SubAnimType.convert(17)
SubAnimType.Spin = SubAnimType.convert(18)
SubAnimType.Ready = SubAnimType.convert(19)
SubAnimType.Channel = SubAnimType.convert(20)
SubAnimType.Defend = SubAnimType.convert(21)
SubAnimType.Victory = SubAnimType.convert(22)
SubAnimType.Turn = SubAnimType.convert(23)
SubAnimType.Left = SubAnimType.convert(24)
SubAnimType.Right = SubAnimType.convert(25)
SubAnimType.Fire = SubAnimType.convert(26)
SubAnimType.Flesh = SubAnimType.convert(27)
SubAnimType.Hit = SubAnimType.convert(28)
SubAnimType.Wounded = SubAnimType.convert(29)
SubAnimType.Light = SubAnimType.convert(30)
SubAnimType.Moderate = SubAnimType.convert(31)
SubAnimType.Severe = SubAnimType.convert(32)
SubAnimType.Critical = SubAnimType.convert(33)
SubAnimType.Complete = SubAnimType.convert(34)
SubAnimType.Gold = SubAnimType.convert(35)
SubAnimType.Lumber = SubAnimType.convert(36)
SubAnimType.Work = SubAnimType.convert(37)
SubAnimType.Talk = SubAnimType.convert(38)
SubAnimType.First = SubAnimType.convert(39)
SubAnimType.Second = SubAnimType.convert(40)
SubAnimType.Third = SubAnimType.convert(41)
SubAnimType.Fourth = SubAnimType.convert(42)
SubAnimType.Fifth = SubAnimType.convert(43)
SubAnimType.One = SubAnimType.convert(44)
SubAnimType.Two = SubAnimType.convert(45)
SubAnimType.Three = SubAnimType.convert(46)
SubAnimType.Four = SubAnimType.convert(47)
SubAnimType.Five = SubAnimType.convert(48)
SubAnimType.Small = SubAnimType.convert(49)
SubAnimType.Medium = SubAnimType.convert(50)
SubAnimType.Large = SubAnimType.convert(51)
SubAnimType.Upgrade = SubAnimType.convert(52)
SubAnimType.Drain = SubAnimType.convert(53)
SubAnimType.Fill = SubAnimType.convert(54)
SubAnimType.ChainLightning = SubAnimType.convert(55)
SubAnimType.EatTree = SubAnimType.convert(56)
SubAnimType.Puke = SubAnimType.convert(57)
SubAnimType.Flail = SubAnimType.convert(58)
SubAnimType.Off = SubAnimType.convert(59)
SubAnimType.Swim = SubAnimType.convert(60)
SubAnimType.Entangle = SubAnimType.convert(61)
SubAnimType.Berserk = SubAnimType.convert(62)

---@class ClassEffect:ClassHandle
---@class Effect:Handle
Effect = newClass(Handle) ---@type ClassEffect

---@param handle effect
function Effect:new(handle)
    local obj = self.old:new(handle) ---@type Effect
    self:instantiate(obj)

    ---@param whichPlayer Player
    ---@return self
    function obj.setByPlayerColor(whichPlayer)
        BlzSetSpecialEffectColorByPlayer(obj.handle,whichPlayer.handle)
        obj.playerFromColor = whichPlayer
        return obj
    end
    -- obj.setByPlayerColor(PlayerNeutralAggressive)

    ---@param r integer
    ---@param g integer
    ---@param b integer
    function obj.setColor(r,g,b)
        BlzSetSpecialEffectColor(obj.handle,r,g,b)
        return obj
    end

    ---@param alpha integer
    function obj.setAlpha(alpha)
        BlzSetSpecialEffectAlpha(obj.handle,alpha)
        obj.alpha = alpha
        return obj
    end

    ---@param scale real
    function obj.setScale(scale)
        BlzSetSpecialEffectScale(obj.handle,scale)
        return obj
    end
    ---@return real
    function obj.getScale()
        return BlzGetSpecialEffectScale(obj.handle)
    end

    ---@param x real
    function obj.setX(x)
        BlzSetSpecialEffectX(obj.handle,x)
        return obj
    end
    ---@return real
    function obj.getX()
        return BlzGetLocalSpecialEffectX(obj.handle)
    end

    ---@param y real
    function obj.setY(y)
        BlzSetSpecialEffectY(obj.handle,y)
        return obj
    end
    ---@return real
    function obj.getY()
        return BlzGetLocalSpecialEffectY(obj.handle)
    end

    ---@param z real
    function obj.setZ(z)
        BlzSetSpecialEffectZ(obj.handle)
        return obj
    end
    ---@return real
    function obj.getZ()
        return BlzGetLocalSpecialEffectZ(obj.handle)
    end

    ---@param x real
    ---@param y real
    ---@param z real
    function obj.setCoordsPos(x,y,z)
        BlzSetSpecialEffectPosition(obj.handle,x,y,z)
        return obj
    end

    ---@param p Point
    function obj.setPos(p)
        obj.setCoordsPos(p.getX(),p.getY(),p.getZ())
        return obj
    end
    function obj.getPos()
        return Point:new(obj.getX(),obj.getY(),obj.getZ())
    end

    ---@param p LocationHandle
    function obj.setHandlePos(p)
        obj.setCoordsPos(p.getX(),p.getY(),p.getZ())
        return obj
    end
    function obj.getHandlePos()
        return TempLocationHandle.move(obj.getX(),obj.getY())
    end

    ---@param height real
    function obj.setHeight(height)
        BlzSetSpecialEffectHeight(obj.handle,height)
        obj.height = height
        return obj
    end

    ---@param scaleTime real
    function obj.setScaleTime(scaleTime)
        BlzSetSpecialEffectTimeScale(obj.handle,scaleTime)
        obj.scaleTime = scaleTime
        return obj
    end

    ---@param time real
    function obj.setTime(time)
        BlzSetSpecialEffectTime(obj.handle,time)
        obj.time = time
        return obj
    end

    ---@param yaw real
    ---@param pitch real
    ---@param roll real
    function obj.setOrientation(yaw,pitch,roll)
        BlzSetSpecialEffectOrientation(obj.handle,yaw,pitch,roll)
        obj.yaw = yaw
        obj.pitch = pitch
        obj.roll = roll
        return obj
    end

    ---@param yaw real
    function obj.setYaw(yaw)
        BlzSetSpecialEffectYaw(obj.handle,yaw)
        obj.yaw = yaw
        return obj
    end

    ---@param pitch real
    function obj.setPitch(pitch)
        BlzSetSpecialEffectPitch(obj.handle,pitch)
        obj.pitch = pitch
        return obj
    end

    ---@param roll real
    function obj.setRoll(roll)
        BlzSetSpecialEffectRoll(obj.handle,roll)
        obj.roll = roll
        return obj
    end

    function obj.clearSubAnimations()
        BlzSpecialEffectClearSubAnimations(obj.handle)
        return obj
    end

    ---@param whichSubAnim subanimtype
    function obj.removeSubAnimation(whichSubAnim)
        BlzSpecialEffectRemoveSubAnimation(obj.handle,whichSubAnim)
        return obj
    end

    ---@param whichSubAnim subanimtype
    function obj.addSubAnimation(whichSubAnim)
        BlzSpecialEffectAddSubAnimation(obj.handle,whichSubAnim)
        return obj
    end

    ---@param whichAnim animtype
    ---@param timeScale real
    function obj.playAnim(whichAnim,timeScale)
        if not timeScale then
            BlzPlaySpecialEffect(obj.handle,whichAnim)
        else
            BlzPlaySpecialEffectWithTimeScale(obj.handle,whichAnim,timeScale)
        end
        return obj
    end

    ---@param x real
    ---@param y real
    ---@param z real
    function obj.setMatrixScale(x,y,z)
        BlzSetSpecialEffectMatrixScale(obj.handle,x,y,z)
        return obj
    end

    function obj.resetMatrix()
        BlzResetSpecialEffectMatrix(obj.handle)
        return obj
    end

    function obj.destroy()
        DestroyEffect(obj.handle)
    end

    return obj
end

---@param modelName string
---@param x real
---@param y real
function Effect:coordsAdd(modelName,x,y)
    return self:new(AddSpecialEffect(modelName,x,y))
end

---@param modelName string
---@param p Point
function Effect:add(modelName,p)
    return self:coordsAdd(modelName,p.getX(),p.getY())
end
---@param modelName string
---@param where LocationHandle
function Effect:locAdd(modelName,where)
    return self:new(AddSpecialEffectLoc(modelName,where))
end

---@param modelName string
---@param targetWidget Widget
---@param attachPointName string
function Effect:addTarget(modelName,targetWidget,attachPointName)
    return self:new(AddSpellEffectTarget(modelName,targetWidget.handle,attachPointName))
end

---@param abilityString string
---@param t effecttype
---@param x real
---@param y real
function Effect:spellCoordsAdd(abilityString, t, x, y)
    return self:new(AddSpellEffect(abilityString,t,x,y))
end

---@param abilityString string
---@param t effecttype
---@param p Point
function Effect:spellAdd(abilityString, t, p)
    return self:spellCoordsAdd(abilityString,t,p.getX(),p.getY())
end


---@param abilityString string
---@param t effecttype
---@param x real
---@param y real
---@return effect
function AddSpellEffect(abilityString, t, x, y) end

---@param abilityString string
---@param t effecttype
---@param where location
---@return effect
function AddSpellEffectLoc(abilityString, t,where) end

---@param abilityId integer
---@param t effecttype
---@param x real
---@param y real
---@return effect
function AddSpellEffectById(abilityId, t,x, y) end

---@param abilityId integer
---@param t effecttype
---@param where location
---@return effect
function AddSpellEffectByIdLoc(abilityId, t,where) end

---@param modelName string
---@param t effecttype
---@param targetWidget widget
---@param attachPoint string
---@return effect
function AddSpellEffectTarget(modelName, t, targetWidget, attachPoint) end

---@param abilityId integer
---@param t effecttype
---@param targetWidget widget
---@param attachPoint string
---@return effect
function AddSpellEffectTargetById(abilityId, t, targetWidget, attachPoint) end
