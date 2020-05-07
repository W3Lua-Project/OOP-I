---@class location:agent

---@class HandlePoint:Handle
---@class obj_HandlePoint:obj_Handle
HandlePoint = newClass(Handle) ---@type HandlePoint

---@param x number
---@param y number
function HandlePoint:new(x,y)
    local object = HandlePoint.old:new(Location(x,y)) ---@type obj_HandlePoint
    HandlePoint:instantiate(object)

    ---@param value number
    ---@return number|null
    function object.x(value)
        if not value then
            return GetLocationX(object.handle)
        else
            MoveLocation(object.handle,value,object.y())
        end
    end

    ---@param value number
    ---@return number|null
    function object.y(value)
        if not value then
            return GetLocationY(object.handle)
        else
            MoveLocation(object.handle,object.x(),value)
        end
    end

    ---@return number
    function object.z()
        return GetLocationZ(object.handle)
    end

    function object.remove()
        RemoveLocation(object.handle)
    end

    ---@param x number
    ---@param y number
    function object.move(x,y)
        MoveLocation(object.handle,x,y)
    end

    return object
end

---@param handle location
---@return obj_HandlePoint
function HandlePoint.fromHandle(handle)
    return HandlePoint.getObject(handle)
end