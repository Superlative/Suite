-- Grow upwards (ugly hack)

PartyMemberFrame1:ClearAllPoints()
PartyMemberFrame1:SetPoint("CENTER", PlayerFrame, "CENTER", 0, 100) -- Anchor to player frame (change to move frames)
PartyMemberFrame1:SetScale(1.2)
	
PartyMemberFrame2:ClearAllPoints()
PartyMemberFrame2:SetPoint("CENTER", PartyMemberFrame1, "CENTER", 0,65) -- If :SetScale(x.x) changes you might need to change (0,65) to a bigger nummer
PartyMemberFrame2:SetScale(1.2)

PartyMemberFrame3:ClearAllPoints()
PartyMemberFrame3:SetPoint("CENTER", PartyMemberFrame2, "CENTER", 0,65)
PartyMemberFrame3:SetScale(1.2)

PartyMemberFrame4:ClearAllPoints()
PartyMemberFrame4:SetPoint("CENTER", PartyMemberFrame3, "CENTER", 0,65)
PartyMemberFrame4:SetScale(1.2)

-- Old Party Frame
local f = CreateFrame("Frame")
  f:RegisterEvent("PLAYER_ENTERING_WORLD")
  f:RegisterEvent("PLAYER_TARGET_CHANGED")
  f:RegisterEvent("PLAYER_FOCUS_CHANGED")
  f:RegisterEvent("PLAYER_GAINS_VEHICLE_DATA")
  f:RegisterEvent("PLAYER_LOSES_VEHICLE_DATA")
  f:RegisterEvent("PLAYER_ENTERING_BATTLEGROUND")
  f:RegisterEvent("PARTY_MEMBERS_CHANGED")
  f:RegisterEvent("PARTY_LEADER_CHANGED")
  f:RegisterEvent("PARTY_LOOT_METHOD_CHANGED")
  f:RegisterEvent("MUTELIST_UPDATE")
  f:RegisterEvent("IGNORELIST_UPDATE")
  f:RegisterEvent("UNIT_FACTION")
  f:RegisterEvent("UNIT_AURA")
  f:RegisterEvent("UNIT_CONNECTION")
  f:RegisterEvent("UNIT_PET")  
  f:RegisterEvent("VARIABLES_LOADED")
  f:RegisterEvent("VEHICLE_PASSENGERS_CHANGED")
  f:RegisterEvent("VEHICLE_UPDATE")  
  f:RegisterEvent("READY_CHECK")
  f:RegisterEvent("READY_CHECK_CONFIRM")
  f:RegisterEvent("READY_CHECK_FINISHED")
  f:RegisterEvent("UNIT_ENTERED_VEHICLE")
  f:RegisterEvent("UNIT_MODEL_CHANGED")  
  f:RegisterEvent("UNIT_EXITED_VEHICLE")
  f:RegisterEvent("UNIT_HEALTH")
  f:RegisterEvent("UNIT_MAXHEALTH")  
  f:RegisterEvent("PARTY_MEMBER_ENABLE")
  f:RegisterEvent("PARTY_MEMBER_DISABLE")
  f:RegisterEvent("UNIT_PHASE");      
      f:SetScript("OnEvent",function()
      local _, type = GetInstanceInfo()  
      for i=1,MAX_PARTY_MEMBERS do local v,f,p,s,d;
          f=_G["PartyMemberFrame"..i];
          p=_G["PartyMemberFrame"..i.."PetFrame"];          
          v=_G["PartyMemberFrame"..i.."PVPIcon"]:SetAlpha(0);
          s=_G["PartyMemberFrame"..i.."Speaker"]:SetAlpha(0);
          d=_G["PartyMemberFrame"..i.."Disconnect"]:SetAlpha(0);                
          if UnitExists("party"..i) and type =="pvp" then                
          f:Show();
          elseif UnitExists("party"..i) and type =="arena" then
          f:Show();
          elseif UnitExists("party"..i) and type =="none" then
          f:Show();                      
          elseif UnitExists("party"..i) and type =="raid" then
          f:Show();
          elseif UnitExists("party"..i) and type =="party" then
          f:Show();
          end end              
      end)      
 
local UnitIsPlayer,UnitPlayerOrPetInParty,
UnitIsConnected, UnitClass, RAID_CLASS_COLORS =
UnitIsPlayer, UnitPlayerOrPetInParty, UnitIsConnected,
UnitClass, RAID_CLASS_COLORS
local _, class, c
local function colour(statusbar, unit)
      if UnitIsPlayer(unit) and
          UnitPlayerOrPetInParty(unit) and
          UnitIsConnected(unit) and
          unit == statusbar.unit and
          UnitClass(unit) then
          _, class = UnitClass(unit)
          c = CUSTOM_CLASS_COLORS and
          CUSTOM_CLASS_COLORS[class] or
          RAID_CLASS_COLORS[class]
          statusbar:SetStatusBarColor(c.r, c.g, c.b)
          end
end
hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
colour(self, self.unit)
end)
local sb = _G.GameTooltipStatusBar
local addon = CreateFrame("Frame", "StatusColour")
addon:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
addon:SetScript("OnEvent", function()
colour(sb, "mouseover")
end)



-- Party Debuffs (show all buffs on party frames)

-- for i=1,4 do
        -- local f = _G["PartyMemberFrame"..i]
        -- f:UnregisterEvent("UNIT_AURA")
        -- local g = CreateFrame("Frame")
        -- g:RegisterEvent("UNIT_AURA")
        -- g:SetScript("OnEvent",function(self,event,a1)
                -- if a1 == f.unit then
                        -- RefreshDebuffs(f,a1,20,nil,1)
                -- else
                        -- if a1 == f.unit.."pet" then
                                -- PartyMemberFrame_RefreshPetDebuffs(f)
                        -- end
                -- end
        -- end)
        -- local b = _G[f:GetName().."Debuff1"]
        -- b:ClearAllPoints()
        -- b:SetPoint("LEFT",f,"RIGHT",-7,5)
        -- for j=5,20 do
                -- local l = f:GetName().."Debuff"
                -- local n = l..j
                -- local c = CreateFrame("Frame",n,f,"PartyDebuffFrameTemplate")
                -- c:SetPoint("LEFT",_G[l..(j-1)],"RIGHT")
        -- end
-- end

-- for i=1,4 do
        -- local f = _G["PartyMemberFrame"..i]
        -- f:UnregisterEvent("UNIT_AURA")
        -- local g = CreateFrame("Frame")
        -- g:RegisterEvent("UNIT_AURA")
        -- g:SetScript("OnEvent",function(self,event,a1)
                -- if a1 == f.unit then
                        -- RefreshBuffs(f,a1,20,nil,1)
                -- end
        -- end)
        -- for j=1,20 do
                -- local l = f:GetName().."Buff"
                -- local n = l..j
                -- local c = CreateFrame("Frame",n,f,"TargetBuffFrameTemplate")
                -- c:EnableMouse(false)
                -- if j == 1 then
                        -- c:SetPoint("TOPLEFT",48,-32)
                -- else
                        -- c:SetPoint("LEFT",_G[l..(j-1)],"RIGHT",1,0)
                -- end
        -- end
-- end