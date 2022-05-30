function mopp.cmd.callback( pPlayer, cmd, args, str )
	if (!(args[1]) or args == {}) then
		print('This is a basic command for mopp gamemode.')
	end
	if table.HasValue(table.GetKeys(mopp.cmd.data),args[1]) then
		local com = args[1]
		-- table.remove(args, 1);
		mopp.cmd.data[com](pPlayer,cmd,args)
	elseif (args[1] or args == {}) then
		print('Errors of the argument!')
	end
end

function mopp.cmd.autoComplete(commandName,args)
	local return_table = {}
	for _, name in pairs(table.GetKeys(mopp.cmd.data)) do
		table.insert(return_table,string.format('mopp %s',name))
	end
	return return_table
end

function mopp.cmd.add(arg,callback)
	mopp.cmd.data[arg] = callback
end

mopp.cmd.add('thirdperson',function( pPlayer )
	netstream.Start(pPlayer, "thirdperson_toggle")
end)

function OOCMassage( pPlayer, cmd, args )
	table.remove(args,1)
	local strMsg = string.Implode( " ", args )
	netstream.Start(player.GetAll(), 'ChatMassage', {
		pPlayer = pPlayer,
		pre = "[OOC] ",
		color = Color(238,50,57),
		text = strMsg
	} )
end
mopp.cmd.add('ooc',OOCMassage)
mopp.cmd.add('/',OOCMassage)

--Neon Modification
function DivisionMassage( pPlayer, cmd, args )
	table.remove(args, 1)
	local strMsg = string.Implode(" ", args)
	local division = mopp.jobs[pPlayer:Team()].group_id
	local tblPlayers = {}
	for k, v in pairs(player.GetAll()) do
		local tem = mopp.jobs[v:Team()].group_id
		if tem == division then	
			table.insert(tblPlayers, v)
		end
	end
	netstream.Start(tblPlayers, 'ChatMassage', {
		pPlayer = pPlayer,
		pre = "[Радио дивизии] ",
		color = Color(160,160,160),
		text = strMsg
	} )
end
mopp.cmd.add('divradio', DivisionMassage)
mopp.cmd.add('div', DivisionMassage)

--[[mopp.cmd.add('jetpack_toggle',function( pPlayer, cmd, args )
	local data = pPlayer:GetNVar('mo_data')
	if pPlayer and IsValid(pPlayer) then
		if data.data.features and data.data.features.jet then
			pPlayer.JetPackToggle = pPlayer.JetPackToggle or false
			if !pPlayer.JetPackToggle then
				table.RemoveByValue(mopp.jetplayers,pPlayer)
				pPlayer:ChatPrint( 'Вы выключили джетпак.' )
				pPlayer.JetPackToggle = true
			else
				pPlayer:ChatPrint( 'Вы включили джетпак.' )
				table.insert(mopp.jetplayers,pPlayer)
				pPlayer.JetPackToggle = false
			end
		end
	end
end)]]

mopp.cmd.add('char',function( ply, cmd, args )
    MySQLite.query( "SELECT * FROM `mopple_player_data` WHERE steam_id = '"..ply:SteamID().."'",function(data)
        player_data = util.JSONToTable(data[1].data)
        for k, v in ipairs(player_data) do
            local team
            for _, t in pairs(mopp.jobs) do
                if t.jobID == v.team.team then
                    team = {team = t.jobID, index = t.index}
                end
            end
            player_data[k].team = team
        end
        netstream.Start(ply, "CharacterSystemOpenMenu", player_data, true)
    end)
end)

