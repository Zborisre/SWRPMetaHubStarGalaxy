local FKeyBinds = {
	["gm_showhelp"] = "ShowHelp",
	["gm_showteam"] = "ShowTeam",
	["gm_showspare1"] = "ShowSpare1",
	["gm_showspare2"] = "ShowSpare2"
}

local right_side_width = 400

function GM:PlayerBindPress(ply, bind, pressed)
	-- if LocalPlayer():IsBanned() then return end
	local bnd = string.match(string.lower(bind), "gm_[a-z]+[12]?")
	if bnd and FKeyBinds[bnd] and GAMEMODE[FKeyBinds[bnd]] then
		GAMEMODE[FKeyBinds[bnd]](GAMEMODE)
	end
	return
end

function GM:ShowTeam()
	intMin = 1
	intMax = 100
    local xScreenRes = 1920
    local yScreenRes = 1080
    local wMod = ScrW() / xScreenRes
    local hMod = ScrH() / yScreenRes
	Window = vgui.Create( "DFrame" )
    Window:SetSize( wMod * 650, hMod * 560 )
	Window:SetTitle( " " )
	Window:SetDraggable( false )
	Window:ShowCloseButton( false )
    Window:MakePopup()
	
local teams = mopp.jobs[LocalPlayer():Team()]
if teams and teams.spawn_group then
--ЖИТЕЛЬ
if teams.spawn_group == "Eventjit" then	
Window.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesas = vgui.Create( "DPanel", Window )
	Panelesas:SetPos( wMod * 0, hMod * 0 )
	Panelesas:SetSize( wMod * 650, hMod * 22 )
	Panelesas:SetBackgroundColor( 25,25,25 )
	Panelesas.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(54,107,21))
	end
	--255,241,91
	local Panelesasa = vgui.Create( "DPanel", Window )
	Panelesasa:SetPos( wMod * -20, hMod * 20 )
	Panelesasa:SetSize( wMod * 850, hMod * 3 )
	Panelesasa:SetBackgroundColor( 25,25,25 )
	Panelesasa.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(54,107,21))
	end
	
	local ButtonCancelF = vgui.Create( "DButton", Window )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 624, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Window:Close() end
	
	local imgcom = vgui.Create('DImage', Window)
	imgcom:SetSize(wMod * 190, hMod * 350)
    imgcom:SetPos(wMod * 85, hMod * 30)
    imgcom:SetImage('materials/radiotvkomlinkone.png')	
	
	local Panelesa = vgui.Create( "DPanel", Window )
	Panelesa:SetPos( wMod * 400, hMod * 40 )
	Panelesa:SetSize( wMod * 220, hMod * 500 )
	Panelesa:SetBackgroundColor( red )
	Panelesa.Paint = function(s,w,h)
	
		draw.RoundedBox(0,0,0,w,h,Color(50,50,50))
	end
	
--ДРОИД
elseif (teams.spawn_group == "Eventdroid") then
Window.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesas = vgui.Create( "DPanel", Window )
	Panelesas:SetPos( wMod * 0, hMod * 0 )
	Panelesas:SetSize( wMod * 650, hMod * 22 )
	Panelesas:SetBackgroundColor( 25,25,25 )
	Panelesas.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(105,0,6))
	end
	--255,241,91
	local Panelesasa = vgui.Create( "DPanel", Window )
	Panelesasa:SetPos( wMod * -20, hMod * 20 )
	Panelesasa:SetSize( wMod * 850, hMod * 3 )
	Panelesasa:SetBackgroundColor( 25,25,25 )
	Panelesasa.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(105,0,6))
	end
	
	local ButtonCancelF = vgui.Create( "DButton", Window )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 624, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Window:Close() end
	
	local imgcom = vgui.Create('DImage', Window)
	imgcom:SetSize(wMod * 190, hMod * 350)
    imgcom:SetPos(wMod * 85, hMod * 30)
    imgcom:SetImage('materials/radiotvkomlinkone.png')	
	
	local Panelesa = vgui.Create( "DPanel", Window )
	Panelesa:SetPos( wMod * 400, hMod * 40 )
	Panelesa:SetSize( wMod * 220, hMod * 500 )
	Panelesa:SetBackgroundColor( red )
	Panelesa.Paint = function(s,w,h)
	
		draw.RoundedBox(0,0,0,w,h,Color(50,50,50))
	end
	
--АСТРОМЕХ
elseif (teams.spawn_group == "Astromech") then
Window.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesas = vgui.Create( "DPanel", Window )
	Panelesas:SetPos( wMod * 0, hMod * 0 )
	Panelesas:SetSize( wMod * 650, hMod * 22 )
	Panelesas:SetBackgroundColor( 25,25,25 )
	Panelesas.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(184,184,184))
	end
	--255,241,91
	local Panelesasa = vgui.Create( "DPanel", Window )
	Panelesasa:SetPos( wMod * -20, hMod * 20 )
	Panelesasa:SetSize( wMod * 850, hMod * 3 )
	Panelesasa:SetBackgroundColor( 25,25,25 )
	Panelesasa.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(184,184,184))
	end
	
	local ButtonCancelF = vgui.Create( "DButton", Window )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 624, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Window:Close() end
	
	local imgcom = vgui.Create('DImage', Window)
	imgcom:SetSize(wMod * 190, hMod * 350)
    imgcom:SetPos(wMod * 85, hMod * 30)
    imgcom:SetImage('materials/radiotvkomlinkone.png')	
	
	local Panelesa = vgui.Create( "DPanel", Window )
	Panelesa:SetPos( wMod * 400, hMod * 40 )
	Panelesa:SetSize( wMod * 220, hMod * 500 )
	Panelesa:SetBackgroundColor( red )
	Panelesa.Paint = function(s,w,h)
	
		draw.RoundedBox(0,0,0,w,h,Color(50,50,50))
	end

--ДЖИД	
elseif (teams.spawn_group == "Jediorden") then
Window.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesas = vgui.Create( "DPanel", Window )
	Panelesas:SetPos( wMod * 0, hMod * 0 )
	Panelesas:SetSize( wMod * 650, hMod * 22 )
	Panelesas:SetBackgroundColor( 25,25,25 )
	Panelesas.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
	end
	--255,241,91
	local Panelesasa = vgui.Create( "DPanel", Window )
	Panelesasa:SetPos( wMod * -20, hMod * 20 )
	Panelesasa:SetSize( wMod * 850, hMod * 3 )
	Panelesasa:SetBackgroundColor( 25,25,25 )
	Panelesasa.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
	end
	
	local ButtonCancelF = vgui.Create( "DButton", Window )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 624, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Window:Close() end
	
	local imgcom = vgui.Create('DImage', Window)
	imgcom:SetSize(wMod * 190, hMod * 350)
    imgcom:SetPos(wMod * 85, hMod * 30)
    imgcom:SetImage('materials/radiotvkomlinkone.png')	
	
	local Panelesa = vgui.Create( "DPanel", Window )
	Panelesa:SetPos( wMod * 400, hMod * 40 )
	Panelesa:SetSize( wMod * 220, hMod * 500 )
	Panelesa:SetBackgroundColor( red )
	Panelesa.Paint = function(s,w,h)
	
		draw.RoundedBox(0,0,0,w,h,Color(50,50,50))
	end	
	
-- МАНД
elseif (teams.spawn_group == "Mand") then
Window.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesas = vgui.Create( "DPanel", Window )
	Panelesas:SetPos( wMod * 0, hMod * 0 )
	Panelesas:SetSize( wMod * 650, hMod * 22 )
	Panelesas:SetBackgroundColor( 25,25,25 )
	Panelesas.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(134,67,1))
	end
	--255,241,91
	local Panelesasa = vgui.Create( "DPanel", Window )
	Panelesasa:SetPos( wMod * -20, hMod * 20 )
	Panelesasa:SetSize( wMod * 850, hMod * 3 )
	Panelesasa:SetBackgroundColor( 25,25,25 )
	Panelesasa.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(134,67,1))
	end
	
	local ButtonCancelF = vgui.Create( "DButton", Window )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 624, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Window:Close() end
	
	local imgcom = vgui.Create('DImage', Window)
	imgcom:SetSize(wMod * 190, hMod * 350)
    imgcom:SetPos(wMod * 85, hMod * 30)
    imgcom:SetImage('materials/radiotvkomlinkone.png')	
	
	local Panelesa = vgui.Create( "DPanel", Window )
	Panelesa:SetPos( wMod * 400, hMod * 40 )
	Panelesa:SetSize( wMod * 220, hMod * 500 )
	Panelesa:SetBackgroundColor( red )
	Panelesa.Paint = function(s,w,h)
	
		draw.RoundedBox(0,0,0,w,h,Color(50,50,50))
	end
	
--КЛОНЫ
else
	Window.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesas = vgui.Create( "DPanel", Window )
	Panelesas:SetPos( wMod * 0, hMod * 0 )
	Panelesas:SetSize( wMod * 650, hMod * 22 )
	Panelesas:SetBackgroundColor( 25,25,25 )
	Panelesas.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	--255,241,91
	local Panelesasa = vgui.Create( "DPanel", Window )
	Panelesasa:SetPos( wMod * -20, hMod * 20 )
	Panelesasa:SetSize( wMod * 850, hMod * 3 )
	Panelesasa:SetBackgroundColor( 25,25,25 )
	Panelesasa.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	
	local ButtonCancelF = vgui.Create( "DButton", Window )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 624, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Window:Close() end
	
	local imgcom = vgui.Create('DImage', Window)
	imgcom:SetSize(wMod * 190, hMod * 350)
    imgcom:SetPos(wMod * 85, hMod * 30)
    imgcom:SetImage('materials/radiotvkomlinkone.png')	
	
	local Panelesa = vgui.Create( "DPanel", Window )
	Panelesa:SetPos( wMod * 400, hMod * 40 )
	Panelesa:SetSize( wMod * 220, hMod * 500 )
	Panelesa:SetBackgroundColor( red )
	Panelesa.Paint = function(s,w,h)
	
		draw.RoundedBox(0,0,0,w,h,Color(50,50,50,200))
	end
