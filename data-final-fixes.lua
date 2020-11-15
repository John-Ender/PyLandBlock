require("libs.rso-mod.prototypes.prototype_utils")
local functions = require("__pycoalprocessing__/prototypes/functions/functions")


for _, spawner in pairs(data.raw["unit-spawner"]) do
  removeProbability(spawner)
end

for _, turret in pairs(data.raw.turret) do
  if turret.subgroup == "enemies" then
    removeProbability(turret)
  end
end

-- -----------------------------------------------------------------------------------------------------------------------------
-- Update uranium from seawater to allow for productivity modules
-- -----------------------------------------------------------------------------------------------------------------------------
local recipes_list =
	{
		"sodium-acetate",
		"ethane",
		"dichloroethane",
		"fecl2",
		"fecl3",
		"ethylenediamine",
		"nylon-rope",
		"nylon-rope-coated",
		"nylon-rope-uranyl-soaked",
		"uranyl-nitrate",
	}

--adding to module limitation list
functions.productivity(recipes_list)