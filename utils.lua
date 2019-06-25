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

        if skip then
            goto continue
        end

        turtle.select(i)

        for j=1,i-1 do
            turtle.transferTo(j)
        end
        ::continue::
    end

function utils.isInventoryFull()
    local previousSlot = turtle.getSelectedSlot()
    for i=1,16 do
        turtle.select(i)


return utils