end
end

local ko = tostring(LocalPlayer():GetNVar('meta_radio'));

RadioScroll = vgui.Create( "DScrollPanel", Window )
    RadioScroll:SetSize( wMod * 200, hMod * 200 )
    RadioScroll:SetPos( wMod * 410,hMod * 50 )
    RadioScroll.Paint = function( self, w, h )
        -- draw.RoundedBox(0,0,0,w,h,ColorAlpha(team.GetColor(v:Team()), 90))
    end

    RadioScroll.VBar = RadioScroll:GetVBar()
    RadioScroll.VBar:SetWide(6)

    function RadioScroll.VBar:PerformLayout()
        local Wide = self:GetWide()
        local Scroll = self:GetScroll() / self.CanvasSize
        local BarSize = math.max( self:BarScale() * ( self:GetTall() - ( Wide * 2 ) ), 10 )
        local Track = self:GetTall() - BarSize
        Track = Track + 1

        Scroll = Scroll * Track

        self.btnGrip:SetPos( 0, Scroll )
        self.btnGrip:SetSize(wMod * Wide,hMod * BarSize )

        self.btnUp:SetPos( 0, 0, 0, 0 )
        self.btnUp:SetSize( 0, 0 )

        self.btnDown:SetPos( 0, self:GetTall() - 0, 0, 0 )
        self.btnDown:SetSize( 0, 0 )
    end
    RadioScroll.VBar.Paint = function( self, w, h ) end
    RadioScroll.VBar.btnGrip.Paint = function( self, w, h ) draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, 190)) end


    local RadioList = vgui.Create( "DListLayout", RadioScroll )
    RadioList:Dock( FILL )
    RadioList:SetPos( 0, 0 )
    RadioList.Paint = function( self, w, h )
        -- draw.RoundedBox(0,0,0,w,h,ColorAlpha(team.GetColor(v:Team()), 90))
    end
	
	if LocalPlayer():GetNVar('meta_radio') ~= 0 then
        for k, v in pairs(player.GetAll()) do
            if v:GetNVar('meta_radio') == LocalPlayer():GetNVar('meta_radio') and IsValid(v) then
                -- table.remove(radio_players, k)
                -- radio_players[k] = nil
                local RadioPlayer = vgui.Create('DPanel')
                RadioPlayer:SetSize(wMod *20,hMod *20)
                RadioPlayer.Paint = function( self, w, h )
                    draw.RoundedBox(0,0,0,w,h,ColorAlpha(team.GetColor(v:Team()), 90))
                    draw.SimpleText(v:Name()..' ('..team.GetName(v:Team())..')', "DermaDefault",wMod * 26, h/2, color_white, 0, 1)
                end

                local RadioPlayerAvatar = vgui.Create('AvatarImage', RadioPlayer)
                RadioPlayerAvatar:SetSize(wMod * 20,hMod *20)
                RadioPlayerAvatar:SetPos( 0, 0 )
                RadioPlayerAvatar:SetPlayer( v, 32 )

                RadioList:Add(RadioPlayer)
            end
        end
    end
	
	local InnerPanel = vgui.Create( "DPanel", Window )
	InnerPanel:SetPaintBackground( false )
	InnerPanel:StretchToParent( wMod * 30, hMod * 110, hMod * 540, hMod * 500 )
	InnerPanel:SetPos(wMod * 140, hMod * 380)

	local Text = vgui.Create( "DLabel", Window )
	Text:SetText( " ")
	-- Text:SizeToContents()
	-- Text:SetContentAlignment( 5 )
	Text:SetTextColor( color_red )
	Text:SetSize(40, 40)

	local NumberWang = vgui.Create( "DNumberWang", Window )

	if intMin then
		NumberWang:SetMin(intMin)
	end

	if intMax then
		NumberWang:SetMax(intMax)
	end

	-- NumberWang:SetText( ( strDefaultNumber and isnumber(strDefaultNumber) ) and strDefaultNumber or 0 )
	NumberWang:SetText( LocalPlayer().RadioChannel or '' )
	NumberWang.OnEnter = function() Window:Close() netstream.Start("WalkieTalkie.ChangeChannel", { channel = tonumber(NumberWang:GetValue()) or 1 }) end
	NumberWang.OnValueChanged = function(self)
		local value = self:GetValue()
		if value > intMax then
			self:SetText( intMax )
		elseif value < intMin then
			self:SetText(intMin)
		end
	end

	Button = vgui.Create( "DButton", Window )
    Button:SetPos( wMod * 23, hMod * 430 )
	Button:SetFont("Trebuchet24")
	Button:SetColor(Color(0, 0, 255))
	Button:SetText( " " )
	Button:SizeToContents()
	Button:SetTall( )
	Button:SetSize(wMod*300,hMod *26)
	if teams and teams.spawn_group then
