-- Removes "Leave" button on ques!

--SafeQue
local queueTime
local queue = 0
local button2 = StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].button2
local remaining = 0
 
local function SafeQueue_Timer()
        local secs = GetBattlefieldPortExpiration(queue)
        if secs > 0 then
                local p = StaticPopup_Visible("CONFIRM_BATTLEFIELD_ENTRY")
    
                if p then
                        local color
                        if remaining ~= secs then
                                remaining = secs
                                if secs > 20 then -- Changes the countdown to yellow
                                        color = "f20ff20"
                                elseif secs > 10 then -- Changes the countdown to red
                                        color = "fffff00"
                                else
                                        color = "fff0000" -- Makes countdown green
                                end
        local str=string.gsub(_G[p .. "Text"]:GetText(), ".+\n", "UR A FUCKING HERO! |cf"..color.. SecondsToTime(secs) .. "|r, GO GET EM!\n\n")--Change the name of the que window!
                                _G[p .. "Text"]:SetText(str)
        
                        end
                end
        end    
end
 
local function SafeQueue_Update()
        local queued
        for i=1, GetMaxBattlefieldID() do 
                local status, _, _, _, _, _, registeredMatch = GetBattlefieldStatus(i)
                if registeredMatch == 1 then
                        if status == "queued" then
                                queued = true
                                if not queueTime then
          queueTime = GetTime()
        end
                        elseif status == "confirm" then
                        if queueTime then
                                queueTime = nil          
                        end
        remaining = 0
        queue = i        
                        end
                        break
                end
        end
        if not queued and queueTime then queueTime = nil end
end
 
frame = CreateFrame("Frame", nil, UIParent)
frame:SetScript("OnEvent", SafeQueue_Update)
frame:SetScript("OnUpdate", SafeQueue_Timer)
 
frame:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].button2 = nil
StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].hideOnEscape = false
