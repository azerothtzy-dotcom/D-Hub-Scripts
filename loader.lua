local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local REPO_OWNER = "azerothtzy-dotcom"
local REPO_NAME = "D-Hub-Scripts"
local BRANCH = "main"
local SCRIPT_FOLDER = "Scripts"

local Games = {
    ["125927821145949"] = {
        file = "Mine A Mountain.lua",
        key = "otw3ksubs"
    },

    ["93978595733734"] = {
        file = "Violence District.lua"
    },

    ["107778070777162"] = {
        file = "Steal An Egg.lua",
        key = "dhubkeren"
    }
}

local function encodePath(value)
    return value:gsub("([^%w%-_%.~])", function(char)
        return string.format("%%%02X", string.byte(char))
    end)
end

local function buildUrl(fileName)
    return string.format(
        "https://raw.githubusercontent.com/%s/%s/refs/heads/%s/%s/%s",
        REPO_OWNER,
        REPO_NAME,
        BRANCH,
        SCRIPT_FOLDER,
        encodePath(fileName)
    )
end

local gameId = tostring(game.PlaceId)
local entry = Games[gameId]

if not entry then
    pcall(function()
        Players.LocalPlayer:Kick("D-Hub Not Supported In This Game")
    end)
    return
end

if entry.key then
    getgenv().key = entry.key
end

local scriptUrl = buildUrl(entry.file)

local success, source = pcall(function()
    return game:HttpGet(scriptUrl, true)
end)

scriptUrl = nil

if not success or type(source) ~= "string" or #source == 0 then
    source = nil
    return
end

local fn

local compiled = pcall(function()
    fn = loadstring(source)
end)

source = nil

if not compiled or type(fn) ~= "function" then
    fn = nil
    return
end

pcall(fn)

fn = nil
entry = nil
Games = nil
