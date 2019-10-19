local addon, dark_addon = ...
local SB = dark_addon.rotation.spellbooks.druid

local function combat()
    -- combat
end

local function resting()
    -- resting
end

dark_addon.rotation.register({
  class = dark_addon.rotation.classes.druid,
  name = 'druid',
  label = 'Bundled Druid',
  combat = combat,
  resting = resting
})
