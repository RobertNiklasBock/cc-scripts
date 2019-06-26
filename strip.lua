local save = require "save"

local cobbleSlot = 16
local torchSlot = 15

function segment()
    turtle.select(cobbleSlot)
    turtle.placeUp()
    save.forward()
    turtle.placeUp()
    save.down()
    turtle.placeDown()
    save.forward()
    turtle.placeDown()
    save.up()
    turtle.placeUp()
    save.forward()
    turtle.placeUp()
    save.down()
    turtle.placeDown()
end

function roof(len)
    len = len or 1

    for i=1,len do
        save.forward()
        turtle.placeUp()
    end
end

function floor(len)
    len = len or 1

    for i=1,len do
        save.forward()
        turtle.placeDown()
    end
end

function branch(low,len)
    low = low or 1
    len = len or 5

    turtle.select(cobbleSlot)

    if low == 1 then
        floor(len)
        save.up()
        turtle.placeUp()
        turtle.select(torchSlot)
        turtle.placeDown()
        turtle.select(cobbleSlot)
        save.turnAround()
        roof(len)
    else
        roof(len)
        save.digDown()
        turtle.select(torchSlot)
        turtle.placeDown()
        turtle.select(cobbleSlot)
        save.turnAround()
        save.forward()
        save.down()
        turtle.placeDown()
        floor(len-1)
    end
end

local counter = 0
while true do
    turtle.placeUp()
    segment()
    turtle.turnLeft()
    branch(1,5)
    save.down()
    branch(1,5)
    turtle.turnRight()
    if counter % 2 == 0 then
        save.placeDown(torchSlot)
    end
    counter = counter + 1
end
