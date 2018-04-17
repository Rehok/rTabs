-- Blizzard API's / Global Table / Lua Functions
local hooksecurefunc = hooksecurefunc
local _G = _G
local CreateFrame = CreateFrame
local pairs, select, unpack = pairs, select, unpack
local UnitClass = UnitClass
-- Create a Frame for some until I find a func to hooksecurefunc onto
local rTabFrame = CreateFrame("Frame")
 
-- ElvUI Skinning for Tabs
if IsAddOnLoaded("ElvUI") then
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule("Skins")
local rTab = E:NewModule('rTabs');

-- Overwrite ElvUI Tabs function to be transparent (Thanks Merathilis (TukUI Discord) for this code)
function rTab:ReskinTab(tab)
    if not tab then return end
    if tab.backdrop then
        tab.backdrop:SetTemplate("Transparent")

    end
end
hooksecurefunc(S, "HandleTab", rTab.ReskinTab)

-- Testing Shit
--[[
function rTab:ReskinScrollBar(frame, thumbTrim)
  local col = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
	if frame:GetName() then
		if _G[frame:GetName().."ScrollUpButton"] and _G[frame:GetName().."ScrollDownButton"] then
      if frame.icon then
        fame.icon:SetAlpha(0)
      end
			if frame.thumbbg and frame.thumbbg.backdropTexture then

        -- Little Square and Arrows
        frame.thumbbg:SetBackdropColor(col.r, col.g, col.b, 0.2)
        -- Track Background
        frame.trackbg:SetAlpha(0)
        frame.thumbbg:SetAlpha(0)
        frame.thumbbg.backdropTexture:SetAlpha(0)

			end
		end
	else
		if frame.ScrollUpButton and frame.ScrollDownButton then
			if frame.thumbbg and frame.thumbbg.backdropTexture then
				frame.thumbbg.backdropTexture.SetVertexColor = nil
				frame.thumbbg.backdropTexture:SetVertexColor(unpack(E.media.rgbvaluecolor))
				frame.thumbbg.backdropTexture.SetVertexColor = E.noop
			end
		end
	end
end
hooksecurefunc(S, "HandleScrollBar", ETR.ReskinScrollBar)
]]
end
--------  TO DO  --------------
-- Inspect Frame, S&L Edits this these tab names (I think)
-- Finish Moving guild tabs
-- Social Frame
-- Merchant Frame
-- Mail Frame
-- GBank Frame
-------------------------------

-- This moves tabs on various frames to 1 pixel down and along to the bottom left corner
-- Some frames are nil until their relevant Blizzard Addon is loaded, So load their addons first
-- so lets force them to be loaded, Timers are started as some UI parts break if not delayed (not sure why)
-- This is currently way to do it until i hooksecurefunc them all or use my frame OnUpdate option as some
-- functions arent functions according to hooksecurefunc

