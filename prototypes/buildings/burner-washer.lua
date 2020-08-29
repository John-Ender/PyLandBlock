
RECIPE {
    type = "recipe",
    name = "burner-washer",
    energy_required = 4,
    enabled = true,
    ingredients = {
        {"pb-wrought-iron-plate", 10},
        {"wrought-iron-pipe", 25},
        {"stone-brick", 30}
    },
    results = {
        {"burner-washer", 1}
    }
}

ITEM {
    type = "item",
    name = "burner-washer",
    icon = "__PyLandBlock__/graphics/icons/washer-mk00.png",
    icon_size = 64,
    flags = {},
    subgroup = "coal-processing",
    order = "z2",
    place_result = "burner-washer",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "burner-washer",
    icon = "__PyLandBlock__/graphics/icons/washer-mk00.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "burner-washer"},
    fast_replaceable_group = "washer",
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.0, -3.0}, {3.0, 3.0}},
    selection_box = {{-3.1, -3.1}, {3.1, 3.1}},
    module_specification = {
        module_slots = 0
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"washer"},
    crafting_speed = 0.5,
    energy_source =
    {
      type = "fluid",
      effectivity = 1,
      emissions = 1,
	  fluid_box =
		{
		base_area = 1,
		height = 2,
		base_level = -1,
		pipe_covers = pipecoverspictures(),
		pipe_connections =
			{
			{type = "input-output", position = {-3.5,0.5}},
			{type = "input-output", position = {3.5, 0.5} }
			},
		filter = "steam",
		production_type = "input-output",
		},
		scale_fluid_usage = true,
    },
    energy_usage = "100kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/washer/washer.png",
        width = 204,
        height = 204,
        frame_count = 80,
        line_length = 10,
        animation_speed = 0.9,
        shift = {0.17, -0.17}
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", {1.17, 2.78}, {-0.05, -0.8}, nil, nil, pipes2),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.5, 3.5}}}
        },
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", nil, {-0.05, -0.8}, nil, nil, pipes),
            base_level = 1,
            pipe_connections = {{position = {0.5, -3.5}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/washer.ogg", volume = 1.8},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/washer.ogg", volume = 1.5},
        apparent_volume = 1.8
    }
}
