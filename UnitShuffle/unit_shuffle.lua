local disallowed_units = {
    "arm_leftshoulder_nationwars_eec",
    "arm_leftshoulder_nationwars_ger",
    "arm_leftshoulder_nationwars_us",
    "armminebomber",
    "armrespawn",
    "armsaap",
    "armsack",
    "armsacsub",
    "armsacv",
    "armsalab",
    "armsasy",
    "armsavp",
    "babylegdrone",
    "babyleggob",
    "babylegheavydrone",
    "babyleglob",
    "babylegshot",
    "chip",
    "cor_hat_fightnight",
    "cor_hat_gnome",
    "cor_hat_hw",
    "cor_hat_legfn",
    "cor_hat_pirate",
    "cor_hat_viking",
    "cor_leftshoulder_nationwars_eec",
    "cor_leftshoulder_nationwars_ger",
    "cor_leftshoulder_nationwars_us",
    "dbg_sphere",
    "dbg_sphere_fullmetal",
    "dice",
    "dummycom",
    "correspawn",
    "corsaap",
    "corsack",
    "corsacv",
    "corsacvsub",
    "corsalab",
    "corsasy",
    "corsavp",
    "lootdroppod_gold",
    "lootdroppod_printer",
    "meteor",
    "legmohobp",
    "legmohobpct",
    "legmohocon",
    "legmohoconin",
    "legnanotcbase",
    "legvision",
    "nuketest",
    "nuketestcor",
    "nuketestorg",
    "pbr_cube",
    "raptor_hive",
    "raptor_turret_burrow_t2_v1",
    "raptor_worm_green",
    "resourcecheat",
    "scavbeacon_t1",
    "scavbeacon_t2",
    "scavbeacon_t3",
    "scavbeacon_t4",
    "scavempspawner",
    "scavengerdroppod",
    "scavengerdroppodfriendly",
    "scavmist",
    "scavmistxl",
    "scavmistxxl",
    "scavsafeareabeacon",
    "scavtacnukespawner",
    "squadarmpw",
    "squadarmpwt4",
    "squadarmsptk",
    "squadarmsptkt4",
    "squadcorak",
    "squadcorakt4",
    "squadcorkarg",
    "squadcorkarganetht4",
    "volcano_projectile_unit",
    "xmasball1_1",
    "xmasball1_2",
    "xmasball1_3",
    "xmasball1_4",
    "xmasball1_5",
    "xmasball1_6",
    "xmasball2_1",
    "xmasball2_2",
    "xmasball2_3",
    "xmasball2_4",
    "xmasball2_5",
    "xmasball2_6",
}

-- for _, unit in ipairs(disallowed_units) do
--     UnitDefs[unit] = nil
-- end

local units = {}

for k in pairs(UnitDefs) do
    table.insert(units, k)
end

for unit_name, unit in pairs(UnitDefs) do
    local unit_copy = unit

    if unit_copy.buildoptions then
        if #unit_copy.buildoptions > 0 then
            for index, _ in pairs(unit_copy.buildoptions) do
                unit_copy.buildoptions[index] = units[math.random(#units)]
            end
        end
    end

    UnitDefs[unit_name] = unit_copy
end
