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

require 'OOP-I.handles.handle'
require 'OOP-I.handles.location handle'
require 'OOP-I.handles.point'
require 'OOP-I.handles.widget'
require 'OOP-I.handles.player'
require 'OOP-I.handles.dialog'
require 'OOP-I.handles.destructable'
require 'OOP-I.handles.camera'
require 'OOP-I.handles.automation test'
require 'OOP-I.handles.blight'