if teams.spawn_group == "Eventjit" then	
Button.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(54,107,21))
        if self:IsHovered() then
            draw.SimpleText("Изменить канал", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Изменить канал", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
elseif (teams.spawn_group == "Eventdroid") then
Button.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(105,0,6))
        if self:IsHovered() then
            draw.SimpleText("Изменить канал", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Изменить канал", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
elseif (teams.spawn_group == "Astromech") then
Button.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(184,184,184))
        if self:IsHovered() then
            draw.SimpleText("Изменить канал", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Изменить канал", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
elseif (teams.spawn_group == "Jediorden") then
Button.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
        if self:IsHovered() then
            draw.SimpleText("Изменить канал", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Изменить канал", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
elseif (teams.spawn_group == "Mand" or teams.spawn_group == "Pirat") then
	Button.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(134,67,1))
        if self:IsHovered() then
            draw.SimpleText("Изменить канал", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Изменить канал", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
else
    Button.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Изменить канал", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Изменить канал", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
end
end
	Button.DoClick = function()
		netstream.Start("WalkieTalkie.ChangeChannel", { channel = tonumber(NumberWang:GetValue()) or 1 })
	end
	
local Buttonsr = vgui.Create( "DButton", Window )
    Buttonsr:SetPos( wMod * 23, hMod * 485 )
	Buttonsr:SetFont("Trebuchet24")
	Buttonsr:SetColor(Color(0, 0, 255))
	Buttonsr:SetText( " " )
	Buttonsr:SizeToContents()
	Buttonsr:SetTall( )
	Buttonsr:SetSize(wMod*140,hMod *26)
	Buttonsr.Paint = function(self, w, h)
	if radio_s then
	draw.RoundedBox(5,0,0,w,h,Color(200,48,48))
        if self:IsHovered() then
            draw.SimpleText("ВЫКЛ.", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("ВЫКЛ.", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNTY then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNTY = false
            end
        else
            SHOULD_RETURNTY = true
        end
	else
	draw.RoundedBox(5,0,0,w,h,Color(48,200,48))
        if self:IsHovered() then
            draw.SimpleText("ВКЛ.", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("ВКЛ.", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNTY then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNTY = false
            end
        else
            SHOULD_RETURNTY = true
        end
	end
	end
	Buttonsr.DoClick = function()
		netstream.Start("WalkieTalkie.SpeakerToggle")

		radio_s = not radio_s

        time = CurTime() + 0.2
	end
	
local Buttonsrs = vgui.Create( "DButton", Window )
    Buttonsrs:SetPos( wMod * 183, hMod * 485 )
	Buttonsrs:SetFont("Trebuchet24")
	Buttonsrs:SetColor(Color(0, 0, 255))
	Buttonsrs:SetText( " " )
	Buttonsrs:SizeToContents()
	Buttonsrs:SetTall( )
	Buttonsrs:SetSize(wMod*140,hMod *26)
	Buttonsrs.Paint = function(self, w, h)
	if micro_s then
	draw.RoundedBox(5,0,0,w,h,Color(200,48,48))
        if self:IsHovered() then
            draw.SimpleText("ВЫКЛ.", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("ВЫКЛ.", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNTYA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNTYA = false
            end
        else
            SHOULD_RETURNTYA = true
        end
	else
	draw.RoundedBox(5,0,0,w,h,Color(48,200,48))
        if self:IsHovered() then
            draw.SimpleText("ВКЛ.", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("ВКЛ.", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNTYA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNTYA = false
            end
        else
            SHOULD_RETURNTYA = true
        end
	end
	end
	Buttonsrs.DoClick = function()
		netstream.Start("WalkieTalkie.MicroToggle")

		micro_s = not micro_s

        time = CurTime() + 0.2
	end
	
local Buttonsra = vgui.Create( "DButton", Window )
	Buttonsra:SetPos( wMod * 23, hMod * 520 )
	Buttonsra:SetFont("Trebuchet24")
	Buttonsra:SetColor(Color(0, 0, 255))
	Buttonsra:SetText( " " )
	Buttonsra:SizeToContents()
	Buttonsra:SetTall( )
	Buttonsra:SetSize(wMod*300,hMod *26)
	Buttonsra.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(48,200,48))
        if self:IsHovered() then
            draw.SimpleText("ГОТОВО", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("ГОТОВО", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNTYAA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNTYAA = false
            end
        else
            SHOULD_RETURNTYAA = true
        end
	end
	Buttonsra.DoClick = function() Window:Close()
	end
	
local ButtonasDiscordsa = vgui.Create( "DButton", Window )
	ButtonasDiscordsa:SetText( "Рация!" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*100,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 45, hMod * 450 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
local ButtonasDiscordsa = vgui.Create( "DButton", Window )
	ButtonasDiscordsa:SetText( "Микрофон!" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*100,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 205, hMod * 450 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end

	Text:StretchToParent( wMod * 230, hMod * 180, 10, 8 )

	NumberWang:StretchToParent(wMod * 240,hMod * 270,wMod * 240,hMod * 270 )
	NumberWang:SetPos(wMod * 100, hMod * 400)

	NumberWang:RequestFocus()
	-- NumberWang:SelectAllText( true )

	-- ButtonPanel:CenterHorizontal()

	Window:MakePopup()
	Window:DoModal()
	Window:Center()
end

function GM:ShowSpare2()
	
	-- local Main = vgui.Create('DFrame')
	-- Main:SetSize(180,44+(#buttons*20))
	-- Main:Center()
	-- Main:MakePopup()
	-- Main:ShowCloseButton(false)
	-- Main:SetDraggable(false)
	-- Main:SetTitle('')
	-- Main.Paint = function( self, w, h )end

	-- local Close = vgui.Create('DButton',Main)
	-- Close:SetPos(Main:GetWide()-20,0)
	-- Close:SetSize(20,20)
	-- Close:SetText('')
	-- Close.DoClick = function()
	-- 	Main:Close()	
	-- end
	-- Close.Paint = function( self, w, h )
	-- 	draw.RoundedBox(0,0,0,w,h,Color(255,64,64,180))
	-- 	draw.SimpleText('X','NiceHudFont_VerySmall',w/2,h/2,Color(255,255,255,255),1,1)
	-- 	surface.SetDrawColor(0,0,0,210)
	-- 	surface.DrawOutlinedRect( 0, 0, w, h )
	-- end

	LocalPlayer().Thirtperson = LocalPlayer().Thirtperson or {}

    local xScreenRes = 1920
    local yScreenRes = 1080
    local wMod = ScrW() / xScreenRes
    local hMod = ScrH() / yScreenRes
	
	local Main = vgui.Create('DFrame')
	Main:SetSize(wMod * 1000, hMod * 640)
	Main:Center()
	Main:SetTitle( ' ' )
	Main:MakePopup()
	Main:ShowCloseButton( false )
	Main:SetDraggable( false )
	-- Main.OnClose = function( self )
	-- 	file.Write( "tfc.txt", util.TableToJSON(LocalPlayer().Thirtperson) )
	-- end
	Main.Paint = function( self, w, h)
		-- draw.RoundedBox(2,0,23,w,65,Color(0,0,0,200))
	end
	
local imgcomet = vgui.Create('DImage', Main)
local teams = mopp.jobs[LocalPlayer():Team()]
if teams and teams.spawn_group then
-- ЖИТЕЛИ
if teams.spawn_group == "Eventjit" then

	Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Paneles = vgui.Create( "DPanel", Main )
	Paneles:SetPos( wMod * 0, hMod * 0 )
	Paneles:SetSize( wMod * 1000, hMod * 22 )
	Paneles:SetBackgroundColor( 25,25,25 )
	Paneles.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(54,107,21))
	end
	local Panelesasaf = vgui.Create( "DPanel", Main )
	Panelesasaf:SetPos( wMod * -20, hMod * 20 )
	Panelesasaf:SetSize( wMod * 1300, hMod * 3 )
	Panelesasaf:SetBackgroundColor( 25,25,25 )
	Panelesasaf.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(54,107,21))
	end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ОСНОВНАЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 190 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 220 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ДАННЫЕ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 320 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ОТСУТСТВУЮТ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 350 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "НАСТРОЙКА ВИДА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ОТ ТРЕТЬЕГО ЛИЦА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local imgcometesrt = vgui.Create('DImage', Main)
    imgcometesrt:SetSize(wMod * 460, hMod * 150)
    imgcometesrt:SetPos(wMod * 270, hMod *30)
    imgcometesrt:SetImage('materials/ffour/jitelf4menuda.png')
	
	local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 974, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end

local ButtonDiscord = vgui.Create( "DButton", Main )
	ButtonDiscord:SetText( " " )
	ButtonDiscord:SetFont("Trebuchet24")
	ButtonDiscord:SizeToContents()
	ButtonDiscord:SetTall( 20 )
	ButtonDiscord:SetSize(wMod*200,hMod *40)
	ButtonDiscord:SetPos( wMod * 80, hMod * 270 )
	ButtonDiscord.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(54,107,21))
        if self:IsHovered() then
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
	ButtonDiscord.DoClick = function() gui.OpenURL('https://discord.gg/dc59eVberA') end

local ButtonUstav = vgui.Create( "DButton", Main )
	ButtonUstav:SetText( " " )
	ButtonUstav:SetFont("Trebuchet24")
	ButtonUstav:SizeToContents()
	ButtonUstav:SetTall( 20 )
	ButtonUstav:SetSize(wMod*200,hMod *40)
	ButtonUstav:SetPos( wMod * 80, hMod * 370 )
	ButtonUstav.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(54,107,21))
        if self:IsHovered() then
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURN = false
            end
        else
            SHOULDA_RETURN = true
        end
	end
	ButtonUstav.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/устав-вар') end


local ButtonContent = vgui.Create( "DButton", Main )
	ButtonContent:SetText( " " )
	ButtonContent:SetFont("Trebuchet24")
	ButtonContent:SizeToContents()
	ButtonContent:SetTall( 20 )
	ButtonContent:SetSize(wMod*200,hMod *40)
	ButtonContent:SetPos( wMod * 80, hMod * 470 )
	ButtonContent.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(54,107,21))
        if self:IsHovered() then
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNA = false
            end
        else
            SHOULDA_RETURNA = true
        end
	end
	ButtonContent.DoClick = function() gui.OpenURL('https://steamcommunity.com/sharedfiles/filedetails/?id=2587021479') end

-- ДРОИДЫ

elseif (teams.spawn_group == "Eventdroid") then

	Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Paneles = vgui.Create( "DPanel", Main )
	Paneles:SetPos( wMod * 0, hMod * 0 )
	Paneles:SetSize( wMod * 1000, hMod * 22 )
	Paneles:SetBackgroundColor( 25,25,25 )
	Paneles.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(105,0,6))
	end
	local Panelesasaf = vgui.Create( "DPanel", Main )
	Panelesasaf:SetPos( wMod * -20, hMod * 20 )
	Panelesasaf:SetSize( wMod * 1300, hMod * 3 )
	Panelesasaf:SetBackgroundColor( 25,25,25 )
	Panelesasaf.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(105,0,6))
	end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ОСНОВНАЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 190 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 220 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "О ВИДАХ ДРОИДОВ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "НАСТРОЙКА ВИДА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ОТ ТРЕТЬЕГО ЛИЦА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local imgcometesrt = vgui.Create('DImage', Main)
    imgcometesrt:SetSize(wMod * 460, hMod * 150)
    imgcometesrt:SetPos(wMod * 270, hMod *30)
    imgcometesrt:SetImage('materials/ffour/droidf4menuda.png')
	
	local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 974, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end

local ButtonDiscord = vgui.Create( "DButton", Main )
	ButtonDiscord:SetText( " " )
	ButtonDiscord:SetFont("Trebuchet24")
	ButtonDiscord:SizeToContents()
	ButtonDiscord:SetTall( 20 )
	ButtonDiscord:SetSize(wMod*200,hMod *40)
	ButtonDiscord:SetPos( wMod * 80, hMod * 270 )
	ButtonDiscord.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(105,0,6))
        if self:IsHovered() then
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
	ButtonDiscord.DoClick = function() gui.OpenURL('https://discord.gg/K9ybnbE6dm') end

local ButtonUstav = vgui.Create( "DButton", Main )
	ButtonUstav:SetText( " " )
	ButtonUstav:SetFont("Trebuchet24")
	ButtonUstav:SizeToContents()
	ButtonUstav:SetTall( 20 )
	ButtonUstav:SetSize(wMod*200,hMod *40)
	ButtonUstav:SetPos( wMod * 80, hMod * 370 )
	ButtonUstav.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(105,0,6))
        if self:IsHovered() then
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURN = false
            end
        else
            SHOULDA_RETURN = true
        end
	end
	ButtonUstav.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/устав-вар') end


local ButtonContent = vgui.Create( "DButton", Main )
	ButtonContent:SetText( " " )
	ButtonContent:SetFont("Trebuchet24")
	ButtonContent:SizeToContents()
	ButtonContent:SetTall( 20 )
	ButtonContent:SetSize(wMod*200,hMod *40)
	ButtonContent:SetPos( wMod * 80, hMod * 470 )
	ButtonContent.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(105,0,6))
        if self:IsHovered() then
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNA = false
            end
        else
            SHOULDA_RETURNA = true
        end
	end
	ButtonContent.DoClick = function() gui.OpenURL('https://steamcommunity.com/sharedfiles/filedetails/?id=2587021479') end


local ButtonFive = vgui.Create( "DButton", Main )
	ButtonFive:SizeToContents()
	ButtonFive:SetTall( 20 )
	ButtonFive:SetSize(wMod*80,hMod *80)
	ButtonFive:SetPos( wMod * 395, hMod * 270 )
	ButtonFive.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(105,0,6))
	end
	ButtonFive.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/виды-дроидов/b1') end

local imgcometes = vgui.Create('DImage', ButtonFive)
    imgcometes:SetSize(wMod * 80, hMod * 80)
    imgcometes:SetPos(0, 0)
    imgcometes:SetImage('materials/b1f4menur.png')
	
local ButtonGuard = vgui.Create( "DButton", Main )
	ButtonGuard:SizeToContents()
	ButtonGuard:SetTall( 20 )
	ButtonGuard:SetSize(wMod*80,hMod *80)
	ButtonGuard:SetPos( wMod * 535, hMod * 270 )
	ButtonGuard.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(105,0,6))
	end
	ButtonGuard.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/виды-дроидов/b2') end

local imgcometese = vgui.Create('DImage', ButtonGuard)
    imgcometese:SetSize(wMod * 80, hMod * 80)
    imgcometese:SetPos(0, 0)
    imgcometese:SetImage('materials/b2f4menur.png')
	
local ButtonFour = vgui.Create( "DButton", Main )
	ButtonFour:SizeToContents()
	ButtonFour:SetTall( 20 )
	ButtonFour:SetSize(wMod*80,hMod *80)
	ButtonFour:SetPos( wMod * 395, hMod * 390 )
	ButtonFour.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(105,0,6))
	end
	ButtonFour.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/виды-дроидов/bx') end

local imgcometesr = vgui.Create('DImage', ButtonFour)
    imgcometesr:SetSize(wMod * 80, hMod * 80)
    imgcometesr:SetPos(0, 0)
    imgcometesr:SetImage('materials/bxf4menur.png')
	
local ButtonOne = vgui.Create( "DButton", Main )
	ButtonOne:SizeToContents()
	ButtonOne:SetTall( 20 )
	ButtonOne:SetSize(wMod*80,hMod *80)
	ButtonOne:SetPos( wMod * 535, hMod * 390 )
	ButtonOne.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(105,0,6))
	end
	ButtonOne.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/виды-дроидов/tactical-droid') end

local imgcometesrt = vgui.Create('DImage', ButtonOne)
    imgcometesrt:SetSize(wMod * 80, hMod * 80)
    imgcometesrt:SetPos(0, 0)
    imgcometesrt:SetImage('materials/tacticf4menur.png')

-- АСТРОМЕХИ

elseif (teams.spawn_group == "Astromech") then

Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Paneles = vgui.Create( "DPanel", Main )
	Paneles:SetPos( wMod * 0, hMod * 0 )
	Paneles:SetSize( wMod * 1000, hMod * 22 )
	Paneles:SetBackgroundColor( 25,25,25 )
	Paneles.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(184,184,184))
	end
	local Panelesasaf = vgui.Create( "DPanel", Main )
	Panelesasaf:SetPos( wMod * -20, hMod * 20 )
	Panelesasaf:SetSize( wMod * 1300, hMod * 3 )
	Panelesasaf:SetBackgroundColor( 25,25,25 )
	Panelesasaf.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(184,184,184))
	end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ОСНОВНАЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 190 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 220 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ХРАНИЛИЩЕ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ДАННЫХ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "НАСТРОЙКА ВИДА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ОТ ТРЕТЬЕГО ЛИЦА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local imgcometesrt = vgui.Create('DImage', Main)
    imgcometesrt:SetSize(wMod * 460, hMod * 150)
    imgcometesrt:SetPos(wMod * 270, hMod *30)
    imgcometesrt:SetImage('materials/ffour/astrof4menuda.png')
	
	local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 974, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end

