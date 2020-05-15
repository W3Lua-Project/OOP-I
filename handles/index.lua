---@class integer:number
---@class real:number

---@param id integer|string
---@return integer
function FormatCC(id)
    if type(id)=='integer' then
        return id
    elseif type(id)=='string' then
        return FourCC(id)
    end
end

require 'w3lua.handles.handle'
require 'w3lua.handles.location handle'
require 'w3lua.handles.point'
require 'w3lua.handles.widget'
require "w3lua.handles.player"
require "w3lua.handles.dialog"
require 'w3lua.handles.destructable'
require 'w3lua.handles.camera'
require "w3lua.handles.automation test"
require "w3lua.handles.blight"