--// Configurations

getgenv().Settings = {
    host = 123456789,
    prefix = '/',
    fps = 3,
    admsg = 'free',
    disable_gui = false -- Secret developer option to disable the fullscreen GUI
}

getgenv().Alts = {
    8336740146,
    123456789,
}

-- Load teleport utilities first
loadstring(game:HttpGet("https://raw.githubusercontent.com/essyyyyy/alty/refs/heads/main/teleport_utils.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/essyyyyy/alty/refs/heads/main/alt.lua"))()