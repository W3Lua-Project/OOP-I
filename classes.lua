do
    ---@class ClassType
    ---@class ObjectType
    local classGeneral = {} ---@type ClassType

    ---@return table
    function classGeneral:new()
        local object = {class=tostring(self)} ---@type ObjectType
        return object
    end

    ---@param object ObjectType
    function classGeneral:instantiate(object)
        object.oldClass = object.class
        object.class = tostring(self)
    end

    ---@param inheritedClass ClassType
    ---@return ClassType
    function inheritedClass(inheritedClass)
        local class = setmetatable({},{__index = inheritedClass}) ---@type ClassType
        class.old = setmetatable({},{__index = inheritedClass}) ---@type ClassType
        return class
    end

    ---@param extendedClass ClassType
    ---@return ClassType
    function newClass(extendedClass)
        local classExt = extendedClass and extendedClass or classGeneral
        local class = inheritedClass(classExt)
        return class
    end

    ---@param object ObjectType
    ---@param class ClassType
    ---@return boolean
    function instanceof(object,class)
        return object.class == tostring(class)
    end
end

-- ---@class Class:ClassType
-- ---@class ClassObject:ObjectType
-- local class = newClass() ---@type Class
-- function class:new()
--     local object = self.old:new() ---@type ClassObject
--     object.field = 10
--     return object
-- end

-- local object = class:new() 
-- print(object,object.class)

-- ---@class Class2:ClassType
-- ---@class Class2Object:ObjectType
-- local class2 = newClass() ---@type Class2
-- function class2:new()
--     local object = self.old:new() ---@type Class2Object
--     object.field2 = 30
--     return object
-- end

-- local object2 = class2:new()
-- print(object2,object2.class)

-- ---@class Class3:Class
-- ---@class Class3Object:ClassObject
-- local class3 = newClass(class) ---@type Class3
-- function class3:new()
--     local object = self.old:new() ---@type Class3Object
--     class3:instantiate(object)
--     object.field3 = 100
--     return object
-- end

-- local object3 = class3:new()
-- print(object3,object3.class)