function ChangeName( pPlayer, cmd, args )
	if !SERVER then
		return
	end

	table.remove(args,1)
	local name = string.Implode(' ',args)
	local ostime = os.time()

	MySQLite.query( "SELECT * FROM `mopple_others_timers` WHERE steam_id = '"..pPlayer:SteamID().."'",function(data)
		local can_change_name = false
		if (data and istable(data)) then
			local timers = util.JSONToTable(data[1].data_timers)
			if timers.name < ostime then
				can_change_name = true
				MySQLite.query( "UPDATE `mopple_others_timers` SET `data_timers`='"..util.TableToJSON({name=ostime+2}).."' WHERE `steam_id` = '"..pPlayer:SteamID().."'" )
			else
				pPlayer:ChatPrint('Подождите!')
			end
		else
			can_change_name = true
			MySQLite.query( "INSERT INTO `mopple_others_timers` VALUES('"..pPlayer:SteamID().."', '"..util.TableToJSON({name=ostime+2}).."');" )
		end
		if can_change_name then
			MySQLite.query( "UPDATE `mopple_others_timers` SET `data_timers`='"..util.TableToJSON({name=ostime-3600}).."' WHERE `steam_id` = '"..pPlayer:SteamID().."'" )
			netstream.Start(player.GetAll(), 'RPCommands', Color(240,240,240), pPlayer, Color(240,240,240), ' изменил игровое имя на ', team.GetColor(pPlayer:Team()), name, Color(240,240,240), '.' )
			pPlayer:SetNVar('mo_name',name,NETWORK_PROTOCOL_PUBLIC)
			pPlayer:SetNWString( "rpname", name )
			MySQLite.query( "SELECT * FROM `mopple_player_data` WHERE steam_id = '"..pPlayer:SteamID().."'",function(data)
				local player_data = pPlayer:GetNVar('mo_data')
				local character = pPlayer:GetNVar('mo_character') or 1
				player_data[character].name = name
				MySQLite.query( "UPDATE `mopple_player_data` SET `data` = '"..util.TableToJSON(player_data).."' WHERE `steam_id` = '"..pPlayer:SteamID().."'" )
			end)
		end
		-- if can_change_name or pPlayer:GetUserGroup() == 'founder' then
		-- 	netstream.Start(player.GetAll(), 'RPCommands', Color(240,240,240), pPlayer, Color(240,240,240), ' изменил игровое имя на ', team.GetColor(pPlayer:Team()), name )
		-- 	pPlayer:SetNVar('mo_name',name,NETWORK_PROTOCOL_PUBLIC)
		-- 	pPlayer:SavePlayerData('player',name)
		-- end
	end)
end

mopp.cmd.add('name', ChangeName)
mopp.cmd.add('rpname', ChangeName)


netstream.Hook('ChangeRadioChannelsCommander',function(player, data)
	local players = data.players
	local channel = data.channel
	if player:GetUserGroup() == 'founder' or serverguard.player:GetImmunity(player) > 20 then
		for k, v in pairs(players) do
			v.RadioChannel = channel
			player:ChatPrint( 'Вы переключили рацию '..v:Name()..' на '..channel )
			v:ChatPrint( player:Name()..' преключил вам рацию на '..channel )
			netstream.Start(v,'ChangeRadioChannel',channel)
		end
	end
end)

function AdvertMassage( pPlayer, cmd, args )
	table.remove(args,1)
	local strMsg = string.Implode( " ", args )
	netstream.Start(player.GetAll(), 'ChatMassage', {
		pPlayer = pPlayer,
		pre = "[ОБЪЯВЛЕНИЕ] ",
		color = Color(255, 215, 20),
		text = strMsg
	} )
end
mopp.cmd.add('advert',AdvertMassage)
mopp.cmd.add('ad',AdvertMassage)

function RoleplMassage( pPlayer, cmd, args )
	table.remove(args,1)
	local tblPlayers = {}
	for _, v in pairs(ents.FindInSphere(pPlayer:GetPos(),10000)) do
		table.insert(tblPlayers,v)
	end
	netstream.Start(tblPlayers, 'ChatMassage', {
		pPlayer = pPlayer,
		pre = "[RP]",
		color = team.GetColor(pPlayer:Team()),
		text = string.Implode( " ", args ),
		postcolor = false,
	} )
end
mopp.cmd.add('rp',RoleplMassage)

