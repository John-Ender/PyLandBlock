local fun = require("functions/functions")

--tailings recipes

data.raw.item["landfill"].stack_size = 1000

data.raw.recipe["landfill"].ingredients={{type="item", name="stone", amount=1},{type="item", name="sand", amount=2}}
data.raw.recipe["landfill"].results = {{type="item", name="landfill", amount=2}}

data.raw.recipe["tailings-copper-iron"].ingredients[1].amount=50

data.raw.recipe["tailings-borax-niobium"].ingredients[1].amount=50

for k, result in ipairs(data.raw.recipe["tailings-copper-iron"].results) do

	--log(data.raw.recipe["tailings-copper-iron"].results[k].name)

	if data.raw.recipe["tailings-copper-iron"].results[k].name == "copper-ore" then

		data.raw.recipe["tailings-copper-iron"].results[k].amount = 4
		data.raw.recipe["tailings-copper-iron"].results[k].probability = 1

	end

	if data.raw.recipe["tailings-copper-iron"].results[k].name == "iron-ore" then

		data.raw.recipe["tailings-copper-iron"].results[k].amount = 4
		data.raw.recipe["tailings-copper-iron"].results[k].probability = .75

	end

end

for k, result in ipairs(data.raw.recipe["tailings-borax-niobium"].results) do

	--log(data.raw.recipe["tailings-copper-iron"].results[k].name)

	if data.raw.recipe["tailings-borax-niobium"].results[k].name == "niobium-ore" then

		data.raw.recipe["tailings-borax-niobium"].results[k].amount = 10
		data.raw.recipe["tailings-borax-niobium"].results[k].probability = 1

	end

	if data.raw.recipe["tailings-borax-niobium"].results[k].name == "raw-borax" then

		data.raw.recipe["tailings-borax-niobium"].results[k].amount = 10
		data.raw.recipe["tailings-borax-niobium"].results[k].probability = 1

	end

end

data:extend(
{
	{
	type = "recipe",
	name = "tailings-lead-chromium"
	},
	{
	type = "recipe",
    name = "tailings-tin-alum",
    localised_name = {"recipe-name.tailings-ore-extraction", {"item-name.ore-tin"}, {"item-name.ore-aluminium"}, {"fluid-name.tar"}},
    category = "quenching-tower",
    enabled = true,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "tar", amount = 200},
        {type = "fluid", name = "dirty-water", amount = 500}
    },
    results = {
        {type = "fluid", name = "dirty-water", amount = 100},
        {type = "fluid", name = "flue-gas", amount = 300},
        {type = "fluid", name = "water-saline", amount = 200},
		{type = "item", name = "ore-tin", amount = 10},
		{type = "item", name = "ore-aluminium", amount = 10}
    },
    icons = {
		{icon = "__pycoalprocessinggraphics__/graphics/icons/dirty-water.png", icon_size = 32, scale = 2},
		{icon = '__pyraworesgraphics__/graphics/icons/mip/ore-aluminium.png', icon_size = 64, size = 0.25, shift = {-15,15}},
		{icon = '__pyraworesgraphics__/graphics/icons/mip/ore-tin.png', icon_size = 64, size = 0.25, shift = {15,15}}
    },
    icon_size = 64,
    subgroup = "py-quenching-ores",
    order = "tailings-a"
	}

}
)

local Recipe = data.raw.recipe

local tailingsrecipe = table.deepcopy(data.raw.recipe["tailings-copper-iron"])
tailingsrecipe.name = nil

Recipe["tailings-lead-chromium"] = tailingsrecipe
Recipe["tailings-lead-chromium"].name = "tailings-lead-chromium"
Recipe["tailings-lead-chromium"].results[4].name = "ore-lead"
Recipe["tailings-lead-chromium"].results[5].name = "ore-chromium"
Recipe["tailings-lead-chromium"].localised_name = "Lead and Chromium from Tar"
Recipe['tailings-lead-chromium'].icons = {
	{icon = "__pycoalprocessinggraphics__/graphics/icons/dirty-water.png", icon_size = 32, scale = 2},
	{icon = '__pyraworesgraphics__/graphics/icons/mip/ore-lead.png', icon_size = 64, size = 0.25, shift = {-15,15}},
	{icon = '__pyraworesgraphics__/graphics/icons/mip/ore-chromium.png', icon_size = 64, size = 0.25, shift = {15,15}}
}
Recipe['tailings-lead-chromium'].icon_size = 64

