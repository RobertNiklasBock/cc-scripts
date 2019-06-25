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
    local counter = 0

    for i=1,times do
        counter = counter + safeDig()
        turtle.forward()
    end

    return counter
end

function safeUp()(times)
    times = optional(times, 1)
    local counter = 0

    for i=1,times do
        counter = counter + safeDigUp()
        turtle.up()
    end

    return counter
end

function safeDown()(times)
    times = optional(times, 1)
    local counter = 0

    for i=1,times do
        counter = counter + safeDigDown()
        turtle.down()
    end

    return counter
end

--------------------------------------------------------------------------------

function turnAround()
    turtle.turnLeft()
    turtle.turnLeft()
end

function refuelTo(level, slot)
    local previousSlot = turtle.getSelectedSlot()

    if slot then
        turtle.select(slot)
    end

    local counter = 0

    while turtle.getFuelLevel() < level do
        turtle.refuel(1)
        counter = counter + 1
        if turtle.getItemCount() == 0 then
            break
        end
    end

    turtle.select(previousSlot)

    return counter
end

--------------------------------------------------------------------------------