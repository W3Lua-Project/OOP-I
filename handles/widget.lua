--============================================================================
-- Widget API

---@class widget:agent

---@class Widget:Handle
---@class obj_Widget:obj_Handle
Widget = newClass(Handle) ---@type Widget

---@param handle handle
function Widget:new(handle)
    local object = self.old:new(handle) ---@type obj_Widget
    self:instantiate(object)

    ---@param newLife real
    ---@return real|self
    function object.life(newLife)
        if not newLife then
            return GetWidgetLife(object.handle)
        else
            SetWidgetLife(object.handle,newLife)
        end
        return object
    end

    ---@return real
    function object.x()
        return GetWidgetX(object.handle)
    end

    ---@return real
    function object.y()
        return GetWidgetY(object.handle)
    end

    ---@return real
    function object.z()
        return TempLocationHandle.move(object.x(),object.y()).z()
    end

    function object.pos()
        return Point:new(object.x(),object.y(),object.z())
    end

    return object
end

function Widget:triggered()
    return self:new(GetTriggerWidget())
end