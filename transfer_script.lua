local term = require("term")
local serialization = require("serialization")
local file = io.open("/home/NIDAS/settings/oreFilters")
local filters = serialization.unserialize(file)
file:close()
term.clear()
print("Editing /home/NIDAS/settings/oreFilters...")
for k, v in pairs(filters) do
    if not v.damage then
        term.setCursor(2, 1)
        io.write("Regarding \"", v.name, "\"...", "\nEnter its damage value: ")
        v.damage = term.read()
        term.clearLine()
        term.setCursor(2, 1)
        term.clearLine()
    end
end
print("Editing complete! Saving...")
local file = io.open("/home/NIDAS/settings/oreFilters", "w")
file:write(serialization.serialize(filters))
file:close()
print("Save complete! Script complete.")