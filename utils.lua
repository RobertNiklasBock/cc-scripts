local utils = {}

function utils.findInList(item,blacklist)
    for k,v in ipairs(blacklist) do
        if v == item then
            return k
        end
    end

    return nil
end

function utils.compressInventory(blacklist)
    blacklist = blacklist or {}
    local previousSlot = turtle.getSelectedSlot()
    for i=1,16 do
        local skip = false
        if utils.findInList(i, blacklist) then
            skip = true
        end
        
        if not skip then
            turtle.select(i)

            for j=1,i-1 do
                if turtle.getItemCout() == 0 then
                    break
                end
                turtle.transferTo(j)
            end
        end
    end
end

function utils.isInventoryFull(blacklist)
    blacklist = blacklist or {}
    local isFull = true
    for i=1,16 do
        local skip = false
        if utils.findInList(i, blacklist) then
            skip = true
        end
        
        if not skip then
            if turtle.getItemCount() == 0 then
                return false
            end
        end
    end

    return true
end

return utils