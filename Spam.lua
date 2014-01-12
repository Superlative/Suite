--Disable damage/healing spam in floating text

-- LoadAddOn("Blizzard_CombatText")

-- COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL"] = {var = nil, show = nil}
-- COMBAT_TEXT_TYPE_INFO["HEAL_CRIT"] = {var = nil, show = nil}
-- COMBAT_TEXT_TYPE_INFO["HEAL"] = {var = nil, show = nil}
-- COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL_ABSORB"] = {var = nil, show = nil}
-- COMBAT_TEXT_TYPE_INFO["HEAL_CRIT_ABSORB"] = {var = nil, show = nil}
-- COMBAT_TEXT_TYPE_INFO["HEAL_ABSORB"] = {var = nil, show = nil}

-- COMBAT_TEXT_TYPE_INFO["DAMAGE_CRIT"] = {var = nil, show = nil}
-- COMBAT_TEXT_TYPE_INFO["DAMAGE"] = {var = nil, show = nil}
-- COMBAT_TEXT_TYPE_INFO["SPELL_DAMAGE_CRIT"] = {var = nil, show = nil}
-- COMBAT_TEXT_TYPE_INFO["SPELL_DAMAGE"] = {var = nil, show = nil}

-- Removes Damage numbers on player portrait (very spammy)
PlayerHitIndicator:SetText(nil)
PlayerHitIndicator.SetText = function() end

PetHitIndicator:SetText(nil)
PetHitIndicator.SetText = function() end