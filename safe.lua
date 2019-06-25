function optional(arg, default)
    if not arg then
        return default
    else
        return arg
    end
end

--------------------------------------------------------------------------------

function safeDig()
    local counter = 0

    while(turtle.detect()) do
        turtle.dig()
        counter = counter + 1
    end

    return counter
end

function safeDigUp()
    local counter = 0

    while(turtle.detectUp()) do
        turtle.digUp()
        counter = counter + 1
    end

    return counter
end

function safeDigDown()
    local counter = 0

    while(turtle.detectDown()) do
        turtle.digDown()
        counter = counter + 1
    end

    return counter
end

--------------------------------------------------------------------------------

function safeForward(times)
    times = optional(times, 1)

    for i=1,times do
        safeDig()
        turtle.forward()
    end
end

function safeUp()(times)
    times = optional(times, 1)

    for i=1,times do
        safeDigUp()
        turtle.up()
    end
end

function safeDown()(times)
    times = optional(times, 1)

    for i=1,times do
        safeDigDown()
        turtle.down()
    end
end

--------------------------------------------------------------------------------

function turnAround()
    turtle.turnLeft()
    turtle.turnLeft()
end