--============================================================================
-- Destructable Object API
-- Facing arguments are specified in degrees

---@class destructable:widget

---@class Destructable:Widget
---@class obj_Destructable:obj_Widget
Destructable = newClass(Widget) ---@type Destructable

---@param handle handle
function Destructable:new(handle)
    local object = self.old:new(handle) ---@type obj_Destructable
    self:instantiate(object)

    ---@param flag boolean
    ---@return boolean|self
    function object.invulnerable(flag)
        if not flag then
            return IsDestructableInvulnerable(object.handle)
        else
            SetDestructableInvulnerable(object.handle,flag)
        end
        return object
    end

    ---@param value real
    ---@return real|self
    function object.life(value)
        if not value then
            return GetDestructableLife(object.handle)
        else
            SetDestructableLife(object.handle,value)
        end
        return object
    end

    ---@return self
    function object.remove()
        RemoveDestructable(object.handle)
        return object
    end

    ---@return self
    function object.kill()
        KillDestructable(object.handle)
        return object
    end

    ---@return integer
    function object.typeId()
        return GetDestructableTypeId(object.handle)
    end

    ---@return real
    function object.x()
        return GetDestructableX(object.handle)
    end

    ---@return real
    function object.y()
        return GetDestructableY(object.handle)
    end

    ---@return real
    function object.z()
        return TempLocationHandle.move(object.x(),object.y()).z()
    end

    ---@return obj_Point
    function object.pos()
        return Point:new(object.x(),object.y(),object.z())
    end

    ---@param max real
    ---@return real|self
    function object.maxLife(max)
        if not max then
            return GetDestructableMaxLife(object.handle)
        else
            SetDestructableMaxLife(object.handle,max)
        end
        return object
    end

    ---@param life real
    ---@param birth boolean
    ---@return self
    function object.restoreLife(life,birth)
        DestructableRestoreLife(object.handle,life,birth)
        return object
    end

    ---@param whichAnimation string
    ---@return self
    function object.queueAnimation(whichAnimation)
        QueueDestructableAnimation(object.handle,whichAnimation)
        return object
    end

    ---@param whichAnimation string
    ---@return self
    function object.animation(whichAnimation)
        SetDestructableAnimation(object.handle,whichAnimation)
        return object
    end

    ---@param speedFactor real
    ---@return self
    function object.speedAnimation(speedFactor)
        SetDestructableAnimationSpeed(object.handle,speedFactor)
        return object
    end

    ---@param flag boolean
    ---@return self
    function object.show(flag)
        ShowDestructable(object.handle,flag)
        return object
    end

    ---@param height real
    ---@return real|self
    function object.occluderHeight(height)
        if not height then
            return GetDestructableOccluderHeight(object.handle)
        else
            SetDestructableOccluderHeight(object.handle,height)
        end
        return object
    end

    ---@return string
    function object.name()
        return GetDestructableName(object.handle)
    end

    return object
end

---@param objectid integer
---@param x real
---@param y real
---@param face real
---@param scale real
---@param variation integer
---@return obj_Destructable
function Destructable:create(objectid,x,y,face,scale,variation)
    return self:new(CreateDestructable(objectid,x,y,face,scale,variation))
end

---@param objectid integer
---@param x real
---@param y real
---@param z real
---@param face real
---@param scale real
---@param variation integer
---@return obj_Destructable
function Destructable:ZCreate(objectid,x,y,z,face,scale,variation)
    return self:new(CreateDestructableZ(objectid,x,y,z,face,scale,variation))
end

---@param objectid integer
---@param x real
---@param y real
---@param face real
---@param scale real
---@param variation integer
---@return obj_Destructable
function Destructable:deadCreate(objectid,x,y,face,scale,variation)
    return self:new(CreateDeadDestructable(objectid,x,y,face,scale,variation))
end

---@param objectid integer
---@param x real
---@param y real
---@param z real
---@param face real
---@param scale real
---@param variation integer
---@return obj_Destructable
function Destructable:deadZCreate(objectid,x,y,z,face,scale,variation)
    return self:new(CreateDeadDestructableZ(objectid,x,y,z,face,scale,variation))
end

---@return obj_Destructable
function Destructable:triggered()
    return self:new(GetTriggerDestructable())
end

---@return obj_Destructable
function Destructable:filtered()
    return self:new(GetFilterDestructable())
end

---@return obj_Destructable
function Destructable:enumed()
    return self:new(GetEnumDestructable())
end