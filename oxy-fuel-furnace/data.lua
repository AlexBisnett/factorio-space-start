local utilities = require("__space-start__/utilities.lua")

local chemicalPlantEntity = utilities.getEntity("assembling-machine", "chemical-plant")
local gasFurnaceEntity = utilities.getEntity("furnace", "gas-furnace")
local gasFurnaceItem = utilities.getItem("gas-furnace")
local gasFurnaceRecipe = utilities.getRecipe("gas-furnace")

local oxyFuelFurnaceEntity = table.deepcopy(chemicalPlantEntity)
oxyFuelFurnaceEntity.name = "oxy-fuel-furnace"
oxyFuelFurnaceEntity.localised_name = "Oxy-Fuel Furnace"
oxyFuelFurnaceEntity.type = "assembling-machine"
oxyFuelFurnaceEntity.crafting_categories = { "oxy-fuel-smelting" }
oxyFuelFurnaceEntity.surface_conditions = nil
oxyFuelFurnaceEntity.minable.result = "oxy-fuel-furnace"
oxyFuelFurnaceEntity.graphics_set = gasFurnaceEntity.graphics_set
oxyFuelFurnaceEntity.collision_box = gasFurnaceEntity.collision_box
oxyFuelFurnaceEntity.selection_box = gasFurnaceEntity.selection_box
oxyFuelFurnaceEntity.rotatable = true
oxyFuelFurnaceEntity.direction_only = false
oxyFuelFurnaceEntity.source_inventory_size = nil
oxyFuelFurnaceEntity.result_inventory_size = nil
oxyFuelFurnaceEntity.energy_source = {
	type = "electric",
	usage_priority = "secondary-input",
}
oxyFuelFurnaceEntity.energy_usage = "9.68kW"
oxyFuelFurnaceEntity.module_slots = 0
oxyFuelFurnaceEntity.fluid_boxes_off_when_no_fluid_recipe = false
local pipePicture = gasFurnaceEntity.fluid_boxes[1].pipe_picture
local drawOrders = gasFurnaceEntity.fluid_boxes[1].secondary_draw_orders
oxyFuelFurnaceEntity.fluid_boxes = {
	{
		volume = 100,
		pipe_connections = {
			{
				direction = defines.direction.south,
				position = { -0.5, 0.5 },
			},
			{
				direction = defines.direction.west,
				position = { -0.5, 0.5 },
			},
			{
				direction = defines.direction.west,
				position = { -0.5, -0.5 },
			},
			{
				direction = defines.direction.north,
				position = { -0.5, -0.5 },
			},
		},
		production_type = "input",
		pipe_picture = pipePicture,
		pipe_covers = pipecoverspictures(),
		secondary_draw_orders = drawOrders,
	},
	{
		volume = 100,
		pipe_connections = {
			{
				direction = defines.direction.south,
				position = { 0.5, 0.5 },
			},
			{
				direction = defines.direction.east,
				position = { 0.5, 0.5 },
			},
			{
				direction = defines.direction.east,
				position = { 0.5, -0.5 },
			},
			{
				direction = defines.direction.north,
				position = { 0.5, -0.5 },
			},
		},
		production_type = "input",
		pipe_picture = pipePicture,
		pipe_covers = pipecoverspictures(),
		secondary_draw_orders = drawOrders,
	},
}
oxyFuelFurnaceEntity.factoriopedia_simulation = {
	init = [[
		local surface = game.surfaces[1]

		local entity = surface.create_entity{
			name = "oxy-fuel-furnace",
			position = {0,0},
			force = "player",
		}
		entity.set_recipe("oxy-fuel-iron-plate")

		local entityPosition = entity.position

		local function drawSprite(sprite, xOffset, yOffset, xScale, yScale, orientation)
			local spriteTarget = {x = entityPosition.x + xOffset, y = entityPosition.y + yOffset}
			local spriteOrientation = orientation ~= nil and orientation or 0

			rendering.draw_sprite{
		        	sprite = sprite,
			        surface = surface,
        			target = spriteTarget,
				x_scale = xScale,
	        		y_scale = yScale, 
				orientation = orientation
			}
		end

		local thrusterOxidizerSprite = "fluid/thruster-oxidizer"
		local thrusterFuelSprite = "fluid/thruster-fuel"
		local arrowSprite = "utility/fluid_indication_arrow"

		drawSprite(thrusterOxidizerSprite, -0.5, -0.5, 0.5, 0.5) -- North West
		drawSprite(thrusterOxidizerSprite, -0.5, 0.5, 0.5, 0.5)  -- South West

		drawSprite(thrusterFuelSprite, 0.5, -0.5, 0.5, 0.5) -- North East
		drawSprite(thrusterFuelSprite, 0.5, 0.5, 0.5, 0.5)  -- South East

		-- West Upper
		drawSprite(arrowSprite, -1, -0.6, 0.5, 0.5, 0.25) -- right
		drawSprite(arrowSprite, -1, -0.4, 0.5, 0.5, 0.75) -- left

		-- West Lower
		drawSprite(arrowSprite, -1, 0.4, 0.5, 0.5, 0.25) -- right
		drawSprite(arrowSprite, -1, 0.6, 0.5, 0.5, 0.75) -- left

		-- North West
		drawSprite(arrowSprite, -0.6,  -1, 0.5, 0.5, 0)   -- up
		drawSprite(arrowSprite, -0.4,  -1, 0.5, 0.5, 0.5)   -- down

		-- North East
		drawSprite(arrowSprite, 0.4,  -1, 0.5, 0.5, 0)   -- up
		drawSprite(arrowSprite, 0.6,  -1, 0.5, 0.5, 0.5)   -- down

		-- East Upper
		drawSprite(arrowSprite, 1, -0.6, 0.5, 0.5, 0.25) -- right
		drawSprite(arrowSprite, 1, -0.4, 0.5, 0.5, 0.75) -- left

		-- East Lower
		drawSprite(arrowSprite, 1, 0.4, 0.5, 0.5, 0.25) -- right
		drawSprite(arrowSprite, 1, 0.6, 0.5, 0.5, 0.75) -- left

		-- South West
		drawSprite(arrowSprite, -0.6,  1, 0.5, 0.5, 0)   -- up
		drawSprite(arrowSprite, -0.4,  1, 0.5, 0.5, 0.5)   -- down

		-- South East
		drawSprite(arrowSprite, 0.4,  1, 0.5, 0.5, 0)   -- up
		drawSprite(arrowSprite, 0.6,  1, 0.5, 0.5, 0.5)   -- down
	]],
}

