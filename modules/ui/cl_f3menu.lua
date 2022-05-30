function GM:ShowSpare1()
	local xScreenRes = 1920
    local yScreenRes = 1080
    local wMod = ScrW() / xScreenRes
    local hMod = ScrH() / yScreenRes
	
	local cc = Material("materials/casqueclone.png")
	local ncc = Material("materials/sanscasque.png")
	
	local Main = vgui.Create('DFrame')
	Main:SetSize(wMod * 800, hMod * 470)
	Main:Center()
	Main:SetTitle( ' ' )
	Main:MakePopup()
	Main:ShowCloseButton( false )
	Main:SetDraggable( false )
	-- Main.OnClose = function( self )
	-- 	file.Write( "tfc.txt", util.TableToJSON(LocalPlayer().Thirtperson) )
	-- end

local teams = mopp.jobs[LocalPlayer():Team()]
if teams and teams.spawn_group then
if teams.spawn_group == "Clones" or teams.spawn_group == "GuardCor" or teams.spawn_group == "FourOne" or teams.spawn_group == "OneZero" or teams.spawn_group == "FiveZero" or teams.spawn_group == "Doomsq" or teams.spawn_group == "TwoTwo" then

	Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesas = vgui.Create( "DPanel", Main )
	Panelesas:SetPos( wMod * 0, hMod * 0 )
	Panelesas:SetSize( wMod * 800, hMod * 22 )
	Panelesas:SetBackgroundColor( 25,25,25 )
	Panelesas.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	--255,241,91
	local Panelesasa = vgui.Create( "DPanel", Main )
	Panelesasa:SetPos( wMod * -20, hMod * 20 )
	Panelesasa:SetSize( wMod * 850, hMod * 3 )
	Panelesasa:SetBackgroundColor( 25,25,25 )
	Panelesasa.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	
	local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 774, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end
	
	local Paneles = vgui.Create( "DPanel", Main )
	Paneles:SetPos( wMod * 290, hMod * 80 )
	Paneles:SetSize( wMod * 220, hMod * 360 )
	Paneles:SetBackgroundColor( red )
	Paneles.Paint = function(s,w,h)
	
		draw.RoundedBox(0,0,0,w,h,Color(50,50,50,200))
	end
	
	
		local icon = vgui.Create( "DModelPanel", Paneles )
		icon:SetPos(wMod * -60, hMod * -10	)
		icon:SetSize( wMod * 350, hMod * 370 )
		icon:SetModel( LocalPlayer():GetModel() )
		icon:SetCamPos(Vector(40, 40, 40))
		icon:SetAnimated(true)
		
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( LocalPlayer():Name() )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 270, hMod * 20 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
		
	local ButtonaDiscordsa = vgui.Create( "DButton", Main )
	ButtonaDiscordsa:SetText( team.GetName(LocalPlayer():Team()) )
	ButtonaDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonaDiscordsa:SizeToContents()
	ButtonaDiscordsa:SetTall( 20 )
	ButtonaDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonaDiscordsa:SetPos( wMod * 270, hMod * 45 )
	ButtonaDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonaDiscordsa.DoClick = function() 
    end

local ButtonDiscord = vgui.Create( "DButton", Main )
	ButtonDiscord:SetText( " " )
	ButtonDiscord:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonDiscord:SizeToContents()
	ButtonDiscord:SetTall( 20 )
	ButtonDiscord:SetSize(wMod*200,hMod *40)
	ButtonDiscord:SetPos( wMod * 40, hMod * 60 )
	ButtonDiscord.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Интерфейс", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Интерфейс", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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
	ButtonDiscord.DoClick = function(pPlayer) 

if a == 0 then

