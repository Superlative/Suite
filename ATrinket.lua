--Adds a pvp trinket next to arena frames
LoadAddOn("Blizzard_ArenaUI")

trinkets = {}
local arenaFrame, trinket
for i = 1, 5 do
        arenaFrame = "ArenaEnemyFrame"..i
        trinket = CreateFrame("Cooldown", arenaFrame.."Trinket", ArenaEnemyFrames)
        trinket:SetPoint("TOPRIGHT", arenaFrame, 30, -6) -- Anchor point of trinket (x/y)
        trinket:SetSize(30, 30) -- Change size of trinket
        trinket.icon = trinket:CreateTexture(nil, "BACKGROUND")
        trinket.icon:SetAllPoints()
        trinket.icon:SetTexture("Interface\\Icons\\inv_jewelry_trinketpvp_01")
        trinket:Hide()
        trinkets["arena"..i] = trinket
end

local events = CreateFrame("Frame")
function events:UNIT_SPELLCAST_SUCCEEDED(unitID, spell, rank, lineID, spellID)
        if not trinkets[unitID] then
                return
        end
        if spellID == 59752 or spellID == 42292 then
                CooldownFrame_SetTimer(trinkets[unitID], GetTime(), 120, 1)
                SendChatMessage("Trinket used by: "..GetUnitName(unitID, true), "PARTY")
        end
end

function events:PLAYER_ENTERING_WORLD()
        local _, instanceType = IsInInstance()
        if instanceType == "arena" then
                self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
        elseif self:IsEventRegistered("UNIT_SPELLCAST_SUCCEEDED") then
                self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
                for _, trinket in pairs(trinkets) do
                        trinket:SetCooldown(0, 0)
                        trinket:Hide()
                end
        end
end
events:SetScript("OnEvent", function(self, event, ...) return self[event](self, ...) end)
events:RegisterEvent("PLAYER_ENTERING_WORLD")