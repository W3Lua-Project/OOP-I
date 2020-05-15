---@class location:agent

---@class ClassLocationHandle:ClassHandle
---@class LocationHandle:Handle
LocationHandle = newClass(Handle) ---@type ClassLocationHandle

---@param handle handle
function LocationHandle:new(handle)
    local object = self.old:new(handle) ---@type LocationHandle
    self:instantiate(object)

    ---@return real
    function object.getX()
        return GetLocationX(object.handle)
    end
    ---@param x real
    function object.setX(x)
        MoveLocation(object.handle,x,object.getY())
        return object
    end

    ---@return real
    function object.getY()
        return GetLocationY(object.handle)
    end
    ---@param y real
    function object.setY(y)
        MoveLocation(object.handle,object.getX(),y)
        return object
    end

    ---@return real
    function object.getZ()
        return GetLocationZ(object.handle)
    end

    function object.remove()
        RemoveLocation(object.handle)
        return object
    end

    ---@param x real
    ---@param y real
    ---@return self
    function object.move(x,y)
        MoveLocation(object.handle,x,y)
        return object
    end

    return object
end

---@param x real
---@param y real
function LocationHandle:alloc(x,y)
    return self:new(Location(x,y))
end

TempLocationHandle = LocationHandle:alloc(0,0)