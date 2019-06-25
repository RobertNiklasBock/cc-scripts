local utils = {}

function utils.compressInventory(blacklist)
    local previousSlot = turtle.getSelectedSlot()
    for i=1,16 do
        local skip = false
        for k,v in ipairs(blacklist) do
            if v == i then
                skip = true
                break
            end
        end

        if not skip then
            turtle.select(i)

            for j=1,i-1 do
                turtle.transferTo(j)
            end
        end
    end
end

function utils.isInventoryFull()
    local previousSlot = turtle.getSelectedSlot()
    for i=1,16 do
        turtle.select(i)


return utils