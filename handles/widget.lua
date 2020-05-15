--============================================================================
-- Widget API

---@class widget:agent

---@class ClassWidget:ClassHandle
---@class Widget:Handle
Widget = newClass(Handle) ---@type ClassWidget

---@param handle handle
function Widget:new(handle)
    local object = self.old:new(handle) ---@type Widget
    self:instantiate(object)

    ---@return real
    function object.getLife()
        return GetWidgetLife(object.handle)
    end
    ---@param newLife real
    function object.setLife(newLife)
        SetWidgetLife(object.handle,newLife)
        return object
    end

    ---@return real
    function object.getX()
        return GetWidgetX(object.handle)
    end

    ---@return real
    function object.getY()
        return GetWidgetY(object.handle)
    end

    ---@return real
    function object.getZ()
        return TempLocationHandle.move(object.getX(),object.getY()).getZ()
    end

    function object.getPos()
        return Point:new(object.getX(),object.getY(),object.getZ())
    end

    return object
end

function Widget:triggered()
    return self:new(GetTriggerWidget())
end