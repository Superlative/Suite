--[[
Buff Tracker

bl = icon list
bs = icon size
xb = x positon of buff Tracker
yb = y positon of buff Tracker

br = x buffs per line

-SHAMAN
    -- 114049 - Acendance
	-- 108281 - Ancestral Guidance
	-- 324    - Lightning Shield -- Dosnt update properly
	-- 16246  - Clearcasting / Elemental Focus
	-- 117014 - Elemental Blast
	-- 79206  - Spiritwalker's Grace
]]--

--[[buffs tracker]]

bl={114049, 108281, 16246, 117014, 79206}
bs=30;xb=-62;yb=0;br=6;bdr="BORDER"be="UNIT_AURA"cbf=CreateFrame;gi=GetSpellInfo;bm=math.ceil;fm=math.floor;st=STANDARD_TEXT_FONT;function cu(s)return UnitBuff("player",gi(s))end
function Cb(i,s)local _,_,t3=gi(s)local f=cbf("Frame")f:SetSize(bs,bs)f.t=f:CreateTexture(nil,bdr)f.t:SetAllPoints(true)f.t:SetTexture(t3)f.f=f:CreateFontString(nil,bdr)f.f:SetFont(st,12,"OUTLINE")f.f:SetPoint("BOTTOMRIGHT",0,0)return f;end
function vb(s,i,row)local b1,_,_,b4=cu(s)local f=_G["B"..i]if b1 then f:Show()f:SetPoint("CENTER",xb+(bs+5)*bm((row-1)%br),yb-(bs+10)*bm(row/br))if(b4>1)then f.f:SetText(b4)end row=row+1;end return row;end
function ub()for i,s in ipairs(bl)do local b,_,_,_,_,_,k=cu(s)if b then local vt=fm(k-GetTime())if(vt>=60)then vt=bm(vt/60)_G["B"..i].c:SetText(vt.."m")elseif vt >=0 then _G["B"..i].c:SetText(vt.."s")end end end end
function Cc(f)f.c=f:CreateFontString(nil,bdr)f.c:SetFont(st,12,"OUTLINE")f.c:SetPoint("CENTER",0,-20)end function db()for i in ipairs(bl)do _G["B"..i]:Hide()end end
for i,s in ipairs(bl)do _G["B"..i]=Cb(i,s)Cc(_G["B"..i])_G["B"..i]:Hide()end function bb()db()local bw=1;for i,s in ipairs(bl)do bw=vb(s,i,bw)end end bk=cbf("Frame")bk:SetScript("OnEvent",bb)bk:SetScript("OnUpdate",ub)bk:RegisterEvent(be)