-- require("libs.rso-mod.resourceconfigs.vanilla")  -- vanilla ore/liquids (no enemies)
require("libs.rso-mod.resourceconfigs.vanilla_enemies")
require("libs.rso-mod.resourceconfigs.pylandblock")

function loadResourceConfig()

	local config={}

	--fillVanillaConfig(config)
	fillEnemies(config)
  fillPyLandBlockConfig(config)
  

	return config
end