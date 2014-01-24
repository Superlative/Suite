--WIP stuff

--Necrotic Tracker--
CreateFrame('GameTooltip', 'NecroticTooltip', nil, 'GameTooltipTemplate'):SetOwner(WorldFrame, 'ANCHOR_NONE')

local function GetNecroticStrikeAbsorption(buff)
NecroticTooltip:ClearLines()
NecroticTooltip:SetUnitDebuff('player', buff:GetID())
return tonumber(NecroticTooltipTextLeft2:GetText():match('.* (%d+%s?) .*'))
end

local function short(n)
return n >= 1000 and ('%dk'):format(floor(n / 1000)) or
n >= 100 and ('%dh'):format(floor(n / 100 )) or n
end

local NecroticStrike = GetSpellInfo(73975)

hooksecurefunc('AuraButton_Update', function(buttonName, index, filter)
if UnitAura('player', index, filter) ~= NecroticStrike then return end

local buff = _G[ buttonName .. index ]
local absorption = GetNecroticStrikeAbsorption(buff)

if absorption then
buff.count:SetText(short(absorption))
buff.count:Show()
return true
end
end)
-------------------------------------

--Party full Debuffs--

for i=1,4 do
local f = _G["PartyMemberFrame"..i]
f:UnregisterEvent("UNIT_AURA")
local g = CreateFrame("Frame")
g:RegisterEvent("UNIT_AURA")
g:SetScript("OnEvent",function(self,event,a1)
if a1 == f.unit then
RefreshDebuffs(f,a1,20,nil,1)
else
if a1 == f.unit.."pet" then
PartyMemberFrame_RefreshPetDebuffs(f)
end
end
end)
local b = _G[f:GetName().."Debuff1"]
b:ClearAllPoints()
b:SetPoint("TOPLEFT",48,-30)

for j=5,20 do
local l = f:GetName().."Debuff"

local n = l..j
local c = CreateFrame("Frame",n,f,"PartyDebuffFrameTemplate")
c:SetPoint("LEFT",_G[l..(j-1)],"RIGHT",1,0)

end
end

--------------------------------------