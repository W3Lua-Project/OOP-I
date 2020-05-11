---@class null:nil

---@param func function
---@return boolean
function compiletime(func) end

local _FourCC = FourCC
---@param id string
---@return number
function FourCC(id) return _FourCC(id) end

---@class ClassWarObject:ClassType
---@class WarObject:ObjectType
WarObject = newClass() ---@type ClassWarObject
function WarObject:new()
    local object = self.old:new() ---@type WarObject

    -- All fields available on this object
    object.all = {}

    -- This object's id as a string.
    object.id=''

    -- Parent's id as a string. Undefined if this object has no parent, i.e. 
    -- it is defined by WC3 data itself.
    object.parentId='' ---@type string|nil

    -- This object's type.
    object.type=''

    -- Clones this object, creating an independent instance of it.
    -- This instance can then be assigned into a `WarObjects` object
    -- to insert it into the map.
    ---@return WarObject
    function object.clone() end

    -- /**
    --  * Gets a field on this object.
    --  *
    --  * Two syntaxes are accepted for the `field` parameter:
    --  * 1) SLK-like, where fields have a 'proper' name, sometimes postfixed with
    --  * a number to indicate which level of the field to get/set. Examples include,
    --  * `Name`, `DataA1`, `DataC10`, etc.
    --  * 2) Raw, using a four-character rawid, optionally with a `+X` postfix
    --  * to indicate which level to use, for fields which can have multiple levels.
    --  * E.g.: `unam`, `xxxx+1`, `xxxx+10`
    --  *
    --  * The returned value will be automatically converted to the appropriate type.
    --  * WC3 has 4 fundamental types for fields:
    --  * real - standard float value
    --  * unreal - float value clamped between 0.0 and 1.0
    --  * int - standard signed integer value
    --  * string - null-terminated string
    --  *
    --  * Setting a field into null/undefined will reset it to its default value.
    --  */
    ---@param field string
    ---@return string|number
    function object.getField(field) end

    -- /**
    --  * Sets a field on this object.
    --  *
    --  * See `getField` for field name syntax.
    --  *
    --  * Setting a field into null/undefined will reset it to its default value.
    --  */
    ---@param field string
    ---@param value string|number
    function object.setField(field,value) end

    return object
end

---@class ClassWarObjects:ClassType
---@class WarObjects:ObjectType
WarObjects = newClass() ---@type ClassWarObjects
function WarObjects:new()
    local object = self.old:new() ---@type WarObjects

    -- /** All WC3 objects of this type in the map. Meant for iteration. */
    object.all = {}

    -- /** Extension string for this WC3 object type. */
    object.ext = ''

    -- /** Type string for this WC3 object type. */
    object.typestr = ''

    -- /** Marker whether any object data here has been modified since loading. Used by Ceres to prevent writing out unmodified object stores. */
    object.isDirty = false

    -- /**
    -- * Reads WC3 objects from the supplied string into this object.
    -- * The expected format is that of WC3 object data files, which is the same for all object data types.
    -- */
    ---@param data string
    function object.readFromString(data) end

    -- /**
    -- * Writes the WC3 objects contained in this object out into the string.
    -- * The resulting format is that of WC3 object data files, which is the same for all object data types.
    -- */
    ---@return string
    function object.writeToString() end

    -- /**
    -- * Gets a reference to a WC3 object inside this storage.
    -- *
    -- * Index is a rawid. Upon getting an object, you get a
    -- * reference which you can use to mutate it.
    -- *
    -- * For example:
    -- *
    -- * // getting a reference to an object
    -- * let myFoo = currentMap.objects.units['hfoo'] as WarObject
    -- * // this will mutate the 'hfoo' unit
    -- * myFoo['Name'] = "Crab"
    -- * // this will create a clone of the "Crab" 'hfoo' with the id 'xxxx'
    -- * currentMap.objects.units['xxxx'] = myFoo
    -- *
    -- * // this will get a clone instead, which won't modify the original object
    -- * let myPea = (currentMap.objects.units['hpea'] as WarObject).clone()
    -- * // this will only modify the clone now
    -- * myPea['Name'] = "Arnold"
    -- * currentMap.objects.units['yyyy'] = myPea
    -- */
    ---@param rawid string
    ---@return WarObject
    function object.getObject(rawid) end

    -- /**
    -- * Sets a WC3 object into this storage.
    -- *
    -- * Index is a rawid.
    -- *
    -- * When setting an object, Ceres will clone the target
    -- * and set the clone's id to that specified here.
    -- *
    -- * Setting an object into null/undefined will reset it to defaults for a stock
    -- * object, and delete it for a custom object.
    -- *
    -- * See `getObject` fore example usage.
    -- */
    ---@param rawid string
    ---@param object WarObject
    function object.setObject(rawid,object) end

    return object
