return function(...)
    local data = ProccessArgs(...)
    local GNew = {}
    for i,v in pairs(data) do
        table.insert(GNew,v)
    end
    local line = ''
    for k, j in pairs(GNew) do
        if k == #GNew then
            line = line..""..tostring(j)
        else
            line = line..""..tostring(j).." "
        end
    end
    saymsg(line)
end
