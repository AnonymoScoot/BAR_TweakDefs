local UnitDefs = UnitDefs or {}
local raptors = {}
local turrets = {}

for key, _ in pairs(UnitDefs) do
    if string.sub(key, 1, 6) == "raptor" then
        if key ~= "raptor_hive" and key ~= "raptor_antinuke" and key ~= "raptor_turret_burrow_t2_v1" and key ~= "raptor_worm_green" then
            if string.match(key, "turret") then
                table.insert(turrets, key)
            else
                table.insert(raptors, key)
            end
        end
    end
end

local factories = {
    air = {
        [1] = {
            UnitDefs["armap"],
            UnitDefs["corap"],
            UnitDefs["legap"],
            UnitDefs["armplat"],
            UnitDefs["corplat"],
            UnitDefs["legsplab"],
        },
        [2] = {
            UnitDefs["armaap"],
            UnitDefs["coraap"],
            UnitDefs["legaap"],
        },
        [3] = {
            UnitDefs["armhaap"],
            UnitDefs["corhaap"],
            UnitDefs["leghaap"],
        },
    },
    bot = {
        [1] = {

            UnitDefs["armlab"],
            UnitDefs["corlab"],
            UnitDefs["leglab"],
            UnitDefs["armhp"],
            UnitDefs["armfhp"],
            UnitDefs["corhp"],
            UnitDefs["corfhp"],
            UnitDefs["leghp"],
            UnitDefs["legfhp"],
            UnitDefs["armamsub"],
            UnitDefs["coramsub"],
            UnitDefs["legamphlab"],
        },
        [2] = {
            UnitDefs["armalab"],
            UnitDefs["coralab"],
            UnitDefs["legalab"],
        },
        [3] = {

            UnitDefs["armhalab"],
            UnitDefs["corhalab"],
            UnitDefs["leghalab"],
        }
    },
    vehicle = {
        [1] = {

            UnitDefs["armvp"],
            UnitDefs["corvp"],
            UnitDefs["legvp"],
        },
        [2] = {

            UnitDefs["armavp"],
            UnitDefs["coravp"],
            UnitDefs["legavp"],
        },
        [3] = {
            UnitDefs["armhavp"],
            UnitDefs["corhavp"],
            UnitDefs["leghavp"],
        },
    },
    sea = {
        [1] = {

            UnitDefs["armsy"],
            UnitDefs["corsy"],
            UnitDefs["legsy"],
        },
        [2] = {

            UnitDefs["armasy"],
            UnitDefs["corasy"],
            UnitDefs["legadvshipyard"],
        },
        [3] = {
            UnitDefs["armhasy"],
            UnitDefs["corhasy"],
        },
    },
    experimental = {
        UnitDefs["armshltx"],
        UnitDefs["armshltxuw"],
        UnitDefs["corgant"],
        UnitDefs["corgantuw"],
        UnitDefs["leggant"],
        UnitDefs["leggantuw"],
    }
}



local function add_factory_unit(unit, facts)
    for _, fac in ipairs(facts) do
        table.insert(fac.buildoptions, unit)
        for i, v in ipairs(fac.buildoptions) do
        end
    end
end

for _, raptor in pairs(raptors) do
    local tier = string.match(raptor, "t%d+")

    if tier then
        local t = tonumber(string.sub(tier, 2, 2))

        if t < 4 then
            if string.match(raptor, "land") then
                add_factory_unit(raptor, factories.bot[t])
            elseif string.match(raptor, "air") then
                add_factory_unit(raptor, factories.air[t])
            elseif string.match(raptor, "allterrain") then
                add_factory_unit(raptor, factories.vehicle[t])
            end
            add_factory_unit(raptor, factories.sea[t])
        else
            add_factory_unit(raptor, factories.experimental)
        end
    else
        if raptor == "raptor_6legged_l" then
            add_factory_unit(raptor, factories.vehicle[2])
            add_factory_unit(raptor, factories.sea[2])
        elseif raptor == "raptorartillery" then
            add_factory_unit(raptor, factories.vehicle[3])
            add_factory_unit(raptor, factories.sea[3])
        elseif raptor == "raptorh1b" then
            add_factory_unit(raptor, factories.bot[1])
            add_factory_unit(raptor, factories.sea[1])
        elseif raptor == "raptorh5" then
            add_factory_unit(raptor, factories.bot[2])
            add_factory_unit(raptor, factories.sea[2])

            local rcom = UnitDefs[raptor]

            rcom.canattack = false
            rcom.canrepair = true
            rcom.canreclaim = true
            rcom.canrestore = true

            for i, turret in ipairs(turrets) do
                rcom.buildoptions[i] = turret
            end
        else
            add_factory_unit(raptor, factories.experimental)
        end
    end
end

table.insert(UnitDefs["armaca"].buildoptions, "armhaap")
table.insert(UnitDefs["coraca"].buildoptions, "corhaap")
table.insert(UnitDefs["legaca"].buildoptions, "leghaap")
table.insert(UnitDefs["armacv"].buildoptions, "armhavp")
table.insert(UnitDefs["coracv"].buildoptions, "corhavp")
table.insert(UnitDefs["legacv"].buildoptions, "leghavp")
table.insert(UnitDefs["armack"].buildoptions, "armhalab")
table.insert(UnitDefs["corack"].buildoptions, "corhalab")
table.insert(UnitDefs["legack"].buildoptions, "leghalab")
table.insert(UnitDefs["armacsub"].buildoptions, "armhasy")
table.insert(UnitDefs["coracsub"].buildoptions, "corhasy")
table.insert(UnitDefs["leganavyconsub"].buildoptions, "leghasy")
