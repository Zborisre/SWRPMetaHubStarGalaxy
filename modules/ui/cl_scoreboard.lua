local HeightLine = 26


local mat_wrench = Material('icons/wrench.png', 'noclamp smooth')
local mat_star = Material('icons/star.png', 'noclamp smooth')
local mat_key = Material('icons/key.png', 'noclamp smooth')
local mat_case = Material('icons/case.png', 'noclamp smooth')
local mat_hammer = Material('icons/hammer.png', 'noclamp smooth')
local mat_lines = Material('icons/lines.png', 'noclamp smooth')
local bhudicon = surface.GetTextureID("hudmenutfu/stargalaxyopk")
local bhudtext = surface.GetTextureID("hudmenutfu/stargalaxyosnf")

local tblIconsGroups = {
    ['founder'] = { col = Color(220,220,220,255), symbol = 'Основатель' },
    ['serverstaff'] = { col = Color(190,190,190,255), symbol = 'Персонал Сервера' },
    ['eventmaker'] = { col = Color(190,190,190,255), symbol = 'Боец Пайков' },
    ['jrevent'] = { col = Color(190,190,190,255), symbol = 'Страж Пайков'},
    ['socmd'] = { col = Color(190,190,190,255), symbol = 'Зам. КМД'},
    ['stagerevent'] = { col = Color(190,190,190,255), symbol = 'Шахтер Пайков'},
    ['stevent'] = { col = Color(190,190,190,255), symbol = 'Генерал Пайков'},
    ['asisevent'] = { col = Color(190,190,190,255), symbol = 'Заместитель Пайков'},
    ['kuratevent'] = { col = Color(190,190,190,255), symbol = 'Лидер Пайков'},
    ['admines'] = { col = Color(190,190,190,255), symbol = 'Администратор'},
    ['jradmines'] = { col = Color(190,190,190,255), symbol = 'Мл. Админ'},
    ['commander'] = { col = Color(190,190,190,255), symbol = 'Коммандер'},
	-- ['admin'] = { col = Color(190,190,190,255), symbol = '★', name = 'Администратор' },
	-- ['superadmin'] = { col = Color(190,190,190,255), symbol = '★', name = 'Главный Администратор' }
}

surface.CreateFont( "font_scoreboard", {
	font = "Default",
	size = 18,
	weight = 300,
	antialias = true,
	underline = true,
	extended = true,
})

surface.CreateFont( "font_scoreboard_header", {
	font = "Default",
	size = 24,
	weight = 300,
	antialias = true,
	underline = true,
	extended = true,
})

surface.CreateFont( "font_scoreboard_title", {
	font = "Arial",
	size = 32,
	weight = 100,
	antialias = true,
	underline = true,
	extended = true,
})

surface.CreateFont( "font_scoreboard_small", {
	font = "Default",
	size = 14,
	weight = 300,
	antialias = true,
	underline = true,
	extended = true,
})

surface.CreateFont( "scoreboard.name", {
	font = "Roboto",
	size = 18,
	weight = 1000,
	antialias = true,
	underline = true,
	extended = true,
})

surface.CreateFont( "scoreboard.info", {
	font = "Roboto Light",
	size = 18,
	weight = 1000,
	antialias = true,
	underline = true,
	extended = true,
})

surface.CreateFont( "scoreboard.title", {
	font = "Electrolize [RUS by Daymarius]",
	size = ScrH()*0.06,
	weight = 1000,
	antialias = true,
	extended = true,
})

surface.CreateFont( "scoreboard.subname", {
	font = "Roboto",
	size = ScrH()*0.03,
	weight = 1000,
	antialias = true,
	underline = true,
	extended = true,
})

surface.CreateFont( "font_base_22", {
	font = "Default",
	size = 14,
	weight = 300,
	antialias = true,
	underline = true,
	extended = true,
})

local function get_admins_count()
	local adminsonline = {}
	for k,v in pairs(player.GetAll()) do
		if v:IsAdmin() then table.insert(adminsonline,v) end
	end

	return adminsonline
end

