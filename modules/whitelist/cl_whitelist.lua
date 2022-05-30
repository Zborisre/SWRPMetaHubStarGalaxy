local characters = {"0", "!", "@", "#", "$", "%", "&", "?", "1"}
local stylized = {}
local BackgroundStrings = {
	
	}

local function StylizedText(text)

	local len = string.len(text)
	local str = ""
	
	if stylized[text] then
	
		str = stylized[text]
		
		for var = 1, len do
		
			if str[var] == text[var] then continue end
			
			str = string.sub(str, 1, var-1)..""..text[var]..""..string.sub(str, var+1)
			stylized[text] = str
			
			return str
		
		end
	
	else
	
		for var = 1, len do
		
			local char = characters[math.random(1, #characters)]
			str = str..""..char
		
		end
		
		stylized[text] = str
	
	end
	
	return str

end

local color_base = Color(75, 75, 75)
local color_alt = Color(125, 125, 125)

local function ButtonColor(pnl)

	local color = color_white
	
	if pnl:IsHovered() then
	
		color = color_alt
	
	end
	
	return color

end

local function TeamToID(tbl)

	local team_to_id = {}
	
	for k, v in pairs(tbl) do
	
		team_to_id[v.Name] = {team = v.jobID, index = k}
		
	end

	return team_to_id

end

function pMeta:OpenWhitelistProfile()

	if !IsValid(self) then return end
	
	local ply = self
	local check = LocalPlayer():isMeetRequirements()
	
	if !check || !check[ply:Team()] then return end
	
	local TeamTbl = TeamToID(check)
	
	local FRAME = vgui.Create("EditablePanel")
	FRAME:SetSize(720, 480)
	FRAME:Center()
	FRAME:MakePopup()
	FRAME.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, Color(100, 100, 100, 100))
	
	end
	
	local HEADER = vgui.Create("DPanel", FRAME)
	HEADER:Dock(TOP)
	HEADER:SetSize(0, 30)
	HEADER.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_base)
		draw.SimpleText(StylizedText("Управление пользователем"), "font_notify", w/2, h/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	end
	
	local BUTTONS = vgui.Create("DPanel", FRAME)
	BUTTONS:Dock(BOTTOM)
	BUTTONS:SetSize(0, 30)
	BUTTONS.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_base)
	
	end
	
	local CLOSE = vgui.Create("DButton", BUTTONS)
	CLOSE:Dock(RIGHT)
	CLOSE:DockPadding(5, 5, 5, 5)
	CLOSE:SetSize(100, 0)
	CLOSE:SetText("")
	CLOSE.Paint = function(s, w, h)
	
		draw.SimpleText("Закрыть", "font_notify", w/2, h/2, ButtonColor(CLOSE), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	end
	CLOSE.DoClick = function()
	
		FRAME:Remove()
		stylized["Управление пользователем"] = nil
	
	end
	
	local BACKGROUND = vgui.Create("RichText", FRAME)
	BACKGROUND:Dock(FILL)
	BACKGROUND:InsertColorChange(50, 255, 50, 255)
	BACKGROUND:AppendText(">\n")
	BACKGROUND.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_black)
	
	end
	
	local function AddBackgroundText(str)
	
		if !IsValid(BACKGROUND) then return end
		BACKGROUND:AppendText(str.."\n")
		BACKGROUND:GotoTextEnd()
	
	end
	
	for k,v in pairs(BackgroundStrings) do
	
		timer.Simple(k/10, function()
		
			if !IsValid(BACKGROUND) then return end
			
			AddBackgroundText(v)
		
		end)
	
	end
	
	local MAIN = vgui.Create("DPanel", BACKGROUND)
	MAIN:Dock(FILL)
	MAIN.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, Color(50, 50, 50, 230))
	
	end
	
	local CURRENT = vgui.Create("DPanel", MAIN)
	CURRENT:Dock(LEFT)
	CURRENT:SetSize(250, 0)
	CURRENT.Paint = function() end
	
	local MODEL = vgui.Create("DModelPanel", CURRENT)
	MODEL:Dock(FILL)
	MODEL:SetModel(ply:GetModel())
	function MODEL:LayoutEntity() return end
	local bone = MODEL.Entity:LookupBone("ValveBiped.Bip01_Head1")
	
	if bone && MODEL.Entity:GetBonePosition(bone) then
	
		local head = MODEL.Entity:GetBonePosition(bone)
		MODEL:SetLookAt(head)
		MODEL:SetCamPos(head-Vector(-20, 0, 0))
		MODEL.Entity:SetEyeTarget(head-Vector(-20, 0, 0))
	
	end
	
	local name, steamid, TeamID, usergroup = ply:OldName() or "NO DATA", ply:SteamID() or "NO DATA", ply:Team() or 1, ply:GetUserGroup()
	local character = ply:GetNVar('mo_character') or 1
	local data = ply.GetNVar and ply:GetNVar("mo_data")[character].data or {}
	local rpid = ply.GetNVar && ply:GetNVar("mo_rpid") or "0000"
	local rank, legion = data.rank or "", data.legion or ""
        local names = ply.GetNVar && ply:GetNVar("mo_name") or "NO DATA"
	
	local INFO = vgui.Create("DPanel", CURRENT)
	INFO:Dock(BOTTOM)
	INFO:DockMargin(5, 5, 5, 5)
	INFO:SetSize(0, 75)
	INFO.Paint = function() end
	
	local INFO_NAME = Label("Имя: "..name, INFO)
	INFO_NAME:Dock(TOP)
	INFO_NAME:SetFont("font_scoreboard")
	INFO_NAME:SetColor(color_white)
	
	local INFO_STEAM = Label("SteamID: "..steamid, INFO)
	INFO_STEAM:Dock(TOP)
	INFO_STEAM:SetFont("font_scoreboard")
	INFO_STEAM:SetColor(color_white)
	
	local INFO_USERGROUP = Label("Привилегия: "..serverguard.ranks:GetRank(usergroup).name or usergroup, INFO)
	INFO_USERGROUP:Dock(TOP)
	INFO_USERGROUP:SetFont("font_scoreboard")
	INFO_USERGROUP:SetColor(color_white)
	
	local EDIT = vgui.Create("DPanel", MAIN)
	EDIT:Dock(FILL)
	EDIT.Paint = function() end
	
	local function AddEditable(pnl, margin)
	
		if !(IsValid(pnl) && IsValid(EDIT)) then return end
		
		pnl:Dock(TOP)
		pnl:DockMargin(5, 0, 5, 0)
		
		if !margin then return end
		
		pnl:DockMargin(5, 5, 5, 0)
	
	end
	
	local function AddHelp(text)
	
		local HELP = Label(text, EDIT)
		HELP:Dock(TOP)
		HELP:DockMargin(5, 5, 5, 0)
		HELP:SetFont("font_scoreboard_small")
		HELP:SetColor(color_white)
	
	end
	
        AddHelp("NAME")

        local EDIT_NAME = vgui.Create("DTextEntry", EDIT)
	AddEditable(EDIT_NAME)
	EDIT_NAME:SetMultiline(false)
	EDIT_NAME:SetDrawLanguageID(false)
	EDIT_NAME:SetValue(names)
	EDIT_NAME.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_alt)
		surface.SetDrawColor(color_black:Unpack())
		surface.DrawOutlinedRect(0, 0, w, h, 1)
		draw.SimpleText(s:GetValue(), "font_scoreboard", 5, h/2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	
	end

	AddHelp("ID")
	
	local EDIT_ID = vgui.Create("DTextEntry", EDIT)
	AddEditable(EDIT_ID)
	EDIT_ID:SetValue(rpid)
	EDIT_ID:SetNumeric(true)
	EDIT_ID:SetMultiline(false)
	EDIT_ID:SetDrawLanguageID(false)
	EDIT_ID:SetDisabled(!serverguard.player:HasPermission(LocalPlayer(), "WhitelistControlPlus"))
	EDIT_ID.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_alt)
		surface.SetDrawColor(color_black:Unpack())
		surface.DrawOutlinedRect(0, 0, w, h, 1)
		draw.SimpleText(s:GetValue(), "font_scoreboard", 5, h/2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		
		if !s:GetDisabled() then return end
		
		draw.RoundedBox(0, 0, 0, w, h, Color(50, 50, 50, 230))
	
	end
	
	AddHelp("Форма")
	
	--Рабочий код с поиском. Изменен на обычный список по просьбе заказчика
	
	--[[
	local EDIT_TEAM = vgui.Create("DTextEntry", EDIT)
	EDIT_TEAM:SetValue(team.GetName(TeamID))
	EDIT_TEAM:SetMultiline(false)
	EDIT_TEAM:SetDrawLanguageID(false)
	AddEditable(EDIT_TEAM)
	EDIT_TEAM.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_alt)
		surface.SetDrawColor(color_black:Unpack())
		surface.DrawOutlinedRect(0, 0, w, h, 1)
		draw.SimpleText(s:GetValue(), "font_scoreboard", 5, h/2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	
	end
	
	local x, y = EDIT_TEAM:GetPos()
	local results = {}
	
	local function ShowResults()
	
		local search = DermaMenu(false, MAIN)
		search:SetPos(0, y)
		search:SetMaxHeight(300)
		search.OpenSubMenu = function() end
		
		for _,v in pairs(results) do
		
			search:AddOption(v, function() EDIT_TEAM:SetText(v) end)
		
		end
	
	end
	
	EDIT_TEAM.OnChange = function(s)
	
		results = {}
		
		for _, team in pairs(check) do
		
			local TeamName = team.Name
			local op, ed = string.find(TeamName, s:GetValue(), 1, true)
			
			if !op then continue end
			
			table.insert(results, TeamName)
		
		end
	
	end
	
	EDIT_TEAM.OnEnter = ShowResults
	EDIT_TEAM.OnLoseFocus = ShowResults
	]]--
	
	local EDIT_TEAM = vgui.Create("DComboBox", EDIT)
	AddEditable(EDIT_TEAM)
	EDIT_TEAM:SetValue(team.GetName(TeamID))
	EDIT_TEAM:SetTextColor(Color(0, 0, 0, 0))
	EDIT_TEAM.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_alt)
		surface.SetDrawColor(color_black:Unpack())
		surface.DrawOutlinedRect(0, 0, w, h, 1)
		draw.SimpleText(s:GetValue(), "font_scoreboard", 5, h/2, mopp.jobs[ply:Team()].Color, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	
	end
	
	for _,v in SortedPairsByMemberValue(check, "Name") do
	
		local TeamName = v.Name
		
		EDIT_TEAM:AddChoice(TeamName, TeamName)
	
	end
	
	AddHelp("Легион")
	
	local EDIT_LEGION = vgui.Create("DTextEntry", EDIT)
	AddEditable(EDIT_LEGION)
	EDIT_LEGION:SetMultiline(false)
	EDIT_LEGION:SetDrawLanguageID(false)
	EDIT_LEGION:SetValue(legion)
	EDIT_LEGION.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_alt)
		surface.SetDrawColor(color_black:Unpack())
		surface.DrawOutlinedRect(0, 0, w, h, 1)
		draw.SimpleText(s:GetValue(), "font_scoreboard", 5, h/2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	
	end
	
	AddHelp("Ранг")
	
	local EDIT_RANK = vgui.Create("DTextEntry", EDIT)
	AddEditable(EDIT_RANK)
	EDIT_RANK:SetMultiline(false)
	EDIT_RANK:SetDrawLanguageID(false)
	EDIT_RANK:SetValue(rank)
	EDIT_RANK.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_alt)
		surface.SetDrawColor(color_black:Unpack())
		surface.DrawOutlinedRect(0, 0, w, h, 1)
		draw.SimpleText(s:GetValue(), "font_scoreboard", 5, h/2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	
	end
	
	AddHelp("Разрешения")
	
	local EDIT_FEATURES = vgui.Create("DScrollPanel", EDIT)
	local EDIT_FEATURES_BAR = EDIT_FEATURES:GetVBar()
	EDIT_FEATURES:Dock(FILL)
	EDIT_FEATURES:DockMargin(5, 5, 5, 5)
	EDIT_FEATURES.Paint = function(s, w, h)
	
		surface.SetDrawColor(color_alt:Unpack())
		surface.DrawOutlinedRect(0, 0, w, h, 1)
	
	end
	EDIT_FEATURES_BAR.Paint = EDIT_FEATURES.Paint
	EDIT_FEATURES_BAR.btnGrip.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 2, 2, w-4, h-4, color_alt)
	
	end
	EDIT_FEATURES_BAR.btnUp.Paint = EDIT_FEATURES_BAR.btnGrip.Paint
	EDIT_FEATURES_BAR.btnDown.Paint = EDIT_FEATURES_BAR.btnGrip.Paint
	
	
	local features = {}
	
	for k, v in pairs(mopp.cfg.features) do
	
		if !(data && data.features) then return end
		
		local FEATURE = vgui.Create("DCheckBoxLabel", EDIT_FEATURES)
		FEATURE:Dock(TOP)
		FEATURE:DockMargin(5, 4, 5, 0)
		FEATURE:SetText(v.title)
		FEATURE.Label:SetFont("font_scoreboard_small")
		FEATURE.Label:SetColor(color_white)
		FEATURE.Button.Paint = function(s, w, h)
		
			surface.SetDrawColor(color_alt:Unpack())
			surface.DrawOutlinedRect(0, 0, w, h, 1)
			
			local CheckColor = Color(175, 0, 0, 255)
			
			if s:GetChecked() then
			
				CheckColor = Color(0, 175, 38, 255)
			
			end
			
			draw.RoundedBox(0, 3, 3, w-6, h-6, CheckColor)
		
		end
		FEATURE.OnChange = function(s, val)
		
			features[v.prefix] = val
		
		end
		FEATURE:SetValue(data.features[v.prefix])
	
	end
	
	local FLAGS = vgui.Create("DPanel", EDIT)
	FLAGS:Dock(BOTTOM)
	FLAGS:DockMargin(5, 0, 5, 5)
	FLAGS:SetSize(0, 16)
	FLAGS.Paint = function() end
	
	local function BlyatCheckBoxLabel(parent, txt)
	
		local PNL = vgui.Create("DPanel", parent)
		PNL.Paint = function() end
		
		PNL.CHECK = vgui.Create("DCheckBox", PNL)
		PNL.CHECK:Dock(LEFT)
		PNL.CHECK:DockMargin(0, 0, 5, 0)
		PNL.CHECK:SetSize(16, 0)
		PNL.CHECK.Paint = function(s, w, h)
			
			surface.SetDrawColor(color_alt:Unpack())
			surface.DrawOutlinedRect(0, 0, w, h, 1)
			
			if !s:GetChecked() then return end
			
			draw.RoundedBox(0, 3, 3, w-6, h-6, color_white)
		
		end
		
		PNL.LABEL = vgui.Create("DLabel", PNL)
		PNL.LABEL:Dock(FILL)
		PNL.LABEL:SetFont("font_scoreboard_small")
		PNL.LABEL:SetColor(color_white)
		PNL.LABEL:SetText(txt)
		
		function PNL:GetChecked()
		
			return self.CHECK:GetChecked()
		
		end
		
		return PNL
	
	end
	
	local FLAG_RESPAWN = BlyatCheckBoxLabel(FLAGS, "Зареспавнить")
	FLAG_RESPAWN:Dock(LEFT)
	FLAG_RESPAWN:SetSize(110, 0)
	
	local FLAG_TIMED = BlyatCheckBoxLabel(FLAGS, "Временно")
	FLAG_TIMED:Dock(LEFT)
	FLAG_TIMED:SetSize(110, 0)
	
	local CONFIRM = vgui.Create("DButton", BUTTONS)
	CONFIRM:Dock(RIGHT)
	CONFIRM:DockPadding(5, 5, 5, 5)
	CONFIRM:SetSize(125, 0)
	CONFIRM:SetText("")
	CONFIRM.Paint = function(s, w, h)
	
		draw.SimpleText("Подтвердить", "font_notify", w/2, h/2, ButtonColor(CONFIRM), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	end
	CONFIRM.DoClick = function()
	
		local tbl = {
		 
		 target = ply,
		 rpid = EDIT_ID:GetValue(),
		 team = TeamTbl[EDIT_TEAM:GetValue()],
		 legion = EDIT_LEGION:GetValue(),
		 rank = EDIT_RANK:GetValue(),
		 features = features,
		 respawn = FLAG_RESPAWN:GetChecked(),
		 timed = FLAG_TIMED:GetChecked()
		
		}
		
		netstream.Start("WhiteList_ChangeProfile", tbl)
		FRAME:Remove()
	
	end

end

netstream.Hook("WhiteList_OpenMenu", function()

	local check = LocalPlayer():isMeetRequirements()
	
	if !check then return end
	
	local FRAME = vgui.Create("EditablePanel")
	FRAME:SetSize(500, 480)
	FRAME:Center()
	FRAME:MakePopup()
	FRAME.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, Color(100, 100, 100, 100))
	
	end
	
	local HEADER = vgui.Create("DPanel", FRAME)
	HEADER:Dock(TOP)
	HEADER:SetSize(0, 30)
	HEADER.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_base)
		draw.SimpleText(StylizedText("Вайтлист"), "font_notify", w/2, h/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	end
	
	local BUTTONS = vgui.Create("DPanel", FRAME)
	BUTTONS:Dock(BOTTOM)
	BUTTONS:SetSize(0, 30)
	BUTTONS.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_base)
	
	end
	
	local CLOSE = vgui.Create("DButton", BUTTONS)
	CLOSE:Dock(RIGHT)
	CLOSE:DockPadding(5, 5, 5, 5)
	CLOSE:SetSize(100, 0)
	CLOSE:SetText("")
	CLOSE.Paint = function(s, w, h)
	
		draw.SimpleText("Закрыть", "font_notify", w/2, h/2, ButtonColor(CLOSE), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	
	end
	CLOSE.DoClick = function()
	
		FRAME:Remove()
		stylized["Вайтлист"] = nil
	
	end
	
	local BACKGROUND = vgui.Create("RichText", FRAME)
	BACKGROUND:Dock(FILL)
	BACKGROUND:InsertColorChange(50, 255, 50, 255)
	BACKGROUND:AppendText(">\n")
	BACKGROUND.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_black)
	
	end
	
	local function AddBackgroundText(str)
	
		if !IsValid(BACKGROUND) then return end
		BACKGROUND:AppendText(str.."\n")
		BACKGROUND:GotoTextEnd()
	
	end
	
	for k,v in pairs(BackgroundStrings) do
	
		timer.Simple(k/10, function()
		
			if !IsValid(BACKGROUND) then return end
			
			AddBackgroundText(v)
		
		end)
	
	end
	
	local MAIN = vgui.Create("DPanel", BACKGROUND)
	MAIN:Dock(FILL)
	MAIN.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, Color(50, 50, 50, 230))
	
	end
	
	local LIST = vgui.Create("DScrollPanel", MAIN)
	LIST:Dock(FILL)
	LIST:DockMargin(5, 5, 5, 5)
	LIST.Paint = function() end
	local LIST_BAR = LIST:GetVBar()
	LIST_BAR.Paint = function(s, w, h)
	
		surface.SetDrawColor(color_alt:Unpack())
		surface.DrawOutlinedRect(0, 0, w, h, 1)
	
	end
	LIST_BAR.btnGrip.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 2, 2, w-4, h-4, color_alt)
	
	end
	LIST_BAR.btnUp.Paint = LIST_BAR.btnGrip.Paint
	LIST_BAR.btnDown.Paint = LIST_BAR.btnGrip.Paint
	
	local SEARCH = vgui.Create("DTextEntry", MAIN)
	SEARCH:Dock(TOP)
	SEARCH:DockMargin(5, 5, 5, 5)
	SEARCH:SetMultiline(false)
	SEARCH:SetDrawLanguageID(false)
	SEARCH.Paint = function(s, w, h)
	
		draw.RoundedBox(0, 0, 0, w, h, color_alt)
		surface.SetDrawColor(color_black:Unpack())
		surface.DrawOutlinedRect(0, 0, w, h, 1)
		draw.SimpleText(s:GetValue(), "font_scoreboard", 5, h/2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	
	end
	
	SEARCH.OnChange = function(s)
	
		LIST:Clear()
		
		for _,ply in pairs(player.GetAll()) do
		
			if !(IsValid(ply) && check[ply:Team()]) then return end
			
			local name = ply:NameWithSteamID()
			local op, ed = string.find(string.lower(name), s:GetValue(), 1, true)
			
			if !op then continue end
			
			local PLAYER = vgui.Create("DButton", LIST)
			PLAYER:Dock(TOP)
			PLAYER:DockMargin(5, 5, 5, 0)
			PLAYER:SetSize(0, 30)
			PLAYER:SetText("")
			PLAYER.Paint = function(s, w, h)
			
				draw.RoundedBox(0, 0, 0, w, h, color_base)
				draw.RoundedBox(0, 0, h-2, w, 2, team.GetColor(ply:Team()))
				draw.SimpleText(name, "font_scoreboard", 30, h/2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			
			end
			PLAYER.DoClick = function()
			
				ply:OpenWhitelistProfile()
				CLOSE:DoClick()
			
			end
			
			local AVATAR = vgui.Create("AvatarImage", PLAYER)
			AVATAR:SetPos(7, 7)
			AVATAR:SetSize(16, 16)
			AVATAR:SetPlayer(ply, 16)
		
		end
	
	end
	
	for _,ply in pairs(player.GetAll()) do
	
		if !(IsValid(ply) && check[ply:Team()]) then return end
		
		local PLAYER = vgui.Create("DButton", LIST)
		PLAYER:Dock(TOP)
		PLAYER:DockMargin(5, 5, 5, 0)
		PLAYER:SetSize(0, 30)
		PLAYER:SetText("")
		PLAYER.Paint = function(s, w, h)
		
			draw.RoundedBox(0, 0, 0, w, h, color_base)
			draw.RoundedBox(0, 0, h-2, w, 2, team.GetColor(ply:Team()))
			draw.SimpleText(ply:Name(), "font_scoreboard", 30, h/2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		
		end
		PLAYER.DoClick = function()
		
			ply:OpenWhitelistProfile()
			CLOSE:DoClick()
		
		end
		
		local AVATAR = vgui.Create("AvatarImage", PLAYER)
		AVATAR:SetPos(7, 7)
		AVATAR:SetSize(16, 16)
		AVATAR:SetPlayer(ply, 16)
	
	end

end)