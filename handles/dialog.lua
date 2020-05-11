--============================================================================
-- Dialog API

---@class dialog:agent
---@class button:agent

---@class ClassButton:ClassHandle
---@class Button:Handle
Button = newClass(Handle) ---@type ClassButton


---@param handle button
function ButtonDialog:new(handle)
    local obj = self.old:new(handle) ---@type Button
    self:instantiate(obj)
    return obj
end

---@class ClassDialog:ClassHandle
---@class Dialog:Handle
Dialog = newClass(Handle) ---@type ClassDialog

---@param handle dialog
function Dialog:new()
    local obj = self.old:new(DialogCreate()) ---@type Dialog
    self:instantiate(obj)

    ---@return self
    function obj.destroy()
        DialogDestroy(obj.handle)
        return obj
    end

    ---@return self
    function obj.clear()
        DialogClear(obj.handle)
        return obj
    end

    ---@param messageText string
    ---@return self
    function obj.setMessage(messageText)
        DialogSetMessage(obj.handle,messageText)
        return obj
    end

    ---@param buttonText string
    ---@param hotkey integer
    ---@param quit boolean
    ---@param doScoreScreen boolean
    ---@return Button
    function obj.addButton(buttonText,hotkey,quit,doScoreScreen)
        if not hotkey then
            hotkey = 0
        end
        if not quit then
            quit = false
        end
        if not doScoreScreen then
            doScoreScreen = false
        end
        if not quit then
            return Button:new(DialogAddButton(obj.handle,buttonText,hotkey))
        else
            return Button:new(DialogAddQuitButton(obj.handle,doScoreScreen,buttonText,hotkey))
        end
    end

    ---@param whichPlayer Player
    ---@param flag boolean
    ---@return self
    function obj.display(whichPlayer,flag)
        DialogDisplay(whichPlayer.handle,obj.handle,flag)
        return obj
    end

    return obj
end