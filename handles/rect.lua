---@class rect:agent

---@class ClassRect:ClassHandle
---@class Rect:Handle
Rect = newClass(Handle) ---@type ClassRect

---@param r rect
---@param filter boolexpr
---@param actionFunc code
function EnumDestructablesInRect(r, filter, actionFunc) end