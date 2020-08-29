function fillPyLandBlockConfig(config)

  starterOres = {
    'iron-rock',
    'copper-rock',
  }

  ores = {
    'uranium-rock',
    'zinc-rock',
    'aluminium-rock',
    'chromium-rock',
    'coal-rock',
    'lead-rock',
    'nexelit-rock',
    'nickel-rock',
    'phosphate-rock-02',
    'quartz-rock',
    'salt-rock',
    'tin-rock',
    'titanium-rock',
    'volcanic-pipe',
    'regolites',
    'rare-earth-bolide',
    'phosphate-rock',
  }

  fluids = {
    'oil-mk01',
    'oil-mk02',
    'oil-mk03',
    'oil-mk04',
    'sulfur-patch',
    'tar-patch'
  }

  for _, ore in ipairs(starterOres) do
    config[ore] = {
      type="resource-liquid",
      minimum_amount=500000,
      allotment=60,
      spawns_per_region={min=1, max=1},
      richness={min=450000, max=500000}, -- richness per resource spawn
      size={min=1, max=1},
      useOreScaling = true,
      starting={richness=500000, size=1, probability=1}
    }
  end
  
  for _, ore in ipairs(ores) do
    config[ore] = {
      type="resource-liquid",
      minimum_amount=500000,
      allotment=60,
      spawns_per_region={min=1, max=1},
      richness={min=450000, max=500000}, -- richness per resource spawn
      size={min=1, max=1},
      useOreScaling = true,
    }
  end

  for _, ore in ipairs(fluids) do
    config[ore] = {
      type="resource-liquid",
      minimum_amount=500000,
      allotment=60,
      spawns_per_region={min=1, max=1},
      richness={min=950000, max=1000000}, -- richness per resource spawn
      size={min=2, max=3},
      useOreScaling = true,
    }
  end 
end
