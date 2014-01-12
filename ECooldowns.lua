--Enemy cooldowns
USS="UNIT_SPELLCAST_SUCCEEDED";OE="OnEvent";F="Frame";CF=CreateFrame;BO="Border";
xb=300;--X
yb=732;--Y
sb=26;--Size
ib=2;--Spacing
ii=1 --Icon distance (Spacing)
--Don't change anything below  its going to get fucked)
function TrS(f,x,y,cd,T,s,h)f:SetPoint("BOTTOMLEFT",x,y)f:SetSize(s,s)f.c=CF("Cooldown",cd)f.c:SetAllPoints(f)f.t=f:CreateTexture(nil,BO)f.t:SetAllPoints()f.t:SetTexture(T);if not h then f:Hide();end f:RegisterEvent(USS)end
function Ts(f,cd,U,N,S,TI)if CPz(N,S,U) then f:Show();CooldownFrame_SetTimer(cd,GetTime(),TI,1)f.elapsed = 0 f:SetScript('OnUpdate', function(self, elapsed)if self.elapsed > TI+1 then self:SetScript('OnUpdate', nil) self:Hide();else self.elapsed = self.elapsed + elapsed end end) end end
function CPz(N,S,U)if(N==S and (U=="arena1" or U=="arena2" or U=="arena3" or U=="arenapet1" or U=="arenapet2" or U=="arenapet3" or U=="target" or U=="focus"))then return true else return false end end
--rogue
t1p="Interface\\Icons\\ability_rogue_kidneyshot";t1=CF(F);TrS(t1,xb,yb,"cd1",t1p,sb,false);t1:SetScript(OE,function(self,event,...) Ts(t1,cd1,select(1,...),select(5,...),408,20) end);
t2p="Interface\\Icons\\ability_rogue_smoke";t2=CF(F);TrS(t2,xb+sb+ii,yb,"cd2",t2p,sb,false);t2:SetScript(OE,function(self,event,...) Ts(t2,cd2,select(1,...),select(5,...),76577,180) end);
--mage
t3p="Interface\\Icons\\ability_mage_deepfreeze";t3=CF(F);TrS(t3,xb+sb*2+ii*2,yb,"cd3",t3p,sb,false);t3:SetScript(OE,function(self,event,...) Ts(t3,cd3,select(1,...),select(5,...),44572,30) end);
t4p="Interface\\Icons\\ability_mage_frostjaw";t4=CF(F);TrS(t4,xb+sb*3+ii*3,yb,"cd4",t4p,sb,false);t4:SetScript(OE,function(self,event,...) Ts(t4,cd4,select(1,...),select(1,...),select(5,...),102051,20) end);


--dk 
t6p="Interface\\Icons\\spell_shadow_antimagicshell";t6=CF(F);TrS(t6,xb,yb-(sb+ib),"cd6",t6p,sb,false);t6:SetScript(OE,function(self,event,...) Ts(t6,cd6,select(1,...),select(5,...),48707,45) end);
t7p="Interface\\Icons\\spell_shadow_soulleech_3";t7=CF(F);TrS(t7,xb+sb+ii,yb-(sb+ib),"cd7",t7p,sb,false);t7:SetScript(OE,function(self,event,...) Ts(t7,cd7,select(1,...),select(5,...),47476,120) end);
t8p="Interface\\Icons\\ability_deathknight_summongargoyle";t8=CF(F);TrS(t8,xb+sb*2+ii*2,yb-(sb+ib),"cd8",t8p,sb,false);t8:SetScript(OE,function(self,event,...) Ts(t8,cd8,select(1,...),select(5,...),49206,180) end);

--druid 
t9p="Interface\\Icons\\ability_druid_berserk";t9=CF(F);TrS(t9,xb,yb-2*(sb+ib),"cd9",t9p,sb,false);t9:SetScript(OE,function(self,event,...) Ts(t9,cd9,select(1,...),select(5,...),50334,180) end);
--paladin 
t10p="Interface\\Icons\\spell_holy_divineshield";t10=CF(F);TrS(t10,xb+sb+ii,yb-2*(sb+ib),"cd10",t10p,sb,false);t10:SetScript(OE,function(self,event,...) Ts(t10,cd10,select(1,...),select(5,...),642,300) end);
--warlock 
t5p="Interface\\Icons\\ability_warlock_howlofterror";t5=CF(F);TrS(t5,xb+sb*2+ii*2,yb-2*(sb+ib),"cd5",t5p,sb,false);t5:SetScript(OE,function(self,event,...) Ts(t5,cd5,select(1,...),select(5,...),5484,40) end);

