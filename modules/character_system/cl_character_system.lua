CharacterSystem = CharacterSystem or {}

function OpenCharacterSystemMenu(data, close)
	local ww, hh = ScrW(), ScrH()
	local selected_character = 1
	if IsValid(CharacterSystemMenu) then CharacterSystemMenu:Remove() end
	CharacterSystemMenu = vgui.Create("DFrame")
	CharacterSystemMenu:SetPos(0, 0)
	CharacterSystemMenu:SetSize(ww, hh)
	CharacterSystemMenu:SetTitle("")
	CharacterSystemMenu:SetDraggable(false)
	CharacterSystemMenu:ShowCloseButton(close)
	CharacterSystemMenu.Paint = function(panel, w, h)
		surface.SetDrawColor(255,255,255)
		surface.SetMaterial(CharacterSystem.Cfg.BackGround)
		surface.DrawTexturedRect(0,0,w,h)
	end
	
	if IsValid(FrameMain) then FrameMain:Remove() end
	FrameMain = vgui.Create("DFrame", CharacterSystemMenu)
	FrameMain:SetSize(ww - 100, hh - 100)
	FrameMain:SetPos(50, 50)
	FrameMain:MakePopup()
	FrameMain:SetTitle("")
	FrameMain:ShowCloseButton(false)
	FrameMain:SetDraggable(false)
	FrameMain:MakePopup()
	FrameMain.Paint = function(pnl, w, h)
		//draw.RoundedBox(0,0,0,w,h, color_white)
	end

	local FrameLeft = FrameMain:Add("DPanel")
	FrameLeft:SetWide(FrameMain:GetWide()/2 - 45)
	FrameLeft:DockMargin(5, 5, 10, 40)
	FrameLeft:Dock(LEFT)
	FrameLeft:SetText("")
	FrameLeft.Paint = function(pnl, w, h)
	end

	CharModelPan = FrameLeft:Add('DPanel')
	CharModelPan:SetWide((FrameMain:GetWide()/2 - 45)/2)
	CharModelPan:Dock(RIGHT)
	CharModelPan.Paint = function( self, w, h )
		draw.RoundedBox(10, 0, 0, w, h, Color(255, 255, 255, 5))
		draw.RoundedBox(10, 0, 0, w, 4, color_white)
		draw.RoundedBox(10, 0, h-4, w, 4, color_white)
	end

	CharModelPanDModel = vgui.Create('DModelPanel', CharModelPan)
	model = mopp.jobs[data[selected_character].team.index].WorldModel
	CharModelPanDModel:SetModel(model)
	CharModelPanDModel:Dock(FILL)
	CharModelPanDModel:SetFOV(35)
	CharModelPanDModel.Angles = Angle(0,0,0)
	local rnd = 2
	function CharModelPanDModel:LayoutEntity( ent )
		if self.bAnimated then
			self:RunAnimation()
		end
		if self.Pressed then
			local mx, my = gui.MousePos()
			self.Angles = self.Angles - Angle( 0, ( self.PressX or mx ) - mx, 0 )
			self.PressX, self.PressY = gui.MousePos()
		end
		ent:SetAngles( self.Angles )
		ent:SetSequence(ent:LookupSequence("pose_standing_0"..rnd))
	end
	local SelectChar = vgui.Create('DButton', CharModelPan)
	SelectChar:Dock(FILL)
	SelectChar:SetText("")
	SelectChar.Paint = function( self, w, h ) end
	function SelectChar:DragMousePress()
		CharModelPanDModel.PressX, CharModelPanDModel.PressY = gui.MousePos()
		CharModelPanDModel.Pressed = true
	end
	function SelectChar:DragMouseRelease()
		timer.Simple(0.01,function()
			if CharModelPanDModel and CharModelPanDModel.Pressed and self then
				CharModelPanDModel.Pressed = false
			end
		end)
	end

	LeftPanel = FrameLeft:Add("DPanel")
	LeftPanel:SetWide((FrameMain:GetWide()/2 - 45)/2)
	LeftPanel:Dock(LEFT)
	LeftPanel:SetText("")
	LeftPanel.Paint = function(pnl, w, h)
		surface.SetFont("font_base_big")
		local x, y = surface.GetTextSize(data[selected_character].name)
		draw.ShadowSimpleText(mopp.jobs[data[selected_character].team.index].Name, "font_base_rotate", 30, h/3, mopp.jobs[data[selected_character].team.index].Color, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		draw.ShadowSimpleText(data[selected_character].name, "font_base_big", 30, h/3 + 35, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		draw.ShadowSimpleText(data[selected_character].rpid, "font_base_22", 30 + x + 5, h/3 + 35, Color(255,255,255, 150), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		draw.ShadowSimpleText(data[selected_character].data.legion, "font_base_rotate", 30, h/3 + 75, Color(255,255,255, 150), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
		draw.ShadowSimpleText(data[selected_character].data.rank, "font_base_rotate", 30, h/3 + 105, Color(255,255,255, 150), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
	end

	local FrameRight = FrameMain:Add("DPanel")
	FrameRight:SetWide(FrameMain:GetWide()/2 - 45)
	FrameRight:DockMargin(10, 5, 5, 40)
	FrameRight:Dock(RIGHT)
	FrameRight:SetText("")
	FrameRight.Paint = function(pnl, w, h)
	end

	RightPanel = FrameRight:Add("DPanel")
	RightPanel:SetTall(50)
	RightPanel:Dock(TOP)
	RightPanel:SetText("")
	RightPanel.Paint = function(pnl, w, h)
		draw.ShadowSimpleText("Выберите персонажа для начала игры", "font_base_title", w/2, 5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	end

	RightPanelScroll = FrameRight:Add("DScrollPanel")
	RightPanelScroll:DockMargin(10, 10, 10, 10)
	RightPanelScroll:Dock(FILL)
	RightPanelScroll.Paint = function( self, w, h )
	end
	local sbar = RightPanelScroll:GetVBar()
	sbar:SetWide(20)
	function sbar:Paint(w, h)
		draw.RoundedBox(10, w/2, 0, w/8, h, Color(100, 100, 100, 150))
	end
	function sbar.btnUp:Paint(w, h) end
	function sbar.btnDown:Paint(w, h) end
	function sbar.btnGrip:Paint(w, h)
		draw.RoundedBox(10, w/2, 0, w/8, h, Color(255, 255, 255, 150))
	end

	local RightPanelCharactersList = RightPanelScroll:Add("DIconLayout")
	RightPanelCharactersList:Dock(FILL)
	RightPanelCharactersList:SetBorder( 20 )
	RightPanelCharactersList:SetSpaceY( 25 )
	RightPanelCharactersList:SetSpaceX( 33 )

	for i = 1, (CharacterSystem.Cfg.MaxCharacters[LocalPlayer():SteamID()] or CharacterSystem.Cfg.MaxCharacters[LocalPlayer():GetUserGroup()] or CharacterSystem.Cfg.MaxCharacters["user"]) do
		if data[i] then
			local CharacterPanel = RightPanelCharactersList:Add("DPanel")
			CharacterPanel:SetSize(FrameRight:GetWide()/2.5, FrameRight:GetWide()/2.5)
			CharacterPanel:SetText("")
			CharacterPanel.Paint = function(pnl, w, h)
				draw.RoundedBox(10, 0, 0, w, h, Color(0, 0, 0, 60))
				surface.SetDrawColor(Color(255,255,255, 100))
				pnl:DrawOutlinedRect()
			end
	
			local DModel = vgui.Create('DModelPanel', CharacterPanel)
			model = mopp.jobs[data[i].team.index].WorldModel
			DModel:SetModel(model)
			DModel:Dock(FILL)
			DModel:SetFOV(25)
			DModel.Angles = Angle(0,45,0)
			local rnd = 2
			function DModel:LayoutEntity( ent )
				ent:SetAngles( self.Angles )
				ent:SetSequence(ent:LookupSequence("pose_standing_0"..rnd))
			end
	
			local mn, mx = DModel.Entity:GetRenderBounds()
			local size = 0
			size = math.max( size, math.abs(mn.x) + math.abs(mx.x) )
			size = math.max( size, math.abs(mn.y) + math.abs(mx.y) )
			size = math.max( size, math.abs(mn.z) + math.abs(mx.z) )
			
			DModel:SetFOV( 20 )
			DModel:SetCamPos( Vector( size, size, size*0.5 ) )
			DModel:SetLookAt( Vector( 0,0,mx.z - 15 ) )
	
			local SelectChar = vgui.Create('DButton', CharacterPanel)
			SelectChar:Dock(FILL)
			SelectChar:SetText("")
			SelectChar.Paint = function(self, w, h)
				surface.SetDrawColor(255,255,255)
				surface.DrawOutlinedRect(0,0,w,h)
				draw.ShadowSimpleText(mopp.jobs[data[i].team.index].Name, "font_base_22", 5, 5, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				draw.ShadowSimpleText(data[i].data.rank, "font_base_22", 5, 25, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				draw.ShadowSimpleText(data[i].data.legion, "font_base_22", 5, h-5, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
			end
			SelectChar.DoClick = function(self, w, h)
				selected_character = i
				CharModelPanDModel:SetModel(mopp.jobs[data[selected_character].team.index].WorldModel)
			end
		else
			local CharacterPanel = RightPanelCharactersList:Add("DButton")
			CharacterPanel:SetSize(FrameRight:GetWide()/2.5, FrameRight:GetWide()/2.5)
			CharacterPanel:SetText("")
			CharacterPanel.Paint = function(pnl, w, h)
				draw.RoundedBox(10, 0, 0, w, h, Color(0, 0, 0, 60))
				if pnl.hover then
					surface.SetDrawColor(Color(255,255,255, 255))
				else
					surface.SetDrawColor(Color(255,255,255, 100))
				end
				pnl:DrawOutlinedRect()
				draw.RoundedBox(10, w/2 - w/8, h/2 - 2, w/4, 4, color_white)
				draw.RoundedBox(10, w/2 - 2, h/2 - h/8, 4, h/4, color_white)
			end
			CharacterPanel.DoClick = function(self, w, h)
				netstream.Start("CharacterSystemCreateCharacter")
			end
			CharacterPanel.OnCursorEntered = function( self )
				self.hover = true
			end	
			CharacterPanel.OnCursorExited = function( self )
				self.hover = false
			end
		end
	end

	local CharacterPanel = LeftPanel:Add("DButton")
	CharacterPanel:DockMargin(30, 10, 10, 0)
	CharacterPanel:SetTall(50)
	CharacterPanel:Dock(BOTTOM)
	CharacterPanel:SetText("")
	CharacterPanel.Paint = function(pnl, w, h)
		draw.RoundedBox(10, 0, 0, w, h, Color(0, 0, 0, 60))
		if pnl.hover then
			surface.SetDrawColor(Color(255,255,255, 255))
		else
			surface.SetDrawColor(Color(255,255,255, 100))
		end
		pnl:DrawOutlinedRect()
		draw.ShadowSimpleText("Начать играть", "font_base", w/2, h/2, Color(255,255,255,200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	CharacterPanel.DoClick = function(self, w, h)
		netstream.Start("CharacterSystemChangeCharacter", selected_character)
		CharacterSystemMenu:Remove()
	end
	CharacterPanel.OnCursorEntered = function( self )
		self.hover = true
	end	
	CharacterPanel.OnCursorExited = function( self )
		self.hover = false
	end
end

netstream.Hook("CharacterSystemOpenMenu", function(data)
	OpenCharacterSystemMenu(data)
end)