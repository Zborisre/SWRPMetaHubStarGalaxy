netstream.Hook("CharacterSystemCreateCharacter", function(ply)
	MySQLite.query( "SELECT * FROM `mopple_player_data` WHERE steam_id = '"..ply:SteamID().."'",function(data)
		local player_data = util.JSONToTable(data[1].data)
		for k, v in ipairs(player_data) do
			local team
			for _, t in pairs(mopp.jobs) do
				if t.jobID == v.team.team then
					team = {team = t.jobID, index = t.index}
				end
			end
			player_data[k].team = team
		end
		local name = ply:Name() or (ply:Name() == '' and ply:Name() or ply:Nick())
		local team = {team = mopp.jobs[TEAM_CADET].jobID, index = TEAM_CADET}
		local rpid = string.char(math.random(48,57))..string.char(math.random(48,57))..string.char(math.random(48,57))..string.char(math.random(48,57))
		player_data[#player_data + 1] = {
			name = name,
			rpid = rpid,
			team = team,
			data = {
				rank = "CAD",
				legion = "CT",
				features = {},
			},
		}
		MySQLite.query( "UPDATE `mopple_player_data` SET `data` = '"..util.TableToJSON(player_data).."' WHERE `steam_id` = '"..ply:SteamID().."'" )
		netstream.Start(ply, "CharacterSystemOpenMenu", player_data)
	end)
end)

netstream.Hook("CharacterSystemChangeCharacter", function(ply, id)
	MySQLite.query( "SELECT * FROM `mopple_player_data` WHERE steam_id = '"..ply:SteamID().."'",function(data)
		local player_data = util.JSONToTable(data[1].data)
		ply:SetNVar('mo_data', player_data, NETWORK_PROTOCOL_PUBLIC)
		ply:SetNVar('mo_team', player_data[id].team, NETWORK_PROTOCOL_PUBLIC)
		ply:SetNVar('mo_rpid', player_data[id].rpid, NETWORK_PROTOCOL_PUBLIC)
		ply:SetNVar('mo_character', id, NETWORK_PROTOCOL_PUBLIC)
		ply:SetNVar('mo_name', player_data[id].name, NETWORK_PROTOCOL_PUBLIC)
		ply:SetNWString( "rpname", player_data[id].name )
	
                ply:StripWeapons()
		ply:SetTeam(player_data[id].team.index)
		ply:Spawn()
	end)
end)

resource.AddSingleFile( "charactersystem/background.png" )