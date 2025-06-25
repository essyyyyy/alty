return function()
    local players = game:service"Players"
    local plr = players:GetPlayerByUserId(Settings['host'])
    if plr then
        _G.TeleportUtils.teleportToPlayer(plr, Vector3.new(0, 10, 0))
    end
end
