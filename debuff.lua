local addon, dark_addon = ...

local UnitDebuff = dark_addon.environment.unit_debuff

local debuff = { }

function debuff:exists()
  local debuff, count, duration, expires, caster = UnitDebuff(self.unitID, self.spell, 'any')
  if debuff and (caster == 'player' or caster == 'pet') then
    return true
  end
  return false
end

function debuff:down()
  return not self.exists
end

function debuff:up()
  return self.exists
end

function debuff:any()
  local debuff, count, duration, expires, caster = UnitDebuff(self.unitID, self.spell, 'any')
  if debuff then
    return true
  end
  return false
end

function debuff:count()
  local debuff, count, duration, expires, caster = UnitDebuff(self.unitID, self.spell, 'any')
  if debuff and (caster == 'player' or caster == 'pet') then
    return count
  end
  return 0
end

function debuff:remains()
  local debuff, count, duration, expires, caster = UnitDebuff(self.unitID, self.spell, 'any')
  if debuff and (caster == 'player' or caster == 'pet') then
    return expires - GetTime()
  end
  return 0
end

function debuff:duration()
  local debuff, count, duration, expires, caster = UnitDebuff(self.unitID, self.spell, 'any')
  if debuff and (caster == 'player' or caster == 'pet') then
    return duration
  end
  return 0
end

function dark_addon.environment.conditions.debuff(unit)
  return setmetatable({
    unitID = unit.unitID
  }, {
    __index = function(t, k)
      if type(t.spell) == 'table' then
        t.spell = dark_addon.environment.selectrank(t.spell)
      end
      local result = debuff[k](t)
      dark_addon.console.debug(4, 'debuff', 'teal', t.unitID .. '.debuff(' .. tostring(t.spell) .. ').' .. k .. ' = ' .. dark_addon.format(result))
      return result
    end,
    __call = function(t, k)
      t.spell = k
      if type(t.spell) == 'table' then
        t.spell = dark_addon.environment.selectrank(t.spell)
      end
      if tonumber(t.spell) then
        t.spell = GetSpellInfo(t.spell)
      end
      return t
    end,
    __unm = function(t)
      if type(t.spell) == 'table' then
        t.spell = dark_addon.environment.selectrank(t.spell)
      end
      local result = debuff['exists'](t)
      dark_addon.console.debug(4, 'debuff', 'teal', t.unitID .. '.debuff(' .. tostring(t.spell) .. ').exists = ' .. dark_addon.format(result))
      return debuff['exists'](t)
    end
  })
end