hook.Add('HUDPaint', 'Helmet_HUD', function()
 --if true then return end
--  PrintTable(tbl_helmeted_models)

  local ply = LocalPlayer()

  local ply_model = ply:GetModel()
  local ply_bodygroups = ply:GetBodyGroups() -- + x:GetBodygroup(number id)

  local health = ply:Health()
  local armor = ply:Armor()
  local critical_level = 30
  --  print("MODEL_TBL - "..tbl_helmeted_models[ply_model])

local teams = mopp.jobs[LocalPlayer():Team()]
if teams and teams.spawn_group then
if teams.spawn_group == "Clones" then
  
	local id_helmet = ply:FindBodygroupByName( "Helmet" )
	--print("G:"..id_helmet.." N:"..ply:GetBodygroup( id_helmet ))
	
	
	if ply_model == "models/gonzo/kricofficerpilot/kricpilot/kricpilot.mdl" then -- ИСКЛЮЧЕНИЕ
		if ply:GetBodygroup( id_helmet ) != 1  then return end
	else
		if ply:GetBodygroup( id_helmet ) != 0 then return end
	end
	
  end 
end
	
	
	-- BODYGROUP EXT
	
--draw.RoundedBox( 0, ScrW()/2 - 200, ScrH()/2 - 200, 400, 400, Color(25,25,25,255) )

	if critical_level >= health then

		surface.SetDrawColor( 255, 15, 15, 18 )
		surface.SetMaterial( Material("vgui/crit.png")	)
		surface.DrawRect( 0, 0, ScrW(), ScrH() )
	end

	surface.SetDrawColor( 255, 255, 255, 50 )
	surface.SetMaterial( Material("vgui/glass.png")	)
	surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )

	--surface.SetDrawColor( 255, 255, 255, 155 )
	--surface.SetMaterial( Material("vgui/damage_glass1.png")	)
	--surface.DrawTexturedRect( 0, 0, ScrW()/2, ScrH()/2 )




	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.SetMaterial( Material("vgui/test2.png")	)
	surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )

	if health <= 50 then
		surface.SetDrawColor( 255, 255, 255, 185 )
		surface.SetMaterial( Material("vgui/dirt.png") )
		surface.DrawTexturedRect( 0,0,ScrW() , ScrH() )
	end

	posx_main = ScrW()*0.23
	posx_main2 = ScrW()*0.67
	posy_main = ScrH()*0.85

	local am_i_hp = health*0.1
	local am_i_ar = armor*0.1


	-- Black Poloska
	for i = 1, 10 do
		local re_i = i*14
		local re_l = i*7
		draw.RoundedBox(0, posx_main + re_l, posy_main + re_i , 200 - re_l, 12  , Color(175, 175, 205, 95)) -- 1 HP
		draw.RoundedBox(0, posx_main2, posy_main + re_i , 200 - re_l, 12  , Color(175, 175, 205, 95)) -- 1 HP
	end

	for i = 1, am_i_hp do
		local re_i = i*14
		local re_l = i*7
		draw.RoundedBox(0, posx_main + re_l, posy_main + re_i , 200 - re_l, 12  , Color(25, 188, 25, 175)) -- 1 HP

	end

	for i = 1, am_i_ar do
		local re_i = i*14
		local re_l = i*7
		draw.RoundedBox(0, posx_main2, posy_main + re_i , 200 - re_l, 12  , Color(25, 140, 188, 175)) -- 1 HP
	end


	if critical_level >= health then


		print(error_sp)

		surface.SetDrawColor( 255, 255, 255, error_sp )
		surface.SetMaterial( Material("vgui/crit.png")	)
		surface.DrawTexturedRect( ScrW()*0.25, 100, ScrW()*0.5, 128 )
	end



		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( Material("vgui/cross.png")	)
		surface.DrawTexturedRect( ScrW()*0.5 - 30, ScrH()*0.5 - 30, 60, 60 )
	--[[
	--draw.RoundedBox(0, posx_main, posy_main , lerp_hp_red, 40, Color(255,100,100,100)) -- RED HP
	--draw.RoundedBox(0, posx_main, posy_main , lerp_hp, 40, Color(255, 25, 25, 155)) -- 1 HP

	local ar_marker = armor * const_bar_size/100
	lerp_ar = Lerp(0.025 , lerp_ar , ar_marker)
	lerp_ar_blue = Lerp(0.015 , lerp_ar_blue , ar_marker)

	draw.RoundedBox(0, posx_main, posy_main - 42,  lerp_ar_blue, 40, Color(100,100,255,100))
	draw.RoundedBox(0, posx_main, posy_main - 42, lerp_ar, 40, Color(25, 25, 255, 155)) -- 1 ARMOR
	]]--

