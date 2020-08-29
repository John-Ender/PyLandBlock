-- local Allrecipes = table.deepcopy(data.raw.recipe)

-- for r, Recipe in pairs(Allrecipes) do

-- if Recipe.subgroup == "py-void-liquid" then

	-- --log(Recipe.name)
	
-- end

-- end

-- log(serpent.block(data.raw.recipe["angelsore5-crushed-smelting"]))

require("libs.rso-mod.prototypes.prototype_utils")

for _, spawner in pairs(data.raw["unit-spawner"]) do
  removeProbability(spawner)
end

for _, turret in pairs(data.raw.turret) do
  if turret.subgroup == "enemies" then
    removeProbability(turret)
  end
end