--priest
t11p="Interface\\Icons\\spell_shadow_psychicscream";t11=CF(F);TrS(t11,xb,yb-3*(sb+ib),"cd11",t11p,sb,false);t11:SetScript(OE,function(self,event,...) Ts(t11,cd11,select(1,...),select(5,...),8122,26) end);
t12p="Interface\\Icons\\spell_shadow_psychicscream";t12=CF(F);TrS(t12,xb+sb+ii,yb-3*(sb+ib),"cd12",t12p,sb,false);t12:SetScript(OE,function(self,event,...) Ts(t12,cd12,select(1,...),select(5,...),8122,30) end);
t13p="Interface\\Icons\\spell_holy_painsupression";t13=CF(F);TrS(t13,xb+sb*2+ii*2,yb-3*(sb+ib),"cd13",t13p,sb,false);t13:SetScript(OE,function(self,event,...) Ts(t13,cd13,select(1,...),select(5,...),33206,180) end);
t14p="Interface\\Icons\\spell_shadow_dispersion";t14=CF(F);TrS(t14,xb+sb*3+ii*3,yb-3*(sb+ib),"cd14",t14p,sb,false);t14:SetScript(OE,function(self,event,...) Ts(t14,cd14,select(1,...),select(5,...),47585,120) end);
t15p="Interface\\Icons\\ability_priest_silence";t15=CF(F);TrS(t15,xb+sb*4+ii*4,yb-3*(sb+ib),"cd15",t15p,sb,false);t15:SetScript(OE,function(self,event,...) Ts(t16,cd15,select(1,...),select(5,...),15487,45) end);

--warrior 
t16p="Interface\\Icons\\ability_warrior_charge";t16=CF(F);TrS(t16,xb,yb-4*(sb+ib),"cd16",t16p,sb,false);t16:SetScript(OE,function(self,event,...) Ts(t16,cd16,select(1,...),select(5,...),100,20) end);
t17p="Interface\\Icons\\ability_warrior_shockwave";t17=CF(F);TrS(t17,xb+sb+ii,yb-4*(sb+ib),"cd17",t17p,sb,false);t17:SetScript(OE,function(self,event,...) Ts(t17,cd17,select(1,...),select(5,...),46968,20) end);
t18p="Interface\\Icons\\ability_criticalstrike";t18=CF(F);TrS(t18,xb+sb*2+ii*2,yb-4*(sb+ib),"cd18",t18p,sb,false);t18:SetScript(OE,function(self,event,...) Ts(t18,cd1,select(1,...),select(5,...),1719,300) end);
t19p="Interface\\Icons\\ability_warrior_shieldwall";t19=CF(F);TrS(t19,xb+sb*3+ii*4,yb-4*(sb+ib),"cd19",t19p,sb,false);t19:SetScript(OE,function(self,event,...) Ts(t19,cd19,select(1,...),select(5,...),871,300) end);

--hunter 
t20p="Interface\\Icons\\ability_golemstormbolt";t20=CF(F);TrS(t20,xb,yb-5*(sb+ib),"cd20",t20p,sb,false);t20:SetScript(OE,function(self,event,...) Ts(t20,cd20,select(1,...),select(5,...),19503,30) end);
t21p="Interface\\Icons\\spell_frost_chainsofice";t21=CF(F);TrS(t21,xb+sb+ii,yb-5*(sb+ib),"cd21",t21p,sb,false);t21:SetScript(OE,function(self,event,...) Ts(t21,cd21,select(1,...),select(5,...),1499,30) end);
t22p="Interface\\Icons\\ability_whirlwind";t22=CF(F);TrS(t22,xb+sb*2+ii*2,yb-5*(sb+ib),"cd22",t22p,sb,false);t22:SetScript(OE,function(self,event,...) Ts(t22,cd2,select(1,...),select(5,...),19263,120) end);

