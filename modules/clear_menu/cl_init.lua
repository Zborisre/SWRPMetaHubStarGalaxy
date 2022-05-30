surface.CreateFont("Charac_Font",{
	size = 20,
	font = "Glasten",
	weight = 8000,
})

net.Receive("ChooseFracOpen",function()

	local function n0thing() end

	function CharacterSys:CreatePutin(teams)
		
		self.CreatePoc = vgui.Create("DFrame")
		self.CreatePoc:SetWide(500)
		self.CreatePoc:SetTall(110)
		self.CreatePoc:ShowCloseButton(false)
		self.CreatePoc:SetTitle('Create Character')
		self.CreatePoc:SetDraggable(false)
		self.CreatePoc:SetBackgroundBlur( true )
		self.CreatePoc:Center()
		self.CreatePoc:MakePopup()
		
		self.ListPanel = vgui.Create("DPanelList",self.CreatePoc)
		self.ListPanel:SetAutoSize(true)
		self.ListPanel:Dock(FILL)
		self.ListPanel:SetSpacing(2)
		self.ListPanel:SetAlpha(0)
		self.ListPanel.Paint = nothing
		self.ListPanel:AlphaTo(255,1)
		self.ListPanel.Paint = n0thing
		
		self.NameList = vgui.Create("DPanelList")
		self.NameList:EnableHorizontal(true)
		self.ListPanel:AddItem(self.NameList)
		
		self.NameText = vgui.Create("DLabel")
		self.NameText:SetFont("Charac_Font")
		self.NameText:SetText'Имя:'
		self.NameText:SetTextColor(color_white)
		self.NameText:SizeToContents()
		self.NameList:AddItem(self.NameText)
		
		self.Name = vgui.Create("DTextEntry",self.ListPanel)
		self.Name:SetFont("Charac_Font")
		self.Name:SetNumeric(false)
		self.Name:SetTextColor(color_white)
		self.Name:SetWide(self.CreatePoc:GetWide()-self.NameText:GetWide()-20)
		self.Name:SetDrawBackground(true)
		self.NameList:AddItem(self.Name)
		
		self.SurnameList = vgui.Create("DPanelList")
		self.SurnameList:EnableHorizontal(true)
		self.ListPanel:AddItem(self.SurnameList)
		
		self.SurnameText = vgui.Create("DLabel")
		self.SurnameText:SetFont("Charac_Font")
		self.SurnameText:SetText'Фамилия:'
		self.SurnameText:SetTextColor(color_white)
		self.SurnameText:SizeToContents()
		self.SurnameList:AddItem(self.SurnameText)
		
		self.Surname = vgui.Create("DTextEntry",self.ListPanel)
		self.Surname:SetFont("Charac_Font")
		self.Surname:SetNumeric(false)
		self.Surname:SetTextColor(color_white)
		self.Surname:SetWide(self.CreatePoc:GetWide()-self.SurnameText:GetWide()-20)
		self.Surname:SetDrawBackground(true)
		self.SurnameList:AddItem(self.Surname)
		
		self.Apply = vgui.Create("DButton")
		self.Apply:SetText('Принять')
		self.ListPanel:AddItem(self.Apply)
		self.Apply.DoClick = function()
			CharacterSys.AddConfig[teams] = {
				["name"] = self.Name:GetValue(),
				["surname"] = self.Surname:GetValue(),
			}
			self.ListPanel:AlphaTo(0,1,0,function(l,pnl)
				net.Start("ChooseCharacteristics")
					net.WriteString(teams)
					net.WriteTable(CharacterSys.AddConfig[teams])
				net.SendToServer()
				self.CreatePoc:Remove()
				gui.EnableScreenClicker(false)
			end)
		end
		
	end

	function CharacterSys:ChooseFraction(_1,_2)

		CharacterSys.AddConfig = {}
		
		local Background = vgui.Create( "DFrame" )
		Background:SetWide(500)
		Background:SetTall(200)
		Background:Center()
		Background:SetBackgroundBlur( true )
		Background:SetTitle( "Fraction Teams" )
		Background:MakePopup() 	
		Background:ShowCloseButton(false)
		Background:SetDraggable(false)

		local RUButton = vgui.Create( "DButton", Background )
		RUButton:SetText( "Wehrmacht" )
		RUButton:Dock(TOP)
		RUButton:SetWide(ScrW())
		RUButton:SetTall(40)
		RUButton.DoClick = function()
			self:CreatePutin(_1)
			Background:Remove()
		end

		local USButton = vgui.Create( "DButton", Background )
		USButton:SetText( "CCCP" )
		USButton:Dock(TOP)
		USButton:SetWide(ScrW())
		USButton:SetTall(40)
		USButton.DoClick = function()
			self:CreatePutin(_2)
			Background:Remove()
		end

		local CloseButton = vgui.Create( "DButton", Background )
		CloseButton:SetText( "Close" )
		CloseButton:Dock(BOTTOM)
		CloseButton:SetWide(ScrW())
		CloseButton:SetTall(30)
		CloseButton.DoClick = function()
			Background:Remove()
		end
	end

	CharacterSys:ChooseFraction("USA","Russian")
	
end)