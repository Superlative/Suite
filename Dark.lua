-- Darkens all borders on frames ect
local ocolor = {0, 0, 0, 1}
local eventframe=CreateFrame("Frame")
eventframe:RegisterEvent("ADDON_LOADED")
eventframe:RegisterEvent("PLAYER_ENTERING_WORLD")
eventframe:SetScript("OnEvent", function(self, event, addon)
      for _, obj in ipairs({Minimap:GetChildren()}) do
            if (obj and (obj:GetObjectType() == "Frame" or obj:GetObjectType() == "Button")) then
                  for _, tex in ipairs({obj:GetRegions()}) do
                        if (tex and tex:GetObjectType() == "Texture") then
                              if tex:GetTexture() == "Interface\\Minimap\\MiniMap-TrackingBorder" then
                                    tex:SetDesaturated(true)
                                    tex:SetVertexColor(unpack(ocolor))
                              end
                        end
                  end
            end
      end

      for i,v in pairs({
            PlayerFrameTexture,
            TargetFrameTextureFrameTexture,
            PetFrameTexture,
            PartyMemberFrame1Texture,
            PartyMemberFrame2Texture,
            PartyMemberFrame3Texture,
            PartyMemberFrame4Texture,
            PartyMemberFrame1PetFrameTexture,
            PartyMemberFrame2PetFrameTexture,
            PartyMemberFrame3PetFrameTexture,
            PartyMemberFrame4PetFrameTexture,
            FocusFrameTextureFrameTexture,
            TargetFrameToTTextureFrameTexture,
            FocusFrameToTTextureFrameTexture,
            
            MinimapBackdrop,
            MinimapBorder,
            MiniMapMailBorder,
            MiniMapTrackingButtonBorder,
            MinimapBorderTop,
            MinimapZoneTextButton,
            MiniMapWorldMapButton,
            MiniMapWorldMapButton,
            MiniMapWorldIcon,
            MinimapZoomIn:GetRegions(),
            MinimapZoomOut:GetRegions(),
            MiniMapWorldMapButton:GetRegions(),
            MiniMapBattlefieldBorder,
            MiniMapLFGFrameBorder,

            CastingBarFrameBorder,
            FocusFrameSpellBarBorder,
            TargetFrameSpellBarBorder,
            
            StanceBarLeft,
            StanceBarRight,
            StanceBarMiddle,

            -- Other
            select(2, CastingBarFrame:GetRegions()),
            select(2, MirrorTimer1:GetRegions()),
            
            BonusActionBarFrameTexture0,
            BonusActionBarFrameTexture1,
            BonusActionBarFrameTexture2,
            BonusActionBarFrameTexture3,
            BonusActionBarFrameTexture4,   
            MainMenuBarTexture0,
            MainMenuBarTexture1,
            MainMenuBarTexture2,
            MainMenuBarTexture3,
            MainMenuMaxLevelBar0,
            MainMenuMaxLevelBar1,
            MainMenuMaxLevelBar2,
            MainMenuMaxLevelBar3,
            MainMenuXPBarTextureMid,
            MainMenuXPBarTextureLeftCap,
            MainMenuXPBarTextureRightCap,

            MainMenuBarLeftEndCap,
            MainMenuBarRightEndCap,
            
            SlidingActionBarTexture0,
            SlidingActionBarTexture1,
            ShapeshiftBarLeft,
            ShapeshiftBarMiddle,
            ShapeshiftBarRight,
            
            select(5, ShardBarFrameShard1:GetRegions()),
            select(5, ShardBarFrameShard2:GetRegions()),
            select(5, ShardBarFrameShard3:GetRegions()),
            
            select(1, PaladinPowerBar:GetRegions()),
            
            
         }) do
            if v and v:GetObjectType() == "Texture" then
                  v:SetDesaturated(true)
                  v:SetVertexColor(unpack(ocolor))
            end
      end   
      
      for i=1,19 do _G["MainMenuXPBarDiv"..i]:SetVertexColor(unpack(ocolor)) end
      
      if TimeManagerClockButton then
            for i,v in pairs({
                  select(1, TimeManagerClockButton:GetRegions()),
                  select(1, GameTimeFrame:GetRegions()),
               }) do
                  if v and v:GetObjectType() == "Texture" then
                        v:SetDesaturated(true)
                        v:SetVertexColor(unpack(ocolor))
                  end
            end   
      end
      
      for i,v in pairs({
            ArenaEnemyFrame1Texture,
            ArenaEnemyFrame2Texture,
            ArenaEnemyFrame3Texture,
            ArenaEnemyFrame4Texture,
            ArenaEnemyFrame5Texture,
         }) do
            v:SetDesaturated(true)
            v:SetVertexColor(unpack(ocolor))
      end
end)