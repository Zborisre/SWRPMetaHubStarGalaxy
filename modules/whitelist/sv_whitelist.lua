netstream.Hook('WhiteList_ChangeProfile',function(admin, data)

	if !admin:isNearWhitelist() then return end
	
	local ply = data.target
	local team
	local character = ply:GetNVar('mo_character') or 1
	
	if data.team then
	
		if istable(data.team) then
		
			team = data.team.index
		
		elseif isnumber(data.team) and data.timed then
		
			team = data.team
		
		end
		
	end
	
	local newteam = team
	
	ply:SetTeam(team)
	
	if !data.timed then
	
		local old_player_data = ply:GetNVar('mo_data')
		local old_player_rpid = ply:GetNVar('mo_rpid')
		
		if !serverguard.player:HasPermission(admin, "WhitelistControlPlus") then
		
			data.rpid = old_player_rpid
		
		end
		
		if data.features then
		
			if data.features.jet == true then
			
				table.insert(mopp.jetplayers,ply)
				ply.JetPackToggle = false
			
			else
			
				table.RemoveByValue(mopp.jetplayers,ply)
				ply.JetPackToggle = nil
			
			end
		
		end
		
		local player_data =  old_player_data

		player_data[character].team = old_player_data[character].team
		
		if data.team then player_data[character].team = data.team end
		
		player_data[character].data.legion = data.legion
		player_data[character].data.rank = data.rank
		player_data[character].rpid = data.rpid
		player_data[character].data.target = nil
		player_data[character].data.timed = nil
		player_data[character].data.features = data.features
		
		ply:SetNVar('mo_data', player_data, NETWORK_PROTOCOL_PUBLIC)
		ply:SetNVar('mo_team', player_data[character].team, NETWORK_PROTOCOL_PUBLIC)
		
		if data.rpid ~= "" then
		
			ply:SetNVar('mo_rpid', data.rpid, NETWORK_PROTOCOL_PUBLIC)
		
		end
		
		MySQLite.query( "UPDATE `mopple_player_data` SET `data` = '"..util.TableToJSON(player_data).."' WHERE `steam_id` = '"..ply:SteamID().."'" )

	end
	
	local pos, ang = ply:GetPos(), ply:EyeAngles()
	
	ply:StripWeapons()
	if !data.respawn then 
		ply.nocuberespawn = true
		ply:Spawn()
		ply:SetPos(pos)
		ply:SetEyeAngles(ang)
	else
		ply:Spawn()
	end
	
	//if data.respawn then return end
	
	ply:SetPos(pos)
	ply:SetEyeAngles(ang)

end)

--["класс энтити"] = true,

local LandVehicles = { --Наземная техника

    ["tkaro_lfs_tx130"] = true,
    ["lunasflightschool_niksacokica_at-rt"] = true,
    ["heracles421_lfs_aat"] = true,
    ["heracles421_lfs_barc"] = true,
    ["lunasflightschool_atte"] = true,
    ["lunasflightschool_iftx"] = true
}

local AirVehicles = { --Воздушная техника
    
    ["lfs_vanilla_azureangel"] = true,
    ["lfs_vanilla_btlbywing"] = true,
    ["lfs_vanilla_nushuttle"] = true,
    ["lunasflightschool_bf2hyenabomber"] = true,
    ["lunasflightschool_cgihyenabomber"] = true,
    ["lunasflightschool_awing"] = true,
    ["lunasflightschool_delta7_adi"] = true,
    ["lunasflightschool_advdroid"] = true,
    ["lunasflightschool_alligator"] = true,
    ["lunasflightschool_alphag"] = true,
    ["lunasflightschool_delta7_anakin"] = true,
    ["lunasflightschool_eta2_anakin"] = true,
    ["lunasflightschool_delta7_barriss"] = true,
    ["lunasflightschool_soulless"] = true,
    ["lunasflightschool_repcorvette1"] = true,
    ["lunasflightschool_cr90"] = true,
    ["lunasflightschool_spiral"] = true,
    ["lunasflightschool_ebonhawk"] = true,
    ["lunasflightschool_eta5"] = true,
    ["lunasflightschool_havoc"] = true,
    ["lunasflightschool_droidgunship"] = true,
    ["lunasflightschool_ig2000"] = true,
    ["lunasflightschool_kimogila"] = true,
    ["lunasflightschool_delta7_kit"] = true,
    ["lunasflightschool_repcorvette2"] = true,
    ["lunasflightschool_repcorvette3"] = true,
    ["lunasflightschool_delta7_luminara"] = true,
    ["lunasflightschool_scyk"] = true,
    ["lunasflightschool_delta7_mace"] = true,
    ["lunasflightschool_gauntlet"] = true,
    ["lunasflightschool_geo"] = true,
    ["lunasflightschool_nbt630"] = true,
    ["lunasflightschool_delta7_obiwan"] = true,
    ["lunasflightschool_eta2_obiwan"] = true,
    ["lunasflightschool_delta7_plo"] = true,
    ["lunasflightschool_r41"] = true,
    ["lunasflightschool_arc170"] = true,
    ["lunasflightschool_tridroid"] = true,
    ["lunasflightschool_vulturedroid"] = true,
    ["lunasflightschool_laatcgunship"] = true,
    ["lunasflightschool_vulturedroid_cis"] = true,
    ["lfs_arc"] = true,
    ["lunasflightschool_laatigunship"] = true,
    ["lunasflightschool_niksacokica_laat_le_republic_gunship"] = true,
    ["lunasflightschool_vwing"] = true
}