local ButtonDiscord = vgui.Create( "DButton", Main )
	ButtonDiscord:SetText( " " )
	ButtonDiscord:SetFont("Trebuchet24")
	ButtonDiscord:SizeToContents()
	ButtonDiscord:SetTall( 20 )
	ButtonDiscord:SetSize(wMod*200,hMod *40)
	ButtonDiscord:SetPos( wMod * 80, hMod * 270 )
	ButtonDiscord.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(184,184,184))
        if self:IsHovered() then
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
	ButtonDiscord.DoClick = function() gui.OpenURL('https://discord.gg/dc59eVberA') end

local ButtonUstav = vgui.Create( "DButton", Main )
	ButtonUstav:SetText( " " )
	ButtonUstav:SetFont("Trebuchet24")
	ButtonUstav:SizeToContents()
	ButtonUstav:SetTall( 20 )
	ButtonUstav:SetSize(wMod*200,hMod *40)
	ButtonUstav:SetPos( wMod * 80, hMod * 370 )
	ButtonUstav.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(184,184,184))
        if self:IsHovered() then
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURN = false
            end
        else
            SHOULDA_RETURN = true
        end
	end
	ButtonUstav.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/устав-вар') end


local ButtonContent = vgui.Create( "DButton", Main )
	ButtonContent:SetText( " " )
	ButtonContent:SetFont("Trebuchet24")
	ButtonContent:SizeToContents()
	ButtonContent:SetTall( 20 )
	ButtonContent:SetSize(wMod*200,hMod *40)
	ButtonContent:SetPos( wMod * 80, hMod * 470 )
	ButtonContent.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(184,184,184))
        if self:IsHovered() then
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNA = false
            end
        else
            SHOULDA_RETURNA = true
        end
	end
	ButtonContent.DoClick = function() gui.OpenURL('https://steamcommunity.com/sharedfiles/filedetails/?id=2587021479') end


local ButtonFive = vgui.Create( "DButton", Main )
	ButtonFive:SizeToContents()
	ButtonFive:SetTall( 20 )
	ButtonFive:SetSize(wMod*80,hMod *80)
	ButtonFive:SetPos( wMod * 395, hMod * 270 )
	ButtonFive.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(184,184,184))
	end
	ButtonFive.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/327th') end

local imgcometes = vgui.Create('DImage', ButtonFive)
    imgcometes:SetSize(wMod * 80, hMod * 80)
    imgcometes:SetPos(0, 0)
    imgcometes:SetImage('materials/327f4menuras.png')
	
local ButtonGuard = vgui.Create( "DButton", Main )
	ButtonGuard:SizeToContents()
	ButtonGuard:SetTall( 20 )
	ButtonGuard:SetSize(wMod*80,hMod *80)
	ButtonGuard:SetPos( wMod * 535, hMod * 270 )
	ButtonGuard.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(184,184,184))
	end
	ButtonGuard.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/rsb') end

local imgcometese = vgui.Create('DImage', ButtonGuard)
    imgcometese:SetSize(wMod * 80, hMod * 80)
    imgcometese:SetPos(0, 0)
    imgcometese:SetImage('materials/guardf4menuras.png')
	
local ButtonFour = vgui.Create( "DButton", Main )
	ButtonFour:SizeToContents()
	ButtonFour:SetTall( 20 )
	ButtonFour:SetSize(wMod*80,hMod *80)
	ButtonFour:SetPos( wMod * 395, hMod * 390 )
	ButtonFour.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(184,184,184))
	end
	ButtonFour.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/ct-corps') end

local imgcometesr = vgui.Create('DImage', ButtonFour)
    imgcometesr:SetSize(wMod * 80, hMod * 80)
    imgcometesr:SetPos(0, 0)
    imgcometesr:SetImage('materials/ctf4menuras.png')
	
local ButtonOne = vgui.Create( "DButton", Main )
	ButtonOne:SizeToContents()
	ButtonOne:SetTall( 20 )
	ButtonOne:SetSize(wMod*80,hMod *80)
	ButtonOne:SetPos( wMod * 535, hMod * 390 )
	ButtonOne.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(184,184,184))
	end
	ButtonOne.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/41st') end

local imgcometesrt = vgui.Create('DImage', ButtonOne)
    imgcometesrt:SetSize(wMod * 80, hMod * 80)
    imgcometesrt:SetPos(0, 0)
    imgcometesrt:SetImage('materials/41f4menuras.png')
	
local ButtonOneS = vgui.Create( "DButton", Main )
	ButtonOneS:SizeToContents()
	ButtonOneS:SetTall( 20 )
	ButtonOneS:SetSize(wMod*80,hMod *80)
	ButtonOneS:SetPos( wMod * 465, hMod * 510 )
	ButtonOneS.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonOneS.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/21st') end

local imgcometesrtad = vgui.Create('DImage', ButtonOneS)
    imgcometesrtad:SetSize(wMod * 80, hMod * 80)
    imgcometesrtad:SetPos(0, 0)
    imgcometesrtad:SetImage('materials/21f4menuras.png')
	
-- ДЖИДЫ


