---@class camerafield:handle
---@class camerasetup:handle
---@class blendmode:handle
---@class texmapflags:handle

CameraField = {}

---@param i integer
---@return camerafield
function CameraField.convert(i)
    return ConvertCameraField(i)
end

CameraField.TargetDistance = CameraField.convert(0)
CameraField.Farz = CameraField.convert(1)
CameraField.AngleOfAttack = CameraField.convert(2)
CameraField.FieldOfView = CameraField.convert(3)
CameraField.Roll = CameraField.convert(4)
CameraField.Rotation = CameraField.convert(5)
CameraField.ZOffset = CameraField.convert(6)
CameraField.Nearz = CameraField.convert(7)
CameraField.LocalPitch = CameraField.convert(8)
CameraField.LocalYaw = CameraField.convert(9)
CameraField.LocalRoll = CameraField.convert(10)

BlendMode = {}

---@param i integer
---@return blendmode
function BlendMode.convert(i)
    return ConvertBlendMode(i)
end

BlendMode.None = BlendMode.convert(0)
BlendMode.DontCare = BlendMode.convert(0)
BlendMode.KeyAlpha = BlendMode.convert(1)
BlendMode.Blend = BlendMode.convert(2)
BlendMode.Additive = BlendMode.convert(3)
BlendMode.Modulate = BlendMode.convert(4)
BlendMode.Modulate2X = BlendMode.convert(5)

TexMapFlags = {}

---@param i integer
---@return texmapflags
function TexMapFlags.convert(i)
    return ConvertTexMapFlags(i)
end

TexMapFlags.None = TexMapFlags.convert(0)
TexMapFlags.WrapU = TexMapFlags.convert(1)
TexMapFlags.WrapV = TexMapFlags.convert(2)
TexMapFlags.WrapUV = TexMapFlags.convert(3)


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

---@return LocationHandle
function Camera.eyeLocation()
    return TempLocationHandle.move(Camera.eyeX(),Camera.eyeY())
end

---@return Point
function Camera.eyePos()
    return Point:new(Camera.eyeX(),Camera.eyeY())
end

---@return LocationHandle
function Camera.targetLocation()
    return TempLocationHandle.move(Camera.targetX(),Camera.targetY())
end

---@return Point
function Camera.targetPos()
    return Point:new(Camera.targetX(),Camera.targetY())
end

function Camera.endCinematicScene()
    EndCinematicScene()
end

---@param flag boolean
function Camera.forceCinematicSubtitles(flag)
    ForceCinematicSubtitles(flag)
end

--===================================================
-- Camera Margin s for use with GetCameraMargin
--===================================================

CameraMargin = {}

CameraMargin.Left = 0 ---@type integer
CameraMargin.Right = 1 ---@type integer
CameraMargin.Top = 2 ---@type integer
CameraMargin.Bottom = 3 ---@type integer

---@param whichMargin integer
---@return real
function Camera.getMargin(whichMargin)
    return GetCameraMargin(whichMargin)
end

---@param mag real
---@param velocity real
---@param vertOnly boolean
function Camera.setSourceNoise(mag,velocity,vertOnly)
    if not vertOnly then
        CameraSetSourceNoise(mag,velocity)
    else
        CameraSetSourceNoiseEx(mag,velocity,vertOnly)
    end
end

---@param mag real
---@param velocity real
---@param vertOnly boolean
function Camera.setTargetNoise(mag,velocity,vertOnly)
    if not vertOnly then
        CameraSetTargetNoise(mag,velocity)
    else
        CameraSetTargetNoiseEx(mag,velocity,vertOnly)
    end
end

---@param factor real
function Camera.setSmoothingFactor(factor)
    CameraSetSmoothingFactor(factor)
end

---@param whichField camerafield
---@return real
function Camera.getField(whichField)
    return GetCameraField(whichField)
end

CineFilter = {}

---@param filename string
function CineFilter.setTexture(filename)
    SetCineFilterTexture(filename)
end

---@param whichMode blendmode
function CineFilter.setBlendMode(whichMode)
    SetCineFilterBlendMode(whichMode)
end

---@param whichFlags texmapflags
function CineFilter.setTexMapFlags(whichFlags)
    SetCineFilterTexMapFlags(whichFlags)
end

---@param minu real
---@param minv real
---@param maxu real
---@param maxv real
function CineFilter.setStartUV(minu,minv,maxu,maxv)
    SetCineFilterStartUV(minu,minv,maxu,maxv)
end

