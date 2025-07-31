local Lib = {
    bank = {
        MultiplierX = -11,
        MultiplierZ = 10,
        StartX = -364,
        CurrentX = -364,
        StartY = 21,
        StartZ = -335,
        CurrentZ = -335,
        MaxIterations = 13,
        MaxPerRow = 3,
        CurrentPerRow = 3
    },
    admin = {
        MultiplierX = -18,
        MultiplierZ = 15,
        StartX = -826,
        CurrentX = -826,
        StartY = -40,
        StartZ = -622,
        CurrentZ = -622,
        MaxIterations = 7,
        MaxPerRow = 6,
        CurrentPerRow = 6
    },
    train = {
        MultiplierX = -14,
        MultiplierZ = -10,
        StartX = 674,
        CurrentX = 674,
        StartY = 47,
        StartZ = -46,
        CurrentZ = -46,
        MaxIterations = 7,
        MaxPerRow = 6,
        CurrentPerRow = 6
    },
    jail = {
        MultiplierX = 14,
        MultiplierZ = 4,
        StartX = -341,
        CurrentX = -341,
        StartY = 22,
        StartZ = -46,
        CurrentZ = -46,
        MaxIterations = 7,
        MaxPerRow = 6,
        CurrentPerRow = 6
    },
    school = {
        MultiplierX = -25,
        MultiplierZ = -11,
        StartX = -489,
        CurrentX = -489,
        StartY = 21,
        StartZ = 233,
        CurrentZ = 233,
        MaxIterations = 5,
        MaxPerRow = 8,
        CurrentPerRow = 8
    },
    basketball = {
        MultiplierX = -17.8,
        MultiplierZ = 18.6,
        StartX = -870,
        CurrentX = -870,
        StartY = 21,
        StartZ = -520,
        CurrentZ = -520,
        MaxIterations = 5,
        MaxPerRow = 8,
        CurrentPerRow = 8
    },
    club = {
        MultiplierX = 8.2,
        MultiplierZ = -13.6,
        StartX = -289,
        CurrentX = -289,
        StartY = -7,
        StartZ = -350,
        CurrentZ = -350,
        MaxIterations = 6,
        MaxPerRow = 7,
        CurrentPerRow = 7
    }
}

return function(...)
    local data = ProccessArgs(...)
    local areas = {'train','club','admin','jail','school','basketball','bank'}
    local plr = game:service"Players".LocalPlayer

    if table.find(areas,data[2]) then
        local area = data[2]:lower()
        for i=1,Lib[area]['MaxIterations']*Lib[area]['MaxPerRow'] do
            local x,y,z = Lib[area]['CurrentX'],Lib[area]['StartY'],Lib[area]['CurrentZ']
            if ReSort(Alts)[i] == plr.UserId then
                _G.TeleportUtils.teleportToCoords(x, y, z)
                break
            end
            Lib[area]['CurrentX'] = Lib[area]['CurrentX'] + Lib[area]['MultiplierX']
            if i == Lib[area]['CurrentPerRow'] then
                Lib[area]['CurrentPerRow'] = Lib[area]['CurrentPerRow'] + Lib[area]['MaxPerRow']
                Lib[area]['CurrentZ'] = Lib[area]['CurrentZ'] + Lib[area]['MultiplierZ']
                Lib[area]['CurrentX'] = Lib[area]['StartX']
            end
        end
    end
end
