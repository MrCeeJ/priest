local addon, dark_addon = ...
local SB = dark_addon.rotation.spellbooks.mage

local function combat()
  if target.alive and target.enemy then
    if -spell(SB.Fireblast) == 0 then
      return cast(SB.Fireblast)
    end
    return cast(SB.Fireball)
  end
end

local function resting()
    if not -player.buff(SB.ArcaneIntellect) then
      return cast(SB.ArcaneIntellect, player)
    end
end

dark_addon.rotation.register({
  class = dark_addon.rotation.classes.mage,
  name = 'mage',
  label = 'Bundled Mage',
  combat = combat,
  resting = resting
})
