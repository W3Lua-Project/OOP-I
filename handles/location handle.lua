---@class location:agent

---@class ClassLocationHandle:ClassHandle
---@class LocationHandle:Handle
LocationHandle = newClass(Handle) ---@type ClassLocationHandle

---@param handle handle
function LocationHandle:new(handle)
    local object = self.old:new(handle) ---@type LocationHandle
    self:instantiate(object)

    ---@param value real
    ---@return real|self
    function object.x(value)
        if not value then
            return GetLocationX(object.handle)
        else
            MoveLocation(object.handle,value,object.y())
        end
        return object
    end

    ---@param value real
    ---@return real|self
    function object.y(value)
        if not value then
            return GetLocationY(object.handle)
        else
            MoveLocation(object.handle,object.x(),value)
        end
        return object
    end

    ---@return real
    function object.z()
        return GetLocationZ(object.handle)
    end

    ---@return self
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
---@return LocationHandle
function LocationHandle:get(x,y)
    return self:new(Location(x,y))
end

TempLocationHandle = LocationHandle:get(0,0)