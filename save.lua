local save = {}
--------------------------------------------------------------------------------

local utils = require "utils"

--------------------------------------------------------------------------------

function save.dig()
    local counter = 0

    while(turtle.detect()) do
        turtle.dig()
        counter = counter + 1
    end

    return counter
end

function save.digUp()
    local counter = 0

    while(turtle.detectUp()) do
        turtle.digUp()
        counter = counter + 1
    end

    return counter
end

function save.digDown()
    local counter = 0

    while(turtle.detectDown()) do
        turtle.digDown()
        counter = counter + 1
    end

    return counter
end

--------------------------------------------------------------------------------

function save.forward(times)
    times = times or 1

    for i=1,times do
        while not turtle.forward() do
            save.dig()
            turtle.attack()
        end
    end
end

function save.up(times)
    times = times or 1

    for i=1,times do
        while not turtle.up() do
            save.digUp()
            turtle.attackUp()
        end
    end
end

function save.down(times)
    times = times or 1

    for i=1,times do
        while not turtle.down() do
            save.digDown()
            turtle.attackDown()
        end
    end
end

--------------------------------------------------------------------------------

function save.turnAround()
    turtle.turnLeft()
    turtle.turnLeft()
end

--------------------------------------------------------------------------------

function save.placeDown(slot)
    local previousSlot = turtle.getSelectedSlot()
    if slot then
        turtle.select(slot)
    end

    if turtle.getItemCount() == 0 then
        return false
    else
        turtle.placeDown()
    end

    if slot then
        turtle.select(previousSlot)
    end
end

function save.place(slot)
    local previousSlot = turtle.getSelectedSlot()
    if slot then
        turtle.select(slot)
    end

    if turtle.getItemCount() == 0 then
        return false
    else
        turtle.place()
    end

    if slot then
        turtle.select(previousSlot)
    end
end

function save.placeUp(slot)
    local previousSlot = turtle.getSelectedSlot()
    if slot then
        turtle.select(slot)
    end

    if turtle.getItemCount() == 0 then
        return false
    else
        turtle.placeUp()
    end

    if slot then
        turtle.select(previousSlot)
    end
end

-------------------------------------------------------------------------------
return save