data.raw.recipe["quenching-tower"].ingredients[4] = nil

--adjust void entities

data.raw["furnace"]["py-sinkhole"].crafting_speed = 10
data.raw["furnace"]["py-gas-vent"].crafting_speed = 10

--new recipes
data:extend
(
{
	{
	type = "recipe",
	name = "soil-to-stone",
	category = "washer",
    enabled = true,
    energy_required = 4,
	ingredients =
		{
			{type = "item", name = "soil", amount = 24},
			{type = "fluid", name = "water", amount = 400}
		},
	results =
		{
			{type = "item", name = "stone", amount = 10},
			{type = "fluid", name = "dirty-water", amount = 50}
		},
	main_product = "stone",
	icon = "__pycoalprocessinggraphics__/graphics/icons/soil-washer.png",
    icon_size = 32,
    subgroup = "py-washer",
    order = "c"
	},
	{
	type = "recipe",
	name = "coaldust-to-diamond",
	category = "hpf",
	enabled = false,
	energy_required = 10,
	ingredients =
		{
			{
			type = "item", name = "coal-dust", amount = 20
			}
		},
	results =
		{
			{
			type = "item", name = "kimberlite-rock", amount = 1
			}
		},
	icon = "__pyfusionenergygraphics__/graphics/icons/ores/kimberlite-rock.png",
	icon_size = 32,
	subgroup = "py-fusion-recipes",
    order = "h"
	},

	{
	type = "recipe",
	name = "sand-quartz-sifting",
	category = "screener",
	enabled = true,
	ingredients =
		{
			{type = "item", name = "sand", amount = 10}
		},
	results =
		{
			{type = "item", name = "ore-quartz", amount = 2}
		},
	main_product = "ore-quartz",
	icon = "__pyraworesgraphics__/graphics/icons/ores/ore-quartz.png",
	icon_size = 32,
	subgroup = "py-washer",
	order = "c",
	energy_required = 4
	},
	--tit ore from rich dust in classifer
	{
	type = "recipe",
	name = "titanium-from-rich-dust",
	category = "classifier",
	enabled = false,
	ingredients =
		{
			{type = "item", name = "rich-dust", amount = 10}
		},
	results =
		{
			{type = "item", name = "ore-titanium", amount = 2}
		},
	main_product = "ore-titanium",
	icon = "__pyraworesgraphics__/graphics/icons/ores/ore-titanium.png",
	icon_size = 32,
	subgroup = "py-items-class",
	order = "b"
	},
	{
	type = "recipe",
	name = "wrought-iron",
	category = "smelting",
	enabled = true,
	ingredients =
		{
			{type = "item", name = "iron-ore", amount = 2}
		},
	results =
		{
			{type = "item", name = "pb-wrought-iron-plate", amount = 1}
		},
	main_product = "pb-wrought-iron-plate",
	icon = "__base__/graphics/icons/iron-plate.png",
	icon_size = 32,
	energy_required = 3,
	--order = "a[smelting]",
	},
	{
	type = "recipe",
	name = "scrap-to-wrought-iron",
	category = "smelting",
	energy_required = 2,
	ingredients =
		{
			{"scrap-iron", 10}
		},
	result = "pb-wrought-iron-plate"
	},
	--[[
	{
		type = "recipe",
		name = "scrap-to-wrought-iron",
		category = "smelting",
		energy_required = 2,
		ingredients =
			{
				{"scrap-iron", 1}
			},
		result = "iron-oxide"
	},
	]]--
	{
	type = "recipe",
	name = "scrap-to-copper",
	category = "smelting",
	energy_required = 2,
	ingredients =
		{
			{name = "scrap-copper", amount = 5}
		},
	results = {
		{name = "copper-plate", amount = 1}
	}
	},
	{
		type = "recipe",
		name = "log-to-moss",
		category = "wpu",
		energy_required = 10,
		ingredients =
			{
				{name = "log", amount = 4}
			},
		results = {
			{name = "moss", amount = 1}
		}
	},
	{
		type = "recipe",
		name = "sap-from-seamoss",
		category = "distilator",
		energy_required = 10,
		ingredients =
			{
				{name = "seaweed", amount = 10},
				{name = "moss", amount = 8},
				{name = "wood", amount = 5}
			},
		results = {
			{name = "saps", amount = 2}
		}
	},

	--new item recipes:
	{
	type = "recipe",
	name = "wrought-iron-pipe",
	energy_required = 1,
	enabled = true,
	ingredients =
		{
			{"pb-wrought-iron-plate", 1}
		},
	results =
		{
			{"wrought-iron-pipe", 1}
		},
	main_product = "wrought-iron-pipe"
	},
	{
    type = "recipe",
    name = "wrought-iron-gear-wheel",
    ingredients = {{"pb-wrought-iron-plate", 2}},
    result = "wrought-iron-gear-wheel"
	},

	--Wrought iron to regulear
	{
	type = "recipe",
	name = "wrought-to-iron",
	category = "smelting",
	ingredients =
		{
			{"pb-wrought-iron-plate", 5}
		},
	result = "iron-plate"
	},
	{
	type = "recipe",
	name = "iron-to-wrought",
	ingredients =
		{
			{"iron-plate", 1}
		},
	result = "pb-wrought-iron-plate",
	main_product = "pb-wrought-iron-plate",
	result_count = 5
	},

	--make phosphorous acid: not used atm
	--[[
	{
	type = "recipe",
	name = "phosphorus-acid",
	ingredients =
		{
			{type = "fluid", name = "phosphorus-tricloride", amount = 20},
			{type = "fluid", name = "water", amount = 60}
		},
	results =
		{
			{type = "fluid", name = "phosphorus-acid", amount = 20},
			{type = "fluid", name = "hydrogen-chloride", amount = 60},
		},
	main_product = "phosphorus-acid"
	},
	]]--
  
}
)



