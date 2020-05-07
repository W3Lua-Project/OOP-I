Camera = {}

---@param flag boolean
---@return boolean|null
function Camera.visible(flag)
    if not flag then
        return IsCineFilterDisplayed()
    else
        DisplayCineFilter(flag)
    end
end

---@return number
function Camera.boundMinX()
    return GetCameraBoundMinX()
end

---@return number
function Camera.boundMinY()
    return GetCameraBoundMinY()
end

---@return number
function Camera.boundMaxX()
    return GetCameraBoundMaxX()
end

---@return number
function Camera.boundMaxY()
    return GetCameraBoundMaxY()
end

---@return number
function Camera.targetX()
    return GetCameraTargetPositionX()
end

---@return number
function Camera.targetY()
    return GetCameraTargetPositionY()
end

---@return number
function Camera.targetZ()
    return GetCameraTargetPositionZ()
end

---@return number
function Camera.eyeX()
    return GetCameraEyePositionX()
end

---@return number
function Camera.eyeY()
    return GetCameraEyePositionY()
end

---@return number
function Camera.eyeZ()
    return GetCameraEyePositionZ()
end

