-- Flashy spellsteal border for non-mages and/or enrage effects

hooksecurefunc("TargetFrame_UpdateAuras", function(s)
        for i = 1, MAX_TARGET_BUFFS do
                _, _, ic, _, dT = UnitBuff(s.unit, i)
                if(ic and (not s.maxBuffs or i<=s.maxBuffs)) then
                        fS=_G[s:GetName()..'Buff'..i..'Stealable']
                        if(UnitIsEnemy(PlayerFrame.unit, s.unit) and dT=='Magic') then
                                fS:Show()
                        else
                                fS:Hide()
                        end
                end
        end
end)