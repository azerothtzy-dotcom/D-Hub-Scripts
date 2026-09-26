if not game:IsLoaded() then
    game.Loaded:Wait()
end

local games = {
    [125927821145949] = {
        raw = "https://raw.githubusercontent.com/azerothtzy-dotcom/D-Hub-Scripts/main/Scripts/Mine%20A%20Mountain.lua",
        key = "otw3ksubs"
    },

    [93978595733734] = {
        raw = "https://raw.githubusercontent.com/azerothtzy-dotcom/D-Hub-Scripts/main/Scripts/Violence%20District.lua"
        key = "otw3ksubs"
    },

    [107778070777162] = {
        raw = "https://raw.githubusercontent.com/azerothtzy-dotcom/D-Hub-Scripts/main/Scripts/Steal%20An%20Egg.lua",
        key = "dhubkeren"
    },

    [124216119978534] = {
        raw = "https://raw.githubusercontent.com/azerothtzy-dotcom/D-Hub-Scripts/refs/heads/main/Scripts/Ride%20A%20Pet.lua",
        key = "dhubkeren"
    }
}

local data = games[game.PlaceId]

if not data then
    warn("[D-HUB] Game tidak didukung.")
    return
end

if data.key then
    getgenv().key = data.key
end

local source = game:HttpGet(data.raw)
local scriptFunc, err = loadstring(source)

if not scriptFunc then
    error("[D-HUB] Load error: " .. tostring(err))
end

return scriptFunc()
