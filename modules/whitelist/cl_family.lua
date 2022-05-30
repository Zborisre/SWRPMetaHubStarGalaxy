--[[
Server Name: ✦ TheForceConflict | [Быстрая загрузка]
Server IP:   212.22.93.170:27016
File Path:   gamemodes/starwarsrp/gamemode/modules/whitelist/cl_family.lua
		 __        __              __             ____     _                ____                __             __         
   _____/ /_____  / /__  ____     / /_  __  __   / __/____(_)__  ____  ____/ / /_  __     _____/ /____  ____ _/ /__  _____
  / ___/ __/ __ \/ / _ \/ __ \   / __ \/ / / /  / /_/ ___/ / _ \/ __ \/ __  / / / / /    / ___/ __/ _ \/ __ `/ / _ \/ ___/
 (__  ) /_/ /_/ / /  __/ / / /  / /_/ / /_/ /  / __/ /  / /  __/ / / / /_/ / / /_/ /    (__  ) /_/  __/ /_/ / /  __/ /    
/____/\__/\____/_/\___/_/ /_/  /_.___/\__, /  /_/ /_/  /_/\___/_/ /_/\__,_/_/\__, /____/____/\__/\___/\__,_/_/\___/_/     
                                     /____/                                 /____/_____/                                  
--]]

local whitelistpanel

netstream.Hook("sfh_whitelist_menu", function(data)
	local tbl = data

	if IsValid(whitelistpanel) then whitelistpanel.AppList:OnReload(tbl) return end

	local f = vgui.Create("DFrame")
	f:SetSize( 500, 500 )
	f:AlignRight()
	f:AlignBottom()
	f:SetTitle("Steam Family Sharing WhiteList")
	f:Center()
	f:MakePopup()

	local AppList = f:Add("DListView")
	AppList:Dock(FILL)
	AppList:SetMultiSelect(false)
	AppList:AddColumn("Name")
	AppList:AddColumn("Steam ID")
	AppList:AddColumn("Value"):SetFixedWidth(60)
	AppList.OnRowRightClick = function(self, id, line)

		local Menu = DermaMenu()

		local btnWithIcon1 = Menu:AddOption("Открыть профиль", function(self)
		
			gui.OpenURL("http://steamcommunity.com/profiles/"..util.SteamIDTo64(line.steamid))
		end)
		btnWithIcon1:SetIcon( "icon16/world.png" )

		local btnWithIcon = Menu:AddOption("Удалить", function(self)
			
			RunConsoleCommand("whitelist", "remove", line.steamid)

		end)
		btnWithIcon:SetIcon( "icon16/delete.png" )

		Menu:Open()
	end

	for k, v in pairs(data) do
		local name
		steamworks.RequestPlayerInfo(util.SteamIDTo64(k), function(c) name = c end)
		timer.Simple(0.1, function()
			local line = AppList:AddLine(name, k, "Whitelisted")
			line.steamid = k
		end)
	end

	AppList.OnReload = function(self, data)
		self:Clear()	
		for k, v in pairs(data) do
			local name
			steamworks.RequestPlayerInfo(util.SteamIDTo64(k), function(c) name = c end)
			local line = self:AddLine(name, k, "Whitelisted")
			line.steamid = k
		end
	end

	f.AppList = AppList

	local p = f:Add("DPanel")
	p:Dock(BOTTOM)
	p:DockMargin(5, 10, 5, 5)
	p:SetTall(34)
	p.Paint = function(self)
		--cool stuff
	end

	local text_entry = p:Add("DTextEntry")
	text_entry:Dock( FILL )
	text_entry:DockMargin(5, 5, 0, 5)
	text_entry:SetText("STEAM_ID")
	text_entry.CheckText = function(self, text)
		if text:find("(STEAM_%d:%d:%d+)$") then
			RunConsoleCommand("whitelist", "add", tostring(text))
		else
			notification.AddLegacy("Не верный SteamID.", NOTIFY_ERROR, 5)
			return self:SetText("ERROR STEAMID!")
		end
	end
	text_entry.OnEnter = function(self)
		self:CheckText(self:GetText())
	end

	local a_button = p:Add("DButton")
	a_button:Dock( RIGHT )
	a_button:DockMargin(5, 5, 5, 5)
	a_button:SetWide(24)
	a_button:SetText("")
	a_button:SetImage("icon16/add.png")
	a_button.DoClick = function(self)
		text_entry:CheckText(text_entry:GetText())
	end
	whitelistpanel = f
end)
