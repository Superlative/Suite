--Hide faction/PvP icon
PlayerPVPIcon:SetAlpha(0)
TargetFrameTextureFramePVPIcon:SetAlpha(0)
FocusFrameTextureFramePVPIcon:SetAlpha(0)
PartyMemberFrame1PVPIcon:SetAlpha(0)
PartyMemberFrame2PVPIcon:SetAlpha(0)
PartyMemberFrame3PVPIcon:SetAlpha(0)
--ArenaPrepFrames:SetAlpha(0)

-- Hides Group indicator (above player frame)
PlayerFrameGroupIndicator.Show = function() return end

hooksecurefunc('PlayerFrameMultiGroupFrame_OnEvent',function(self, event, ...)
  if ( event == "GROUP_ROSTER_UPDATE" ) then
    if ( IsInGroup(LE_PARTY_CATEGORY_HOME) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE) ) then
      self:Hide(); end
  elseif ( event == "UPDATE_CHAT_COLOR" ) then    
    self.HomePartyIcon:Hide();
    self.InstancePartyIcon:Hide();
  end
end)