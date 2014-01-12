-- Blue CastBar

CastingBarFrame:ClearAllPoints()
CastingBarFrame:SetScale(1.1) -- Change scale of cast bar
CastingBarFrame:SetPoint("CENTER", 0, -350) -- Change position of castbar
CastingBarFrame:SetStatusBarColor(0,0.45,0.9) -- Change color of castbar (hex code)
CastingBarFrame.SetPoint = function() end

TargetFrameSpellBar:SetStatusBarColor(0,0.45,0.9) -- Target castbar color 
TargetFrameSpellBar.SetStatusBarColor = function() end
FocusFrameSpellBar:SetStatusBarColor(0,0.45,0.9) -- Focus castbar color
FocusFrameSpellBar.SetStatusBarColor = function() end

FocusFrameSpellBar:ClearAllPoints() 
FocusFrameSpellBar:SetPoint("CENTER", CastingBarFrame, "CENTER", 10, 200) -- Change poosition of focus castbar (middle)
FocusFrameSpellBar.SetPoint = function() end

--LoadAddOn("Blizzard_ArenaUI")
--for i=1,3 do 
--_G[ArenaEnemyFrame..i..CastingBar]:SetStatusBarColor(0,0.45,0.9)end -- havnt tested yet (makes castbar blue on arena frames)

--for i=1,MAX_ARENA_ENEMIES do 
--_G["ArenaEnemyFrame"..i.."CastingBar"]:SetStatusBarColor(0,0.45,0.9)

--Text cast timer ("0.8 / 1.5")
CastingBarFrame.timer = CastingBarFrame:CreateFontString(nil);
CastingBarFrame.timer:SetFont(STANDARD_TEXT_FONT,12,"OUTLINE");
CastingBarFrame.timer:SetPoint("TOP", CastingBarFrame, "BOTTOM", 0, 0);
CastingBarFrame.update = .1;

hooksecurefunc("CastingBarFrame_OnUpdate", function(self, elapsed)
        if not self.timer then return end
        if self.update and self.update < elapsed then
                if self.casting then
                        self.timer:SetText(format("%2.1f/%1.1f", max(self.maxValue - self.value, 0), self.maxValue))
                elseif self.channeling then
                        self.timer:SetText(format("%.1f", max(self.value, 0)))
                else
                        self.timer:SetText("")
                end
                self.update = .1
        else
                self.update = self.update - elapsed
        end
end)