local oxyFuelFurnaceItem = table.deepcopy(gasFurnaceItem)
oxyFuelFurnaceItem.name = "oxy-fuel-furnace"
oxyFuelFurnaceItem.localised_name = "Oxy-Fuel Furnace"
oxyFuelFurnaceItem.place_result = "oxy-fuel-furnace"

local oxyFuelFurnaceRecipe = table.deepcopy(gasFurnaceRecipe)
oxyFuelFurnaceRecipe.name = "oxy-fuel-furnace"
oxyFuelFurnaceRecipe.localised_name = "Oxy-Fuel Furnace"
oxyFuelFurnaceRecipe.ingredients = {
	{ type = "item", name = "pipe", amount = 4 },
	{ type = "item", name = "pump", amount = 2 },
	{ type = "item", name = "steel-furnace", amount = 1 },
}
oxyFuelFurnaceRecipe.results = { { type = "item", name = "oxy-fuel-furnace", amount = 1 } }
oxyFuelFurnaceRecipe.enabled = true

data:extend({
	{ type = "recipe-category", name = "oxy-fuel-smelting" },
	oxyFuelFurnaceEntity,
	oxyFuelFurnaceItem,
	oxyFuelFurnaceRecipe,
	{
		type = "recipe",
		name = "oxy-fuel-iron-plate",
		localised_name = "Iron Plate",
		category = "oxy-fuel-smelting",
		energy_required = 3.2,
		ingredients = {
			{ type = "item", name = "iron-ore", amount = 1 },
			{ type = "fluid", name = "thruster-fuel", amount = 3 },
			{ type = "fluid", name = "thruster-oxidizer", amount = 3 },
		},
		results = {
			{ type = "item", name = "iron-plate", amount = 1 },
		},
	},
	{
		type = "recipe",
		name = "oxy-fuel-copper-plate",
		localised_name = "Copper Plate",
		category = "oxy-fuel-smelting",
		energy_required = 3.2,
		ingredients = {
			{ type = "item", name = "copper-ore", amount = 1 },
			{ type = "fluid", name = "thruster-fuel", amount = 3 },
			{ type = "fluid", name = "thruster-oxidizer", amount = 3 },
		},
		results = {
			{ type = "item", name = "copper-plate", amount = 1 },
		},
	},
	{
		type = "recipe",
		name = "oxy-fuel-steel-plate",
		localised_name = "Steel Plate",
		category = "oxy-fuel-smelting",
		energy_required = 16,
		ingredients = {
			{ type = "item", name = "iron-plate", amount = 5 },
			{ type = "fluid", name = "thruster-fuel", amount = 15 },
			{ type = "fluid", name = "thruster-oxidizer", amount = 15 },
		},
		results = {
			{ type = "item", name = "steel-plate", amount = 1 },
		},
	},
	{
		type = "recipe",
		name = "oxy-fuel-stone-brick",
		localised_name = "Stone Brick",
		category = "oxy-fuel-smelting",
		energy_required = 3.2,
		ingredients = {
			{ type = "item", name = "stone", amount = 2 },
			{ type = "fluid", name = "thruster-fuel", amount = 3 },
			{ type = "fluid", name = "thruster-oxidizer", amount = 3 },
		},
		results = {
			{ type = "item", name = "stone-brick", amount = 1 },
		},
	},
})