function AdvertCISMassage( pPlayer, cmd, args )
    if pPlayer:IsAdmin() or pPlayer:GetUserGroup() == 'founder' or serverguard.player:GetImmunity(pPlayer) > 10 then

	table.remove(args,1)
	local strMsg = string.Implode( " ", args )
	netstream.Start(player.GetAll(), 'VanMassage', {
		pPlayer = pPlayer,
                drawname = '',
		pre = "[КНС] | ",
		color = Color(33, 155, 255),
		text = strMsg,
        text_color = Color(2, 255, 242)
	} )
     end
end
mopp.cmd.add('cis',AdvertCISMassage)

function AdvertSYSMassage( pPlayer, cmd, args )
    if pPlayer:IsAdmin() or pPlayer:GetUserGroup() == 'founder' or serverguard.player:GetImmunity(pPlayer) > 10 then

	table.remove(args,1)
	local strMsg = string.Implode( " ", args )
	netstream.Start(player.GetAll(), 'VanMassage', {
		pPlayer = pPlayer,
                drawname = '',
		pre = "[SYS] | ",
		color = Color(33, 155, 255),
		text = strMsg,
        text_color = Color(2, 255, 242)
	} )
     end
end
mopp.cmd.add('sys',AdvertSYSMassage)


function AdvertRANDOMMassage( pPlayer, cmd, args )
    if pPlayer:IsAdmin() or pPlayer:GetUserGroup() == 'founder' or serverguard.player:GetImmunity(pPlayer) > 10 then

	table.remove(args,1)
	local strMsg = string.Implode( " ", args )
	netstream.Start(player.GetAll(), 'VanMassage', {
		pPlayer = pPlayer,
        drawname = '',
		pre = "[Неизвестная Частота] | ",
		color = Color(33, 155, 255),
		text = strMsg,
        text_color = Color(2, 255, 242)
	} )
     end
end
mopp.cmd.add('rnd',AdvertRANDOMMassage)

function AdvertVENATORMassage( pPlayer, cmd, args )
    if pPlayer:IsAdmin() or pPlayer:GetUserGroup() == 'founder' or serverguard.player:GetImmunity(pPlayer) > 10 then

	table.remove(args,1)
	local strMsg = string.Implode( " ", args )
	netstream.Start(player.GetAll(), 'VanMassage', {
		pPlayer = pPlayer,
        drawname = '',
		pre = "[ВЕНАТОР] | ",
		color = Color(255, 215, 20),
		text = strMsg,
        text_color = Color(2, 255, 242)
	} )
     end
end
mopp.cmd.add('ven',AdvertVENATORMassage)

function AdvertVARMassage( pPlayer, cmd, args )
    if pPlayer:IsAdmin() or pPlayer:GetUserGroup() == 'founder' or serverguard.player:GetImmunity(pPlayer) > 10 then

	table.remove(args,1)
	local strMsg = string.Implode( " ", args )
	netstream.Start(player.GetAll(), 'VanMassage', {
		pPlayer = pPlayer,
                drawname = '',
		pre = "[Силы Республики] | ",
		color = Color(255, 215, 20),
		text = strMsg,
        text_color = Color(2, 255, 242)
	} )
     end
end
mopp.cmd.add('var',AdvertVARMassage)

function MeMassage( pPlayer, cmd, args )
	table.remove(args,1)
	local tblPlayers = {}
	for _, v in pairs(ents.FindInSphere(pPlayer:GetPos(),300)) do
		table.insert(tblPlayers,v)
	end
	netstream.Start(tblPlayers, 'ChatMassage', {
		pPlayer = pPlayer,
		pre = "",
		color = team.GetColor(pPlayer:Team()),
		text = string.Implode( " ", args ),
		postcolor = false,
	} )
end
mopp.cmd.add('me',MeMassage)