elseif (teams.spawn_group == "Jediorden") then

	Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Paneles = vgui.Create( "DPanel", Main )
	Paneles:SetPos( wMod * 0, hMod * 0 )
	Paneles:SetSize( wMod * 1000, hMod * 22 )
	Paneles:SetBackgroundColor( 25,25,25 )
	Paneles.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
	end
	
	local Panelesasaf = vgui.Create( "DPanel", Main )
	Panelesasaf:SetPos( wMod * -20, hMod * 20 )
	Panelesasaf:SetSize( wMod * 1300, hMod * 3 )
	Panelesasaf:SetBackgroundColor( 25,25,25 )
	Panelesasaf.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
	end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ОСНОВНАЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 190 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(255,241,91, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 220 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ГОЛОКРОН" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ДЖЕДАЕВ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "НАСТРОЙКА ВИДА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ОТ ТРЕТЬЕГО ЛИЦА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local imgcometesrt = vgui.Create('DImage', Main)
    imgcometesrt:SetSize(wMod * 460, hMod * 150)
    imgcometesrt:SetPos(wMod * 270, hMod *30)
    imgcometesrt:SetImage('materials/ffour/jedif4menuda.png')
	
	local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 974, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end

local ButtonDiscord = vgui.Create( "DButton", Main )
	ButtonDiscord:SetText( " " )
	ButtonDiscord:SetFont("Trebuchet24")
	ButtonDiscord:SizeToContents()
	ButtonDiscord:SetTall( 20 )
	ButtonDiscord:SetSize(wMod*200,hMod *40)
	ButtonDiscord:SetPos( wMod * 80, hMod * 270 )
	ButtonDiscord.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
        if self:IsHovered() then
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(134,160,200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
	ButtonDiscord.DoClick = function() gui.OpenURL('https://discord.gg/dc59eVberA') end

local ButtonUstav = vgui.Create( "DButton", Main )
	ButtonUstav:SetText( " " )
	ButtonUstav:SetFont("Trebuchet24")
	ButtonUstav:SizeToContents()
	ButtonUstav:SetTall( 20 )
	ButtonUstav:SetSize(wMod*200,hMod *40)
	ButtonUstav:SetPos( wMod * 80, hMod * 340 )
	ButtonUstav.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
        if self:IsHovered() then
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(134,160,200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURN = false
            end
        else
            SHOULDA_RETURN = true
        end
	end
	ButtonUstav.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/устав-вар') end


local ButtonContent = vgui.Create( "DButton", Main )
	ButtonContent:SetText( " " )
	ButtonContent:SetFont("Trebuchet24")
	ButtonContent:SizeToContents()
	ButtonContent:SetTall( 20 )
	ButtonContent:SetSize(wMod*200,hMod *40)
	ButtonContent:SetPos( wMod * 80, hMod * 410 )
	ButtonContent.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
        if self:IsHovered() then
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(134,160,200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNA = false
            end
        else
            SHOULDA_RETURNA = true
        end
	end
	ButtonContent.DoClick = function() gui.OpenURL('https://steamcommunity.com/sharedfiles/filedetails/?id=2587021479') end
	
local ButtonContentld = vgui.Create( "DButton", Main )
	ButtonContentld:SetText( " " )
	ButtonContentld:SetFont("Trebuchet24")
	ButtonContentld:SizeToContents()
	ButtonContentld:SetTall( 20 )
	ButtonContentld:SetSize(wMod*200,hMod *40)
	ButtonContentld:SetPos( wMod * 80, hMod * 480 )
	ButtonContentld.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
        if self:IsHovered() then
            draw.SimpleText("Смена персонажа", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(134,160,200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Смена персонажа", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNAGAGA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNAGAGA = false
            end
        else
            SHOULDA_RETURNAGAGA = true
        end
	end
	ButtonContentld.DoClick = function() LocalPlayer():ConCommand( "say /char" ) Main:Close() end


local ButtonFive = vgui.Create( "DButton", Main )
	ButtonFive:SizeToContents()
	ButtonFive:SetTall( 20 )
	ButtonFive:SetSize(wMod*80,hMod *80)
	ButtonFive:SetPos( wMod * 395, hMod * 270 )
	ButtonFive.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(255,241,91))
	end
	ButtonFive.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/голокрон-джедаев/кайбер-кристаллы') end

local imgcometes = vgui.Create('DImage', ButtonFive)
    imgcometes:SetSize(wMod * 80, hMod * 80)
    imgcometes:SetPos(0, 0)
    imgcometes:SetImage('materials/cristalf4menur.png')
	
local ButtonGuard = vgui.Create( "DButton", Main )
	ButtonGuard:SizeToContents()
	ButtonGuard:SetTall( 20 )
	ButtonGuard:SetSize(wMod*80,hMod *80)
	ButtonGuard:SetPos( wMod * 535, hMod * 270 )
	ButtonGuard.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(255,241,91))
	end
	ButtonGuard.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/голокрон-джедаев/история-ордена') end

local imgcometese = vgui.Create('DImage', ButtonGuard)
    imgcometese:SetSize(wMod * 80, hMod * 80)
    imgcometese:SetPos(0, 0)
    imgcometese:SetImage('materials/historyf4menur.png')
	
local ButtonFour = vgui.Create( "DButton", Main )
	ButtonFour:SizeToContents()
	ButtonFour:SetTall( 20 )
	ButtonFour:SetSize(wMod*80,hMod *80)
	ButtonFour:SetPos( wMod * 395, hMod * 390 )
	ButtonFour.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(255,241,91))
	end
	ButtonFour.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/голокрон-джедаев/использование-силы') end

local imgcometesr = vgui.Create('DImage', ButtonFour)
    imgcometesr:SetSize(wMod * 80, hMod * 80)
    imgcometesr:SetPos(0, 0)
    imgcometesr:SetImage('materials/forcef4menur.png')
	
local ButtonOne = vgui.Create( "DButton", Main )
	ButtonOne:SizeToContents()
	ButtonOne:SetTall( 20 )
	ButtonOne:SetSize(wMod*80,hMod *80)
	ButtonOne:SetPos( wMod * 535, hMod * 390 )
	ButtonOne.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(255,241,91))
	end
	ButtonOne.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/голокрон-джедаев/стойки') end

local imgcometesrt = vgui.Create('DImage', ButtonOne)
    imgcometesrt:SetSize(wMod * 80, hMod * 80)
    imgcometesrt:SetPos(0, 0)
    imgcometesrt:SetImage('materials/stoicaf4menur.png')

	
-- ПИРАТЫ

elseif (teams.spawn_group == "Pirat") or (teams.spawn_group == "Mand") then

Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Paneles = vgui.Create( "DPanel", Main )
	Paneles:SetPos( wMod * -20, hMod * 23 )
	Paneles:SetSize( wMod * 1050, hMod * 817 )
	Paneles:SetBackgroundColor( 25,25,25 )
	Paneles.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(134,67,1))
	end
	
	local Panelesasaf = vgui.Create( "DPanel", Main )
	Panelesasaf:SetPos( wMod * -20, hMod * 20 )
	Panelesasaf:SetSize( wMod * 1300, hMod * 3 )
	Panelesasaf:SetBackgroundColor( 25,25,25 )
	Panelesasaf.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(134,67,1))
	end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ОСНОВНАЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 190 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 220 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "О СИНДИКАТАХ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "НАСТРОЙКА ВИДА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ОТ ТРЕТЬЕГО ЛИЦА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local imgcometesrt = vgui.Create('DImage', Main)
    imgcometesrt:SetSize(wMod * 460, hMod * 150)
    imgcometesrt:SetPos(wMod * 270, hMod *30)
    imgcometesrt:SetImage('materials/ffour/piratf4menuda.png')
	
	local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 974, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end

local ButtonDiscord = vgui.Create( "DButton", Main )
	ButtonDiscord:SetText( " " )
	ButtonDiscord:SetFont("Trebuchet24")
	ButtonDiscord:SizeToContents()
	ButtonDiscord:SetTall( 20 )
	ButtonDiscord:SetSize(wMod*200,hMod *40)
	ButtonDiscord:SetPos( wMod * 80, hMod * 270 )
	ButtonDiscord.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(134,67,1))
        if self:IsHovered() then
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
	ButtonDiscord.DoClick = function() gui.OpenURL('https://discord.gg/dc59eVberA') end

local ButtonUstav = vgui.Create( "DButton", Main )
	ButtonUstav:SetText( " " )
	ButtonUstav:SetFont("Trebuchet24")
	ButtonUstav:SizeToContents()
	ButtonUstav:SetTall( 20 )
	ButtonUstav:SetSize(wMod*200,hMod *40)
	ButtonUstav:SetPos( wMod * 80, hMod * 370 )
	ButtonUstav.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(134,67,1))
        if self:IsHovered() then
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURN = false
            end
        else
            SHOULDA_RETURN = true
        end
	end
	ButtonUstav.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/устав-вар') end


local ButtonContent = vgui.Create( "DButton", Main )
	ButtonContent:SetText( " " )
	ButtonContent:SetFont("Trebuchet24")
	ButtonContent:SizeToContents()
	ButtonContent:SetTall( 20 )
	ButtonContent:SetSize(wMod*200,hMod *40)
	ButtonContent:SetPos( wMod * 80, hMod * 470 )
	ButtonContent.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(134,67,1))
        if self:IsHovered() then
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNA = false
            end
        else
            SHOULDA_RETURNA = true
        end
	end
	ButtonContent.DoClick = function() gui.OpenURL('https://steamcommunity.com/sharedfiles/filedetails/?id=2587021479') end


local ButtonFive = vgui.Create( "DButton", Main )
	ButtonFive:SizeToContents()
	ButtonFive:SetTall( 20 )
	ButtonFive:SetSize(wMod*80,hMod *80)
	ButtonFive:SetPos( wMod * 395, hMod * 270 )
	ButtonFive.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(134,67,1))
	end
	ButtonFive.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/синдикаты/чёрное-солнце') end

local imgcometes = vgui.Create('DImage', ButtonFive)
    imgcometes:SetSize(wMod * 80, hMod * 80)
    imgcometes:SetPos(0, 0)
    imgcometes:SetImage('materials/blackf4menur.png')
	
local ButtonGuard = vgui.Create( "DButton", Main )
	ButtonGuard:SizeToContents()
	ButtonGuard:SetTall( 20 )
	ButtonGuard:SetSize(wMod*80,hMod *80)
	ButtonGuard:SetPos( wMod * 535, hMod * 270 )
	ButtonGuard.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(134,67,1))
	end
	ButtonGuard.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/синдикаты/клан-хаттов') end

local imgcometese = vgui.Create('DImage', ButtonGuard)
    imgcometese:SetSize(wMod * 80, hMod * 80)
    imgcometese:SetPos(0, 0)
    imgcometese:SetImage('materials/hattsf4menur.png')
	
local ButtonFour = vgui.Create( "DButton", Main )
	ButtonFour:SizeToContents()
	ButtonFour:SetTall( 20 )
	ButtonFour:SetSize(wMod*80,hMod *80)
	ButtonFour:SetPos( wMod * 395, hMod * 390 )
	ButtonFour.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(134,67,1))
	end
	ButtonFour.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/синдикаты/синдикат-пайков') end

local imgcometesr = vgui.Create('DImage', ButtonFour)
    imgcometesr:SetSize(wMod * 80, hMod * 80)
    imgcometesr:SetPos(0, 0)
    imgcometesr:SetImage('materials/paikif4menur.png')
	
local ButtonOne = vgui.Create( "DButton", Main )
	ButtonOne:SizeToContents()
	ButtonOne:SetTall( 20 )
	ButtonOne:SetSize(wMod*80,hMod *80)
	ButtonOne:SetPos( wMod * 535, hMod * 390 )
	ButtonOne.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(134,67,1))
	end
	ButtonOne.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/синдикаты/багровый-рассвет') end

local imgcometesrt = vgui.Create('DImage', ButtonOne)
    imgcometesrt:SetSize(wMod * 80, hMod * 80)
    imgcometesrt:SetPos(0, 0)
    imgcometesrt:SetImage('materials/bagrassvetr.png')


elseif (teams.spawn_group == "Adminese") then

Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesasf = vgui.Create( "DPanel", Main )
	Panelesasf:SetPos( wMod * 0, hMod * 0 )
	Panelesasf:SetSize( wMod * 1000, hMod * 22 )
	Panelesasf:SetBackgroundColor( 25,25,25 )
	Panelesasf.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	--255,241,91
	local Panelesasaf = vgui.Create( "DPanel", Main )
	Panelesasaf:SetPos( wMod * -20, hMod * 20 )
	Panelesasaf:SetSize( wMod * 1300, hMod * 3 )
	Panelesasaf:SetBackgroundColor( 25,25,25 )
	Panelesasaf.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ОСНОВНАЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 190 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 220 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "О ПОДРАЗДЕЛЕНИЯХ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "НАСТРОЙКА ВИДА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ОТ ТРЕТЬЕГО ЛИЦА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local imgcometesrt = vgui.Create('DImage', Main)
    imgcometesrt:SetSize(wMod * 460, hMod * 150)
    imgcometesrt:SetPos(wMod * 270, hMod *30)
    imgcometesrt:SetImage('materials/ffour/clonef4menuda.png')
	
	local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 974, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end

