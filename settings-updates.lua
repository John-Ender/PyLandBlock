-- Update the PyCoalProcessing ore-gen setting to be hidden
if mods['pycoalprocessing'] then 
  data:extend({
    {
      type = "bool-setting",
      name = "ore-gen",
      setting_type = "startup",
      default_value = false,
      order = "e",
      hidden = true,
    },
  })
end