---@class camerafield:handle
---@class camerasetup:handle

Camera = {}

--============================================================================
-- Camera API
---@param x real
---@param y real
function Camera.setPos(x,y)
    SetCameraPosition(x,y)
end

---@param x real
---@param y real
function Camera.setQuickPos(x,y)
    SetCameraQuickPosition(x,y)
end

---@param x1 real
---@param y1 real
---@param x2 real
---@param y2 real
---@param x3 real
---@param y3 real
---@param x4 real
---@param y4 real
function Camera.setBounds(x1,y1,x2,y2,x3,y3,x4,y4)
    SetCameraBounds(x1, y1, x2, y2, x3, y3, x4, y4)
end

function Camera.stop()
    StopCamera()
end

---@param duration real
function Camera.reset(duration)
    ResetToGameCamera(duration)
end

---@param x real
---@param y real
---@param zOffsetDest real|null
function Camera.pan(x,y,zOffsetDest)
    if not zOffsetDest then
        PanCameraTo(x,y)
    else
        PanCameraToWithZ(x,y,zOffsetDest)
    end
end

---@param x real 
---@param y real
---@param zOffsetDest real|null
---@param duration real
function Camera.panTimed(x,y,zOffsetDest,duration)
    if not zOffsetDest then
        PanCameraToTimed(x,y,duration)
    else
        PanCameraToTimedWithZ(x,y,zOffsetDest,duration)
    end
end


---@param cameraModelFile string
function Camera.setCinematic(cameraModelFile)
    SetCinematicCamera(cameraModelFile)
end

---@param x real
---@param y real
---@param radiansToSweep real
---@param duration real
function Camera.setRotateMode(x,y,radiansToSweep,duration)
    SetCameraRotateMode(x,y,radiansToSweep,duration)
end

---@param whichField camerafield
---@param value real
---@param duration real
function Camera.setField(whichField,value,duration)
    SetCameraField(whichField,value,duration)
end

---@param whichField camerafield
---@param offset real
---@param duration real
function Camera.adjustField(whichField,offset,duration)
    AdjustCameraField(whichField,offset,duration)
end

---@param whichUnit unit
---@param xoffset real
---@param yoffset real
---@param inheritOrientation boolean
function Camera.setTargetController(whichUnit,xoffset,yoffset,inheritOrientation)
    SetCameraTargetController(whichUnit,xoffset,yoffset,inheritOrientation)
end

---@param whichUnit unit
---@param xoffset real
---@param yoffset real
function Camera.setOrientController(whichUnit,xoffset,yoffset)
    SetCameraOrientController(whichUnit,xoffset,yoffset)
end

---@return camerasetup
function CreateCameraSetup() end

---@param whichSetup camerasetup
---@param whichField camerafield
---@param value real
---@param duration real
function CameraSetupSetField(whichSetup, whichField, value, duration) end

---@param whichSetup camerasetup
---@param whichField camerafield
---@return real
function CameraSetupGetField(whichSetup, whichField) end

---@param whichSetup camerasetup
---@param x real
---@param y real
---@param duration real
function CameraSetupSetDestPosition(whichSetup, x, y, duration) end

---@param whichSetup camerasetup
---@return location
function CameraSetupGetDestPositionLoc(whichSetup) end

---@param whichSetup camerasetup
---@return real
function CameraSetupGetDestPositionX(whichSetup) end

---@param whichSetup camerasetup
---@return real
function CameraSetupGetDestPositionY(whichSetup) end

---@param whichSetup camerasetup
---@param doPan boolean
---@param panTimed boolean
function CameraSetupApply(whichSetup, doPan, panTimed) end

---@param whichSetup camerasetup
---@param zDestOffset real
function CameraSetupApplyWithZ(whichSetup, zDestOffset) end

---@param whichSetup camerasetup
---@param doPan boolean
---@param forceDuration real
function CameraSetupApplyForceDuration(whichSetup, doPan, forceDuration) end

