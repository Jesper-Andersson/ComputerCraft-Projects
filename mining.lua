print("Beginning Mine...")
turtle.refuel()
print("Refueling...")
WidthDepth = 5
Y = 50
TurnLeft = false
InventoryFull = false

function Mine(WidthDepth, TurnLeft)
    --Counters
    x = 0
    z = 0
    i = 0
    k = 0
    n = 0
    heightDepth = 0
    itemCounter = 0

    while x < Y do  --Depth Y-Axis
        while z < 6 or z == 6 do --Repeats mining straight and turn for WidthMine * WidthMine
            while i < WidthDepth or i == WidthDepth do --Mines straight
                while turtle.detect() do
                    turtle.dig()
                end
                turtle.forward()

                --Item Space Checker
                while k > 0 do
                    if turtle.getItemCount(itemCounter) > 0 then
                        itemCounter = itemCounter + 1
                    end

                    if itemCounter < 16 then
                        while Y < n do
                            turtle.up()
                        end

                        if itemCounter < 16 then
                            while Y < n do
                                turtle.up()
                            end
                        end
                    end
                end
                i = i + 1
            end
            i = 0
            print("Turning")
            if TurnLeft == false then
                turtle.turnRight()
                turtle.dig()
                turtle.forward()
                turtle.turnRight()
                TurnLeft = true
               else
                turtle.turnLeft()
                turtle.dig()
                turtle.forward()
                turtle.turnLeft()
                TurnLeft = false
            end
            z = z + 1
            print("Digging Down")
            turtle.digDown()
            turtle.down()
        end
        z = 0

        TurnLeft = not TurnLeft
        x = x + 1
    end
    x = 0
end

while turtle.getFuelLevel() > 0 do --Main Program
    Mine(WidthDepth, TurnLeft)
end