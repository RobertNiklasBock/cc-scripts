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
                if turtle.getItemCount() == 0 then
                    break
                end
                turtle.transferTo(j)
            end
        end
    end
    turtle.select(previousSlot)
end

function utils.organizeInventory(matchingTable)
    local previousSlot = turtle.getSelectedSlot()
    local freeSlot = utils.getFreeSlot()

    if freeSlot == 0 then
        return false
    end

    for i=1,16 do
        if matchingTable[i] ~= nil then
            if utils.getItemName(i) ~= matchingTable[i] then
                turtle.transferTo(freeSlot)
            end

            for j=1,16 do
                -- check whether this slot is in sorting table -> we dont want to break existing order
                if matchingTable[j] == nil then
                    if utils.getItemName(j) == matchingTable[i] then
                        turtle.select(j)
                        turtle.transferTo(i)
                        -- if items were left behind, the target slot is full -> break early
                        if not turtle.getItemCount() == 0 then
                            break
                        -- otherwise we have a new, definitively free slot
                        else
                            freeSlot = i
                        end
                    end
                end
            end
        end
    end
    turtle.select(previousSlot)
    return true
end

function utils.getFreeSlot()
    for i=1,16 do
        if turtle.getItemCount(i) == 0 then
            return i
        end
    end
    return 0
end

function utils.getItemName(slot)
    local detail = turtle.getItemDetail(slot)
    if detail then
        return detail.name
    else
        return ""
    end
end

function utils.isInList(item, list)
    for k,v in ipairs(list) do
        if item == v then
            return k
        end
    end

    return nil
end

return utils