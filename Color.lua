--Class colors in hp bars

local function colour(statusbar, unit)
        local _, class, c
        if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
                _, class = UnitClass(unit)
                c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
                statusbar:SetStatusBarColor(c.r, c.g, c.b)
                PlayerFrameHealthBar:SetStatusBarColor(0,1,0)
        end
end

hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
        colour(self, self.unit)
end)

--Class color backdrop
local frame = CreateFrame("FRAME")
frame:RegisterEvent("PARTY_MEMBERS_CHANGED")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
frame:RegisterEvent("UNIT_FACTION")

local function eventHandler(self, event, ...)
        if UnitIsPlayer("target") then
                c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
                TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
        end
        if UnitIsPlayer("focus") then
                c = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
                FocusFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
        end
end

-- arena frame class color'd hp bars
local bar,color 
	for i=1,5 do
		bar = _G["ArenaEnemyFrame"..i.."HealthBar"]
		color = RAID_CLASS_COLORS[select(2,UnitClass("arena"..i))]
		if color then
			bar:SetStatusBarColor(color.r,color.g,color.b)
		end
	end
 

frame:SetScript("OnEvent", eventHandler)