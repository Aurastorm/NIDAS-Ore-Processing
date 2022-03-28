local file = io.open("/home/NIDAS/configuration/menu.lua", "r")
local fileContent = {}
for line in file:lines() do
    table.insert(fileContent, line)
end
io.close()
if fileContent[21] ~= "    {name = \"Ore Processing\", module = \"modules.tools.OreProcessing\", desc = descriptions.OreProcessing}" then
    fileContent[20] = fileContent[20]..","
    table.insert(fileContent, 21, "    {name = \"Ore Processing\", module = \"modules.tools.OreProcessing\", desc = descriptions.OreProcessing}")
    file = io.open("/home/NIDAS/configuration/menu.lua", "w")
    for k, v in ipairs(fileContent) do
        file:write(v.."\n")
    end
    io.close(file)
end
fileContent = {}
file = io.open("/home/NIDAS/configuration/descriptions.lua", "r")
if file then
    for line in file:lines() do
        table.insert(fileContent, line)
    end
end
--fileContent.descriptions.OreProcessing = "Automatically sorts incoming ores into their respective configurable ore processing lines."
if fileContent[8] ~= "    OreProcessing = \"Automatically sorts incoming ores into their respective configurable ore processing lines.\"" then
    fileContent[7] = fileContent[7]..","
    table.insert(fileContent, 8, "    OreProcessing = \"Automatically sorts incoming ores into their respective configurable ore processing lines.\"")
    file = io.open("/home/NIDAS/configuration/descriptions.lua", "w")
    for k, v in ipairs(fileContent) do
        file:write(v.."\n")
    end
    io.close(file)
end
require("shell").execute("wget https://raw.githubusercontent.com/Aurastorm/NIDAS-Ore-Processing/main/OreProcessing.lua /home/NIDAS/modules/tools/OreProcessing.lua -f")
require("computer").shutdown(true)