local function LFSUpdateSetPassenger(ent)

	if ent.UpdatedSetPassenger then return end
	
	function ent:SetPassenger(ply)
		
		if !IsValid(ply) then return end
		
		local character = ply:GetNVar('mo_character') or 1
		local features = ply:GetNVar("mo_data")[character].data.features
		
		if !istable(features) then return false end
		
		if self:GetlfsLockedStatus() then
		
			ply:PrintMessage(HUD_PRINTCENTER, 'Транспорт закрыт')
			return
		
		end
		
		local function FindEmptySeat()
		
			local seat = nil
			local dist = 500000
			
			for _,v in pairs(self:GetPassengerSeats()) do
			
				if !(IsValid(v) && !IsValid(v:GetDriver())) then continue end
				
				local CurDist = (v:GetPos() - ply:GetPos()):Length()
				
				if CurDist < dist then
				
					seat = v
					dist = CurDist
				
				end
			
			end
			
			return seat
			
		end
		
		if features.air then
		
			local DriverSeat = self:GetDriverSeat()
			
			if self:GetAI() || !IsValid(DriverSeat) || ply:KeyDown(IN_WALK) || IsValid(DriverSeat:GetDriver()) then
			
				local seat = FindEmptySeat()
				
				if !IsValid(seat) then return end
				
				ply:EnterVehicle(seat)
			
			else
			
				ply:EnterVehicle(DriverSeat)
			
			end
		
		else
		
			local seat = FindEmptySeat()
			
			if !IsValid(seat) then return end

			ply:EnterVehicle(seat)
		
		end
	
	end
	
	ent.UpdatedSetPassenger = true

end

hook.Add("PlayerButtonDown", "!!!lfsButtonDown", function(ply, button)

	if !isfunction(ply.lfsGetPlane) then return end

	local vehicle = ply:lfsGetPlane()
	
	for _, LFS_BIND in pairs( ply:lfsGetControls() ) do
	
		if !LFS_BIND[button] then continue end
		
		ply:lfsSetInput(LFS_BIND[ button ], true)
		
		if IsValid(vehicle) && ply.LFS_HIPSTER && LFS_BIND[button] == "EXIT" then
		
			ply:ExitVehicle()
		
		end
	
	end
	
	if !IsValid(vehicle) then return end
	
	if button == KEY_1 then
	
		if ply == vehicle:GetDriver() then
		
			if vehicle:GetlfsLockedStatus() then
			
				vehicle:UnLock()
			
			else
			
				vehicle:Lock()
			
			end
		
		else
		
			local character = ply:GetNVar('mo_character') or 1
			local features = ply:GetNVar("mo_data")[character].data.features
			
			if !istable(features) then return end
			
			if !features.air then
			
				ply:PrintMessage(HUD_PRINTCENTER, 'Вы не умеете управлять воздушным транспортом')
				return
			
			end
			
			if !(IsValid(vehicle:GetDriver()) or vehicle:GetAI()) then
			
				ply:ExitVehicle()
				
				local DriverSeat = vehicle:GetDriverSeat()
				
				if !IsValid(DriverSeat) then return end
				
				timer.Simple(FrameTime(), function()
				
					if !(IsValid(vehicle) || IsValid(ply)) then return end
					if IsValid(vehicle:GetDriver()) || !IsValid( DriverSeat ) || vehicle:GetAI() then return end
					
					ply:EnterVehicle(DriverSeat)
					
					timer.Simple(FrameTime()*2, function()
					
						if !(IsValid(vehicle) and IsValid(ply)) then return end
						ply:SetEyeAngles(Angle(0,vehicle:GetAngles().y,0))
					
					end)
					
				end)
			
			end
		
		end
		
	else
	
		for _, pod in pairs(vehicle:GetPassengerSeats()) do
		
			if !IsValid(pod) then continue end
			
			if pod:GetNWInt("pPodIndex", 3) == simfphys.LFS.pSwitchKeys[button] then
			
				if IsValid(pod:GetDriver()) then continue end
				
				ply:ExitVehicle()
				
				timer.Simple(FrameTime(), function()
				
					if !(IsValid(pod) and IsValid(ply)) then return end
					if IsValid(pod:GetDriver()) then return end
					
					ply:EnterVehicle(pod)
				
				end)
			
			end
			
		end
		
	end

end)

hook.Add("PlayerUse", "WhitelistVehicles_PlayerUse", function(ply, ent)
	
	ply.nextUseVehicle = ply.nextUseVehicle or 0
	local class = ent:GetClass()
	
	if !(LandVehicles[class] || AirVehicles[class]) then return end
	if ply.nextUseVehicle > CurTime() then return false end
	
	ply.nextUseVehicle = CurTime() + 2
	local character = ply:GetNVar('mo_character') or 1
	local features = ply:GetNVar("mo_data")[character].data.features
	
	if !istable(features) then return false end
	
	if LandVehicles[class] then
	
		if features.land then return true end
		
		ply:PrintMessage(HUD_PRINTCENTER, 'Вы не умеете управлять наземным транспортом')
	
	elseif AirVehicles[class] then
	
		if ent.LFS then
		
			LFSUpdateSetPassenger(ent)
			return true
		
		else
		
			if features.air then return true end
			
			ply:PrintMessage(HUD_PRINTCENTER, 'Вы не умеете управлять воздушным транспортом')
		
		end
	
	end
	
	return false

end)