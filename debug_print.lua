local function traverseTable(tbl, indent, visited, printValues)
    indent = indent or 0
    visited = visited or {}

    if visited[tbl] then
        if printValues then
            Spring.Echo(string.rep(" ", indent) .. "<already visited>")
        end
        return
    end
    visited[tbl] = true

    for key, value in pairs(tbl) do
        local prefix = string.rep(" ", indent) .. tostring(key)

        if type(value) == "table" then
            Spring.Echo(prefix)

            traverseTable(
                value,
                indent + 4,
                visited,
                printValues
            )
        else
            if printValues then
                Spring.Echo(prefix .. " = " .. tostring(value))
            else
                Spring.Echo(prefix)
            end
        end
    end
end

function printTable(tbl)
    traverseTable(tbl, 0, {}, true)
end

function printTableKeys(tbl)
    traverseTable(tbl, 0, {}, false)
end

for key, _ in pairs(UnitDefs) do
    Spring.Echo(tostring(key))
end

-----

gl = "This is a global variable"

local lc = "This is a local variable"


Spring.Echo(tostring(gl))
Spring.Echo(tostring(lc))

-----

for k, v in pairs(_G) do
    Spring.Echo(tostring(k) .. ": " .. tostring(v))
end