--shaman 
t23p="Interface\\Icons\\spell_shaman_hex";t23=CF(F);TrS(t23,xb,yb-6*(sb+ib),"cd23",t23p,sb,false);t23:SetScript(OE,function(self,event,...) Ts(t23,cd23,select(1,...),select(5,...),51514,45) end);
t24p="Interface\\Icons\\spell_shaman_spiritlink";t24=CF(F);TrS(t24,xb+sb+ii,yb-6*(sb+ib),"cd24",t24p,sb,false);t24:SetScript(OE,function(self,event,...) Ts(t24,cd24,select(1,...),select(5,...),98008,180) end);
t25p="Interface\\Icons\\spell_nature_tremortotem";t25=CF(F);TrS(t25,xb+sb*2+ii*2,yb-6*(sb+ib),"cd25",t25p,sb,false);t25:SetScript(OE,function(self,event,...) Ts(t25,cd25,select(1,...),select(5,...),8143,60) end);

--monk
-- t76p="Interface\\Icons\\ability_monk_chargingoxwave";t76=CF(F);TrS(t76,xb,yb-8*(sb+ib),"cd76",t76p,sb,false);t76:SetScript(OE,function(self,event,...) Ts(t76,cd76,select(1,...),select(5,...),119392,60) end);
-- t77p="Interface\\Icons\\ability_monk_legsweep";t77=CF(F);TrS(t77,xb,yb-8*(sb+ib),"cd77",t77p,sb,false);t77:SetScript(OE,function(self,event,...) Ts(t77,cd77,select(1,...),select(5,...),119381,45) end);
-- t78p="Interface\\Icons\\ability_monk_dampenharm";t78=CF(F);TrS(t78,xb+sb+ii,yb-8*(sb+ib),"cd78",t78p,sb,false);t78:SetScript(OE,function(self,event,...) Ts(t78,cd78,select(1,...),select(5,...),122278,90) end);
-- t79p="Interface\\Icons\\spell_arcane_massdispel";t79=CF(F);TrS(t79,xb+sb+ii,yb-8*(sb+ib),"cd79",t79p,sb,false);t79:SetScript(OE,function(self,event,...) Ts(t79,cd78,select(1,...),select(5,...),122783,90) end);
-- t80p="Interface\\Icons\\ability_monk_rushingjadewind";t80=CF(F);TrS(t80,xb+sb*2+ii*2,yb-8*(sb+ib),"cd80",t80p,sb,false);t80:SetScript(OE,function(self,event,...) Ts(t80,cd80,select(1,...),select(5,...),116847,30) end);
-- t81p="Interface\\Icons\\ability_monk_summontigerstatue";t81=CF(F);TrS(t81,xb+sb*2+ii*2,yb-8*(sb+ib),"cd81",t81p,sb,false);t81:SetScript(OE,function(self,event,...) Ts(t81,cd81,select(1,...),select(5,...),123904,180) end);
-- t82p="Interface\\Icons\\ability_monk_clashingoxcharge";t82=CF(F);TrS(t82,xb+sb*3+ii*3,yb-8*(sb+ib),"cd82",t82p,sb,false);t82:SetScript(OE,function(self,event,...) Ts(t82,cd82,select(1,...),select(5,...),122057,35) end);
-- t83p="Interface\\Icons\\ability_monk_touchofdeath";t83=CF(F);TrS(t83,xb+sb*4+ii*4,yb-8*(sb+ib),"cd83",t83p,sb,false);t83:SetScript(OE,function(self,event,...) Ts(t83,cd83,select(1,...),select(5,...),115080,90) end);
-- t84p="Interface\\Icons\\ability_monk_zenmeditation";t84=CF(F);TrS(t84,xb+sb*5+ii*5,yb-8*(sb+ib),"cd84",t84p,sb,false);t84:SetScript(OE,function(self,event,...) Ts(t84,cd84,select(1,...),select(5,...),115176,180) end);