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
    times = utils.optional(times, 1)

    for i=1,times do
        save.dig()
        turtle.forward()
    end
end

function save.up(times)
    times = utils.optional(times, 1)

    for i=1,times do
        save.digUp()
        turtle.up()
    end
end

function save.down()(times)
    times = utils.optional(times, 1)

    for i=1,times do
        save.digDown()
        turtle.down()
    end
end

--------------------------------------------------------------------------------

function save.turnAround()
    turtle.turnLeft()
    turtle.turnLeft()
end

--------------------------------------------------------------------------------

return save