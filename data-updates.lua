local globals = require("globals")

local function getRecipe(name)
	local recipe = data.raw.recipe[name]
	assert(recipe, "Recipe " .. name .. " is missing! Cannot initialize " .. globals.modName .. ".")
	return recipe
end

--data.raw.recipe["space-platform-foundation"].enabled = true

--[[
local metallicAsteroidCrushingRecipe = data.raw.recipe["metallic-asteroid-crushing"]

local ironMetallicAsteroidCrushingRecipe = table.deepcopy(metallicAsteroidCrushingRecipe)
ironMetallicAsteroidCrushingRecipe.name = "iron-metallic-asteroid-crushing"
ironMetallicAsteroidCrushingRecipe.localised_name = "Iron Metallic Asteroid Crushing"
ironMetallicAsteroidCrushingRecipe.icon = "__space-start__/graphics/icons/iron-metallic-asteroid-crushing.png"
data:extend({ ironMetallicAsteroidCrushingRecipe })

local copperMetallicAsteroidCrushingRecipe = table.deepcopy(metallicAsteroidCrushingRecipe)
copperMetallicAsteroidCrushingRecipe.name = "copper-metallic-asteroid-crushing"
copperMetallicAsteroidCrushingRecipe.localised_name = "Copper Metallic Asteroid Crushing"
copperMetallicAsteroidCrushingRecipe.icon = "__space-start__/graphics/icons/copper-metallic-asteroid-crushing.png"
copperMetallicAsteroidCrushingRecipe.results[1] = { type = "item", name = "copper-ore", amount = 20 }
data:extend({ copperMetallicAsteroidCrushingRecipe })

metallicAsteroidCrushingRecipe.hidden = true
ironMetallicAsteroidCrushingRecipe.enabled = true
copperMetallicAsteroidCrushingRecipe.enabled = true
]]

local metallicAsteroidCrushingRecipe = getRecipe("metallic-asteroid-crushing")
if metallicAsteroidCrushingRecipe then
	metallicAsteroidCrushingRecipe.hidden = true
end

local advancedMetallicAsteroidCrushingRecipe = getRecipe("advanced-metallic-asteroid-crushing")
if advancedMetallicAsteroidCrushingRecipe then
	advancedMetallicAsteroidCrushingRecipe.enabled = true
	advancedMetallicAsteroidCrushingRecipe.localised_name = "Metallic Asteroid Crushing"
end

local carbonicAsteroidCrushingRecipe = getRecipe("carbonic-asteroid-crushing")
if carbonicAsteroidCrushingRecipe then
	carbonicAsteroidCrushingRecipe.enabled = true
end

local oxideAsteroidCrushingRecipe = getRecipe("oxide-asteroid-crushing")
if oxideAsteroidCrushingRecipe then
	oxideAsteroidCrushingRecipe.enabled = true
end

local spacePlatformTechnology = data.raw.technology["space-platform"]
spacePlatformTechnology.prerequisites = nil
