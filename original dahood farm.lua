-- [ Authorization ] --

_G.wl_key = getgenv().ScriptKey

-- [ Optimizations ] --

local existingSettings = getgenv().settings

if existingSettings and type(existingSettings) == "table" and existingSettings.Rendering then
    existingSettings.Rendering.QualityLevel = 1
end

UserSettings().GameSettings.MasterVolume = 0

loadstring(game:HttpGet("https://raw.githubusercontent.com/Astonlix/Roblox-Lua/Main/fps-booster"))()

-- [ Settings ] --

getgenv().settings = {
  ['FPS'] = getgenv().Settings.FPS,
  ['CPU_SAVER'] = getgenv().Settings.CPUSaver,
  ['PUBLICSERVERMODE'] = getgenv().Settings.PublicServerMode,
  ['WEBHOOK'] = getgenv().Webhook.WebhookURL,
  ['HOOK_INTERVAL'] = getgenv().Webhook.Interval,
}

loadstring(game:HttpGet('https://scripts.luawl.com/hosted/5736/20857/dahood-lmg-farm.lua'))()
