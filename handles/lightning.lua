---@class  lightning:handle
---@class ClassLightning:ClassHandle
---@class Lightning:Handle
Lightning = newClass(Handle) ---@type ClassLightning

---@param handle lightning
function Lightning:new(handle)
    local obj = self.old:new(handle) ---@type Lightning
    self:instantiate(obj)

    ---@return boolean
    function obj.destroy()
        return DestroyLightning(obj.handle)
    end

    ---@param checkVisibility boolean
    ---@param x1 real
    ---@param y1 real
    ---@param z1 real
    ---@param x2 real
    ---@param y2 real
    ---@param z2 real
    ---@return boolean
    function obj.coordsMove(checkVisibility, x1, y1, z1, x2, y2, z2)
        return MoveLightning(obj.handle,checkVisibility,x1,y1,x2,y2)
    end

    ---@param checkVisibility boolean
    ---@param p1 Point
    ---@param p2 Point
    ---@return boolean
    function obj.move(checkVisibility,p1,p2)
        return obj.coordsMove(checkVisibility,p1.getX(),p1.getY(),p1.getZ(),p2.getX(),p2.getY(),p2.getZ())
    end

    ---@return real
    function obj.alphaColor()
        return GetLightningColorA(obj.handle)
    end

    ---@return real
    function obj.redColor()
        return GetLightningColorR(obj.handle)
    end

    ---@return real
    function obj.greenColor()
        return GetLightningColorG(obj.handle)
    end

    ---@return real
    function obj.blueColor()
        return  GetLightningColorB(obj.handle)
    end

    ---@param r real
    ---@param g real
    ---@param b real
    ---@param a real
    ---@return boolean
    function obj.color(r,g,b,a)
        return SetLightningColor(obj.handle,r,g,b,a)
    end

    return obj
end

---@param codeName string
---@param checkVisibility boolean
---@param p1 Point
---@param p2 Point
---@return Lightning
function Lightning:add(codeName, checkVisibility, p1, p2)
    return Lightning:new(AddLightningEx(codeName,checkVisibility,p1.x(),p1.y(),p1.z(),p2.x(),p2.y(),p2.z()))
end