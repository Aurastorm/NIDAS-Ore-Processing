local term = require("term")
local serialization = require("serialization")
local file = io.open("/home/NIDAS/settings/oreFilters")
local filters = serialization.unserialize(file:read("*a"))
file:close()
term.clear()
print("Editing /home/NIDAS/settings/oreFilters...")
for k, v in pairs(filters) do
    if not v.damage then
        io.write("Regarding \"", v.name, "\"...", "\nEnter its damage value: ")
        local input = term.read()
        input = string.gsub(input, "\n", "")
        v.damage = tonumber(input)
        term.setCursor(1, 3)
        term.clearLine()
        term.setCursor(1, 2)
        term.clearLine()
    end
end
print("Editing complete! Saving...")
local file = io.open("/home/NIDAS/settings/oreFilters", "w")
file:write(serialization.serialize(filters))
file:close()
print("Save complete! Script complete.")