local ButtonDiscord = vgui.Create( "DButton", Main )
	ButtonDiscord:SetText( " " )
	ButtonDiscord:SetFont("Trebuchet24")
	ButtonDiscord:SizeToContents()
	ButtonDiscord:SetTall( 20 )
	ButtonDiscord:SetSize(wMod*200,hMod *40)
	ButtonDiscord:SetPos( wMod * 80, hMod * 270 )
	ButtonDiscord.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
	ButtonDiscord.DoClick = function() gui.OpenURL('https://discord.gg/dc59eVberA') end

local ButtonUstav = vgui.Create( "DButton", Main )
	ButtonUstav:SetText( " " )
	ButtonUstav:SetFont("Trebuchet24")
	ButtonUstav:SizeToContents()
	ButtonUstav:SetTall( 20 )
	ButtonUstav:SetSize(wMod*200,hMod *40)
	ButtonUstav:SetPos( wMod * 80, hMod * 335 )
	ButtonUstav.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURN = false
            end
        else
            SHOULDA_RETURN = true
        end
	end
	ButtonUstav.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/устав-вар') end


local ButtonContent = vgui.Create( "DButton", Main )
	ButtonContent:SetText( " " )
	ButtonContent:SetFont("Trebuchet24")
	ButtonContent:SizeToContents()
	ButtonContent:SetTall( 20 )
	ButtonContent:SetSize(wMod*200,hMod *40)
	ButtonContent:SetPos( wMod * 80, hMod * 400 )
	ButtonContent.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNA = false
            end
        else
            SHOULDA_RETURNA = true
        end
	end
	ButtonContent.DoClick = function() gui.OpenURL('https://steamcommunity.com/sharedfiles/filedetails/?id=2587021479') end
	
local ButtonDefcone = vgui.Create( "DButton", Main )
	ButtonDefcone:SetText( " " )
	ButtonDefcone:SetFont("Trebuchet24")
	ButtonDefcone:SizeToContents()
	ButtonDefcone:SetTall( 20 )
	ButtonDefcone:SetSize(wMod*200,hMod *40)
	ButtonDefcone:SetPos( wMod * 80, hMod * 470 )
	ButtonDefcone.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Ивент-система", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Ивент-система", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNATR then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNATR = false
            end
        else
            SHOULDA_RETURNATR = true
        end
	end
	ButtonDefcone.DoClick = function() 
		LocalPlayer():ConCommand( "say /mapadmin" )
	end

local ButtonFive = vgui.Create( "DButton", Main )
	ButtonFive:SizeToContents()
	ButtonFive:SetTall( 20 )
	ButtonFive:SetSize(wMod*80,hMod *80)
	ButtonFive:SetPos( wMod * 395, hMod * 270 )
	ButtonFive.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonFive.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/327th') end

local imgcometes = vgui.Create('DImage', ButtonFive)
    imgcometes:SetSize(wMod * 80, hMod * 80)
    imgcometes:SetPos(0, 0)
    imgcometes:SetImage('materials/327f4menur.png')
	
local ButtonGuard = vgui.Create( "DButton", Main )
	ButtonGuard:SizeToContents()
	ButtonGuard:SetTall( 20 )
	ButtonGuard:SetSize(wMod*80,hMod *80)
	ButtonGuard:SetPos( wMod * 535, hMod * 270 )
	ButtonGuard.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonGuard.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/rsb') end
	
local imgcometese = vgui.Create('DImage', ButtonGuard)
    imgcometese:SetSize(wMod * 80, hMod * 80)
    imgcometese:SetPos(0, 0)
    imgcometese:SetImage('materials/guardf4menur.png')
	

local ButtonFour = vgui.Create( "DButton", Main )
	ButtonFour:SizeToContents()
	ButtonFour:SetTall( 20 )
	ButtonFour:SetSize(wMod*80,hMod *80)
	ButtonFour:SetPos( wMod * 395, hMod * 390 )
	ButtonFour.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonFour.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/ct-corps') end

local imgcometesr = vgui.Create('DImage', ButtonFour)
    imgcometesr:SetSize(wMod * 80, hMod * 80)
    imgcometesr:SetPos(0, 0)
    imgcometesr:SetImage('materials/ctf4menur.png')
	
local ButtonOne = vgui.Create( "DButton", Main )
	ButtonOne:SizeToContents()
	ButtonOne:SetTall( 20 )
	ButtonOne:SetSize(wMod*80,hMod *80)
	ButtonOne:SetPos( wMod * 535, hMod * 390 )
	ButtonOne.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonOne.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/41st') end

local imgcometesrt = vgui.Create('DImage', ButtonOne)
    imgcometesrt:SetSize(wMod * 80, hMod * 80)
    imgcometesrt:SetPos(0, 0)
    imgcometesrt:SetImage('materials/41f4menur.png')

local ButtonOneS = vgui.Create( "DButton", Main )
	ButtonOneS:SizeToContents()
	ButtonOneS:SetTall( 20 )
	ButtonOneS:SetSize(wMod*80,hMod *80)
	ButtonOneS:SetPos( wMod * 465, hMod * 510 )
	ButtonOneS.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonOneS.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/21st') end

local imgcometesrtad = vgui.Create('DImage', ButtonOneS)
    imgcometesrtad:SetSize(wMod * 80, hMod * 80)
    imgcometesrtad:SetPos(0, 0)
    imgcometesrtad:SetImage('materials/21f4menur.png')

-- ГВАРДИЯ

elseif (teams.spawn_group == "GuardCor") then

Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesasf = vgui.Create( "DPanel", Main )
	Panelesasf:SetPos( wMod * 0, hMod * 0 )
	Panelesasf:SetSize( wMod * 1000, hMod * 22 )
	Panelesasf:SetBackgroundColor( 25,25,25 )
	Panelesasf.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	--255,241,91
	local Panelesasaf = vgui.Create( "DPanel", Main )
	Panelesasaf:SetPos( wMod * -20, hMod * 20 )
	Panelesasaf:SetSize( wMod * 1300, hMod * 3 )
	Panelesasaf:SetBackgroundColor( 25,25,25 )
	Panelesasaf.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ОСНОВНАЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 190 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 220 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "О ПОДРАЗДЕЛЕНИЯХ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "НАСТРОЙКА ВИДА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ОТ ТРЕТЬЕГО ЛИЦА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local imgcometesrt = vgui.Create('DImage', Main)
    imgcometesrt:SetSize(wMod * 460, hMod * 150)
    imgcometesrt:SetPos(wMod * 270, hMod *30)
    imgcometesrt:SetImage('materials/ffour/clonef4menuda.png')
	
	local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 974, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end

local ButtonDiscord = vgui.Create( "DButton", Main )
	ButtonDiscord:SetText( " " )
	ButtonDiscord:SetFont("Trebuchet24")
	ButtonDiscord:SizeToContents()
	ButtonDiscord:SetTall( 20 )
	ButtonDiscord:SetSize(wMod*200,hMod *40)
	ButtonDiscord:SetPos( wMod * 80, hMod * 270 )
	ButtonDiscord.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
	ButtonDiscord.DoClick = function() gui.OpenURL('https://discord.gg/dc59eVberA') end

local ButtonUstav = vgui.Create( "DButton", Main )
	ButtonUstav:SetText( " " )
	ButtonUstav:SetFont("Trebuchet24")
	ButtonUstav:SizeToContents()
	ButtonUstav:SetTall( 20 )
	ButtonUstav:SetSize(wMod*200,hMod *40)
	ButtonUstav:SetPos( wMod * 80, hMod * 335 )
	ButtonUstav.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURN = false
            end
        else
            SHOULDA_RETURN = true
        end
	end
	ButtonUstav.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/устав-вар') end


local ButtonContent = vgui.Create( "DButton", Main )
	ButtonContent:SetText( " " )
	ButtonContent:SetFont("Trebuchet24")
	ButtonContent:SizeToContents()
	ButtonContent:SetTall( 20 )
	ButtonContent:SetSize(wMod*200,hMod *40)
	ButtonContent:SetPos( wMod * 80, hMod * 400 )
	ButtonContent.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNA = false
            end
        else
            SHOULDA_RETURNA = true
        end
	end
	ButtonContent.DoClick = function() gui.OpenURL('https://steamcommunity.com/sharedfiles/filedetails/?id=2587021479') end
	
local ButtonContentld = vgui.Create( "DButton", Main )
	ButtonContentld:SetText( " " )
	ButtonContentld:SetFont("Trebuchet24")
	ButtonContentld:SizeToContents()
	ButtonContentld:SetTall( 20 )
	ButtonContentld:SetSize(wMod*200,hMod *40)
	ButtonContentld:SetPos( wMod * 80, hMod * 470 )
	ButtonContentld.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Смена персонажа", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Смена персонажа", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNAGAGA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNAGAGA = false
            end
        else
            SHOULDA_RETURNAGAGA = true
        end
	end
	ButtonContentld.DoClick = function() LocalPlayer():ConCommand( "say /char" ) Main:Close() end
	
