local armcon = UnitDefs["armck"]

local i = 1

for unit_name, unit in pairs(UnitDefs) do
    armcon.buildoptions[i] = unit_name
    i = i + 1
end
