---@class  weathereffect:handle
---@class ClassWeatherEffect:ClassHandle
---@class WeatherEffect:Handle
WeatherEffect = newClass(Handle) ---@type ClassWeatherEffect

---@param where Rect
---@param effectID integer|string
---@return WeatherEffect
function WeatherEffect:new(where,effectID)
    local obj = self.old:new(AddWeatherEffect(where.handle,FormatCC(effectID))) ---@type WeatherEffect
    self:instantiate(obj)
    
    function obj.remove()
        RemoveWeatherEffect(obj.handle)
    end

    ---@param flag boolean
    function obj.enable(flag)
        EnableWeatherEffect(obj.handle,flag)
    end

    return obj
end