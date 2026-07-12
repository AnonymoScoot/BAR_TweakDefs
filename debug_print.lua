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

for k, v in pairs(UnitDefs) do
    if v.buildoptions then
        if #v.buildoptions > 0 then
            Spring.Echo(tostring(k))
        end
    end
end
