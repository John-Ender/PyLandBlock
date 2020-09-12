require "util"
require ('libs/rso-mod/rso-mod')

local crashedshipparts =
		{
      "crash-site-spaceship-wreck-big-1",
      "crash-site-spaceship-wreck-big-2",
      "crash-site-spaceship-wreck-medium-1",
      "crash-site-spaceship-wreck-medium-2",
      "crash-site-spaceship-wreck-medium-3"
		}

-- -----------------------------------------------------------------------------------------------------------------------------
-- Game Init
-- -----------------------------------------------------------------------------------------------------------------------------
script.on_init(function(event)

  -- ---------------------------------------------------------------------------------------------------------------------------
  -- RSO Initialization
  -- ---------------------------------------------------------------------------------------------------------------------------
  init()

  -- ---------------------------------------------------------------------------------------------------------------------------
  -- Put items in player inventory
  -- ---------------------------------------------------------------------------------------------------------------------------
  local created_items = remote.call("freeplay", "get_created_items")
  
  created_items["py-construction-robot-01"] = 20
  created_items["personal-roboport-equipment"] = 2
  created_items["battery-equipment"] = 2
  created_items["solar-panel-equipment"] = 13
  created_items["modular-armor"] = 1
  created_items["stone-furnace"] = nil
  created_items["burner-mining-drill"] = nil
  created_items["wood"] = nil

  remote.call("freeplay", "set_created_items", created_items)
  
  -- ---------------------------------------------------------------------------------------------------------------------------
  -- Technology unlocked at start:
  -- ---------------------------------------------------------------------------------------------------------------------------
  
  game.forces['player'].technologies['automation'].researched = true
  game.forces['player'].technologies['logistics'].researched = true
  game.forces['player'].technologies['steel-processing'].researched = true


  -- ---------------------------------------------------------------------------------------------------------------------------
  -- Place extra starting wreckage for starting iron and copper 
  -- ---------------------------------------------------------------------------------------------------------------------------
  
  -- Place wreckage with sinkhole and pyvent for map start
  local cs = game.surfaces["nauvis"].create_entity{name= "crash-site-spaceship-wreck-big-2", position={3,3}, force='neutral'}
  cs.insert({name="py-sinkhole", count=2})
  cs.insert({name="py-gas-vent", count=2})
  
  local cs = game.surfaces["nauvis"].create_entity{name= "crash-site-spaceship-wreck-medium-2", position={7,7}, force='neutral'}
  cs.insert({name="burner-quenching-tower", count=1})
  
   -- Place some other starting wreckage
  local shippieces = math.random(12,14)

  for a=1,shippieces do

    local pickedpiece = crashedshipparts[math.random(1,5)]

    local x = math.random(-25,25)
    local y = math.random(-25,25)

    local cs = game.surfaces["nauvis"].create_entity{name=pickedpiece, position={x,y}, force='neutral'}

  end
  
  -- Find the placed wreckage from the cutscene and modify the wreckage inventory
  local wreckage = game.surfaces["nauvis"].find_entities_filtered{position={x=0, y=0}, radius=32, name=crashedshipparts, limit=20}
  local count = 0
  
  for _, container in pairs(wreckage) do
    count = count + 1
    container.remove_item({name = "iron-plate", count=100})
    
    if container.name == "crash-site-spaceship-wreck-big-1" or container.name == "crash-site-spaceship-wreck-big-2" then
    	container.insert({name = "scrap-iron", count = 500})
      container.insert({name = "scrap-copper", count = 500})
    else
      if count % 2 == 0 then
        container.insert({name = "scrap-iron", count = 500})
      else 
        container.insert({name = "scrap-copper", count = 500})
      end    
    end
  end
  
end)


script.on_event(defines.events.on_player_created, function(event)
  -- Remove items the other players spawn with in multiplayer.
  local player = game.players[event.player_index]
  player.remove_item({name="burner-mining-drill", count=9})
  player.remove_item({name="wood", count=499})
end)

local loot_table_fuelrod =
	{
		'fuelrod-mk01',
		'fuelrod-mk02',
		'fuelrod-mk03',
		'fuelrod-mk04',
		'fuelrod-mk05'
	}

local loot_table_plates =
	{
		'iron-plate',
		'copper-plate',
		'duralumin',
		'steel-plate',
		'pb-wrought-iron-plate',
		'chromium',
		'super-steel',
		'landfill'
	}

local loot_table_basic_mats =
	{
		'stone',
		'wood',
		'stone-brick',
		'iron-ore',
		'ore-aluminium',
		'ore-nickel',
		'ore-quartz',
		'ore-zinc',
		'ore-titanium',
		'ore-chromium',
		'raw-coal'
	}
  
-- -----------------------------------------------------------------------------------------------------------------------------
-- Generate Chunck
-- -----------------------------------------------------------------------------------------------------------------------------
script.on_event(defines.events.on_chunk_generated, function(event)

  -- ---------------------------------------------------------------------------------------------------------------------------
  -- RSO Chunk Generation
  -- ---------------------------------------------------------------------------------------------------------------------------
  localGenerateChunk(event)

  -- ---------------------------------------------------------------------------------------------------------------------------
  -- Clean up starting area cliffs
  -- ---------------------------------------------------------------------------------------------------------------------------
	local mid_x = (event.area.left_top.x + event.area.right_bottom.x) / 2
	local mid_y = (event.area.left_top.y + event.area.right_bottom.y) / 2
  
	if util.distance({x=0, y=0}, {x=mid_x, y=mid_y}) <= 500 then
    
    local cliffs = event.surface.find_entities_filtered({area=event.area, name='cliff'})
    
    for _,c in pairs(cliffs) do
      c.destroy()
    end
	end

  local tx = event.area.left_top.x
  local ty = event.area.left_top.y
  local bx = event.area.right_bottom.x
  local by = event.area.right_bottom.y

  -- -----------------------------------------------------------------------------------------------------------------------------
  -- Place ship parts in chunk
  -- -----------------------------------------------------------------------------------------------------------------------------

  local RandChance = math.random(0,240)

  if RandChance == 6 then
    local ship = game.surfaces['nauvis'].create_entity{name = crashedshipparts[math.random(1,3)],
                 position={math.random(tx+3,bx-3),math.random(ty+3,by-3)}, force=game.players[1].force}
    local loot_rand_pick = math.random(1,25) 
    if loot_rand_pick > 20 and loot_rand_pick <= 25 then
      local rand = math.random(1,5)
      ship.insert({name = loot_table_fuelrod[rand], count = math.random(1,6)})
    elseif loot_rand_pick > 10 and loot_rand_pick < 20 then
      local rand = math.random(1,8)
      ship.insert({name = loot_table_plates[rand], count = math.random(25,100)})
    elseif loot_rand_pick > 0 and loot_rand_pick < 10 then
      local rand = math.random(1,11)
      ship.insert({name = loot_table_basic_mats[rand], count = math.random(100,500)})
    end
  end
end)
