if not game:IsLoaded() then
    game.Loaded:Wait()
end

local BASE = "https://raw.githubusercontent.com/azerothtzy-dotcom/D-Hub-Scripts/main/Scripts/"

local games = {
    [125927821145949] = {
        file = "Mine%20A%20Mountain.lua",
        key = "otw3ksubs"
    },

    [93978595733734] = {
        file = "Violence%20District.lua"
    },

    [107778070777162] = {
        file = "Steal%20An%20Egg.lua",
        key = "dhubkeren"
    }
}

local entry = games[game.PlaceId]

if not entry then
    game:GetService("Players").LocalPlayer:Kick(
        "D-Hub Not Supported In This Game"
    )
    return
end

if entry.key then
    getgenv().key = entry.key
end

local source = game:HttpGet(BASE .. entry.file)

local fn = loadstring(source)

if fn then
    fn()
end
