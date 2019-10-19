local addon, dark_addon = ...
local SB = dark_addon.rotation.spellbooks.warlock

local function combat()
    -- combat
end

local function resting()
    -- resting
end

dark_addon.rotation.register({
  class = dark_addon.rotation.classes.warlock,
  name = 'warlock',
  label = 'Bundled Warlock',
  combat = combat,
  resting = resting
})