end

-- Encapsulates all objects of all types in a map.
---@class ClassWarMapObjects:ClassType
---@class WarMapObjects:ObjectType
WarMapObjects = newClass() ---@type ClassWarMapObjects
function WarMapObjects:new()
    local object = self.old:new() ---@type WarMapObjects
    object.ability = {} ---@type WarObject
    object.item = {} ---@type WarObject
    object.unit = {} ---@type WarObject
    object.destructable = {} ---@type WarObject
    object.doodad = {} ---@type WarObject
    object.buff = {} ---@type WarObject
    object.upgrade = {} ---@type WarObject
    return object
end

-- Encapsulates a WC3 map during the compilation stage.
---@class ClassWarMap:ClassType
---@class WarMap:ObjectType
WarMap = newClass() ---@type ClassWarMap
function WarMap:new()
    local object = self.old:new() ---@type WarMap
    
    -- /** Reference to all object storage in this map. */
    object.objects = {} ---@type WarMapObjects

    -- /**
    -- * Reads a file from the map. Returns the file contents as a
    -- * string upon success, or false + an error message upon failure.
    -- *
    -- * This function will also "see" any files previously added to the map
    -- * via `addFileString`, `addFileDisk` or `addDir`.
    -- *
    -- * @tupleReturn
    -- */
    ---@param path string
    ---@return string|table
    function object.readFile(path) end

    -- /**
    -- * Adds a directory to the map, preserving the file hierarcy.
    -- * Note: the directory will only be written when writeToDir() or writeToMpq() has been called.
    -- */
    ---@param path string
    function object.addDir(path) end

    -- /**
    -- * Adds a file to the map with the specified content as a string.
    -- * Note: the file will only be written when writeToDir() or writeToMpq() has been called.
    -- */
    ---@param archivePath string
    ---@param contents string
    function object.addFileString(archivePath,contents) end

    -- /**
    -- * Adds a file to the map, reading it from disk at the specified lcoation.
    -- * Note: the file will only be written when writeToDir() or writeToMpq() has been called.
    -- */
    ---@param archivePath string
    ---@param diskPath string
    function object.addFileDisk(archivePath,diskPath) end

    -- /**
    -- * Writes the map and all manually added files to the specified directory.
    -- */
    ---@param path string
    function object.writeToDir(path) end

    -- /**
    -- * Writes the map and all manually added files to an MPQ archive at the specified path.
    -- */
    ---@param path string
    function object.writeToMpq(path) end

    -- /**
    -- * Initializes an object storage for the specified extension type.
    -- * This will read objects already present in the map if appropriate.
    -- */
    ---@param ext string
    function object.initObjectStorage(ext) end

    -- /**
    -- * Initializes all object storages in the map.
    -- */
    function object.initObjects() end

    -- /**
    -- * Writes out all the object storages to their respective files in the map.
    -- */
    ---@param objects WarObjects
    function object.commitObjectStorage(objects) end

    return object
end

-- /**
--  * Currently compiling map, if any.
--  * @compiletime
--  */
currentMap = WarMap:new()