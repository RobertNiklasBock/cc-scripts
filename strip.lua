local save = require "save"

local cobbleSlot = 16

function segment()
    turtle.select(cobbleSlot)
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

segment()
