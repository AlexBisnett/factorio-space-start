local globals = require("globals")

local utilities = {}

utilities.getRecipe = function(name)
	local recipe = data.raw.recipe[name]
	assert(recipe, "Recipe " .. name .. " is missing! Cannot initialize " .. globals.modName .. ".")
	return recipe
end

utilities.getItem = function(name)
	local item = data.raw.item[name]
	assert(item, "Item " .. name .. " is missing! Cannot initialize " .. globals.modName .. ".")
	return item
end

utilities.getEntity = function(prototype, name)
	local item = data.raw[prototype][name]
	assert(item, "Entity " .. name .. " is missing! Cannot initialize " .. globals.modName .. ".")
	return item
end

return utilities