C_Timer.After(2, function() DEFAULT_CHAT_FRAME:AddMessage("|cFF00A5FFrTabs|r is starting a 20s timer. This is so parts of your UI don't break, If you see talents pop up and disappear that is for the tabs to be moved.") end)
C_Timer.After(22, function()
LoadAddOn("Blizzard_AchievementUI")
LoadAddOn("Blizzard_GuildUI")
LoadAddOn("Blizzard_TalentUI")
LoadAddOn("Blizzard_Collections")
C_Timer.After(2, function() DEFAULT_CHAT_FRAME:AddMessage("|cFF00A5FFrTabs|r has finished.") end)
-- Character Frame
CharacterFrameTab1:ClearAllPoints()
CharacterFrameTab1:SetPoint("BOTTOMLEFT", PaperDollItemsFrame, -10, -32)
CharacterFrameTab2:ClearAllPoints()
CharacterFrameTab2:SetPoint("BOTTOMLEFT", PaperDollItemsFrame, 62, -32)
CharacterFrameTab3:ClearAllPoints()
CharacterFrameTab3:SetPoint("BOTTOMLEFT", PaperDollItemsFrame, 139, -32)

-- PVE Frame (GroupFinder)
PVEFrameTab1:ClearAllPoints()
PVEFrameTab1:SetPoint("BOTTOMLEFT", PVEFrame, -11, -33)
PVEFrameTab1.ClearAllPoints = DoNothing
PVEFrameTab1.SetPoint = DoNothing
PVEFrameTab2:ClearAllPoints()
PVEFrameTab2:SetPoint("BOTTOMLEFT", PVEFrame, 104, -33)
PVEFrameTab3:ClearAllPoints()
PVEFrameTab3:SetPoint("BOTTOMLEFT", PVEFrame, 213, -33)

-- Mounts, Pet Journal, Toy Box, Heirlooms, Appearances
CollectionsJournalTab1:ClearAllPoints()
CollectionsJournalTab1:SetPoint("BOTTOMLEFT", CollectionsJournal, -10, -33)
CollectionsJournalTab2:ClearAllPoints()
CollectionsJournalTab2:SetPoint("BOTTOMLEFT", CollectionsJournal, 48, -33)
CollectionsJournalTab3:ClearAllPoints()
CollectionsJournalTab3:SetPoint("BOTTOMLEFT", CollectionsJournal, 128, -33)
CollectionsJournalTab4:ClearAllPoints()
CollectionsJournalTab4:SetPoint("BOTTOMLEFT", CollectionsJournal, 192, -33)
CollectionsJournalTab5:ClearAllPoints()
CollectionsJournalTab5:SetPoint("BOTTOMLEFT", CollectionsJournal, 264, -33)
-- Spellbook, Professions
SpellBookFrameTabButton1:ClearAllPoints()
SpellBookFrameTabButton1:SetPoint("BOTTOMLEFT", SpellBookFrame, -10, -32)
SpellBookFrameTabButton1.ClearAllPoints = DoNothing
SpellBookFrameTabButton1.SetPoint = DoNothing
SpellBookFrameTabButton2:ClearAllPoints()
SpellBookFrameTabButton2:SetPoint("BOTTOMLEFT", SpellBookFrame, 62, -32)

-- Achievements
AchievementFrameTab1:ClearAllPoints()
AchievementFrameTab1:SetPoint("BOTTOMLEFT", AchievementFrame, -10, -32)
AchievementFrameTab1.ClearAllPoints = DoNothing
AchievementFrameTab1.SetPoint = DoNothing
AchievementFrameTab2:ClearAllPoints()
AchievementFrameTab2:SetPoint("RIGHT", AchievementFrameTab1, "CENTER", (AchievementFrameTab1:GetWidth()+8), 0)
AchievementFrameTab3:ClearAllPoints()
AchievementFrameTab3:SetPoint("RIGHT", AchievementFrameTab2, "CENTER", (AchievementFrameTab1:GetWidth()+8), 0)
AchievementFrameTab3.ClearAllPoints = DoNothing
AchievementFrameTab3.SetPoint = DoNothing

-- Guild
GuildFrameTab1:ClearAllPoints()
GuildFrameTab1:SetPoint("BOTTOMLEFT", GuildFrame, -10, -32)
GuildFrameTab2:ClearAllPoints()
GuildFrameTab2:SetPoint("BOTTOMLEFT", GuildFrame, 39, -32)
GuildFrameTab3:ClearAllPoints()
GuildFrameTab3:SetPoint("BOTTOMLEFT", GuildFrame, 95, -32)
GuildFrameTab4:ClearAllPoints()
GuildFrameTab4:SetPoint("BOTTOMLEFT", GuildFrame, 146, -32)
GuildFrameTab5:ClearAllPoints()
GuildFrameTab5:SetPoint("BOTTOMLEFT", GuildFrame, 211, -32)
end)


 local rTalentScript = function()
  -- local _, englishClass = UnitClass("player") -- Checking for Hunters so we move Pet Frame
  if PlayerTalentFrame then

   
    --[[for i=1, 4 do
      talentTab = _G['PlayerTalentFrameTab'..i]
      local point, anchor, anchorPoint, x = _G['PlayerTalentFrameTab'..i]:GetPoint()]]
  PlayerTalentFrameTab1:ClearAllPoints()
  PlayerTalentFrameTab1:SetPoint("BOTTOMLEFT", PlayerTalentFrame, -10, -38)
  PlayerTalentFrameTab2:ClearAllPoints()
  PlayerTalentFrameTab2:SetPoint("RIGHT", PlayerTalentFrameTab1, "CENTER", (PlayerTalentFrameTab1:GetWidth()+3), 0)
  PlayerTalentFrameTab3:ClearAllPoints()
  PlayerTalentFrameTab3:SetPoint("RIGHT", PlayerTalentFrameTab2, "CENTER", (PlayerTalentFrameTab1:GetWidth()+18), 0)


  end
end
-- Warboard Frame
local rWarboardScript = function()
  for i = 1,3 do 
    local choiceFrame = _G["WarboardQuestChoiceFrameOption"..i]
    choiceFrame.Header.Background:Hide()
    choiceFrame.Nail:Hide()
    choiceFrame.OptionText:SetTextColor(1,1,1)
    choiceFrame.Header.Text:SetTextColor(1,1,1)
    
  end
end

hooksecurefunc("WarboardQuestChoice_LoadUI", rWarboardScript)
-- hooksecurefunc("PlayerTalentFrame_UpdateTabs", rTalentScript) -- Why can  ElvUI use various funcs like this one but i cant ??
rTabFrame:SetScript("OnUpdate", rTalentScript)