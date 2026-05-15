local input = load(LoadResourceFile(GetCurrentResourceName(), 'input/items.lua'))

if type(input) == 'function' then
    input = input()
elseif type(input) ~= 'table' then
    print("^1[CONVERTER] Le fichier input/items.lua n'est pas valide.^0")
    return
end

RegisterCommand("items", function()
    local list = ""

    for itemName, item in pairs(input) do
        local label = item.label or itemName
        local weight = item.weight or 0
        local stackable = item.stack ~= false

        -- Ox utilise souvent les grammes, donc 250 devient 0.25
        local convertedWeight = weight / 1000

        list = list .. string.format([[
ScriptShared.Items:Add("%s", {
    stackable = %s,
    deletable = true,
    tradable = true,
    label = "%s",
    weight = %.2f,
    category = "Divers",
    defaultMeta = {},
})

]], itemName, tostring(stackable), label, convertedWeight)
    end

    local path = GetResourcePath(GetCurrentResourceName()) .. "/output/items.lua"
    local file, err = io.open(path, "w")

    if file then
        file:write(list)
        file:close()
        print("^2[CONVERTER] Conversion terminée : output/items.lua^0")
    else
        print("^1[CONVERTER] Erreur création fichier : " .. tostring(err) .. "^0")
    end
end, true)