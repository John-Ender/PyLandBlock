
local settingDescription = {
   {
      name = "rso-vanilla-biter-generation",
      value = false,
   },
   {
      name = "rso-biter-generation",
      value = true,
   },
   {
      name = "rso-use-donuts",
      value = false,
   },   
   {
      name = "rso-remove-trees",
      value = false,
   },
   {
      name = "rso-region-size",
      value = 8,
   },
   {
      name = "rso-resource-chance",
      value = 0.2,
   },
   {
      name = "rso-enemy-chance",
      value = 0.25,
   },
   {
      name = "rso-enemy-base-size",
      value = 1.0,
   },   
   {
      name = "rso-starting-richness-mult",
      value = 1.0,
   },
   {
      name = "rso-global-richness-mult",
      value = 1.0,
   },
   {
      name = "rso-global-size-mult",
      value = 1.0,
   },
   {
      name = "rso-infinite-ores-in-start-area",
      value = false,
   },   
   {
      name = "rso-infinite-ore-threshold",
      value = 0.7,
   },
   {
      name = "rso-reveal-spawned-resources",
      value = false,
   },
   {
      name = "rso-multi-resource-active",
      value = true,
   },   
   {
      name = "rso-distance-exponent",
      value = 0.6,
   },
   {
      name = "rso-fluid-distance-exponent",
      value = 0.6,
   },
   {
      name = "rso-size-exponent",
      value = 0.0,
   },
   {
   
      name = "rso-oil-in-start-area",
      value = true,
   },
   {
      name = "rso-ore-in-start-area",
      value = true,
   },   
}

function rsoSettings()
  local set = {}
  for _, item in ipairs(settingDescription) do set[item.name] = item end
  return set
end

