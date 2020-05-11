---@class ClassPoint:ClassType
---@class Point:ObjectType
Point = newClass() ---@type ClassPoint

---@param x real
---@param y real
---@param z real
function Point:new(x,y,z)
    local object = self.old:new() ---@type Point
    object.coordX = x
    object.coordY = y
    object.coordZ = z

    ---@param x real
    ---@return real|self
    function object.x(x)
        if not x then
            return object.coordX
        else
            object.coordX = x
        end
        return object
    end

    ---@param y real
    ---@return real|self
    function object.y(y)
        if not y then
            return object.coordY
        else
            object.coordY = y
        end
        return object
    end

    ---@param z real
    ---@return real|self
    function object.z(z)
        if not z then
            return object.coordZ
        else
            object.coordZ = z
        end
        return object
    end

    ---@param x real
    ---@param y real
    ---@param z real
    ---@return self
    function object.move(x,y,z)
        object.coordX = x
        object.coordY = y
        object.coordZ = z
        return object
    end

    return object
end