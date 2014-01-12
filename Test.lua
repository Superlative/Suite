cs=20;ps=10;ctp="CENTER"ptp="BOTTOMRIGHT"cp=1;ct=UNIT_NAME_FONT;crt=2;cDB={}action={}ccf=CreateFrame;gac=GetActionCooldown;ol="OUTLINE"cpe="PLAYER_ENTERING_WORLD"cau="ACTIONBAR_UPDATE_COOLDOWN"co="OnUpdate"

function rt(f)f.e=nil f.t:SetText("")f:SetScript(co,nil)end function sf(f,v)f.t:SetFont(ct,f.s*v,ol)end function acv(b)local x=b.cooldown x.a=b.action action[x]=x end function scv(p,f,po,s)if(s>1)then f.t:SetPoint(po,p)end f.s=s;end

function sr(f,e)if(e>60)then sf(f,0.7)if(f.s==cs)then return"%d:%02d",e,e else return"%dm",e+60,e end elseif(e>=cp)then sf(f,1)f.t:SetTextColor(1,1,0,1)return"%d",e elseif(e>0)then sf(f,0.9)f.t:SetTextColor(1,0,0,1)return"%.1f",e else return end end

function suc(f)if not f.e then f.e=1;f:SetScript(co,function(s,e)f.c=f.c+e;local fo,v1,v2=sr(f,f.r-f.c)if not fo then rt(f)elseif not v2 then f.t:SetFormattedText(fo,v1)else f.t:SetTextColor(1,1,1,1)f.t:SetFormattedText(fo,v1/60,v2%60)end end)end end

function scs(p,f)if(p:GetSize()<35)then scv(p,f,ptp,ps)else scv(p,f,ctp,cs)end end function gict(f)local c=ccf("Frame",nil,f)c:SetFrameLevel(f:GetFrameLevel()+5)c.t=c:CreateFontString(nil,"OVERLAY")c.t:SetAllPoints(c)scs(f:GetParent(),c)return c;end

function gct(f)if not cDB[f]then local c=gict(f)c:SetSize(c.s*crt,c.s*crt)sf(c,1)cDB[f]=c;end return cDB[f]end function cvf(f,s,d)local c=gct(f)if(s and d)then c.b=s;c.d=d;if(s>0 and d>1.5)then c.c=0;c.r=d-(GetTime()-s);suc(c)else rt(c)end end end

function cvc(DB)for c in pairs(DB)do if c.a then local s,d=gac(c.a)cvf(c,s,d)end end end function pcv(_,e)if e==cau then cvc(action)else cvc(cDB)end end for _,b in pairs(ActionBarButtonEventsFrame.frames)do acv(b)end

vc=ccf("Frame")vc:SetScript("OnEvent",pcv)vc:RegisterEvent(cpe)vc:RegisterEvent(cau)hooksecurefunc(getmetatable(ActionButton1Cooldown).__index,"SetCooldown",cvf)hooksecurefunc("SetActionUIButton",acv)