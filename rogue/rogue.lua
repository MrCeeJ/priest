local addon, dark_addon = ...
local SB = dark_addon.rotation.spellbooks.rogue

local function combat()
    -- combat
end

local function resting()
    -- resting
end

dark_addon.rotation.register({
  class = dark_addon.rotation.classes.rogue,
  name = 'rogue',
  label = 'Bundled Rogue',
  combat = combat,
  resting = resting
})