end)

hook.Remove("HUDPaintBackground", "GUIosn")
a = 1

else

hook.Remove('HUDPaint', 'Helmet_HUD')

a = 0
end

end

local ButtonDiscords = vgui.Create( "DButton", Main )
	ButtonDiscords:SetText( " " )
	ButtonDiscords:SetFont("Trebuchet24")
	ButtonDiscords:SizeToContents()
	ButtonDiscords:SetTall( 20 )
	ButtonDiscords:SetSize(wMod*200,hMod *40)
	ButtonDiscords:SetPos( wMod * 40, hMod * 135 )
	ButtonDiscords.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Тепловизор", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Тепловизор", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNA = false
            end
        else
            SHOULD_RETURNA = true
        end
	end
	ButtonDiscords.DoClick = function() 		
	    LocalPlayer():ConCommand( "nv_type 2" )
        LocalPlayer():ConCommand( "nv_togg" )
end

local Nightvision = false

local ButtonDiscordsa = vgui.Create( "DButton", Main )
	ButtonDiscordsa:SetText( " " )
	ButtonDiscordsa:SetFont("Trebuchet24")
	ButtonDiscordsa:SizeToContents()
	ButtonDiscordsa:SetTall( 20 )
	ButtonDiscordsa:SetSize(wMod*200,hMod *40)
	ButtonDiscordsa:SetPos( wMod * 40, hMod * 210 )
	ButtonDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("ПНВ", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("ПНВ", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNT then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNT = false
            end
        else
            SHOULD_RETURNT = true
        end
	end
	ButtonDiscordsa.DoClick = function() 
	    LocalPlayer():ConCommand( "nv_type 1" )
        LocalPlayer():ConCommand( "nv_togg" )
end

local ButtonDiscordsag = vgui.Create( "DButton", Main )
	ButtonDiscordsag:SetText( " " )
	ButtonDiscordsag:SetFont("Trebuchet24")
	ButtonDiscordsag:SizeToContents()
	ButtonDiscordsag:SetTall( 20 )
	ButtonDiscordsag:SetSize(wMod*200,hMod *40)
	ButtonDiscordsag:SetPos( wMod * 40, hMod * 285 )
	ButtonDiscordsag.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Создать отряд", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Создать отряд", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNTT then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNTT = false
            end
        else
            SHOULD_RETURNTT = true
        end
	end
	ButtonDiscordsag.DoClick = function() 
	    LocalPlayer():ConCommand( "say !createsquad" )
            Main:Close()
end

local ButtonDiscordsaga = vgui.Create( "DButton", Main )
	ButtonDiscordsaga:SetText( " " )
	ButtonDiscordsaga:SetFont("Trebuchet24")
	ButtonDiscordsaga:SizeToContents()
	ButtonDiscordsaga:SetTall( 20 )
	ButtonDiscordsaga:SetSize(wMod*200,hMod *40)
	ButtonDiscordsaga:SetPos( wMod * 40, hMod * 360 )
	ButtonDiscordsaga.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Открытые отряды", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Открытые отряды", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNTTG then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNTTG = false
            end
        else
            SHOULD_RETURNTTG = true
        end
	end
	ButtonDiscordsaga.DoClick = function() 
	    LocalPlayer():ConCommand( "say !squads" )
            Main:Close()
end

local ButtonDiscordsa = vgui.Create( "DButton", Main )
	ButtonDiscordsa:SetText( " " )
	ButtonDiscordsa:SetFont("Trebuchet24")
	ButtonDiscordsa:SizeToContents()
	ButtonDiscordsa:SetTall( 20 )
	ButtonDiscordsa:SetSize(wMod*200,hMod *40)
	ButtonDiscordsa:SetPos( wMod * 560, hMod * 60 )
	ButtonDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Документы", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Документы", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNG then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNG = false
            end
        else
            SHOULD_RETURNG = true
        end
	end
	ButtonDiscordsa.DoClick = function() 
        LocalPlayer():ConCommand( "say /pass" )
end

local ButtonDiscordsah = vgui.Create( "DButton", Main )
	ButtonDiscordsah:SetText( " " )
	ButtonDiscordsah:SetFont("Trebuchet24")
	ButtonDiscordsah:SizeToContents()
	ButtonDiscordsah:SetTall( 20 )
	ButtonDiscordsah:SetSize(wMod*200,hMod *40)
	ButtonDiscordsah:SetPos( wMod * 560, hMod * 160 )
	ButtonDiscordsah.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Включить СЗД", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Включить СЗД", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNH then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNH = false
            end
        else
            SHOULD_RETURNH = true
        end
	end
	ButtonDiscordsah.DoClick = function() 
        LocalPlayer():ConCommand( "say /rp включил СЗД" )
end

local ButtonDiscordsahj = vgui.Create( "DButton", Main )
	ButtonDiscordsahj:SetText( " " )
	ButtonDiscordsahj:SetFont("Trebuchet24")
	ButtonDiscordsahj:SizeToContents()
	ButtonDiscordsahj:SetTall( 20 )
	ButtonDiscordsahj:SetSize(wMod*200,hMod *40)
	ButtonDiscordsahj:SetPos( wMod * 560, hMod * 260 )
	ButtonDiscordsahj.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Шлем", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Шлем", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNV then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNV = false
            end
        else
            SHOULD_RETURNV = true
        end
	end
	ButtonDiscordsahj.DoClick = function() 
        LocalPlayer():ConCommand( "say /helmet" )
end

local ButtonsDiscordsahj = vgui.Create( "DButton", Main )
	ButtonsDiscordsahj:SetText( " " )
	ButtonsDiscordsahj:SetFont("Trebuchet24")
	ButtonsDiscordsahj:SizeToContents()
	ButtonsDiscordsahj:SetTall( 20 )
	ButtonsDiscordsahj:SetSize(wMod*200,hMod *40)
	ButtonsDiscordsahj:SetPos( wMod * 560, hMod * 360 )
	ButtonsDiscordsahj.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
        if self:IsHovered() then
            draw.SimpleText("Визор", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Визор", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNAF then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNAF = false
            end
        else
            SHOULD_RETURNAF = true
        end
	end
	ButtonsDiscordsahj.DoClick = function() 
        LocalPlayer():ConCommand( "say /visor" )
end

elseif (teams.spawn_group == "Eventdroid") then

    Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesas = vgui.Create( "DPanel", Main )
	Panelesas:SetPos( wMod * 0, hMod * 0 )
	Panelesas:SetSize( wMod * 800, hMod * 22 )
	Panelesas:SetBackgroundColor( 25,25,25 )
	Panelesas.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(105,0,6))
	end
	--255,241,91
	local Panelesasa = vgui.Create( "DPanel", Main )
	Panelesasa:SetPos( wMod * -20, hMod * 20 )
	Panelesasa:SetSize( wMod * 850, hMod * 3 )
	Panelesasa:SetBackgroundColor( 25,25,25 )
	Panelesasa.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(105,0,6))
	end
	
local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 774, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end
	
	local Paneles = vgui.Create( "DPanel", Main )
	Paneles:SetPos( wMod * 290, hMod * 80 )
	Paneles:SetSize( wMod * 220, hMod * 360 )
	Paneles:SetBackgroundColor( red )
	Paneles.Paint = function(s,w,h)
	
		draw.RoundedBox(0,0,0,w,h,Color(50,50,50,200))
	end
	
	
		local icon = vgui.Create( "DModelPanel", Paneles )
		icon:SetPos(wMod * -60, hMod * -10	)
		icon:SetSize( wMod * 350, hMod * 370 )
		icon:SetModel( LocalPlayer():GetModel() )
		icon:SetCamPos(Vector(40, 40, 40))
		icon:SetAnimated(true)
		
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( LocalPlayer():Name() )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 270, hMod * 20 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
		
	local ButtonaDiscordsa = vgui.Create( "DButton", Main )
	ButtonaDiscordsa:SetText( team.GetName(LocalPlayer():Team()) )
	ButtonaDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonaDiscordsa:SizeToContents()
	ButtonaDiscordsa:SetTall( 20 )
	ButtonaDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonaDiscordsa:SetPos( wMod * 270, hMod * 45 )
	ButtonaDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonaDiscordsa.DoClick = function() 
    end

local ButtonDiscords = vgui.Create( "DButton", Main )
	ButtonDiscords:SetText( " " )
	ButtonDiscords:SetFont("Trebuchet24")
	ButtonDiscords:SizeToContents()
	ButtonDiscords:SetTall( 20 )
	ButtonDiscords:SetSize(wMod*200,hMod *40)
	ButtonDiscords:SetPos( wMod * 40, hMod * 220 )
	ButtonDiscords.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(105,0,6))
        if self:IsHovered() then
            draw.SimpleText("Тепловизор", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Тепловизор", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNA = false
            end
        else
            SHOULD_RETURNA = true
        end
	end
	ButtonDiscords.DoClick = function() 		
	    LocalPlayer():ConCommand( "nv_type 2" )
        LocalPlayer():ConCommand( "nv_togg" )
end

local Nightvision = false

local ButtonDiscordsa = vgui.Create( "DButton", Main )
	ButtonDiscordsa:SetText( " " )
	ButtonDiscordsa:SetFont("Trebuchet24")
	ButtonDiscordsa:SizeToContents()
	ButtonDiscordsa:SetTall( 20 )
	ButtonDiscordsa:SetSize(wMod*200,hMod *40)
	ButtonDiscordsa:SetPos( wMod * 560, hMod * 220 )
	ButtonDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(105,0,6))
        if self:IsHovered() then
            draw.SimpleText("Ночное", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Ночное", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNT then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNT = false
            end
        else
            SHOULD_RETURNT = true
        end
	end
	ButtonDiscordsa.DoClick = function() 
	    LocalPlayer():ConCommand( "nv_type 1" )
        LocalPlayer():ConCommand( "nv_togg" )
end

elseif (teams.spawn_group == "Mand" or teams.spawn_group == "Pirat") then

    Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesas = vgui.Create( "DPanel", Main )
	Panelesas:SetPos( wMod * 0, hMod * 0 )
	Panelesas:SetSize( wMod * 800, hMod * 22 )
	Panelesas:SetBackgroundColor( 25,25,25 )
	Panelesas.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(134,67,1))
	end
	--255,241,91
	local Panelesasa = vgui.Create( "DPanel", Main )
	Panelesasa:SetPos( wMod * -20, hMod * 20 )
	Panelesasa:SetSize( wMod * 850, hMod * 3 )
	Panelesasa:SetBackgroundColor( 25,25,25 )
	Panelesasa.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(134,67,1))
	end
	