function Helmet( pPlayer, cmd, args )
    pPlayer.helmet = not pPlayer.helmet

	local bnum = pPlayer.helmet and 0 or 1

	for k, v in pairs(pPlayer:GetBodyGroups()) do
		if v.name == 'Helmet' or v.name == 'Head' or v.name == 'helmet' then
			pPlayer:SetBodygroup(v.id, bnum)
		end
	end
end
mopp.cmd.add('helmet',Helmet)

function Visor( pPlayer, cmd, args )
    pPlayer.visor = not pPlayer.visor

	local bnum = pPlayer.visor and 1 or 0 or 2

	for k, v in pairs(pPlayer:GetBodyGroups()) do
		if v.name == 'Visor' or v.name == 'visor' or v.name == 'helmet attachments' then
			pPlayer:SetBodygroup(v.id, bnum)
		end
	end
end
mopp.cmd.add('visor',Visor)

function DoMassage( pPlayer, cmd, args )
	table.remove(args,1)
	local tblPlayers = {}
	for _, v in pairs(ents.FindInSphere(pPlayer:GetPos(),300)) do
		table.insert(tblPlayers,v)
	end
    local rand = tostring(math.random(1,100))
	netstream.Start(tblPlayers, 'RPCommands', team.GetColor(pPlayer:Team()), string.Implode( " ", args ), " (( "..pPlayer:Name().." ))" )
end
mopp.cmd.add('do',DoMassage)

function NoRPMassage( pPlayer, cmd, args )
	table.remove(args,1)
	local tblPlayers = {}
	local strMsg = string.Implode( " ", args )
	for _, v in pairs(ents.FindInSphere(pPlayer:GetPos(),300)) do
		table.insert(tblPlayers,v)
	end
	netstream.Start(tblPlayers, 'ChatMassage', {
		pPlayer = pPlayer,
		pre = "[LOOC]",
		color = Color(186,218,85),
		text = strMsg
	} )
end
mopp.cmd.add('l',NoRPMassage)
mopp.cmd.add('looc',NoRPMassage)

function RollMassage( pPlayer, cmd, args )
	table.remove(args,1)
	local tblPlayers = {}
	for _, v in pairs(ents.FindInSphere(pPlayer:GetPos(),300)) do
		table.insert(tblPlayers,v)
	end
	netstream.Start(tblPlayers, 'RPCommands', pPlayer, Color(240,240,240,255), ' кинул галактический кубик, и ему выпало ', Color(0,165,240,255), math.random(1,100), Color(240,240,240,255), '.' )
end
mopp.cmd.add('roll',RollMassage)

function PassMassage( pPlayer, cmd, args )
	table.remove(args,1)
	local tblPlayers = {}
	for _, v in pairs(ents.FindInSphere(pPlayer:GetPos(),300)) do
		table.insert(tblPlayers,v)
	end
	netstream.Start(tblPlayers, 'passes', {
	pPlayer = pPlayer,
	})
end
mopp.cmd.add('pass',PassMassage)

function TryMassage( pPlayer, cmd, args )
	table.remove(args,1)
	local tblPlayers = {}
	for _, v in pairs(ents.FindInSphere(pPlayer:GetPos(),300)) do
		table.insert(tblPlayers,v)
	end
	local try = math.random(0,6)%2 == 1 and 'неудача' or 'успех'
	netstream.Start(tblPlayers, 'RPCommands', team.GetColor(pPlayer:Team()), pPlayer, Color(240,240,240,255), ' ', string.Implode( " ", args ), ', ', Color(0,165,240,255), try, Color(240,240,240,255), '.'  )
end
mopp.cmd.add('try',TryMassage)

function YellMassage( pPlayer, cmd, args )
	table.remove(args,1)
	local tblPlayers = {}
	local strMsg = string.Implode( " ", args )
	for _, v in pairs(ents.FindInSphere(pPlayer:GetPos(),650)) do
		table.insert(tblPlayers,v)
	end
	netstream.Start(tblPlayers, 'ChatMassage', {
		pPlayer = pPlayer,
		pre = "Крик | ",
		color = Color(186, 50, 50),
		text = strMsg
	} )