---@param whichSetup camerasetup
---@param zDestOffset real
---@param forceDuration real
function CameraSetupApplyForceDurationWithZ(whichSetup, zDestOffset, forceDuration) end


---@param mag real
---@param velocity real
function CameraSetTargetNoise(mag, velocity) end

---@param mag real
---@param velocity real
function CameraSetSourceNoise(mag, velocity) end


---@param mag real
---@param velocity real
---@param vertOnly boolean
function CameraSetTargetNoiseEx(mag, velocity, vertOnly) end

---@param mag real
---@param velocity real
---@param vertOnly boolean
function CameraSetSourceNoiseEx(mag, velocity, vertOnly) end


---@param factor real
function CameraSetSmoothingFactor(factor) end


---@param filename string
function SetCineFilterTexture(filename) end

---@param whichMode blendmode
function SetCineFilterBlendMode(whichMode) end

---@param whichFlags texmapflags
function SetCineFilterTexMapFlags(whichFlags) end

---@param minu real
---@param minv real
---@param maxu real
---@param maxv real
function SetCineFilterStartUV(minu, minv, maxu, maxv) end

---@param minu real
---@param minv real
---@param maxu real
---@param maxv real
function SetCineFilterEndUV(minu, minv, maxu, maxv) end

---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function SetCineFilterStartColor(red, green, blue, alpha) end

---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function SetCineFilterEndColor(red, green, blue, alpha) end

---@param duration real
function SetCineFilterDuration(duration) end

---@param flag boolean
function DisplayCineFilter(flag) end

---@return boolean
function IsCineFilterDisplayed() end


---@param portraitUnitId integer
---@param color playercolor
---@param speakerTitle string
---@param text string
---@param sceneDuration real
---@param voiceoverDuration real
function SetCinematicScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration) end

---@param whichField camerafield
---@return real
function GetCameraField(whichField) end

---@param whichSetup camerasetup
---@param doPan boolean
---@param forcedDuration real
---@param easeInDuration real
---@param easeOutDuration real
---@param smoothFactor real
function BlzCameraSetupApplyForceDurationSmooth(whichSetup, doPan, forcedDuration, easeInDuration, easeOutDuration, smoothFactor) end




---@param flag boolean
---@return boolean|null
function Camera.visible(flag)
    if not flag then
        return IsCineFilterDisplayed()
    else
        DisplayCineFilter(flag)
    end
end

-- These return values for the local players camera only...
---@return real
function Camera.boundMinX()
    return GetCameraBoundMinX()
end

---@return real
function Camera.boundMinY()
    return GetCameraBoundMinY()
end

---@return real
function Camera.boundMaxX()
    return GetCameraBoundMaxX()
end

---@return real
function Camera.boundMaxY()
    return GetCameraBoundMaxY()
end

---@return real
function Camera.targetX()
    return GetCameraTargetPositionX()
end

---@return real
function Camera.targetY()
    return GetCameraTargetPositionY()
end

---@return real
function Camera.targetZ()
    return GetCameraTargetPositionZ()
end

---@return real
function Camera.eyeX()
    return GetCameraEyePositionX()
end

---@return real
function Camera.eyeY()
    return GetCameraEyePositionY()
end

---@return real
function Camera.eyeZ()
    return GetCameraEyePositionZ()
end

---@return obj_HandlePoint
function Camera.eyeHandlePoint()
    return HandlePoint.fromHandle(GetCameraEyePositionLoc())
end

---@return obj_HandlePoint
function Camera.targetHandlePoint()
    return HandlePoint.fromHandle(GetCameraTargetPositionLoc())
end

---@param whichField camerafield
---@param offset real
---@param duration real
function Camera.adjustField(whichField,offset,duration)
    AdjustCameraField(whichField,offset,duration)
end

function Camera.endCinematicScene()
    EndCinematicScene()
end

---@param flag boolean
function Camera.forceCinematicSubtitles(flag)
    ForceCinematicSubtitles(flag)
end

---@param whichMargin integer
---@return real
function Camera.getMargin(whichMargin)
    return GetCameraMargin(whichMargin)
end