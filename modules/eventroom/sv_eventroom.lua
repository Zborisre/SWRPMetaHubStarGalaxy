netstream.Hook('EventRoom_MakeDroids',function(pPlayer,data)
	if table.HasValue(mopp.cfg.EventroomAllowedGroups,pPlayer:GetUserGroup()) then
		local tblPlayers = data.players
		local team = data.team or false
		for _, player in pairs(tblPlayers) do
			if team and team != false and team != '' then
				player:SetTeam(team)
			else
				local player_team = player:GetNVar('mo_team')
				player:SetTeam(player_team.index)
			end
			
			player:StripWeapons()
			player:Spawn()
		end
	end
end)

netstream.Hook('EventRoom_MakeEffect',function(pPlayer,data)
	if table.HasValue(mopp.cfg.EventroomAllowedGroups,pPlayer:GetUserGroup()) then
		mopp.util.EventRoomEffects = mopp.util.EventRoomEffects or {}
		mopp.util.EventRoomEffects[data.effect] = data.activate

		SetGlobalBool('mopple_effect_'..data.effect,data.activate)
		local is = data.activate and 'activate' or 'deactivate'
		mopp.cfg.EventRoomEffects[data.effect][is]()
	end
end)