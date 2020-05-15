--============================================================================
-- Blight API

Blight = {}

---@param whichPlayer Player
---@param x real
---@param y real
---@param radius real
---@param addBlight boolean
function Blight.setAreaCoords(whichPlayer,x,y,radius,addBlight)
    SetBlight(whichPlayer.handle,x,y,radius,addBlight)
end

---@param whichPlayer Player
---@param p Point
---@param radius real
---@param addBlight boolean
function Blight.setAreaPoint(whichPlayer,p,radius,addBlight)
    Blight.setCoords(whichPlayer.handle,p.x(),p.y(),radius,addBlight)
end

---@param whichPlayer Player
---@param x real
---@param y real
---@param addBlight boolean
function Blight.setCoords(whichPlayer,x,y,addBlight)
    SetBlightPoint(whichPlayer.handle,x,y,addBlight)
end

---@param whichPlayer Player
---@param p Point
---@param addBlight boolean
function Blight.setPoint(whichPlayer,p,addBlight)
    Blight.setCoords(whichPlayer.handle,p.x(),p.y(),addBlight)
end