local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 774, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end
	
	local Paneles = vgui.Create( "DPanel", Main )
	Paneles:SetPos( wMod * 290, hMod * 80 )
	Paneles:SetSize( wMod * 220, hMod * 360 )
	Paneles:SetBackgroundColor( red )
	Paneles.Paint = function(s,w,h)
	
		draw.RoundedBox(0,0,0,w,h,Color(50,50,50,200))
	end
	
	
		local icon = vgui.Create( "DModelPanel", Paneles )
		icon:SetPos(wMod * -60, hMod * -10	)
		icon:SetSize( wMod * 350, hMod * 370 )
		icon:SetModel( LocalPlayer():GetModel() )
		icon:SetCamPos(Vector(40, 40, 40))
		icon:SetAnimated(true)
		
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( LocalPlayer():Name() )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 270, hMod * 20 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
		
	local ButtonaDiscordsa = vgui.Create( "DButton", Main )
	ButtonaDiscordsa:SetText( team.GetName(LocalPlayer():Team()) )
	ButtonaDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonaDiscordsa:SizeToContents()
	ButtonaDiscordsa:SetTall( 20 )
	ButtonaDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonaDiscordsa:SetPos( wMod * 270, hMod * 45 )
	ButtonaDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonaDiscordsa.DoClick = function() 
    end

