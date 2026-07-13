local raptors = {}

for key, _ in pairs(UnitDefs) do
    if string.sub(key, 1, 6) == "raptor" then
        table.insert(raptors, key)
    end
end

local hive = UnitDefs["armhavp"]
local com = UnitDefs["raptorh5"]

com.canattack = false
com.canrepair = true
com.canreclaim = true
com.canrestore = true

for index, raptor in ipairs(raptors) do
    hive.buildoptions[index] = raptor
    com.buildoptions[index] = raptor
end

local armcom = UnitDefs["armcom"]

armcom.buildoptions[#armcom.buildoptions + 1] = "armhavp"
