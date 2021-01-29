print("Booting...")
turtle.refuel()

FuelSlot = 1
SaplingSlot = 2

if turtle.detect() then
    HarvestComplete = false
else
    HarvestComplete = true
    turtle.select(SaplingSlot)
    turtle.place()
end

Standby = HarvestComplete

while true do --ALWAYS RUNNING
        while not HarvestComplete and not Standby do
            if turtle.detect() then
                Standby = false
                turtle.dig()
                turtle.digUp()
                turtle.up()
            else
                HarvestComplete = true
                print("Harvest Complete.")
            end
        end

        while HarvestComplete and not turtle.detectDown() and not Standby do
            turtle.down()
        end

        if HarvestComplete and turtle.detectDown() and not Standby then
            turtle.down()
            turtle.dig()

            turtle.select(SaplingSlot)
            turtle.place()

            if turtle.detect() then
                print("Sapling Successfully Planted.")
            else
                print("Sapling Plantation Failed Please Reboot...")
            end

            turtle.select(FuelSlot)

            Standby = true
            print("Standby Mode Initiated...")
        end

        if Standby and turtle.detect() then
            turtle.digUp()
            turtle.up()
            if turtle.detect() then
                Standby = false
                HarvestComplete = false
            else
                turtle.down()
                os.sleep(30)
            end
        end

        if turtle.getFuelLevel() == 0 then
            print("Attempting to Refuel...")
            turtle.select(FuelSlot)
            turtle.refuel()
        end
end