---@param minu real
---@param minv real
---@param maxu real
---@param maxv real
function CineFilter.setEndUV(minu,minv,maxu,maxv)
    SetCineFilterEndUV(minu,minv,maxu,maxv)
end

---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function CineFilter.setStartColor(red,green,blue,alpha)
    SetCineFilterStartColor(red,green,blue,alpha)
end

---@param red integer
---@param green integer
---@param blue integer
---@param alpha integer
function CineFilter.setEndColor(red,green,blue,alpha)
    SetCineFilterEndColor(red,green,blue,alpha)
end

---@param duration real
function CineFilter.setDuration(duration)
    SetCineFilterDuration(duration)
end

---@param portraitUnitId integer
---@param color playercolor
---@param speakerTitle string
---@param text string
---@param sceneDuration real
---@param voiceoverDuration real
function CineFilter.setScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
    SetCinematicScene(portraitUnitId, color, speakerTitle, text, sceneDuration, voiceoverDuration)
end


---@class ClassCameraSetup:ClassHandle
---@class CameraSetup:Handle
CameraSetup = newClass(Handle) ---@type ClassCameraSetup

function CameraSetup:new()
    local object = self.old:new(CreateCameraSetup()) ---@type CameraSetup
    self:instantiate(object)

    ---@param whichField camerafield
    ---@return real
    function object.getField(whichField)
        return CameraSetupGetField(object.handle,whichField)
    end
    ---@param whichField camerafield
    ---@param value real
    ---@param duration real
    function object.setField(whichField,value,duration)
        CameraSetupSetField(object.handle,whichField,value,duration)
        return object
    end

    ---@param x real
    ---@param y real
    ---@param duration real
    function object.setDestCoordsPos(x,y,duration)
        CameraSetupSetDestPosition(object.handle,x,y,duration)
        return object
    end
    ---@param p Point
    ---@param duration real
    function object.setDestPos(p,duration)
        return object.setDestCoordsPos(p.getX(),p.getY(),duration)
    end
    function object.getDestPos()
        return Point:new(object.getDestXPos(),object.getDestYPos(),object.getDestZPos())
    end

    ---@param x real
    ---@param y real
    ---@param duration real
    ---@return LocationHandle|self
    function object.destLoc(x,y,duration)
        if not (x or y or duration) then
            return TempLocationHandle.move(object.destXPos(),object.destYPos())
        else
            CameraSetupSetDestPosition(object.handle,x,y,duration)
        end
        return object
    end

    ---@param p Point
    ---@param duration real
    ---@return Point|self
    function object.destPos(p,duration)
        if not p then
            return Point:new(object.destXPos(),object.destYPos(),object.destZPos())
        else
            CameraSetupSetDestPosition(object.handle,p.x(),p.y(),duration)
        end
        return object
    end

    ---@return real
    function object.getDestXPos()
        return CameraSetupGetDestPositionX(object.handle)
    end

    ---@return real
    function object.getDestYPos()
        return CameraSetupGetDestPositionY(object.handle)
    end

    ---@return real
    function object.getDestZPos()
        return TempLocationHandle.move(object.getDestXPos(),object.getDestYPos()).getZ()
    end

    ---@param doPan boolean
    ---@param panTimed boolean
    function object.apply(doPan,panTimed)
        CameraSetupApply(object.handle,doPan,panTimed)
        return object
    end

    ---@param zDestOffset real
    function object.withZApply(zDestOffset)
        CameraSetupApplyWithZ(object.handle,zDestOffset)
        return object
    end

    ---@param doPan boolean
    ---@param forceDuration real
    ---@return self
    function object.forceDurationApply(doPan,forceDuration)
        CameraSetupApplyForceDuration(object.handle,doPan,forceDuration)
        return object
    end

    ---@param zDestOffset real
    ---@param forceDuration real
    function object.withZForceDurationApply(zDestOffset,forceDuration)
        CameraSetupApplyForceDurationWithZ(object.handle,zDestOffset,forceDuration)
        return object
    end

    ---@param doPan boolean
    ---@param forcedDuration real
    ---@param easeInDuration real
    ---@param easeOutDuration real
    ---@param smoothFactor real
    function object.smoothForceDurationApply(doPan,forcedDuration,easeInDuration,easeOutDuration,smoothFactor)
        BlzCameraSetupApplyForceDurationSmooth(object.handle,doPan,forcedDuration,easeInDuration,easeOutDuration,smoothFactor)
        return object
    end

    return object
end