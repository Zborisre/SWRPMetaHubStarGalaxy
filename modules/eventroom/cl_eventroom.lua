-- mopp.cfg.EventroomJobs = {
-- 	TEAM_CISS,
-- 	TEAM_CISDJ,
-- 	TEAM_CISTR,
-- 	TEAM_CISS1,
-- 	TEAM_CISCO,
-- 	TEAM_CIDI,
-- 	TEAM_CIPIL,
-- 	TEAM_T3DES,
-- 	TEAM_SITH,
-- 	TEAM_CISCOM1,
-- 	TEAM_CISCOM,
-- 	TEAM_CHEWBACCA,
-- 	TEAM_CISDK,
-- 	TEAM_TUSK,
-- 	TEAM_CALLA,
-- 	TEAM_RADI,
-- 	TEAM_CAD
-- }

netstream.Hook('EventRoom_OpenMenu',function()
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
		
	local effect_panels = {}

	local Main = vgui.Create('DFrame')
	Main:SetSize(600,280)
	Main:Center()
	Main:SetTitle('EventRoom')
	Main:MakePopup()

	local AppList = vgui.Create( "DListView", Main )
	AppList:SetPos(0,25)
	AppList:SetSize(400,255)
	AppList:AddColumn( "Entity" )
	AppList:AddColumn( "RealName" )
	AppList:AddColumn( "Team" )
	local players = player.GetAll()
	for _, pPlayer in ipairs(players) do
		AppList:AddLine(pPlayer,pPlayer:Name(),team.GetName(pPlayer:Team()))
	end

	local MakeDroids = vgui.Create('DButton',Main)
	MakeDroids:SetSize(160,20)
	MakeDroids:SetText('Выдать выбраным...')
	MakeDroids:SetPos(410,30)
	MakeDroids.DoClick = function()
		local tblSelected = {}
		for _, line in pairs(AppList:GetSelected()) do
			table.insert(tblSelected,line:GetValue(1))
		end

		local menu = DermaMenu();
		for _, team in pairs(droids) do
			menu:AddOption('Выдать "'..mopp.jobs[team].Name..'"', function()
				netstream.Start('EventRoom_MakeDroids',{players = tblSelected, team = team})

				timer.Simple(1,function()
					if IsValid(Main) then
						AppList:Clear()
						local players = player.GetAll()
						for k, pPlayer in pairs(players) do
							if pPlayer then
								AppList:AddLine(pPlayer,pPlayer:Name(),mopp.jobs[pPlayer:Team()].Name)
							end
						end
					end
				end)
			end)
		end
		menu:AddSpacer()
		menu:AddOption('Выдать обратно клона', function()
			netstream.Start('EventRoom_MakeDroids',{players = tblSelected, team = false})

			timer.Simple(1,function()
				if IsValid(Main) then
					AppList:Clear()
					local players = player.GetAll()
					for k, pPlayer in pairs(players) do
						if pPlayer then
							AppList:AddLine(pPlayer,pPlayer:Name(),mopp.jobs[pPlayer:Team()].Name)
						end
					end
				end
			end)
		end):SetIcon("icon16/arrow_undo.png");
		menu:Open();
	end

	local Random = vgui.Create('DButton',Main)
	Random:SetSize(160,20)
	Random:SetText('Выбрать/Поиск')
	Random:SetPos(410,50)
	Random.DoClick = function()
		local menu = DermaMenu();
		menu:AddOption('Выбрать половину игроков способом четности', function()
			AppList:ClearSelection()
			for k, pPlayer in ipairs(players) do
				if k%2==0 then
					AppList:SelectItem( AppList:GetLine(k) )
				end
			end
		end):SetIcon("icon16/find.png");
		menu:AddOption('Выбрать слуйчайно игроков', function()
			AppList:ClearSelection()
			for k, pPlayer in ipairs(players) do
				if math.random(0,1) == 0 then
					AppList:SelectItem( AppList:GetLine(k) )
				end
			end
		end):SetIcon("icon16/find.png");
		menu:AddOption('Выбрать всех кадетов', function()
			AppList:ClearSelection()
			for k, pPlayer in ipairs(players) do
				if mopp.jobs[pPlayer:Team()].jobID == 'cadet' then
					AppList:SelectItem( AppList:GetLine(k) )
				end
			end
		end):SetIcon("icon16/find.png");
		menu:AddOption('Выбрать всех дройдов', function()
			AppList:ClearSelection()
			for k, pPlayer in ipairs(players) do
				if table.HasValue(droids,pPlayer:Team()) then
					AppList:SelectItem( AppList:GetLine(k) )
				end
			end
		end):SetIcon("icon16/find.png");
		menu:Open();
	end

	local i = 0
	for name, effect in pairs(mopp.cfg.EventRoomEffects) do
		effect_panels[name] = vgui.Create('DCheckBoxLabel',Main)
		effect_panels[name]:SetPos(410, 80+(20*i))
		effect_panels[name]:SetText(effect.title)
		effect_panels[name]:SetValue(GetGlobalBool('mopple_effect_'..name))

		effect_panels[name].OnChange = function(self)
			--PrintTable({activate = self:GetChecked(),effect = name})
			netstream.Start('EventRoom_MakeEffect',{activate = self:GetChecked(),effect = name})
		end
		i = i + 1
	end
end)