RECIPE {
    type = "recipe",
    name = "log0",
    category = "fwf-basic",
    enabled = true,
    energy_required = 60,
    ingredients = {},
    results = {
        {type = "item", name = "log", amount = 3}
    },
    icon = "__pycoalprocessinggraphics__/graphics/icons/log.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "c6"
}

data.raw.recipe["iron-plate"].enabled = false

RECIPE("bio-reactor"):replace_ingredient('super-alloy','boron')
RECIPE("bio-reactor"):replace_ingredient('gasturbinemk02','gasturbinemk01')


--modify pyro recipes to give byproduct ores
--copper gives moly
fun.results_replacer(data.raw.recipe["grade-1-copper-crush"],"stone","molybdenum-ore")
fun.results_replacer(data.raw.recipe["copper-rejects-recrush"],"gravel","molybdenum-ore")

RECIPE {
    type = 'recipe',
    name = 'electronic-circuit-initial',
    category = 'handcrafting',
    enabled = true,
    energy_required = 2,
    ingredients = {
        {type = 'item', name = 'copper-plate', amount = 10},
        {type = 'item', name = 'copper-cable', amount = 10},
        {type = 'item', name = 'wood', amount = 5},
    },
    results = {
        {type = 'item', name = 'electronic-circuit', amount = 2}
    },
    subgroup = 'py-hightech-tier-1',
    order = 'aaa'
	}

RECIPE {
    type = 'recipe',
    name = 'fish-start-01',
    category = 'fish-farm',
    enabled = true,
    energy_required = 100,
    ingredients = {
        {type = 'item', name = 'seaweed', amount = 5},
        {type = 'fluid', name = 'water', amount = 50},
    },
    results = {
        {type = 'item', name = 'fish', amount = 3},
    },
    main_product = "fish",
    subgroup = 'py-alienlife-fish',
    order = 'a',
	}

RECIPE {
		type = 'recipe',
		name = 'fish-start-02',
		category = 'fish-farm',
		enabled = true,
		energy_required = 85,
		ingredients = {
			{type = 'item', name = 'seaweed', amount = 5},
			{type = 'fluid', name = 'water-saline', amount = 50},
		},
		results = {
			{type = 'item', name = 'fish', amount = 5},
			{type = 'fluid', name = 'waste-water', amount = 50},
		},
		main_product = "fish",
		subgroup = 'py-alienlife-fish',
		order = 'a',
		}

RECIPE {
    type = "recipe",
    name = "coal-gas-from-seaweed",
    category = "distilator",
    enabled = true,
    energy_required = 3,
    ingredients = {
        {type = "item", name = "seaweed", amount = 10}
    },
    results = {
        {type = "fluid", name = "coal-gas", amount = 5},
        {type = "fluid", name = "tar", amount = 5},
        {type = "item", name = "raw-coal", amount = 4},
        {type = "item", name = "raw-coal", amount = 2, probability = .2}
    },
    main_product = "coal-gas",
    icon = "__pylandblock__/graphics/icons/coalgas-from-seaweed.png",
    icon_size = 64,
    subgroup = "py-syngas",
    order = "f"
}

