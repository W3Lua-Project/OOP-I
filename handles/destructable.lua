--============================================================================
-- Destructable Object API
-- Facing arguments are specified in degrees

---@class destructable:widget

---@class ClassDestructable:ClassWidget
---@class Destructable:Widget
Destructable = newClass(Widget) ---@type ClassDestructable

---@param handle destructable
function Destructable:new(handle)
    local object = self.old:new(handle) ---@type Destructable
    self:instantiate(object)

    ---@return boolean
    function object.isInvulnerable()
        return IsDestructableInvulnerable(object.handle)
    end
    ---@param flag boolean
    function object.setInvulnerable(flag)
        SetDestructableInvulnerable(object.handle,flag)
        return object
    end


    ---@return real
    function object.getLife()
        return GetDestructableLife(object.handle)
    end
    ---@param life real
    function object.setLife(life)
        SetDestructableLife(object.handle,life)
        return object
    end

    function object.remove()
        RemoveDestructable(object.handle)
        return object
    end

    function object.kill()
        KillDestructable(object.handle)
        return object
    end

    ---@return integer
    function object.typeId()
        return GetDestructableTypeId(object.handle)
    end

    ---@return real
    function object.getX()
        return GetDestructableX(object.handle)
    end

    ---@return real
    function object.getY()
        return GetDestructableY(object.handle)
    end

    ---@return real
    function object.getZ()
        return TempLocationHandle.move(object.getX(),object.getY()).getZ()
    end

    function object.getPos()
        return Point:new(object.getX(),object.getY(),object.getZ())
    end

    ---@return real
    function object.getMaxLife()
        return GetDestructableMaxLife(object.handle)
    end
    ---@param max real
    function object.setMaxLife(max)
        SetDestructableMaxLife(object.handle,max)
        return object
    end

    ---@param life real
    ---@param birth boolean
    function object.restoreLife(life,birth)
        DestructableRestoreLife(object.handle,life,birth)
        return object
    end

    ---@param whichAnimation string
    function object.queueAnimation(whichAnimation)
        QueueDestructableAnimation(object.handle,whichAnimation)
        return object
    end

    ---@param whichAnimation string
    function object.animation(whichAnimation)
        SetDestructableAnimation(object.handle,whichAnimation)
        return object
    end

    ---@param speedFactor real
    function object.speedAnimation(speedFactor)
        SetDestructableAnimationSpeed(object.handle,speedFactor)
        return object
    end

    ---@param flag boolean
    function object.show(flag)
        ShowDestructable(object.handle,flag)
        return object
    end

    ---@return real
    function object.getOccluderHeight()
        return GetDestructableOccluderHeight(object.handle)
    end
    ---@param height real
    function object.setOccluderHeight(height)
        SetDestructableOccluderHeight(object.handle,height)
        return object
    end

    ---@return string
    function object.getName()
        return GetDestructableName(object.handle)
    end

    return object
end

---@param objectid integer|string
---@param x real
---@param y real
---@param z real
---@param face real
---@param scale real
---@param variation integer
---@return Destructable
function Destructable:create(objectid,x,y,z,face,scale,variation)
    return self:new(CreateDestructableZ(FormatCC(objectid),x,y,z,face,scale,variation))
end

---@param objectid integer|string
---@param p Point
---@param face real
---@param scale real
---@param variation integer
---@return Destructable
function Destructable:create(objectid,p,face,scale,variation)
    return self:create(FormatCC(objectid),p.getX(),p.getY(),p.getZ(),face,scale,variation)
end

---@param objectid integer|string
---@param x real
---@param y real
---@param z real
---@param face real
---@param scale real
---@param variation integer
---@return Destructable
function Destructable:deadCoordsCreate(objectid,x,y,z,face,scale,variation)
    return self:new(CreateDeadDestructableZ(FormatCC(objectid),x,y,z,face,scale,variation))
end

---@param objectid integer|string
---@param p Point
---@param face real
---@param scale real
---@param variation integer
---@return Destructable
function Destructable:deadCoordsCreate(objectid,p,face,scale,variation)
    return self:new(CreateDeadDestructableZ(FormatCC(objectid),p.getX(),p.getY(),p.getZ(),face,scale,variation))
end

---@return Destructable
function Destructable:triggered()
    return self:new(GetTriggerDestructable())
end

---@return Destructable
function Destructable:filtered()
    return self:new(GetFilterDestructable())
end

---@return Destructable
function Destructable:enumed()
    return self:new(GetEnumDestructable())
end