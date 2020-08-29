RECIPE {
    type = "recipe",
    name = "atomizer-mk00",
    energy_required = 0.5,
    enabled = true,
    ingredients = {
        {"burner-washer", 1},
        {"pb-wrought-iron-plate", 35},
        {"electronic-circuit", 10},
    },
    results = {
        {"atomizer-mk00", 1}
    }
}

ITEM {
    type = "item",
    name = "atomizer-mk00",
    icon = "__PyLandBlock__/graphics/icons/atomizer-mk00.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-alienlife-buildings-mk00",
    order = "a",
    place_result = "atomizer-mk00",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "atomizer-mk00",
    icon = "__PyLandBlock__/graphics/icons/atomizer-mk00.png",
	icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "atomizer-mk00"},
    fast_replaceable_group = "atomizer",
    max_health = 100,
    corpse = "medium-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"speed","pollution"},
    crafting_categories = {"atomizer"},
    crafting_speed = 0.5,
    energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = 0.06,
    },
    energy_usage = "600kW",
    ingredient_count = 10,
    animation = {
        layers = {
            {
                filename = "__pyalienlifegraphics__/graphics/entity/atomizer/off.png",
                --priority = "high",
                width = 256,
                height = 256,
                --line_length = 1,
                frame_count = 1,
                --animation_speed = 2,
                shift = util.by_pixel(16, -16)
            },
            {
                filename = "__pyalienlifegraphics__/graphics/entity/atomizer/off-mask.png",
                --priority = "high",
                width = 256,
                height = 256,
                --line_length = 1,
                frame_count = 1,
                --animation_speed = 2,
                shift = util.by_pixel(16, -16),
                tint = {r = 1.0, g = 1.0, b = 0.0, a = 1.0}
            },
        }
    },
    working_visualisations = {
        {
            north_position = util.by_pixel(0, -16),
            west_position = util.by_pixel(0, -16),
            south_position = util.by_pixel(0, -16),
            east_position = util.by_pixel(0, -16),
            animation = {
                filename = "__pyalienlifegraphics__/graphics/entity/atomizer/on.png",
                priority = "high",
                frame_count = 90,
                line_length = 9,
                width = 224,
                height = 192,
                animation_speed = 0.5
            }
        },
    },
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", nil, {0.0, -0.96}, nil, nil),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {1.0, -4.0}}}
        },
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", nil, {0.0, -0.96}, nil, nil),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {-1.0, -4.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", nil, {0.0, -0.96}, nil, nil),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {1.0, 4.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", nil, {0.0, -0.96}, nil, nil),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-1.0, 4.0}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pyalienlifegraphics__/sounds/atomizer.ogg", volume = 1.0},
        idle_sound = {filename = "__pyalienlifegraphics__/sounds/atomizer.ogg", volume = 0.50},
        apparent_volume = 2.5
    }
}
