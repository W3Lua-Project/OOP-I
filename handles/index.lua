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

require 'modules.oop-i.handles.handle'
require 'modules.oop-i.handles.location handle'
require 'modules.oop-i.handles.point'
require 'modules.oop-i.handles.widget'
require 'modules.oop-i.handles.player'
require 'modules.oop-i.handles.destructable'
require 'modules.oop-i.handles.camera'
require 'modules.oop-i.handles.automation test'
require 'modules.oop-i.handles.blight'