-- Automation Test
AutomationTest = {}

---@param testType string
function AutomationTest.setType(testType)
    AutomationSetTestType(testType)
end

---@param testName string
function AutomationTest.start(testName)
    AutomationTestStart(testName)
end

function AutomationTest.End()
    AutomationTestEnd()
end

function AutomationTest.finished()
    AutomationTestingFinished()
end