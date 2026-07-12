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

local units = {}

for k in pairs(UnitDefs) do
    if ! disallowed_units[k] then
        table.insert(units, k)
    end
end

for unit_name in pairs(units) do
    local unit = UnitDefs[unit_name]

    if unit.buildoptions then
        if #unit.buildoptions > 0 then
            for index, _ in pairs(unit.buildoptions) do
                unit.buildoptions[index] = units[math.random(#units)]
            end
        end
    end

    UnitDefs[unit_name] = unit
end