function PlayerButtonClick(pl)
	if not IsValid(pl) then return end
				local rankData = serverguard.ranks:GetRank(serverguard.player:GetRank(LocalPlayer()))
				local commands = serverguard.command:GetTable()

				local bNoAccess = true
				local menu = DermaMenu(Main);
				menu:SetSkin("serverguard");
				menu:AddOption("Открыть профиль Steam", function()
					pl:ShowProfile()
				end):SetIcon("icon16/group_link.png");
				menu:AddSpacer()
				menu:AddOption("Скопировать SteamID", function()
					SetClipboardText(pl:SteamID());
				end):SetIcon("icon16/page_copy.png");
				menu:AddOption("Скопировать SteamID64", function()
					SetClipboardText(pl:SteamID64());
				end):SetIcon("icon16/page_copy.png");
				menu:AddOption("Скопировать ник", function()
					SetClipboardText(pl:Name());
				end):SetIcon("icon16/page_copy.png");

				if LocalPlayer():IsAdmin() or LocalPlayer():GetUserGroup() == 'founder' or serverguard.player:GetImmunity(LocalPlayer()) > 5 then
		menu:AddSpacer()
		local sub_whitelist = menu:AddSubMenu("Выдать профессию")
		sub_whitelist:AddOption('Выдать Клон CT, и звание PVT', function()
			Derma_Query( 'Выдать Клон CT, и звание PVT', 'Выдать и заспавнить игрока на спавне?', 'Да', function()
				netstream.Start('WhiteList_ChangeProfile',{
	                               	rpid = LocalPlayer():GetNVar('mo_rpid') or 0,
                                        player = '',
					legion = 'CT',
					rank = 'PVT',
					timed = false,
					target = pl,
					respawn = true,
					team = {team = 'cttrooper', index = TEAM_RYADCT}
				})
			end, 'Нет, оставить на месте', function()
				netstream.Start('WhiteList_ChangeProfile',{
	                               	rpid = LocalPlayer():GetNVar('mo_rpid') or 0,
                                        player = '',
					legion = 'CT',
					rank = 'PVT',
					timed = false,
					target = pl,
					respawn = false,
					team = {team = 'cttrooper', index = TEAM_RYADCT}
				})
			end, 'Отмена', function() end)
		end):SetIcon("icon16/page_copy.png");
		sub_whitelist:AddOption('Выдать "Администратор"', function()
			Derma_Query( 'Выдать "Администратор"', 'Выдать и заспавнить игрока на спавне?', 'Да', function()
				netstream.Start('WhiteList_ChangeProfile',{
					legion = '',
					rank = '',
					timed = true,
					target = pl,
					respawn = true,
					team = {team = 'admin', index = TEAM_ADMIN}
				})
			end, 'Нет, оставить на месте', function()
				netstream.Start('WhiteList_ChangeProfile',{
					legion = '',
					rank = '',
					timed = true,
					target = pl,
					respawn = false,
					team = {team = 'admin', index = TEAM_ADMIN}
				})
			end, 'Отмена', function() end)
		end):SetIcon("icon16/page_copy.png");
		sub_whitelist:AddOption('Выдать "Кадет", и очистить звание', function()
			Derma_Query( 'Выдать "Кадет", и очистить звание', 'Выдать и заспавнить игрока на спавне?', 'Да', function()
				netstream.Start('WhiteList_ChangeProfile',{
	                               	rpid = LocalPlayer():GetNVar('mo_rpid') or 0,
                                        player = '',
					legion = 'CT',
					rank = 'CAD',
					timed = false,
					target = pl,
					respawn = true,
					team = {team = 'cadet', index = TEAM_CADET}
				})
			end, 'Нет, оставить на месте', function()
				netstream.Start('WhiteList_ChangeProfile',{
	                               	rpid = LocalPlayer():GetNVar('mo_rpid') or 0,
                                        player = '',
					legion = 'CT',
					rank = 'CAD',
					timed = false,
					target = pl,
					respawn = false,
					team = {team = 'cadet', index = TEAM_CADET}
				})
			end, 'Отмена', function() end)
		end):SetIcon("icon16/page_copy.png");
		sub_whitelist:AddOption('Изменить ранг и легион', function()
			local lg, rk
			Derma_StringRequest( 'Изменить ранг и легион', 'Какой ЛЕГИОН вы хотите выдать игроку '..pPlayer:Name()..'?', '', function(strText)
				lg = strText
				Derma_StringRequest( 'Изменить ранг и легион', 'Какой РАНГ вы хотите выдать игроку '..pPlayer:Name()..'?', '', function(strTextRank)
					rk = strTextRank
					Derma_Query( 'Изменить ранг и легион', 'Выдать и заспавнить игрока на спавне?', 'Да', function()
						netstream.Start('WhiteList_ChangeProfile',{
							legion = lg,
							rank = rk,
							timed = false,
							target = pl,
							respawn = false
						})
					end, 'Нет, оставить на месте', function()
						netstream.Start('WhiteList_ChangeProfile',{
							legion = lg,
							rank = rk,
							timed = false,
							target = pl,
							respawn = false
						})
					end, 'Отмена', function() end)
				end, nil, "Дальше", "Отмена" )
			end, nil, "Дальше", "Отмена" )
		end):SetIcon("icon16/page_copy.png");
		sub_whitelist:AddOption('Открыть Whitelist профиль', function()
			pl:OpenWhitelistProfile()
		end):SetIcon("icon16/page_copy.png");

		local droids = {
			TEAM_KALANI,
			TEAM_TACTICDOID,
			TEAM_BONE,
			TEAM_BONECOM,
			TEAM_BXSOL,
			TEAM_BXCOM,
			TEAM_BTWO,
			TEAM_BTWOCOM,
			TEAM_MAGNO
		}
		local civils = {
			TEAM_TWILECKDANC,
			TEAM_CITIZENONE
		}
		sub_whitelist:AddSpacer()
		local sub_job = sub_whitelist:AddSubMenu("Выдать профессию на время инвента")
		for _, team in pairs(droids) do
			sub_job:AddOption('Выдать "'..mopp.jobs[team].Name..'"', function()
				netstream.Start('WhiteList_ChangeProfile',{
					timed = true,
					target = pPlayer,
					team = team,
					respawn = true
				})
			end):SetIcon("icon16/page_copy.png");
		end
		sub_job:AddSpacer()
		for _, team in pairs(civils) do
			sub_job:AddOption('Выдать "'..mopp.jobs[team].Name..'"', function()
				netstream.Start('WhiteList_ChangeProfile',{
					timed = true,
					target = pPlayer,
					team = team,
					respawn = true
				})
			end):SetIcon("icon16/page_copy.png");
		end
	end
	if LocalPlayer():IsAdmin() or LocalPlayer():GetUserGroup() == 'founder' or serverguard.player:GetImmunity(LocalPlayer()) > 10 then
		local sub_commands = menu:AddSubMenu("Администрирование")
				for unique, data in pairs(commands) do
					if (data.ContextMenu and (!data.permissions or serverguard.player:HasPermission(LocalPlayer(), data.permissions))) then
						data:ContextMenu(pl, sub_commands, rankData); bNoAccess = false;
					end;
				end;
	end
	menu:Open();