local ButtonDefcone = vgui.Create( "DButton", Main )
	ButtonDefcone:SetText( " " )
	ButtonDefcone:SetFont("Trebuchet24")
	ButtonDefcone:SizeToContents()
	ButtonDefcone:SetTall( 20 )
	ButtonDefcone:SetSize(wMod*200,hMod *40)
	ButtonDefcone:SetPos( wMod * 80, hMod * 540 )
	ButtonDefcone.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Система кодов", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Система кодов", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNATR then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNATR = false
            end
        else
            SHOULDA_RETURNATR = true
        end
	end
	ButtonDefcone.DoClick = function() 
	Main:Close() 
	local Main = vgui.Create('DFrame')
	Main:SetSize(wMod * 700, hMod * 300)
	Main:Center()
	Main:SetVisible(true)
	Main:SetTitle( ' ' )
	Main:MakePopup()
	Main:ShowCloseButton( false )
	Main:SetDraggable( false )
	Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	
	local Paneles = vgui.Create( "DPanel", Main )
	Paneles:SetPos( wMod * -20, hMod * 23 )
	Paneles:SetSize( wMod * 740, hMod * 377 )
	Paneles:SetBackgroundColor( 25,25,25 )
	Paneles.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25))
	end
	
	local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 674, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "Система Кодов" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*200,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 250, hMod * 40 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonContent = vgui.Create( "DButton", Main )
	ButtonContent:SetText( " " )
	ButtonContent:SetFont("Trebuchet24")
	ButtonContent:SizeToContents()
	ButtonContent:SetTall( 20 )
	ButtonContent:SetSize(wMod*220,hMod *40)
	ButtonContent:SetPos( wMod * 10, hMod * 100 )
	ButtonContent.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Зеленый код", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,104,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Зеленый код", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
    end
	ButtonContent.DoClick = function() 
	LocalPlayer():ConCommand( "defconegreendaaa" )
	Main:Close() 
	end
	
	local ButtonContents = vgui.Create( "DButton", Main )
	ButtonContents:SetText( " " )
	ButtonContents:SetFont("Trebuchet24")
	ButtonContents:SizeToContents()
	ButtonContents:SetTall( 20 )
	ButtonContents:SetSize(wMod*220,hMod *40)
	ButtonContents:SetPos( wMod * 240, hMod * 100 )
	ButtonContents.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Желтый код", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,104,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if SHOULD_ACCEPT then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_ACCEPT = false
            end
        else
            draw.SimpleText("Желтый код", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            SHOULD_ACCEPT = true
        end
    end 
	ButtonContents.DoClick = function() 
	LocalPlayer():ConCommand( "defconeyellowdaaa" )
	Main:Close() 
	end
	
	local ButtonContenta = vgui.Create( "DButton", Main )
	ButtonContenta:SetText( " " )
	ButtonContenta:SetFont("Trebuchet24")
	ButtonContenta:SizeToContents()
	ButtonContenta:SetTall( 20 )
	ButtonContenta:SetSize(wMod*220,hMod *40)
	ButtonContenta:SetPos( wMod * 470, hMod * 100 )
	ButtonContenta.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Красный код ОВО", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,104,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Красный код ОВО", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
		if self:IsHovered() then
            if SHOULD_S then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_S = false
            end
        else
            SHOULD_S = true
        end
    end 
	ButtonContenta.DoClick = function() 
	LocalPlayer():ConCommand( "defconereddaaa" )
	Main:Close() 
	end
	
	local ButtonContentaw = vgui.Create( "DButton", Main )
	ButtonContentaw:SetText( " " )
	ButtonContentaw:SetFont("Trebuchet24")
	ButtonContentaw:SizeToContents()
	ButtonContentaw:SetTall( 20 )
	ButtonContentaw:SetSize(wMod*220,hMod *40)
	ButtonContentaw:SetPos( wMod * 10, hMod * 150 )
	ButtonContentaw.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Черный код", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,104,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Черный код", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
		if self:IsHovered() then
            if SHOULD_SI then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_SI = false
            end
        else
            SHOULD_SI = true
        end
    end 
	ButtonContentaw.DoClick = function() 
	LocalPlayer():ConCommand( "defconeblackdaaa" )
	Main:Close() 
	end
	
	local ButtonContentawh = vgui.Create( "DButton", Main )
	ButtonContentawh:SetText( " " )
	ButtonContentawh:SetFont("Trebuchet24")
	ButtonContentawh:SizeToContents()
	ButtonContentawh:SetTall( 20 )
	ButtonContentawh:SetSize(wMod*220,hMod *40)
	ButtonContentawh:SetPos( wMod * 470, hMod * 150 )
	ButtonContentawh.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Заражение", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,104,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Заражение", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
		if self:IsHovered() then
            if SHOULD_SIA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_SIA = false
            end
        else
            SHOULD_SIA = true
        end
    end 
	ButtonContentawh.DoClick = function() 
	LocalPlayer():ConCommand( "defconemeddaaa" )
	Main:Close() 
	end
	
	local ButtonContentawha = vgui.Create( "DButton", Main )
	ButtonContentawha:SetText( " " )
	ButtonContentawha:SetFont("Trebuchet24")
	ButtonContentawha:SizeToContents()
	ButtonContentawha:SetTall( 20 )
	ButtonContentawha:SetSize(wMod*220,hMod *40)
	ButtonContentawha:SetPos( wMod * 240, hMod * 150 )
	ButtonContentawha.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Крейсер КНС", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,104,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Крейсер КНС", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
		if self:IsHovered() then
            if SHOULD_SIAG then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_SIAG = false
            end
        else
            SHOULD_SIAG = true
        end
    end 
	ButtonContentawha.DoClick = function() 
	LocalPlayer():ConCommand( "defconevozuhedaaa" )
	Main:Close() 
	end
	
	local ButtonContentawhat = vgui.Create( "DButton", Main )
	ButtonContentawhat:SetText( " " )
	ButtonContentawhat:SetFont("Trebuchet24")
	ButtonContentawhat:SizeToContents()
	ButtonContentawhat:SetTall( 20 )
	ButtonContentawhat:SetSize(wMod*220,hMod *40)
	ButtonContentawhat:SetPos( wMod * 240, hMod * 200 )
	ButtonContentawhat.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Красный код ВО", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,104,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Красный код ВО", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
		if self:IsHovered() then
            if SHOULD_SIAGAA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_SIAGAA = false
            end
        else
            SHOULD_SIAGAA = true
        end
    end 
	ButtonContentawhat.DoClick = function() 
	LocalPlayer():ConCommand( "defconeredvoedaaa" )
	Main:Close() 
	end
	end

local ButtonFive = vgui.Create( "DButton", Main )
	ButtonFive:SizeToContents()
	ButtonFive:SetTall( 20 )
	ButtonFive:SetSize(wMod*80,hMod *80)
	ButtonFive:SetPos( wMod * 395, hMod * 270 )
	ButtonFive.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonFive.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/327th') end

local imgcometes = vgui.Create('DImage', ButtonFive)
    imgcometes:SetSize(wMod * 80, hMod * 80)
    imgcometes:SetPos(0, 0)
    imgcometes:SetImage('materials/327f4menur.png')
	
local ButtonGuard = vgui.Create( "DButton", Main )
	ButtonGuard:SizeToContents()
	ButtonGuard:SetTall( 20 )
	ButtonGuard:SetSize(wMod*80,hMod *80)
	ButtonGuard:SetPos( wMod * 535, hMod * 270 )
	ButtonGuard.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonGuard.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/rsb') end
	
local imgcometese = vgui.Create('DImage', ButtonGuard)
    imgcometese:SetSize(wMod * 80, hMod * 80)
    imgcometese:SetPos(0, 0)
    imgcometese:SetImage('materials/guardf4menur.png')
	

local ButtonFour = vgui.Create( "DButton", Main )
	ButtonFour:SizeToContents()
	ButtonFour:SetTall( 20 )
	ButtonFour:SetSize(wMod*80,hMod *80)
	ButtonFour:SetPos( wMod * 395, hMod * 390 )
	ButtonFour.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonFour.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/ct-corps') end

local imgcometesr = vgui.Create('DImage', ButtonFour)
    imgcometesr:SetSize(wMod * 80, hMod * 80)
    imgcometesr:SetPos(0, 0)
    imgcometesr:SetImage('materials/ctf4menur.png')
	
local ButtonOne = vgui.Create( "DButton", Main )
	ButtonOne:SizeToContents()
	ButtonOne:SetTall( 20 )
	ButtonOne:SetSize(wMod*80,hMod *80)
	ButtonOne:SetPos( wMod * 535, hMod * 390 )
	ButtonOne.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonOne.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/41st') end

local imgcometesrt = vgui.Create('DImage', ButtonOne)
    imgcometesrt:SetSize(wMod * 80, hMod * 80)
    imgcometesrt:SetPos(0, 0)
    imgcometesrt:SetImage('materials/41f4menur.png')
	
local ButtonOneS = vgui.Create( "DButton", Main )
	ButtonOneS:SizeToContents()
	ButtonOneS:SetTall( 20 )
	ButtonOneS:SetSize(wMod*80,hMod *80)
	ButtonOneS:SetPos( wMod * 465, hMod * 510 )
	ButtonOneS.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonOneS.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/21st') end

local imgcometesrtad = vgui.Create('DImage', ButtonOneS)
    imgcometesrtad:SetSize(wMod * 80, hMod * 80)
    imgcometesrtad:SetPos(0, 0)
    imgcometesrtad:SetImage('materials/21f4menur.png')

-- КЛОНЫ

else

Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesasf = vgui.Create( "DPanel", Main )
	Panelesasf:SetPos( wMod * 0, hMod * 0 )
	Panelesasf:SetSize( wMod * 1000, hMod * 22 )
	Panelesasf:SetBackgroundColor( 25,25,25 )
	Panelesasf.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	--255,241,91
	local Panelesasaf = vgui.Create( "DPanel", Main )
	Panelesasaf:SetPos( wMod * -20, hMod * 20 )
	Panelesasaf:SetSize( wMod * 1300, hMod * 3 )
	Panelesasaf:SetBackgroundColor( 25,25,25 )
	Panelesasaf.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ОСНОВНАЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 190 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 50, hMod * 220 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ИНФОРМАЦИЯ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "О ПОДРАЗДЕЛЕНИЯХ" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 330, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "НАСТРОЙКА ВИДА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 190 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local ButtonasiDiscordsa = vgui.Create( "DButton", Main )
	ButtonasiDiscordsa:SetText( "ОТ ТРЕТЬЕГО ЛИЦА" )
	ButtonasiDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasiDiscordsa:SizeToContents()
	ButtonasiDiscordsa:SetTall( 20 )
	ButtonasiDiscordsa:SetSize(wMod*350,hMod *30)
	ButtonasiDiscordsa:SetPos( wMod * 650, hMod * 220 )
	ButtonasiDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasiDiscordsa.DoClick = function() 
    end
	
	local imgcometesrt = vgui.Create('DImage', Main)
    imgcometesrt:SetSize(wMod * 460, hMod * 150)
    imgcometesrt:SetPos(wMod * 270, hMod *30)
    imgcometesrt:SetImage('materials/ffour/clonef4menuda.png')
	
	local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 974, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end

local ButtonDiscord = vgui.Create( "DButton", Main )
	ButtonDiscord:SetText( " " )
	ButtonDiscord:SetFont("Trebuchet24")
	ButtonDiscord:SizeToContents()
	ButtonDiscord:SetTall( 20 )
	ButtonDiscord:SetSize(wMod*200,hMod *40)
	ButtonDiscord:SetPos( wMod * 80, hMod * 270 )
	ButtonDiscord.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Дискорд Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURN = false
            end
        else
            SHOULD_RETURN = true
        end
	end
	ButtonDiscord.DoClick = function() gui.OpenURL('https://discord.gg/dc59eVberA') end

local ButtonUstav = vgui.Create( "DButton", Main )
	ButtonUstav:SetText( " " )
	ButtonUstav:SetFont("Trebuchet24")
	ButtonUstav:SizeToContents()
	ButtonUstav:SetTall( 20 )
	ButtonUstav:SetSize(wMod*200,hMod *40)
	ButtonUstav:SetPos( wMod * 80, hMod * 340 )
	ButtonUstav.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Устав ВАР", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURN then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURN = false
            end
        else
            SHOULDA_RETURN = true
        end
	end
	ButtonUstav.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/устав-вар') end


local ButtonContent = vgui.Create( "DButton", Main )
	ButtonContent:SetText( " " )
	ButtonContent:SetFont("Trebuchet24")
	ButtonContent:SizeToContents()
	ButtonContent:SetTall( 20 )
	ButtonContent:SetSize(wMod*200,hMod *40)
	ButtonContent:SetPos( wMod * 80, hMod * 410 )
	ButtonContent.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Контент Сервера", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNA = false
            end
        else
            SHOULDA_RETURNA = true
        end
	end
	ButtonContent.DoClick = function() gui.OpenURL('https://steamcommunity.com/sharedfiles/filedetails/?id=2587021479') end

local ButtonContentld = vgui.Create( "DButton", Main )
	ButtonContentld:SetText( " " )
	ButtonContentld:SetFont("Trebuchet24")
	ButtonContentld:SizeToContents()
	ButtonContentld:SetTall( 20 )
	ButtonContentld:SetSize(wMod*200,hMod *40)
	ButtonContentld:SetPos( wMod * 80, hMod * 480 )
	ButtonContentld.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Смена персонажа", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Смена персонажа", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULDA_RETURNAGAGA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULDA_RETURNAGAGA = false
            end
        else
            SHOULDA_RETURNAGAGA = true
        end
	end
	ButtonContentld.DoClick = function() LocalPlayer():ConCommand( "say /char" ) Main:Close() end

local ButtonFive = vgui.Create( "DButton", Main )
	ButtonFive:SizeToContents()
	ButtonFive:SetTall( 20 )
	ButtonFive:SetSize(wMod*80,hMod *80)
	ButtonFive:SetPos( wMod * 395, hMod * 270 )
	ButtonFive.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonFive.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/327th') end

local imgcometes = vgui.Create('DImage', ButtonFive)
    imgcometes:SetSize(wMod * 80, hMod * 80)
    imgcometes:SetPos(0, 0)
    imgcometes:SetImage('materials/327f4menur.png')
	
local ButtonGuard = vgui.Create( "DButton", Main )
	ButtonGuard:SizeToContents()
	ButtonGuard:SetTall( 20 )
	ButtonGuard:SetSize(wMod*80,hMod *80)
	ButtonGuard:SetPos( wMod * 535, hMod * 270 )
	ButtonGuard.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonGuard.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/rsb') end
	
local imgcometese = vgui.Create('DImage', ButtonGuard)
    imgcometese:SetSize(wMod * 80, hMod * 80)
    imgcometese:SetPos(0, 0)
    imgcometese:SetImage('materials/guardf4menur.png')
	

local ButtonFour = vgui.Create( "DButton", Main )
	ButtonFour:SizeToContents()
	ButtonFour:SetTall( 20 )
	ButtonFour:SetSize(wMod*80,hMod *80)
	ButtonFour:SetPos( wMod * 395, hMod * 390 )
	ButtonFour.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonFour.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/ct-corps') end

local imgcometesr = vgui.Create('DImage', ButtonFour)
    imgcometesr:SetSize(wMod * 80, hMod * 80)
    imgcometesr:SetPos(0, 0)
    imgcometesr:SetImage('materials/ctf4menur.png')
	
local ButtonOne = vgui.Create( "DButton", Main )
	ButtonOne:SizeToContents()
	ButtonOne:SetTall( 20 )
	ButtonOne:SetSize(wMod*80,hMod *80)
	ButtonOne:SetPos( wMod * 535, hMod * 390 )
	ButtonOne.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonOne.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/41st') end

local imgcometesrt = vgui.Create('DImage', ButtonOne)
    imgcometesrt:SetSize(wMod * 80, hMod * 80)
    imgcometesrt:SetPos(0, 0)
    imgcometesrt:SetImage('materials/41f4menur.png')
	
local ButtonOneS = vgui.Create( "DButton", Main )
	ButtonOneS:SizeToContents()
	ButtonOneS:SetTall( 20 )
	ButtonOneS:SetSize(wMod*80,hMod *80)
	ButtonOneS:SetPos( wMod * 465, hMod * 510 )
	ButtonOneS.Paint = function(self, w, h)
	draw.RoundedBox(10,0,0,w,h,Color(34,104,255))
	end
	ButtonOneS.DoClick = function() gui.OpenURL('https://sites.google.com/view/the-force-unleashed-clone-wars/база-данных/подразделения/21st') end

local imgcometesrtad = vgui.Create('DImage', ButtonOneS)
    imgcometesrtad:SetSize(wMod * 80, hMod * 80)
    imgcometesrtad:SetPos(0, 0)
    imgcometesrtad:SetImage('materials/21f4menur.png')

end
end
	 
	 local max_x, max_y = 120, 100
        local Slider = vgui.Create( "DSlider", Main )
        Slider:SetSize(wMod * 200,hMod * 200 )
        Slider:SetPos(wMod * 725, hMod * 270 )
        Slider:SetLockX()
        Slider:SetLockY()
        Slider:SetSlideY(tonumber(thirtperson.z:GetString()))
        Slider:SetSlideX(tonumber(thirtperson.y:GetString()))
        Slider.Knob:SetSize(14,14)
        Slider.Knob.Paint = function( self, w, h )
            -- local col = self.Depressed and Color(0,165,255,255) or (self:IsHovered() and Color(190,190,190,255) or color_white)
            local col = self.Depressed and Color(0,165,255,255) or Color(0,165,255,230)
            draw.RoundedBox(0,0,0,w,h,col)
        end
        Slider.Paint = function( self, w, h )
            draw.RoundedBox(0,0,0,w,h,Color(0,0,0,90))
            local y, z = self:GetSlideX(), self:GetSlideY()
            surface.SetDrawColor(Color(255,255,255,90))
            surface.DrawLine(y*w,0,y*w,h)
            surface.DrawLine(0,z*h,w,z*h)

            surface.DrawLine(0,w*.5,w,w*.5)
            surface.DrawLine(h*.5,0,h*.5,h)
            draw.SimpleText(' '..y*100, "DermaDefault", y*w, 0, color_white, 1, 0)
            draw.SimpleText(' '..z*100, "DermaDefault", h, z*h, color_white, 2, 1)

            thirtperson.y:SetString(y)
            thirtperson.z:SetString(z)
            surface.DrawOutlinedRect( 0, 0, w, h )
        end
        local ZSlider = vgui.Create( "DNumSlider", Main )
        ZSlider:SetSize(wMod * 200,hMod * 20 )
        ZSlider:SetPos(wMod * 725, hMod * 470 )
        ZSlider.Paint = function( self, w, h )
            draw.RoundedBox(0,0,0,w,h,Color(0,0,0,90))
            surface.SetDrawColor(Color(255,255,255,90))
            surface.DrawOutlinedRect( 0, 0, w, h )

            surface.DrawLine(w*.5,0,w*.5,w)
        end

        ZSlider:SetConVar('thirtperson_x')
        ZSlider:SetMin( 40 )
        ZSlider:SetMax( 200 )
        ZSlider:SetDecimals( 0 )

        ZSlider.PerformLayout = function()
            ZSlider:GetTextArea():SetWide(0)
            ZSlider.Label:SetWide(0)
            ZSlider.Slider:SetPos(0,0)
            ZSlider.Slider.Knob:SetSize(18,18)
            ZSlider.Slider.Paint = function( self, w, h ) end
            ZSlider.Slider.Knob.Paint = function( self, w, h )
                local col = self.Depressed and Color(0,165,255,255) or Color(0,165,255,230)
                local pos_x = ZSlider:GetValue() == ZSlider:GetMax() and -1 or (ZSlider:GetValue() == ZSlider:GetMin() and 1 or 0)

                draw.RoundedBox(0,pos_x,0,w,h,col)
            end
        end

        local Person = vgui.Create( "DButton", Main )
        Person:SetSize( wMod * right_side_width/2,hMod * 30 )
        Person:SetText('')
        Person:SetPos(wMod * 725,hMod * 500 )
        Person:SetZPos(10)
        Person.Paint = function( self, w, h )
            -- draw.RoundedBox(0, 0, 0, w, h, Color(92,184,92))
            if thirdperson_enabled then
                draw.RoundedBox(5, 0, 0, w, h, Color(255,48,48))
                draw.SimpleText('Выключить Третье лицо', "font_base_18", w/2, h/2, Color( 255, 255, 255, 255 ), 1, 1)
            else
                draw.RoundedBox(5, 0, 0, w, h, Color(34,104,255))
                draw.SimpleText('Включить Третье лицо', "font_base_18", w/2, h/2, Color( 255, 255, 255, 255 ), 1, 1)
            end
        end
        Person:SetZPos( 0 )

        Person.DoClick = function( self )
            thirdperson_enabled = not thirdperson_enabled
            -- Menu:Remove()
        end
		
end

function GM:ShowHelp(ply)
    thirdperson_enabled = not thirdperson_enabled
    -- Menu:Remove()
end