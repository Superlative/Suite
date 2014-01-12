--Makes your debuffs/buffs on target/focus bigger than others

hooksecurefunc("TargetFrame_UpdateAuraPositions", function(self, auraName, numAuras, numOppositeAuras,largeAuraList, updateFunc, maxRowWidth, offsetX)
local AURA_OFFSET_Y = 3
local LARGE_AURA_SIZE = 27 -- Your Buffs/Debuffs Size
local SMALL_AURA_SIZE = 15 -- Others Buff/Debuff Size
local size
local offsetY = AURA_OFFSET_Y
local rowWidth = 0
local firstBuffOnRow = 1
for i=1, numAuras do
    if ( largeAuraList[i] ) then
        size = LARGE_AURA_SIZE
        offsetY = AURA_OFFSET_Y + AURA_OFFSET_Y
    else
        size = SMALL_AURA_SIZE
	end
    if ( i == 1 ) then
        rowWidth = size
        self.auraRows = self.auraRows + 1
    else
        rowWidth = rowWidth + size + offsetX
    end
    if ( rowWidth > maxRowWidth ) then
        updateFunc(self, auraName, i, numOppositeAuras, firstBuffOnRow, size, offsetX, offsetY)
        rowWidth = size
        self.auraRows = self.auraRows + 1
        firstBuffOnRow = i
        offsetY = AURA_OFFSET_Y
    else
        updateFunc(self, auraName, i, numOppositeAuras, i - 1, size, offsetX, offsetY)
    end
end
end)