end
mopp.cmd.add('r',YellMassage)


function WhisperMassage( pPlayer, cmd, args )
	table.remove(args,1)
	local tblPlayers = {}
	local strMsg = string.Implode( " ", args )
	for _, v in pairs(ents.FindInSphere(pPlayer:GetPos(),50)) do
		table.insert(tblPlayers,v)
	end
	netstream.Start(tblPlayers, 'ChatMassage', {
		pPlayer = pPlayer,
		pre = "Шёпот | ",
		color = Color(186, 50, 50),
		text = strMsg
	} )
end
mopp.cmd.add('w',WhisperMassage)

mopp.cmd.add('whitelist',function( pPlayer )
	if pPlayer:GetUserGroup() == 'founder' or serverguard.player:GetImmunity(pPlayer) > 20 then
		netstream.Start(pPlayer,'WhiteList_OpenMenu',nil)
	end
end)

mopp.cmd.add('offlinelist',function( player, cmd, args )
	-- if player and player:isNearWhitelist() then
	-- 	table.remove(args,1)
	-- 	local find = args[1]
	-- 	if find then
	-- 		if string.sub( find, 1, 6 ) == 'STEAM_' then 
	-- 			MySQLite.query( "SELECT * FROM `serverguard_users` WHERE steam_id = '"..find.."'",function(data)
	-- 				if data then
	-- 					-- PrintTable(data[1])
	-- 					local tbl = data[1]
	-- 					tbl.steamid64 = util.SteamIDTo64(tbl.steam_id)
	-- 					MySQLite.query( "SELECT * FROM `mopple_player_data` WHERE community_id = '"..tbl.steamid64.."'",function(data)
	-- 						if data then
	-- 							tbl.mopp = data[1]
	-- 							netstream.Start(player,"OfflineList_OpenProfile",tbl)
	-- 						end
	-- 					end)
	-- 				else
	-- 					player:ChatPrint( 'Мы не нашли такой профиль' )
	-- 				end
	-- 			end)
	-- 		elseif string.sub( args[1], 1, 3 ) == '765' then
	-- 			MySQLite.query( "SELECT * FROM `serverguard_users` WHERE steam_id = '"..util.SteamIDFrom64(find).."'",function(data)
	-- 				if data then
	-- 					-- PrintTable(data[1])
	-- 					local tbl = data[1]
	-- 					tbl.steamid64 = util.SteamIDTo64(tbl.steam_id)
	-- 					MySQLite.query( "SELECT * FROM `mopple_player_data` WHERE community_id = '"..tbl.steamid64.."'",function(data)
	-- 						if data then
	-- 							tbl.mopp = data[1]
	-- 							netstream.Start(player,"OfflineList_OpenProfile",tbl)
	-- 						end
	-- 					end)
	-- 				else
	-- 					player:ChatPrint( 'Мы не нашли такой профиль' )
	-- 				end
	-- 			end)
	-- 		else
	-- 			MySQLite.query( "SELECT * FROM `serverguard_users` WHERE name = '"..find.."'",function(data)
	-- 				if data then
	-- 					-- PrintTable(data[1])
	-- 					local tbl = data[1]
	-- 					tbl.steamid64 = util.SteamIDTo64(tbl.steam_id)
	-- 					MySQLite.query( "SELECT * FROM `mopple_player_data` WHERE steam_id = '"..tbl.steam_id.."'",function(data)
	-- 						if data then
	-- 							tbl.mopp = data[1]
	-- 							netstream.Start(player,"OfflineList_OpenProfile",tbl)
	-- 						end
	-- 					end)
	-- 				else
	-- 					player:ChatPrint( 'Мы не нашли такой профиль' )
	-- 				end
	-- 			end)
	-- 		end
	-- 	-- else
	-- 		-- local teams = {}
	-- 		-- for k, v in pairs(mopp.jobs) do
	-- 		-- 	if v.group_id then
	-- 		-- 		if !teams[v.group_id] then
	-- 		-- 			teams[v.group_id] = {}
	-- 		-- 		end
	-- 		-- 		table.insert(teams[v.group_id],v.jobID)
	-- 		-- 	end
	-- 		-- end
	-- 		-- local count_teams = {}
	-- 		-- -- PrintTable(teams)


	-- 		-- -- MySQLite.query( [[SELECT (SELECT COUNT(*) FROM `mopple_player_data` WHERE `team`='cadet'),
	-- 		-- --   (SELECT COUNT(*) FROM `mopple_player_data` WHERE `team`='ctrp')]],function(data)
	-- 		-- -- 	if data then
	-- 		-- -- 		PrintTable(data)
	-- 		-- -- 		for k, v in pairs()
	-- 		-- -- 	end
	-- 		-- -- end)

	-- 		-- player:ChatPrint( 'fff' )
	-- 	end
	-- end
end)

