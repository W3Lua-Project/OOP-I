---@class ClassPoint:ClassType
---@class Point:ObjectType
Point = newClass() ---@type ClassPoint

---@param x real
---@param y real
---@param z real
function Point:new(x,y,z)
    local object = self.old:new() ---@type Point
    object.coordX = defaultValue(x,0)
    object.coordY = defaultValue(y,0)
    object.coordZ = defaultValue(z,0)

    ---@return real
    function object.getX()
        return object.coordX
    end
    ---@param x real
    function object.setX(x)
        object.coordX = x
        return object
    end

    ---@return real
    function object.getY()
        return object.coordY
    end
    ---@param y real
    function object.setY(y)
        object.coordY = y
        return object
    end

    ---@return real
    function object.getZ()
        return object.coordZ
    end
    ---@param z real
    function object.setZ(z)
        object.coordZ = z
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

    ---@return  boolean
    function object.isBlighted()
        return IsPointBlighted(object.getX(),object.getY())
    end

    return object
end