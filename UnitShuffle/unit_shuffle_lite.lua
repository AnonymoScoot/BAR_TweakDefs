local du = {
    ["arm_leftshoulder_nationwars_eec"] = true,
    ["arm_leftshoulder_nationwars_ger"] = true,
    ["arm_leftshoulder_nationwars_us"] = true,
    ["armminebomber"] = true,
    ["armrespawn"] = true,
    ["armsaap"] = true,
    ["armsack"] = true,
    ["armsacsub"] = true,
    ["armsacv"] = true,
    ["armsalab"] = true,
    ["armsasy"] = true,
    ["armsavp"] = true,
    ["babylegdrone"] = true,
    ["babyleggob"] = true,
    ["babylegheavydrone"] = true,
    ["babyleglob"] = true,
    ["babylegshot"] = true,
    ["chip"] = true,
    ["cor_hat_fightnight"] = true,
    ["cor_hat_gnome"] = true,
    ["cor_hat_hw"] = true,
    ["cor_hat_legfn"] = true,
    ["cor_hat_pirate"] = true,
    ["cor_hat_viking"] = true,
    ["cor_leftshoulder_nationwars_eec"] = true,
    ["cor_leftshoulder_nationwars_ger"] = true,
    ["cor_leftshoulder_nationwars_us"] = true,
    ["dbg_sphere"] = true,
    ["dbg_sphere_fullmetal"] = true,
    ["dice"] = true,
    ["dummycom"] = true,
    ["correspawn"] = true,
    ["corsaap"] = true,
    ["corsack"] = true,
    ["corsacv"] = true,
    ["corsacvsub"] = true,
    ["corsalab"] = true,
    ["corsasy"] = true,
    ["corsavp"] = true,
    ["corvacct"] = true,
    ["lootdroppod_gold"] = true,
    ["lootdroppod_printer"] = true,
    ["meteor"] = true,
    ["legmohobp"] = true,
    ["legmohobpct"] = true,
    ["legmohocon"] = true,
    ["legmohoconin"] = true,
    ["legnanotcbase"] = true,
    ["legvision"] = true,
    ["nuketest"] = true,
    ["nuketestcor"] = true,
    ["nuketestorg"] = true,
    ["pbr_cube"] = true,
    ["raptor_hive"] = true,
    ["raptor_turret_burrow_t2_v1"] = true,
    ["raptor_worm_green"] = true,
    ["resourcecheat"] = true,
    ["scavbeacon_t1"] = true,
    ["scavbeacon_t2"] = true,
    ["scavbeacon_t3"] = true,
    ["scavbeacon_t4"] = true,
    ["scavempspawner"] = true,
    ["scavengerdroppod"] = true,
    ["scavengerdroppodfriendly"] = true,
    ["scavmist"] = true,
    ["scavmistxl"] = true,
    ["scavmistxxl"] = true,
    ["scavsafeareabeacon"] = true,
    ["scavtacnukespawner"] = true,
    ["squadarmpw"] = true,
    ["squadarmpwt4"] = true,
    ["squadarmsptk"] = true,
    ["squadarmsptkt4"] = true,
    ["squadcorak"] = true,
    ["squadcorakt4"] = true,
    ["squadcorkarg"] = true,
    ["squadcorkarganetht4"] = true,
    ["volcano_projectile_unit"] = true,
    ["xmasball1_1"] = true,
    ["xmasball1_2"] = true,
    ["xmasball1_3"] = true,
    ["xmasball1_4"] = true,
    ["xmasball1_5"] = true,
    ["xmasball1_6"] = true,
    ["xmasball2_1"] = true,
    ["xmasball2_2"] = true,
    ["xmasball2_3"] = true,
    ["xmasball2_4"] = true,
    ["xmasball2_5"] = true,
    ["xmasball2_6"] = true,
}

local us = {}

for k in pairs(UnitDefs) do
    if not du[k] then
        table.insert(us, k)
    end
end

for _, un in pairs(us) do
    local u = UnitDefs[un]

    if u.buildoptions then
        if #u.buildoptions > 0 and (un ~= "armcom") then
            for index, _ in pairs(u.buildoptions) do
                u.buildoptions[index] = us[math.random(#us)]
            end
        end
    end
end