mopp.cmd.add('eventroom',function( pPlayer )
	if table.HasValue(mopp.cfg.EventroomAllowedGroups,pPlayer:GetUserGroup()) then
		netstream.Start(pPlayer,'EventRoom_OpenMenu')
	end
end)

if SERVER then
	concommand.Add( "mopp", mopp.cmd.callback, mopp.cmd.autoComplete, 'This is a basic command for mopp gamemode.' )
	netstream.Hook("mopp.command.SendCommandsToServer", function(pPlayer, data)
		mopp.cmd.callback(pPlayer, data.cmd, data.args)
	end);

	hook.Add("PlayerSay","mopp.command.PlayerSay",function(pPlayer,strMsg)
	 	strMsg = string.Explode(" ",strMsg)
	 	for k, v in pairs(mopp.cmd.data) do
	 		if "/"..k == strMsg[1] then
	 			strMsg[1] = string.gsub(strMsg[1], "/", "")
				v(pPlayer, "mopp", strMsg)
				return ''
	 		end
	 	end
	 end)
else
	concommand.Add( "mopp", function(pPlayer,cmd,args)
		netstream.Start("mopp.command.SendCommandsToServer", {
			args = args,
			cmd = cmd
		})
	end, mopp.cmd.autoComplete, 'This is a basic command for mopp gamemode.' )

	netstream.Hook("ChatMassage", function(data)
		pCaller = data.pPlayer
		if pCaller and pCaller:IsPlayer() then
			color, pre = data.color, data.pre
			postcolor = data.postcolor == false and '' or Color(255,255,255)
			postname = data.postcolor == false and ' ' or ': '
			chat.AddText(color, pre, team.GetColor(pCaller:Team()), pCaller:Name(), postcolor, postname, data.text)
		end
	end);
	
	netstream.Hook("VanMassage", function(data)
		pCaller = data.pPlayer
		if pCaller and pCaller:IsPlayer() then
			color, pre = data.color, data.pre
			postcolor = data.postcolor == false and '' or Color(255,255,255)
			postname = data.postcolor == false and ' ' or ': '
			chat.AddText(color, pre, postcolor, postname, data.text)
		end
	end);
	
	netstream.Hook("passes", function(data)
		pCaller = data.pPlayer
                local character = pCaller:GetNVar('mo_character') or 1
		if pCaller and pCaller:IsPlayer() then
			chat.AddText(Color(59, 91, 255), "Документы : " , Color(255,255,255),"Номер: ", pCaller:GetNVar('mo_rpid'),Color(59, 91, 255)," |",Color(255,255,255), " Позывной: ", pCaller:Name(),Color(59, 91, 255)," |",Color(255,255,255)," Подразделение: ", pCaller:GetNVar('mo_data')[character].data.legion,Color(59, 91, 255)," |",Color(255,255,255)," Приписки: ", pCaller:GetNVar('mo_data')[character].data.rank)
		end
	end);

	netstream.Hook("RPCommands", function(...)
		chat.AddText(...)
	end);
end