local ButtonDiscords = vgui.Create( "DButton", Main )
	ButtonDiscords:SetText( " " )
	ButtonDiscords:SetFont("Trebuchet24")
	ButtonDiscords:SizeToContents()
	ButtonDiscords:SetTall( 20 )
	ButtonDiscords:SetSize(wMod*200,hMod *40)
	ButtonDiscords:SetPos( wMod * 40, hMod * 220 )
	ButtonDiscords.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(134,67,1))
        if self:IsHovered() then
            draw.SimpleText("Тепловизор", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Тепловизор", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNA = false
            end
        else
            SHOULD_RETURNA = true
        end
	end
	ButtonDiscords.DoClick = function() 		
	    LocalPlayer():ConCommand( "nv_type 2" )
        LocalPlayer():ConCommand( "nv_togg" )
end

local Nightvision = false

local ButtonDiscordsa = vgui.Create( "DButton", Main )
	ButtonDiscordsa:SetText( " " )
	ButtonDiscordsa:SetFont("Trebuchet24")
	ButtonDiscordsa:SizeToContents()
	ButtonDiscordsa:SetTall( 20 )
	ButtonDiscordsa:SetSize(wMod*200,hMod *40)
	ButtonDiscordsa:SetPos( wMod * 560, hMod * 220 )
	ButtonDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(134,67,1))
        if self:IsHovered() then
            draw.SimpleText("Ночное", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Ночное", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNT then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNT = false
            end
        else
            SHOULD_RETURNT = true
        end
	end
	ButtonDiscordsa.DoClick = function() 
	    LocalPlayer():ConCommand( "nv_type 1" )
        LocalPlayer():ConCommand( "nv_togg" )
end

elseif (teams.spawn_group == "Jediorden") then

    Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesas = vgui.Create( "DPanel", Main )
	Panelesas:SetPos( wMod * 0, hMod * 0 )
	Panelesas:SetSize( wMod * 800, hMod * 22 )
	Panelesas:SetBackgroundColor( 25,25,25 )
	Panelesas.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
	end
	--255,241,91
	local Panelesasa = vgui.Create( "DPanel", Main )
	Panelesasa:SetPos( wMod * -20, hMod * 20 )
	Panelesasa:SetSize( wMod * 850, hMod * 3 )
	Panelesasa:SetBackgroundColor( 25,25,25 )
	Panelesasa.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
	end
	
local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 774, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(155,155,155), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end
	
	local Paneles = vgui.Create( "DPanel", Main )
	Paneles:SetPos( wMod * 290, hMod * 80 )
	Paneles:SetSize( wMod * 220, hMod * 360 )
	Paneles:SetBackgroundColor( red )
	Paneles.Paint = function(s,w,h)
	
		draw.RoundedBox(0,0,0,w,h,Color(50,50,50,200))
	end
	
	
		local icon = vgui.Create( "DModelPanel", Paneles )
		icon:SetPos(wMod * -60, hMod * -10	)
		icon:SetSize( wMod * 350, hMod * 370 )
		icon:SetModel( LocalPlayer():GetModel() )
		icon:SetCamPos(Vector(40, 40, 40))
		icon:SetAnimated(true)
		
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( LocalPlayer():Name() )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 270, hMod * 20 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end
		
	local ButtonaDiscordsa = vgui.Create( "DButton", Main )
	ButtonaDiscordsa:SetText( team.GetName(LocalPlayer():Team()) )
	ButtonaDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonaDiscordsa:SizeToContents()
	ButtonaDiscordsa:SetTall( 20 )
	ButtonaDiscordsa:SetSize(wMod*260,hMod *40)
	ButtonaDiscordsa:SetPos( wMod * 270, hMod * 45 )
	ButtonaDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonaDiscordsa.DoClick = function() 
    end

local ButtonDiscords = vgui.Create( "DButton", Main )
	ButtonDiscords:SetText( " " )
	ButtonDiscords:SetFont("Trebuchet24")
	ButtonDiscords:SizeToContents()
	ButtonDiscords:SetTall( 20 )
	ButtonDiscords:SetSize(wMod*200,hMod *40)
	ButtonDiscords:SetPos( wMod * 40, hMod * 110 )
	ButtonDiscords.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
        if self:IsHovered() then
            draw.SimpleText("Чувство присутствия", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Чувство присутствия", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(155,155,155), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNA = false
            end
        else
            SHOULD_RETURNA = true
        end
	end
	ButtonDiscords.DoClick = function() 		
	    LocalPlayer():ConCommand( "nv_type 2" )
        LocalPlayer():ConCommand( "nv_togg" )
end

local Nightvision = false

local ButtonDiscordsa = vgui.Create( "DButton", Main )
	ButtonDiscordsa:SetText( " " )
	ButtonDiscordsa:SetFont("Trebuchet24")
	ButtonDiscordsa:SizeToContents()
	ButtonDiscordsa:SetTall( 20 )
	ButtonDiscordsa:SetSize(wMod*200,hMod *40)
	ButtonDiscordsa:SetPos( wMod * 560, hMod * 110 )
	ButtonDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
        if self:IsHovered() then
            draw.SimpleText("Зрение силы", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Зрение силы", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(155,155,155), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNT then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNT = false
            end
        else
            SHOULD_RETURNT = true
        end
	end
	ButtonDiscordsa.DoClick = function() 
	    LocalPlayer():ConCommand( "nv_type 1" )
        LocalPlayer():ConCommand( "nv_togg" )
end

local ButtonDiscordsasf = vgui.Create( "DButton", Main )
	ButtonDiscordsasf:SetText( " " )
	ButtonDiscordsasf:SetFont("Trebuchet24")
	ButtonDiscordsasf:SizeToContents()
	ButtonDiscordsasf:SetTall( 20 )
	ButtonDiscordsasf:SetSize(wMod*200,hMod *40)
	ButtonDiscordsasf:SetPos( wMod * 40, hMod * 220 )
	ButtonDiscordsasf.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
        if self:IsHovered() then
            draw.SimpleText("Инвентарь", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Инвентарь", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(155,155,155), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNTFA then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNTFA = false
            end
        else
            SHOULD_RETURNTFA = true
        end
	end
	ButtonDiscordsasf.DoClick = function() 
	    LocalPlayer():ConCommand( "openinv" )
		Main:Close()
end


local ButtonDiscordsasfa = vgui.Create( "DButton", Main )
	ButtonDiscordsasfa:SetText( " " )
	ButtonDiscordsasfa:SetFont("Trebuchet24")
	ButtonDiscordsasfa:SizeToContents()
	ButtonDiscordsasfa:SetTall( 20 )
	ButtonDiscordsasfa:SetSize(wMod*200,hMod *40)
	ButtonDiscordsasfa:SetPos( wMod * 560, hMod * 220 )
	ButtonDiscordsasfa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
        if self:IsHovered() then
            draw.SimpleText("Сила", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Сила", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(155,155,155), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNTFAG then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNTFAG = false
            end
        else
            SHOULD_RETURNTFAG = true
        end
	end
	ButtonDiscordsasfa.DoClick = function() 
	    LocalPlayer():ConCommand( "forcePowers" )
		Main:Close()
end

local ButtonDiscordsasfg = vgui.Create( "DButton", Main )
	ButtonDiscordsasfg:SetText( " " )
	ButtonDiscordsasfg:SetFont("Trebuchet24")
	ButtonDiscordsasfg:SizeToContents()
	ButtonDiscordsasfg:SetTall( 20 )
	ButtonDiscordsasfg:SetSize(wMod*200,hMod *40)
	ButtonDiscordsasfg:SetPos( wMod * 40, hMod * 330 )
	ButtonDiscordsasfg.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
        if self:IsHovered() then
            draw.SimpleText("Настройка силы", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Настройка силы", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(155,155,155), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNTFAGG then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNTFAGG = false
            end
        else
            SHOULD_RETURNTFAGG = true
        end
	end
	ButtonDiscordsasfg.DoClick = function() 
	    LocalPlayer():ConCommand( "powerConfigs" )
		Main:Close()
end


local ButtonDiscordsasfai = vgui.Create( "DButton", Main )
	ButtonDiscordsasfai:SetText( " " )
	ButtonDiscordsasfai:SetFont("Trebuchet24")
	ButtonDiscordsasfai:SizeToContents()
	ButtonDiscordsasfai:SetTall( 20 )
	ButtonDiscordsasfai:SetSize(wMod*200,hMod *40)
	ButtonDiscordsasfai:SetPos( wMod * 560, hMod * 330 )
	ButtonDiscordsasfai.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(255,241,91))
        if self:IsHovered() then
            draw.SimpleText("Стойки", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(34,60,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Стойки", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(155,155,155), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 

        if self:IsHovered() then
            if SHOULD_RETURNTFAGF then
                surface.PlaySound("reality_development/ui/ui_hover.ogg")
                
                SHOULD_RETURNTFAGF = false
            end
        else
            SHOULD_RETURNTFAGF = true
        end
	end
	ButtonDiscordsasfai.DoClick = function() 
	    formSelection()
		Main:Close()
end

else

Main.Paint = function( self, w, h)
		draw.RoundedBox(5,0,0,w,h,Color(25,25,25,200))
	end
	
	local Panelesas = vgui.Create( "DPanel", Main )
	Panelesas:SetPos( wMod * 0, hMod * 0 )
	Panelesas:SetSize( wMod * 800, hMod * 22 )
	Panelesas:SetBackgroundColor( 25,25,25 )
	Panelesas.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	--255,241,91
	local Panelesasa = vgui.Create( "DPanel", Main )
	Panelesasa:SetPos( wMod * -20, hMod * 20 )
	Panelesasa:SetSize( wMod * 850, hMod * 3 )
	Panelesasa:SetBackgroundColor( 25,25,25 )
	Panelesasa.Paint = function(s,w,h)
		draw.RoundedBox(5,0,0,w,h,Color(34,104,255))
	end
	
local ButtonCancelF = vgui.Create( "DButton", Main )
	ButtonCancelF:SetText( "" )
	ButtonCancelF:SetFont("Trebuchet24")
	ButtonCancelF:SizeToContents()
	ButtonCancelF:SetTall( 20 )
	ButtonCancelF:SetSize(wMod*20,hMod *20)
	ButtonCancelF:SetPos( wMod * 774, hMod * 2 )
	ButtonCancelF.Paint = function(self, w, h)
        if self:IsHovered() then
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        else
            draw.SimpleText("X", "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end 
    end
	ButtonCancelF.DoClick = function() Main:Close() end
	
	local ButtonasDiscordsa = vgui.Create( "DButton", Main )
	ButtonasDiscordsa:SetText( "У нас нет доступа к настройке брони!" )
	ButtonasDiscordsa:SetFont("RD_FONTS_CORE_LABEL_LOWER")
	ButtonasDiscordsa:SizeToContents()
	ButtonasDiscordsa:SetTall( 20 )
	ButtonasDiscordsa:SetSize(wMod*400,hMod *40)
	ButtonasDiscordsa:SetPos( wMod * 200, hMod * 200 )
	ButtonasDiscordsa.Paint = function(self, w, h)
	draw.RoundedBox(5,0,0,w,h,Color(34,104,255, 0))
	end
	
	ButtonasDiscordsa.DoClick = function() 
    end

end
end
end