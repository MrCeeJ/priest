local addon, dark_addon = ...
local SB = dark_addon.rotation.spellbooks.paladin

local function combat()
    -- combat
end

local function resting()
    -- resting
end

dark_addon.rotation.register({
  class = dark_addon.rotation.classes.paladin,
  name = 'paladin',
  label = 'Bundled Paladin',
  combat = combat,
  resting = resting
})
