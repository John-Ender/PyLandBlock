
--buildings--
require('prototypes/buildings/atomizer-mk00')
require('prototypes/buildings/automated-screener-mk00')
require('prototypes/buildings/basic-ddc')
require('prototypes/buildings/bqt')
require('prototypes/buildings/burner-soil-extractor')
require('prototypes/buildings/burner-washer')
require('prototypes/buildings/burner-wpu')
require('prototypes/buildings/compost-plant-mk00')
require('prototypes/buildings/early-copper-mine')
require('prototypes/buildings/early-iron-mine')
require('prototypes/buildings/fish-farm-mk00')
require('prototypes/buildings/fwf-mk00')
require('prototypes/buildings/slaughterhouse-mk00')
require('prototypes/buildings/seaweed-crop-mk00')


require("functions/functions")
require("prototypes/itemgroups")
require("prototypes/recipe-categories")
require("prototypes/technology")
require("prototypes/item")
require("prototypes/fluids")
require("prototypes/entity")

-- -----------------------------------------------------------------------------------------------------------------------------
-- Recipes
-- -----------------------------------------------------------------------------------------------------------------------------
require("prototypes/recipes/recipes")
require("prototypes/recipes/recipes-uranium")


-- -----------------------------------------------------------------------------------------------------------------------------
-- Set the PyCoalProcessing setting to false regardless of user setting to avoid crash
-- ----------------------------------------------------------------------------------------------------------------------------
if mods['pycoalprocessing'] and settings.startup['ore-gen'] then 
  settings.startup['ore-gen'].value = false;
end

-- -----------------------------------------------------------------------------------------------------------------------------
-- Modify the map gen presets for Py Land Block
-- -----------------------------------------------------------------------------------------------------------------------------
data:extend(
{
  {
    type = "map-gen-presets",
    name = "default",
    ['default'] = {
      order = '-',
      default = true,
    },
    ['py-land-block'] = {
      order = 'a',
      basic_settings =
      {
        terrain_segmentation = 0.5,
        starting_area = 3,
        autoplace_controls = {
          ["trees"] = { frequency = 1, size = 1.5}
        },
      },
      advanced_settings =
      {
        pollution = {
          enabled = false,
        },
        difficulty_settings =
        {
          research_queue_setting = 'always',
        },
        enemy_expansion = {
          enabled = false
        },
        enemy_evolution = {
          enabled = true,
          time_factor = 0,
          destroy_factor = 0.00300,
          pollution_factor = 0,
        }
      }
    }
  }
})
