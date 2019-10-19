local addon, dark_addon = ...
local SB = dark_addon.rotation.spellbooks.warrior

local function combat()
    -- combat
end

local function resting()
    -- resting
end

dark_addon.rotation.register({
  class = dark_addon.rotation.classes.warrior,
  name = 'warrior',
  label = 'Bundled Warrior',
  combat = combat,
  resting = resting
})
