---@class  terraindeformation:handle
---@class ClassTerrainDeformation:ClassHandle
---@class TerrainDeformation:Handle
TerrainDeformation = newClass(Handle) ---@type ClassTerrainDeformation

---@param handle terraindeformation
---@return TerrainDeformation
function TerrainDeformation:new(handle)
    local obj = self.old:new(handle) ---@type TerrainDeformation
    self:instantiate(obj)

    ---@param duration integer
    function obj.stop(duration)
        TerrainDeformStop(obj.handle,duration)
    end

    return obj
end

function TerrainDeformation.stopAll()
    TerrainDeformStopAll()
end

---@param x real
---@param y real
---@param radius real
---@param depth real
---@param duration integer
---@param permanent boolean
---@return TerrainDeformation
function TerrainDeformation:coordsCrater(x,y,radius,depth,duration,permanent)
    return TerrainDeformation:new(TerrainDeformCrater(x,y,radius,depth,duration,permanent))
end

---@param p Point
---@param radius real
---@param depth real
---@param duration integer
---@param permanent boolean
---@return TerrainDeformation
function TerrainDeformation:crater(p,radius,depth,duration,permanent)
    return TerrainDeformation:coordsCrater(p.x(),p.y(),radius,depth,duration,permanent)
end

---@param x real
---@param y real
---@param radius real
---@param depth real
---@param duration integer
---@param count integer
---@param spaceWaves real
---@param timeWaves real
---@param radiusStartPct real
---@param limitNeg boolean
---@return TerrainDeformation
function TerrainDeformation:coordsRipple(x, y, radius, depth, duration, count, spaceWaves, timeWaves, radiusStartPct, limitNeg)
    return TerrainDeformation:new(TerrainDeformRipple(x, y, radius, depth, duration, count, spaceWaves, timeWaves, radiusStartPct, limitNeg))
end

---@param p Point
---@param radius real
---@param depth real
---@param duration integer
---@param count integer
---@param spaceWaves real
---@param timeWaves real
---@param radiusStartPct real
---@param limitNeg boolean
---@return TerrainDeformation
function TerrainDeformation:ripple(p, radius, depth, duration, count, spaceWaves, timeWaves, radiusStartPct, limitNeg)
    return TerrainDeformation:coordsRipple(p.x(), p.y(), radius, depth, duration, count, spaceWaves, timeWaves, radiusStartPct, limitNeg)
end

---@param x real
---@param y real
---@param dirX real
---@param dirY real
---@param distance real
---@param speed real
---@param radius real
---@param depth real
---@param trailTime integer
---@param count integer
---@return TerrainDeformation
function TerrainDeformation:coordsWave(x, y, dirX, dirY, distance, speed, radius, depth, trailTime, count)
    return TerrainDeformation:new(TerrainDeformWave(x, y, dirX, dirY, distance, speed, radius, depth, trailTime, count))
end

---@param p Point
---@param dirP Point
---@param distance real
---@param speed real
---@param radius real
---@param depth real
---@param trailTime integer
---@param count integer
---@return TerrainDeformation
function TerrainDeformation:wave(p, dirP, distance, speed, radius, depth, trailTime, count)
    return TerrainDeformation:coordsWave(p.x(), p.y(), dirP.x(), dirP.y(), distance, speed, radius, depth, trailTime, count)
end

---@param x real
---@param y real
---@param radius real
---@param minDelta real
---@param maxDelta real
---@param duration integer
---@param updateInterval integer
---@return TerrainDeformation
function TerrainDeformation:coordsRandom(x, y, radius, minDelta, maxDelta, duration, updateInterval)
    return TerrainDeformation:new(TerrainDeformRandom(x, y, radius, minDelta, maxDelta, duration, updateInterval))
end

---@param p Point
---@param radius real
---@param minDelta real
---@param maxDelta real
---@param duration integer
---@param updateInterval integer
---@return TerrainDeformation
function TerrainDeformation:random(p, radius, minDelta, maxDelta, duration, updateInterval)
    return TerrainDeformation:coordsRandom(p.x(), p.y(), radius, minDelta, maxDelta, duration, updateInterval)
end