end

team.SetColor( 0, Color(131,138,142) )
team.SetColor( 1001, Color(131,138,142) )

local MainPanel, Main
local alpha, alpha_lerp = 0, 0
function ScoreboardOpen()
	if not IsValid(Main) then
        alpha = 160

	
		LocalPlayer().Scoreboard = true
		Main = vgui.Create("DFrame")
		Main:SetSize(ScrW(),ScrH())
		Main:SetPos((ScrW()-Main:GetWide())/2,(ScrH()-Main:GetTall())/2)
		Main:SetTitle('')

		-- Main:Center()
		Main:SetDraggable(false)
		Main:ShowCloseButton(false)
		Main.Paint = function( self, w, h )
			alpha_lerp = Lerp(FrameTime()*6,alpha_lerp or 0,alpha or 0) or 0

            local x, y = self:GetPos()
            -- print(alpha_lerp)
            if alpha_lerp/100 > 1 then
                draw.DrawBlur( x, y, self:GetWide(), self:GetTall(), alpha_lerp/100 )
            end

            draw.RoundedBox(0,0,0,w,h,Color(34,104,255, 0))
		end

        MainPanel = vgui.Create('DScrollPanel', Main)
        MainPanel:SetSize(Main:GetWide()/1.3,Main:GetTall()/1.1)
        MainPanel:SetPos(Main:GetWide()*.5 - MainPanel:GetWide()*.5, Main:GetTall()*.5 - MainPanel:GetTall()*.5)
	
		local line_front = markup.Parse(string.format('<font=font_sans_21><colour=255, 255, 255, 255>Игроков: <colour=175, 175, 175, 255>%s</colour> из <colour=175, 175, 175, 255>%s</colour> (Персонал сервера: <colour=175, 175, 175, 255>%s</colour>). Текущая карта <colour=175, 175, 175, 255>%s</colour></colour></font>',
            #player.GetAll(),
            game.MaxPlayers(),
            #get_admins_count(),
            game.GetMap()
        ))
        MainPanel.Paint = function( self, w, h )
            line_front:Draw( 0, 0, 0, 0 )
        end

        MainPanel.VBar:SetWide(0)
		
        local layout = vgui.Create( "DListLayout", MainPanel )
        layout:SetSize( MainPanel:GetWide(), MainPanel:GetTall() )
        layout:SetPos( 0, 30 )
		
        -- layout:SetSpace( 2 )

        --Draw a background so we can see what it's doing
         layout:SetPaintBackground( true )
         layout:SetBackgroundColor( Color( 25, 25, 25, 200 ) )

        -- layout:MakeDroppable( "unique_name" ) -- Allows us to rearrange children
		
		-- layout:MakeDroppable( "unique_name" )
			
		local PlayerPanelff = vgui.Create('DButton', layout)
            PlayerPanelff:SetTall(7)
            PlayerPanelff:SetWide(MainPanel:GetWide())
            PlayerPanelff:SetText('')
            PlayerPanelff.Paint = function( self, w, h )
				surface.SetDrawColor(34,104,255, 150)
                surface.DrawRect(0, 0, w, h)
			end
			
		local PlayerPanelfs = vgui.Create('DButton', layout)
            PlayerPanelfs:SetTall(60)
            PlayerPanelfs:SetWide(MainPanel:GetWide())
            PlayerPanelfs:SetText('')
            PlayerPanelfs.Paint = function( self, w, h )
				local xScreenRes = 1920
				local yScreenRes = 1080
				local wMod = ScrW() / xScreenRes
				local hMod = ScrH() / yScreenRes
				surface.SetDrawColor(40, 40, 40, 200)
                surface.DrawRect(0, 0, w, h)
				surface.SetTexture(bhudicon)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 10 , wMod*40 , hMod*40)
				surface.SetTexture(bhudicon)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*1430 , hMod * 10 , wMod*40 , hMod*40)
				surface.SetTexture(bhudtext)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*630 , hMod * 5 , wMod*240 , hMod*50)
			end
		
		 local PlayerPanelf = vgui.Create('DButton', layout)
            PlayerPanelf:SetTall(5)
            PlayerPanelf:SetWide(MainPanel:GetWide())
            PlayerPanelf:SetText('')
            PlayerPanelf.Paint = function( self, w, h )
				surface.SetDrawColor(34,104,255, 150)
                surface.DrawRect(0, 0, w, h)
			end
			
			local PlayerPanelfg = vgui.Create('DButton', layout)
            PlayerPanelfg:SetTall(20)
			PlayerPanelfg:SetPos( 0, 4 )
            PlayerPanelfg:SetWide(MainPanel:GetWide())
            PlayerPanelfg:SetText('')
            PlayerPanelfg.Paint = function( self, w, h )
				surface.SetDrawColor(40, 40, 40, 200)
                surface.DrawRect(0, 0, w, h)
                
                draw.SimpleText('IDN', 'font_sans_21', 48 - 5, h * .5 - 1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText('Позывной', 'font_sans_21', 64 + 16 + 4 + 22, h * .5 - 1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				
				draw.SimpleText('Профа', 'font_sans_21', w/3 , h * .5 - 1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                draw.SimpleText('Приписки', 'font_sans_21', w/1.8,h * .5 - 1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                draw.SimpleText('Пинг', 'font_sans_21', w - 64 - 16 - 4 - 20 +48 + 18, h * .5 - 1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText('Ранг', 'font_sans_21', w/1.3 , h * .5 - 1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
			
			local PlayerPanelf = vgui.Create('DButton', layout)
            PlayerPanelf:SetTall(5)
            PlayerPanelf:SetWide(MainPanel:GetWide())
            PlayerPanelf:SetText('')
            PlayerPanelf.Paint = function( self, w, h )
				surface.SetDrawColor(34,104,255, 150)
                surface.DrawRect(0, 0, w, h)
			end
		
	local DCollapsible = vgui.Create( "DCategoryList", layout )
	DCollapsible:Dock( FILL )
	DCollapsible.Paint = function( self, w, h )
		
	end
	
	DCollapsible.VBar:SetWide(0)

	local team_players = {}
        local players = player.GetAll()

        table.sort(players, function(a, b) return a:Team() < b:Team() end)
		
		local button_hover = {}
        for i, pl in pairs(players) do
			
			local character = pl:GetNVar('mo_character') or 1
            local PlayerPanel = vgui.Create('DButton')
            PlayerPanel:SetTall(20)
            PlayerPanel:SetWide(MainPanel:GetWide())
            PlayerPanel:SetText('')
            PlayerPanel.Paint = function( self, w, h )
                if not pl or not IsValid(pl) then
                    return
                end
				
				local player_data = pl:GetNVar('mo_data')

                local pcol = team.GetColor(pl:Team())
				if button_hover and button_hover[key] then
				pcol = Color(pcol.r+20,pcol.g+20,pcol.b+20)
				end
                h = 28
                if pl and pcol then
                    draw.RoundedBox(0,0,0,w,h,Color(pcol.r, pcol.g, pcol.b, 250))

                    local rpid = pl:GetNVar('mo_rpid')
                    -- rpid = (rpid and rpid ~= '') and ' '..rpid..'' or '   ----  '
                    if rpid and rpid ~= '' then
                        local id = rpid
                        for i = 1, (4-#tostring(id)) do id = '0'..id end

                        rpid = ' '..id..''
                    else
                        rpid = '   ----  '
                    end


                    local tm = pl:Team()
                    local rank = pl:GetNWString('meta_rank')

                    surface.SetFont('font_base_small')
                    local wrt, _ = surface.GetTextSize(' '..rpid)

                    draw.RoundedBox(0, 28, 0, wrt, h, Color(pcol.r-12,pcol.g-12,pcol.b-12,255))

                    surface.SetFont('font_base_small')
                    local wgr = 0

                    -- if tblIconsGroups[pl:GetUserGroup()] then
                    --     local group_data = tblIconsGroups[pl:GetUserGroup()]
                    --     -- PrintTable(group_data)
                    --     surface.SetFont('font_base_24')
                    --     wgr, _ = surface.GetTextSize(group_data.symbol..' ')

                    --     draw.SimpleText(group_data.symbol, "font_base_24", wrt+34+1, h/2+1, Color( 0, 0, 0, 60 ), 0, 1)
                    --     draw.SimpleText(group_data.symbol, "font_base_24", wrt+34, h/2, group_data.col, 0, 1)
                    -- end

                    local name = pl:Name()
                    draw.ShadowSimpleText(name, "font_base_small", wrt+34+wgr, h/3, Color(  240, 240, 240, 255  ), 0, 1)


                    -- surface.SetFont('font_base_22')
                    -- local wt, _ = surface.GetTextSize(name)
                    draw.ShadowSimpleText(rpid, "font_base_small", 28 , h/3, Color(  240, 240, 240, 255  ), 0, 1)



                    local tname = tm == 0 or tm == 1001 and 'Не прогрузился' or team.GetName(tm)
                    draw.ShadowSimpleText(tname, "font_base_small", w/3 , h/3, Color(  240, 240, 240, 255  ), 1, 1)

                    if rank then
                        draw.ShadowSimpleText(rank, "font_base_small", w/3 , h/3, Color( 240, 240, 240, 255  ), 1, 1)
                    end
				if tm == 1001 then
                                     draw.ShadowSimpleText('Нет данных', "font_base_small", w/1.8, h/3, Color( 240, 240, 240, 255 ), 1, 1)
                                else
					if player_data[character] and player_data[character].data.legion and player_data[character].data.rank and player_data[character].data.legion != '' then
						draw.ShadowSimpleText('['..player_data[character].data.legion..', '..player_data[character].data.rank..']', "font_base_small", w/1.8, h/3, Color( 240, 240, 240, 255 ), 1, 1)
					end
                                end

                    if tblIconsGroups[pl:GetUserGroup()] then
                        local group_data = tblIconsGroups[pl:GetUserGroup()]
                        -- PrintTable(group_data)
                        surface.SetFont('font_base_small')
                        wgr, _ = surface.GetTextSize(group_data.symbol..' ')

                        draw.ShadowSimpleText(group_data.symbol, "font_base_small", w/1.3, h/3, group_data.col, 1, 1)
                    end

                    if self:IsHovered() then
                        -- local oldname = pl:OldName()
                        -- draw.SimpleText(oldname, "font_base_22", w/1.3 +1, h/2+1, Color( 0, 0, 0, 60 ), 1, 1)
                        -- draw.SimpleText(oldname, "font_base_22", w/1.3, h/2, Color( 195, 195, 195, 255 ), 1, 1)


                        draw.RoundedBox(0,0,0,w,h,Color(230, 230, 230, 4))
                    end
                end

                draw.RoundedBox(0, w-10+1, 4+1, 6, 15, Color(0,0,0,60))
                draw.RoundedBox(0, w-17+1, 9+1, 6, 10, Color(0,0,0,60))
                draw.RoundedBox(0, w-24+1, 14+1, 6, 5, Color(0,0,0,60))

                local pg = pl:Ping()
                local pgcol = pl:Ping() < 100 and Color(119,184,0) or pg < 200 and Color(255,165,0) or Color(214,45,32)
                draw.RoundedBox(0, w-10, 4, 6, 15, pgcol)
                draw.RoundedBox(0, w-17, 9, 6, 10, pgcol)
                draw.RoundedBox(0, w-24, 14, 6, 5, pgcol)

                draw.ShadowSimpleText(pg, "font_base_small", w - 30 , h/3, Color( 200, 200, 200, 255 ), 2, 1)
            end

            PlayerPanel.DoClick = function(self)
 				PlayerButtonClick(pl)
            end


            local Avatar = vgui.Create( "AvatarImage", PlayerPanel )
            Avatar:SetSize( 20, 20 )
            Avatar:SetPos( 0, 0 )
            Avatar:SetPlayer( pl, 64 )

            -- local DermaCheckbox = vgui.Create( "DCheckBox", PlayerPanel )
            -- DermaCheckbox:SetPos( PlayerPanel:GetWide()-DermaCheckbox:GetWide()-2, 2 )
            -- DermaCheckbox:SetValue( 0 )
            -- DermaCheckbox.Paint = function( self, w, h )
            --     draw.RoundedBox(4,0,0,w,h,color_white)
            --     if DermaCheckbox:GetChecked() then
            --         draw.RoundedBox(4,2,2,w-4,w-4,Color(119,184,0))
            --     end
            -- end
            layout:Add(  PlayerPanel )
			
		end
	end
end

function ScoreboardClose()
	if IsValid(Main) then
		Main:Close()
		LocalPlayer().Scoreboard = false
        gui.EnableScreenClicker(false)
	end
end

function GM:ScoreboardShow()
	ScoreboardOpen()

	if IsValid(Main) then
		Main:Show()
		-- Main:MakePopup()
        gui.EnableScreenClicker(true)
		Main:SetKeyboardInputEnabled(true)
	end
end

function GM:ScoreboardHide()
    if MainPanel and IsValid(MainPanel) then
        MainPanel:Remove()
    end
	if IsValid(Main) then
        Main:SetKeyboardInputEnabled(false)
        LocalPlayer().Scoreboard = false

        alpha = 0
        timer.Simple(FrameTime()*6*8, function()
		    ScoreboardClose()
        end)
        gui.EnableScreenClicker(false)
	end
end

hook.Add('OnReloaded','CloseScoreboard_OnReloaded',function()
    if MainPanel and IsValid(MainPanel) then
        MainPanel:Remove()
    end
    if Main and IsValid(Main) then
        Main:Remove()
    end
    ScoreboardClose()
end)
