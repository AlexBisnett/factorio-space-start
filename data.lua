local globals = require("globals")
local utilities = require("utilities")

require("oxy-fuel-furnace/data.lua")

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

local metallicAsteroidCrushingRecipe = utilities.getRecipe("metallic-asteroid-crushing")
if metallicAsteroidCrushingRecipe then
	metallicAsteroidCrushingRecipe.hidden = true
end

local advancedMetallicAsteroidCrushingRecipe = utilities.getRecipe("advanced-metallic-asteroid-crushing")
if advancedMetallicAsteroidCrushingRecipe then
	advancedMetallicAsteroidCrushingRecipe.enabled = true
	advancedMetallicAsteroidCrushingRecipe.localised_name = "Metallic Asteroid Crushing"

	local advancedMetallicAsteroidCrushingRecipeResults = advancedMetallicAsteroidCrushingRecipe.results
	advancedMetallicAsteroidCrushingRecipeResults[#advancedMetallicAsteroidCrushingRecipeResults + 1] =
		{ type = "item", name = "stone", amount = 5 }
end

local carbonicAsteroidCrushingRecipe = utilities.getRecipe("carbonic-asteroid-crushing")
if carbonicAsteroidCrushingRecipe then
	carbonicAsteroidCrushingRecipe.enabled = true

	local carbonicAsteroidCrushingRecipeResults = carbonicAsteroidCrushingRecipe.results
	carbonicAsteroidCrushingRecipeResults[#carbonicAsteroidCrushingRecipeResults + 1] =
		{ type = "item", name = "stone", amount = 5 }
end

local advancedCarbonicAsteroidCrushingRecipe = utilities.getRecipe("advanced-carbonic-asteroid-crushing")
if advancedCarbonicAsteroidCrushingRecipe then
	local advancedCarbonicAsteroidCrushingRecipeResults = advancedCarbonicAsteroidCrushingRecipe.results
	advancedCarbonicAsteroidCrushingRecipeResults[#advancedCarbonicAsteroidCrushingRecipeResults + 1] =
		{ type = "item", name = "stone", amount = 5 }
end

local oxideAsteroidCrushingRecipe = utilities.getRecipe("oxide-asteroid-crushing")
if oxideAsteroidCrushingRecipe then
	oxideAsteroidCrushingRecipe.enabled = true

	local oxideAsteroidCrushingRecipeResults = oxideAsteroidCrushingRecipe.results
	oxideAsteroidCrushingRecipeResults[#oxideAsteroidCrushingRecipeResults + 1] =
		{ type = "item", name = "stone", amount = 5 }
end

local advancedOxideAsteroidCrushingRecipe = utilities.getRecipe("advanced-oxide-asteroid-crushing")
if advancedOxideAsteroidCrushingRecipe then
	local advancedOxideAsteroidCrushingRecipeResults = advancedOxideAsteroidCrushingRecipe.results
	advancedOxideAsteroidCrushingRecipeResults[#advancedOxideAsteroidCrushingRecipeResults + 1] =
		{ type = "item", name = "stone", amount = 5 }
end

local spacePlatformTechnology = data.raw.technology["space-platform"]
spacePlatformTechnology.prerequisites = nil

local iceMeltingRecipe = utilities.getRecipe("ice-melting")
if iceMeltingRecipe then
	iceMeltingRecipe.enabled = true
end

local thrusterFuelRecipe = utilities.getRecipe("thruster-fuel")
if thrusterFuelRecipe then
	thrusterFuelRecipe.enabled = true
end

local thrusterOxidizerRecipe = utilities.getRecipe("thruster-oxidizer")
if thrusterOxidizerRecipe then
	thrusterOxidizerRecipe.enabled = true
end
