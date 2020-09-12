require("libs.rso-mod.prototypes.prototype_utils")

for _, spawner in pairs(data.raw["unit-spawner"]) do
  removeProbability(spawner)
end

for _, turret in pairs(data.raw.turret) do
  if turret.subgroup == "enemies" then
    removeProbability(turret)
  end
end