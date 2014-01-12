--Hide Grypons
MainMenuBarLeftEndCap:Hide() 
MainMenuBarRightEndCap:Hide()

--Player Frame
PlayerFrame:ClearAllPoints()
PlayerFrame:SetPoint("CENTER", "UIParent", "CENTER", -320, -120) -- Change position of player frame
PlayerFrame.SetPoint = function() end

--Target Frame
TargetFrame:ClearAllPoints() 
TargetFrame:SetPoint("CENTER", PlayerFrame, "CENTER", 100, -45) -- Change position of target frame

-- ToT
TargetFrameToT:ClearAllPoints() 
TargetFrameToT:SetPoint("CENTER","TargetFrame","CENTER", 55, -35) -- Change position of targetOftarget 

--Focus Frame
FocusFrame:ClearAllPoints() 
FocusFrame:SetPoint("CENTER", PlayerFrame, "CENTER", 640, 0)

--Pet Frame
PetFrame:ClearAllPoints() 
PetFrame:SetPoint("CENTER", PlayerFrame, "CENTER", -65, -45) -- Change position of pet frame (left of target frame)
PetFrame.SetPoint = function() end
PetName:Hide()

--Class Specific Frames
_,Class=UnitClass("player");
	if Class == "SHAMAN" then
		TotemFrame:ClearAllPoints()
		TotemFrame:SetPoint("CENTER", "PlayerFrame", "CENTER", 45, 45) -- Change position of TotemBar (above player frame)

	elseif Class == "PALADIN" then
		PaladinPowerBar:ClearAllPoints();
		PaladinPowerBar:SetAlpha(0);
		PaladinPowerBar.SetPoint = function() end
		
	-- elseif Class == "DRUID" then
		--EclipseBarFrame:ClearAllPoints()
		--EclipseBarFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, -300) -- Change positon of Eclipsebar
		
	-- elseif Class == "DEATHKNIGHT" then
		--RuneFrame:ClearAllPoints()
		--RuneFrame:SetPoint("CENTER", "PlayerFrame", "CENTER", 50, 43) -- Change position of dk runes (above player frame)
		--RuneFrame.SetPoint = function() end
		
	elseif Class == "PRIEST" then -- Removes shadowfiend pet frame
		PetFrame:ClearAllPoints()
		PetFrame:Hide()

	--ShardFrame (on pet)
	elseif Class == "WARLOCK" then 
		ShardBarFrame:ClearAllPoints()
		ShardBarFrame:SetPoint("TOP", PetFrame, "BOTTOM",28,19) -- Change positon of shards (under pet frame)
		ShardBarFrame:SetScale(0.67)
end


--Remove Status Icons
local RPFI = true
if RPFI == true then
	function PlayerFrame_UpdateStatus (self)
		PlayerStatusTexture:Hide()
		PlayerStatusGlow:Hide()
		PlayerRestGlow:Hide()
		PlayerAttackGlow:Hide()
		PlayerRestIcon:Hide()
		PlayerAttackIcon:Hide()
		PlayerAttackBackground:Hide()
		PlayerFrameGroupIndicator:Hide()
	end
end

--Group Number
PlayerFrameGroupIndicator.Show = function() return end