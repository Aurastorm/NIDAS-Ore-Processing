local term = require("term")
local serialization = require("serialization")
local file = io.open("/home/NIDAS/settings/oreFilters")
local filters = serialization.unserialize(file:read("*a"))
file:close()
term.clear()
print("Editing /home/NIDAS/settings/oreFilters...")
for k, v in pairs(filters) do
    if not v.damage then
        term.setCursor(1, 2)
        io.write("Regarding \"", v.name, "\"...", "\nEnter its damage value: ")
        v.damage = tonumber(string.gsub(term.read(), "\n", ""))
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