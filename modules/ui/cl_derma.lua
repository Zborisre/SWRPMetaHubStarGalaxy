--[[
gamemodes/starwarsrp/gamemode/modules/ui/cl_derma.lua
--]]
surface.CreateFont( "ui.button", {

	font = "Roboto",

	size = 16,

	weight = 1000,

	extended = true

})

surface.CreateFont( "ui.subtitle", {

	font = "Roboto Condensed",

	size = 19,

	weight = 500,

	extended = true

})

surface.CreateFont( "ui.ee", {

	font = "Roboto",

	size = 16,

	weight = 500,

	extended = true

})

surface.CreateFont( "ui.entry", {

	font = "Roboto",

	size = 20,

	weight = 500,

	extended = true,

	italic = true

})

surface.CreateFont( "ui.title", {

	font = "Electrolize [RUS by Daymarius]",

	size = 19,

	weight = 1000,

	extended = true

})



/*

	=====================

	Общие функции

	=====================

*/



function surface.GetTextWidth(text, font)

	surface.SetFont(font)

	local width = select(1, surface.GetTextSize(text))

	return width

end



function surface.GetTextHeight(text, font)

	surface.SetFont(font)

	local height = select(2, surface.GetTextSize(text))

	return height

end



function draw.LinBox( x, y, w, h, thickness, clr )

	surface.SetDrawColor( clr )

	for i=0, thickness - 1 do

		surface.DrawOutlinedRect( x + i, y + i, w - i * 2, h - i * 2 )

	end

end



function draw.Box(x, y, width, height, color)

	surface.SetDrawColor(color.r, color.g, color.b, color.a)

	surface.DrawRect(x, y, width, height)

end



local blur = Material("pp/blurscreen")

function draw.Blur(panel, amount)

	local x, y = panel:LocalToScreen(0, 0)

	local scrW, scrH = ScrW(), ScrH()

	surface.SetDrawColor(255, 255, 255)

	surface.SetMaterial(blur)

	for i = 1, 3 do

		blur:SetFloat("$blur", (i / 3) * (amount or 6))

		blur:Recompute()

		render.UpdateScreenEffectTexture()

		surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)

	end

end



function draw.Icon(material, x, y, w, h, color)

	color = color or Color(255,255,255)

	surface.SetMaterial(Material(material))

	surface.SetDrawColor(color.r, color.g, color.b, color.a)

	surface.DrawTexturedRect(x, y, w, h)

end



local g_grds, g_wgrd, g_sz