RECIPE {
    type = "recipe",
    name = "biosample",
    category = "biofactory",
    enabled = false,
    energy_required = 5,
    ingredients = {
		{type = "item", name = "bio-container", amount = 10},
		{type = "item", name = "seaweed", amount = 4},
		{type = "item", name = "moss", amount = 2},
		{type = 'fluid', name = 'waste-water', amount = 20},
		{type = 'fluid', name = 'phytoplankton', amount = 25},
		{type = 'fluid', name = 'zogna-bacteria', amount = 5},
    },
    results = {
        {type = "item", name = "bio-sample", amount = 10},

    },
    main_product = "bio-sample",
    icon = "__pyalienlifegraphics__/graphics/icons/biosample.png",
    icon_size = 64,
    subgroup = "py-alienlife-genetics",
    order = "a"
}:add_unlock('xenobiology')

-- -----------------------------------------------------------------------------------------------------------------------------
--Nickel from clay
-- -----------------------------------------------------------------------------------------------------------------------------
RECIPE {
    type = "recipe",
    name = "nickel-alum-from-clay",
    category = "hpf",
    enabled = true,
    energy_required = 6,
    ingredients =
      {
        {type = "item", name = "clay", amount = 6},
        {type = "fluid", name = "sulfuric-acid", amount = 20}
      },
    results =
      {
        {type = "item", name = "ore-nickel", amount = 2},
        {type = "item", name = "ore-aluminium", amount = 1, probability = 0.2}
      },
    main_product = "ore-nickel",
    subgroup = "py-quenching-ores",
    order = "tailings-e"
}:add_unlock('sulfur-processing')

-- -----------------------------------------------------------------------------------------------------------------------------
-- New fluids for ree from ash
-- -----------------------------------------------------------------------------------------------------------------------------
RECIPE {
    type = "recipe",
    name = "propene-to-butanol",
    ingredients =
      {
        {type = "fluid", name = "propene", amount = 50},
        {type = "fluid", name = "hydrogen", amount = 50},
        {type = "fluid", name = "carbon-dioxide", amount = 25}
      },
    results =
      {
        {type = "fluid", name = "butanol", amount = 50}
      },
    main_product = "butanol",
    category = "electrolyzer"
}:add_unlock('uranium-mk01')

RECIPE {
    type = "recipe",
    name = "phosphorus-tricloride",
    ingredients =
      {
        {type = "item", name = "powdered-phosphate-rock", amount = 10},
        {type = "fluid", name = "chlorine", amount = 60}
      },
    results =
      {
        {type = "fluid", name = "phosphorus-tricloride", amount = 50}
      },
    main_product = "phosphorus-tricloride",
    category = "electrolyzer"
}:add_unlock('uranium-mk01')
  
RECIPE {
    type = "recipe",
    name = "phosphoryl-chloride",
    ingredients =
      {
        {type = "fluid", name = "phosphorus-tricloride", amount = 20},
        {type = "fluid", name = "oxygen", amount = 10}
      },
    results =
      {
        {type = "fluid", name = "phosphoryl-chloride", amount = 40}
      },
    main_product = "phosphoryl-chloride",
    category = "electrolyzer"
}:add_unlock('uranium-mk01')

RECIPE {
    type = "recipe",
    name = "tributyl-phosphate",
    ingredients =
      {
        {type = "fluid", name = "phosphoryl-chloride", amount = 10},
        {type = "fluid", name = "butanol", amount = 30}
      },
    results =
      {
        {type = "fluid", name = "tributyl-phosphate", amount = 10},
        {type = "fluid", name = "hydrogen-chloride", amount = 30},
      },
    main_product = "tributyl-phosphate",
    category = "electrolyzer"
}:add_unlock('uranium-mk01')
  
  
RECIPE {
    type = "recipe",
    name = "ree-from-ash",
    ingredients =
      {
        {type = "fluid", name = "tributyl-phosphate", amount = 20},
        {type = "item", name = "ash", amount = 25}
      },
    results =
      {
        {type = "item", name = "rare-earth-ore", amount = 5},
      },
    main_product = "rare-earth-ore",
    category = "electrolyzer"
}:add_unlock('rare-earth-tech')