function draw.GradientBox(x, y, w, h, al, ...)

	g_grds = {...}

	al = math.Clamp(math.floor(al), 0, 1)

	if(al == 1) then

		local t = w

		w, h = h, t

	end

	g_wgrd = w / (#g_grds - 1)

	local n

	for i = 1, w do

		for c = 1, #g_grds do

			n = c

			if(i <= g_wgrd * c) then break end

		end

		g_sz = i - (g_wgrd * (n - 1))

		surface.SetDrawColor(

			Lerp(g_sz/g_wgrd, g_grds[n].r, g_grds[n + 1].r),

			Lerp(g_sz/g_wgrd, g_grds[n].g, g_grds[n + 1].g),

			Lerp(g_sz/g_wgrd, g_grds[n].b, g_grds[n + 1].b),

			Lerp(g_sz/g_wgrd, g_grds[n].a, g_grds[n + 1].a))

		if(al == 1) then surface.DrawRect(x, y + i, h, 1)

		else surface.DrawRect(x + i, y, 1, h) end

	end

end




/*

	=====================

	Панели

	=====================

*/



/*

	FPanel

	- Panel

*/

local PANEL = {}

	AccessorFunc( PANEL, "blur", "Blur", FORCE_BOOL )

	AccessorFunc( PANEL, "dark", "Dark", FORCE_BOOL )

	function PANEL:Paint( w, h )

		if self:GetBlur() then

			draw.Blur(self, 2)

		end



		if self:GetDark() then

			draw.Box(0, 0, w, h, Color(5, 5, 5, 80))

		else

			-- draw.Box(0, 0, w, h, Color(75, 75, 75, 150))

			draw.Box(0, 0, w, h, Color(223, 249, 251, 30))

		end

	end

	vgui.Register( "FPanel", PANEL, "Panel" )



/*

	FScrollp

	- DScrollPanel

*/

local PANEL = {}

	function PANEL:Paint( w, h )

		draw.Box(0, 0, w, h, Color(64, 115, 158, 80))

	end

	vgui.Register( "FScrollp", PANEL, "DScrollPanel" )



/*

	FList

	- DPanelList

*/

local PANEL = {}

	function PANEL:Init()

		self:SetSpacing(1)

		self:SetPadding(5)

	end

	function PANEL:Paint( w, h )

		draw.Box(0, 0, w, h, Color(64, 115, 158, 80))

	end

	vgui.Register( "FList", PANEL, "DPanelList" )



/*

	FCheck

	- DCheckBox

*/

local PANEL = {}

	function PANEL:Paint(w,h)

		draw.Box(0, 0, h, h, Color(5,5,5,60))

		local sz = (h-6)

		if self:GetChecked() then

			draw.Icon("tfc_starwars/tick.png", h/2-sz/2, h/2-sz/2, sz, sz, Color(0, 148, 50))

		else

			draw.Icon("tfc_starwars/cancel.png", h/2-sz/2, h/2-sz/2, sz, sz, Color(234, 32, 39))

		end

	end

	vgui.Register( "FCheck", PANEL, "DCheckBox" )





local PANEL = {}

	function PANEL:Init()

		timer.Simple(0, function()

			self.Label:SetFont('f4.info.small')

			self.Button.Paint = function(self, w, h)

				draw.Box(0, 0, h, h, Color(5,5,5,60))

				local sz = (h-6)

				if self:GetChecked() then

					draw.Icon("tfc_starwars/tick.png", h/2-sz/2, h/2-sz/2, sz, sz, Color(0, 148, 50))

				else

					draw.Icon("tfc_starwars/cancel.png", h/2-sz/2, h/2-sz/2, sz, sz, Color(234, 32, 39))

				end

			end

		end)

	end

	vgui.Register( "FCheckLabel", PANEL, "DCheckBoxLabel" )



/*

	FButton

	- DButton

*/

local PANEL = {}

	AccessorFunc( PANEL, "name", "Name", FORCE_STRING )

	AccessorFunc( PANEL, "dark", "Dark", FORCE_BOOL )

	function PANEL:Init()

		self:SetText("")

		self:SetName("")

	end

	function PANEL:Paint( w, h )

		local clr = self:IsHovered() and Color(0, 151, 230) or Color(64, 115, 158)

		local minus = 40

		if self:GetDark() then

			clr = self:IsHovered() and Color(47-5, 54-5, 64-5) or Color(47, 54, 64)

			minus = 20

		end



		local alpha = self:IsHovered() and 255 or 200

		draw.GradientBox(0, -1, w, h, 1, clr, Color(clr.r-minus, clr.g-minus, clr.b-minus, clr.a))

		draw.LinBox(0, 0, w, h, 1, Color(5,5,5,50))

		draw.SimpleText(self:GetName(), "ui.button", w/2, h/2+1, Color(5,5,5,alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		draw.SimpleText(self:GetName(), "ui.button", w/2, h/2, Color(255,255,255,alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	end

	vgui.Register( "FButton", PANEL, "DButton" )



/*

	FEntry

	- DTextEntry

*/

local PANEL = {}

	function PANEL:Init()

		self:SetFont("ui.entry")

	end

	function PANEL:Paint( w, h )

		local clr = self:IsEditing() and Color(5,5,5,90) or Color(5,5,5,60)

		draw.Box(0, 0, w, h, clr	)

		self:DrawTextEntryText(Color(225,225,225), Color(0, 168, 255), Color(5,5,5))

	end

	vgui.Register( "FEntry", PANEL, "DTextEntry" )



	/*

		FFrame

		- DFrame

	*/

	local PANEL = {}

		function PANEL:Init()

			self:ShowCloseButton(false)



			timer.Simple(0, function()

				self.lblTitle:SetAlpha(0)

				self.Title = vgui.Create("DPanel", self)

				self.Title:SetSize(self:GetWide(), 25)

				self.Title.Paint = function(self, w, h)

					draw.GradientBox(0, -1, w, h, 1, Color(35, 35, 35), Color(25,25,25))

					draw.Icon("icon16/gun.png", 5, h/2-8, 16, 16)

					draw.SimpleText(self:GetParent():GetTitle(), "ui.ee", 5+16+5, h/2+1, Color(5,5,5), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

					draw.SimpleText(self:GetParent():GetTitle(), "ui.ee", 5+16+5, h/2, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

				end



				self.Close = vgui.Create("FButton", self)

				self.Close:SetSize(self:GetWide()/5, 25)

				self.Close:SetPos(self:GetWide() - self.Close:GetWide())

				self.Close:SetName("Закрыть")

				self.Close.Paint = function(self, w, h)

					local clr = self:IsHovered() and Color(234, 32, 39) or Color(214, 48, 49)

					local minus = 70

					local alpha = self:IsHovered() and 255 or 200

					draw.GradientBox(0, -1, w, h, 1, clr, Color(clr.r-minus, clr.g-minus, clr.b-minus, clr.a))

					draw.LinBox(0, 0, w, h, 1, Color(5,5,5,50))

					draw.SimpleText(self:GetName(), "ui.button", w/2, h/2+1, Color(5,5,5,alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

					draw.SimpleText(self:GetName(), "ui.button", w/2, h/2, Color(255,255,255,alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

				end

				self.Close.DoClick = function()

					self:FadeOut(0.2)

				end

			end)

		end

		function PANEL:Paint(w,h)

			draw.Blur(self, 2)

			draw.Box(0, 0, w, h, Color(223, 249, 251, 30))

		end

		vgui.Register( "FFrame", PANEL, "DFrame" )



/*

	=====================

	Функции для панелей

	=====================

*/



local panelMeta = FindMetaTable("Panel")

function panelMeta:FadeOut(time, removeOnEnd, callback)

	removeOnEnd = removeOnEnd or true

	self:AlphaTo(0, time, 0, function()

		if removeOnEnd then

			if self.OnRemove then

				self:OnRemove()

			end

			self:Remove()

		end

		if callback then

			callback(self)

		end

	end)

end



function panelMeta:FadeIn(time, callback)

	self:SetAlpha(0)

	self:AlphaTo(255, time, 0, function()

		if callback then

			callback(self)

		end

	end)

end



function panelMeta:OnClick(leftClick, rightClick)

	self.OnMousePressed = function(self, type)

		if type == MOUSE_LEFT then

			leftClick(self)

		elseif rightClick && type == MOUSE_RIGHT then

			rightClick(self)

		end

	end

end





/*

	=====================

	Панели

	=====================

*/



function AcceptMenu(name, func)

	local base = vgui.Create("FPanel")

	base:SetSize(ScrW()*0.3, ScrH()*0.1)

	base:MakePopup()

	base:SetBlur(true)

	base:Center()

	base:FadeIn(0.5)



	local message = vgui.Create("FPanel", base)

	message:SetSize(base:GetWide(), 25)

	message:SetPos(0, 0)

	function message:Paint(w,h)

		draw.GradientBox(0, -1, w, h, 1, Color(35, 35, 35), Color(25,25,25))

		draw.Icon("icon16/script_go.png", 5, h/2-8, 16, 16)

		draw.SimpleText("Подтверждение", "ui.ee", 5+16+5, h/2+1, Color(5,5,5), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

		draw.SimpleText("Подтверждение", "ui.ee", 5+16+5, h/2, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

	end



	local message = vgui.Create("FPanel", base)

	message:SetSize(base:GetWide(), base:GetTall()-30-25)

	message:SetPos(0, 25)

	function message:Paint(w,h)

		draw.SimpleText(name, "ui.subtitle", w/2, h/2+1, Color(5,5,5), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		draw.SimpleText(name, "ui.subtitle", w/2, h/2, Color(246, 185, 59), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	end



	local accept = vgui.Create("FButton", base)

	accept:SetSize(base:GetWide()/3, 25)

	accept:SetPos(base:GetWide()/2 - accept:GetWide()-5, base:GetTall()-30)

	accept:SetName("Принять")

	function accept:DoClick()

		if func then

			func()

		end

		base:FadeOut(0.2)

	end



	local cancel = vgui.Create("FButton", base)

	cancel:SetSize(base:GetWide()/3, 25)

	cancel:SetPos(base:GetWide()/2+5, base:GetTall()-30)

	cancel:SetName("Отмена")

	function cancel:DoClick()

		base:FadeOut(0.2)

	end

end



function TextMenu(name)

	local base = vgui.Create("DFrame")

	base:SetSize(ScrW()*0.3, ScrH()*0.1)

	base:MakePopup()

	base:Center()

	base:FadeIn(0.5)

	base:ShowCloseButton(false)

	base:SetDraggable(false)



	local message = vgui.Create("FPanel", base)

	message:SetSize(base:GetWide(), 25)

	message:SetPos(0, 0)

	function message:Paint(w,h)

		draw.GradientBox(0, -1, w, h, 1, Color(35, 35, 35), Color(25,25,25))

		draw.Icon("icon16/tick.png", 5, h/2-8, 16, 16)

		draw.SimpleText("Подтверждение", "ui.ee", 5+16+5, h/2+1, Color(5,5,5), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

		draw.SimpleText("Подтверждение", "ui.ee", 5+16+5, h/2, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

	end



	local message = vgui.Create("DTextEntry", base)

	message:SetSize(base:GetWide()-10, base:GetTall()-30-25-10)

	message:SetPos(5, 30)



	local accept = vgui.Create("FButton", base)

	accept:SetSize(base:GetWide()/3, 25)

	accept:SetPos(base:GetWide()/2 - accept:GetWide()-5, base:GetTall()-30)

	accept:SetName("Принять")

	function accept:DoClick()

		base:FadeOut(0.2)

		return message:GetValue()

	end



	local cancel = vgui.Create("FButton", base)

	cancel:SetSize(base:GetWide()/3, 25)

	cancel:SetPos(base:GetWide()/2+5, base:GetTall()-30)

	cancel:SetName("Отмена")

	function cancel:DoClick()

		base:FadeOut(0.2)

	end

end



function AddBindMenu()

	local base = vgui.Create("DFrame")

	base:SetSize(ScrW()*0.4, ScrH()*0.6)

	base:MakePopup()

	base:Center()

	base:FadeIn(0.5)

	base:ShowCloseButton(false)

	base.Paint = function(self, w, h)

		draw.Blur(self, 2)

		draw.Box(0, 0, w, h, Color(223, 249, 251, 30))

	end



	local tab = vgui.Create("FPanel", base)

	tab:SetSize(base:GetWide(), 25)

	function tab:Paint(w,h)

		draw.GradientBox(0, -1, w, h, 1, Color(35, 35, 35), Color(25,25,25))

		draw.Icon("icon16/tick.png", 5, h/2-8, 16, 16)

		draw.SimpleText("Подтверждение", "ui.ee", 5+16+5, h/2+1, Color(5,5,5), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

		draw.SimpleText("Подтверждение", "ui.ee", 5+16+5, h/2, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

	end



	local panel = vgui.Create("FList", base)

	panel:SetSize(base:GetWide()-10, base:GetTall()-30-25-10)

	panel:SetPos(5, 30)

	panel:SetSpacing(5)

	function panel:Paint() end



	local title = panel:Add("FPanel")

	title:SetHeight(50)

	panel:AddItem(title)

	function title:Paint(w, h)

		draw.Box(0, 0, w, h, Color(200,5,5,60))

		draw.LinBox(0, 0, w, h, 1, Color(5,5,5,30))

		draw.SimpleText('ВНИМАНИЕ!', 'f4.info.text', w/2, 6, Color(5, 5, 5), TEXT_ALIGN_CENTER)

		draw.SimpleText('ВНИМАНИЕ!', 'f4.info.text', w/2, 5, Color(234, 32, 39), TEXT_ALIGN_CENTER)

		draw.SimpleText('После нажатия на кнопку "Применить" - проверьте консоль', 'f4.info.title', w/2, h-5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

	end



	local title = panel:Add("FPanel")

	title:SetHeight(50)

	panel:AddItem(title)

	function title:Paint(w, h)

		draw.Box(0, 0, w, h, Color(5,5,5,120))

		draw.LinBox(0, 0, w, h, 1, Color(5,5,5,30))

		draw.SimpleText('Кнопка активации', 'f4.info.text', w/2, 6, Color(5, 5, 5), TEXT_ALIGN_CENTER)

		draw.SimpleText('Кнопка активации', 'f4.info.text', w/2, 5, Color(246, 229, 141), TEXT_ALIGN_CENTER)

		draw.SimpleText('Кнопка, при нажатии которой выполнится команда', 'f4.info.title', w/2, h-5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

	end



	local binder = panel:Add("DBinder")

	binder:SetHeight(25)

	binder:SetColor(Color(225,225,225))

	binder:SetFont("f4.info.title")

	panel:AddItem(binder)

	function binder:Paint(w,h)

		local clr = self:IsHovered() and Color(47-5, 54-5, 64-5) or Color(47, 54, 64)

		draw.GradientBox(0, -1, w, h, 1, clr, Color(clr.r-20, clr.g-20, clr.b-20, clr.a))

		draw.LinBox(0, 0, w, h, 1, Color(5,5,5,50))

	end



	local title = panel:Add("FPanel")

	title:SetHeight(50)

	panel:AddItem(title)

	function title:Paint(w, h)

		draw.Box(0, 0, w, h, Color(5,5,5,120))

		draw.LinBox(0, 0, w, h, 1, Color(5,5,5,30))

		draw.SimpleText('Команда', 'f4.info.text', w/2, 6, Color(5, 5, 5), TEXT_ALIGN_CENTER)

		draw.SimpleText('Команда', 'f4.info.text', w/2, 5, Color(246, 229, 141), TEXT_ALIGN_CENTER)

		draw.SimpleText('Команда, выполняемая при нажатии кнопки', 'f4.info.title', w/2, h-5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

	end



	local act = panel:Add("FEntry")

	act:SetHeight(25)

	act:SetTooltip('Например: say Ну чо как?')

	act:SetValue('Команда...')

	panel:AddItem(act)



	local title = panel:Add("FPanel")

	title:SetHeight(50)

	panel:AddItem(title)

	function title:Paint(w, h)

		draw.Box(0, 0, w, h, Color(5,5,5,120))

		draw.LinBox(0, 0, w, h, 1, Color(5,5,5,30))

		draw.SimpleText('Дополнительное действие', 'f4.info.text', w/2, 6, Color(5, 5, 5), TEXT_ALIGN_CENTER)

		draw.SimpleText('Дополнительное действие', 'f4.info.text', w/2, 5, Color(246, 229, 141), TEXT_ALIGN_CENTER)

		draw.SimpleText('Дополнительное действие для команды', 'f4.info.title', w/2, h-5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

	end



	local additional_act = panel:Add("FEntry")

	additional_act:SetValue('Команда...')

	additional_act:SetHeight(25)



	local anim = panel:Add("DComboBox")

	anim:SetHeight(25)

	anim:SetValue('Можете выбрать дополнительным действием анимацию')

	local animations = {"salute", "halt", "wave", "forward", "becon", "group"}

	for k, v in pairs(animations) do

		anim:AddChoice(v)

	end

	anim.OnSelect = function( self, index, value )

		additional_act:SetValue("act "..value)

	end



	panel:AddItem(anim)

	panel:AddItem(additional_act)



	local title = panel:Add("FPanel")

	title:SetHeight(50)

	panel:AddItem(title)

	function title:Paint(w, h)

		draw.Box(0, 0, w, h, Color(200,5,5,60))

		draw.LinBox(0, 0, w, h, 1, Color(5,5,5,30))

		draw.SimpleText('ВНИМАНИЕ!', 'f4.info.text', w/2, 6, Color(5, 5, 5), TEXT_ALIGN_CENTER)

		draw.SimpleText('ВНИМАНИЕ!', 'f4.info.text', w/2, 5, Color(234, 32, 39), TEXT_ALIGN_CENTER)

		draw.SimpleText('После нажатия на кнопку "Применить" - проверьте консоль', 'f4.info.title', w/2, h-5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

	end



	local accept = vgui.Create("FButton", base)

	accept:SetSize(base:GetWide()/3, 25)

	accept:SetPos(base:GetWide()/2 - accept:GetWide()-5, base:GetTall()-30)

	accept:SetName("Применить")

	accept:SetDark(true)

	function accept:DoClick()

		base:FadeOut(0.2)

		local key = input.GetKeyName(binder:GetValue())

		local main = act:GetValue()

		local sub = additional_act:GetValue()



		MsgC( Color(52, 152, 219), "========================================\n" )

		MsgC( Color(52, 152, 219), "============ СОЗДАНИЕ БИНДА ============\n" )

		MsgC( Color(52, 152, 219), "========================================\n" )

		MsgC( Color(241, 196, 15), 'Вставьте содержимое буфера обмена в консоль и нажмите ENTER\n' )

		MsgC( Color(241, 196, 15), 'CTRL + V\n\n' )

		if sub == "" or sub == "Команда..." then

			SetClipboardText('bind '..key..' "'..main..'"')

			MsgC( Color(241, 196, 15), 'bind '..key..' "'..main..'"')

		else

			SetClipboardText('bind '..key..' "'..main..';'..sub..'"')

			MsgC( Color(241, 196, 15), 'bind '..key..' "'..main..';'..sub..'"')

		end

		MsgC( Color(52, 152, 219), "\n========================================\n" )

	end



	local cancel = vgui.Create("FButton", base)

	cancel:SetSize(base:GetWide()/3, 25)

	cancel:SetPos(base:GetWide()/2+5, base:GetTall()-30)

	cancel:SetName("Отмена")

	cancel:SetDark(true)

	function cancel:DoClick()

		base:FadeOut(0.2)

	end

end



netstream.Hook('arrest_reason', function(victim)

	local base = vgui.Create("FFrame")

	base:SetSize(ScrW()*0.3, ScrH()*0.1)

	base:MakePopup()

	base:Center()

	base:FadeIn(0.5)

	base:SetTitle('За что вы арестовали '..victim:Name()..'?')

	base:ShowCloseButton(false)

	base:SetDraggable(false)



	timer.Simple(0, function()

		base.Close:Remove()

	end)



	local message = vgui.Create("FEntry", base)

	message:SetSize(base:GetWide()-10, base:GetTall()-30-25-10)

	message:SetPos(5, 30)



	local accept = vgui.Create("FButton", base)

	accept:SetSize(base:GetWide()-10, 25)

	accept:SetPos(5, base:GetTall()-30)

	accept:SetName("Принять")

	function accept:DoClick()

		base:FadeOut(0.2)



		netstream.Start('reason_upload', {target = victim, reason = message:GetValue()})

	end

end);



net.Receive('asdasd', function()

  if serverguard.player:GetImmunity(player) < 21 then return end;



	notification.AddLegacy( "Получена новая жалоба!", NOTIFY_UNDO, 2 )

	surface.PlaySound( "buttons/button5.wav" )

end)



