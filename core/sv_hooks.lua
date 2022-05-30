function GM:PlayerSpawn( pPlayer )
	pPlayer.Initialized = true;
	hook.Call( "PlayerLoadout", GAMEMODE, pPlayer );

        local oldHands = pPlayer:GetHands()

	if (IsValid(oldHands)) then
		oldHands:Remove()
	end

	local handsEntity = ents.Create("gmod_hands")

	if (IsValid(handsEntity)) then
		pPlayer:SetHands(handsEntity)
		handsEntity:SetOwner(pPlayer)

		local info = player_manager.RunClass(pPlayer, "GetHandsModel")

		if (info) then
			handsEntity:SetModel(info.model)
			handsEntity:SetSkin(info.skin)
			handsEntity:SetBodyGroups(info.body)
		end

		local viewModel = pPlayer:GetViewModel(0)
		handsEntity:AttachToViewmodel(viewModel)

		viewModel:DeleteOnRemove(handsEntity)
		pPlayer:DeleteOnRemove(handsEntity)

		handsEntity:Spawn()
	end
end

local curent_map = game.GetMap()

function GM:PlayerLoadout( pPlayer )
	local team = mopp.jobs[pPlayer:Team()]
	if !(team and team ~= 1001) then return end

	player_manager.SetPlayerClass(pPlayer, team.playerClass or "player_mopp")

	pPlayer:ShouldDropWeapon(false);

	if (pPlayer:FlashlightIsOn()) then
		pPlayer:Flashlight(true);
	end;

	pPlayer:SetCollisionGroup(COLLISION_GROUP_PLAYER);
	pPlayer:SetMaterial("");
	pPlayer:SetMoveType(MOVETYPE_WALK);
	pPlayer:Extinguish();
	pPlayer:UnSpectate();
	pPlayer:GodDisable();
	pPlayer:ConCommand("-duck");
	pPlayer:SetColor(Color(255, 255, 255, 255));
	pPlayer:SetupHands();

	pPlayer:SetModelScale(1)

	if team.weapons and istable(team.weapons) then
		for k, v in pairs(team.weapons) do
			pPlayer:Give(v)
		end
	end

	pPlayer:Give('re_hands')
	pPlayer:SelectWeapon('re_hands')

	pPlayer:SetPlayerColor( Vector( 1, 1, 1 ) )

	-- Change some gmod defaults
	pPlayer:SetCrouchedWalkSpeed(25);
	pPlayer:SetWalkSpeed(100);
	pPlayer:SetJumpPower(160);
	pPlayer:SetRunSpeed(225);

	pPlayer:SetMaxHealth(team.maxHealth or 100);
	pPlayer:SetHealth(team.maxHealth or 100);
	pPlayer:SetArmor(team.maxArmor or 0);

	pPlayer:SetModel(team.WorldModel)

	local spawn_positions = mopp.cfg.spawn_positions[curent_map]
	if spawn_positions then
		pPlayer:SetPos(table.Random(spawn_positions))
	end

	if pPlayer then
		team.PlayerSpawn(pPlayer)
	end

        local player_data = pPlayer:GetNVar('mo_data')
		local character = pPlayer:GetNVar('mo_character')
	if player_data[character].data.features and player_data[character].data.features['hookes'] == true and team.spawn_group != "Eventdroid" and team.spawn_group != "Eventjit" and team.jobID != "massife" and team.spawn_group != "Astromech" and team.spawn_group != "Jediorden" and team.jobID != "ussrpilot" then
		pPlayer:Give('realistic_hook')
	end
        if player_data[character].data.features and player_data[character].data.features['handcuff'] == true and team.spawn_group != "Eventdroid" and team.spawn_group != "Eventjit" and team.jobID != "massife" and team.spawn_group != "Astromech" and team.spawn_group != "Jediorden" and team.jobID != "ussrpilot" then
		pPlayer:Give('weapon_cuff_elastic')
                pPlayer:Give('rw_sw_riotbaton')
	end
	if player_data[character].data.features and player_data[character].data.features['medics'] == true and team.spawn_group != "Eventdroid" and team.spawn_group != "Eventjit" and team.jobID != "massife" and team.spawn_group != "Astromech" and team.spawn_group != "Jediorden" and team.jobID != "ussrpilot" then
		pPlayer:Give('weapon_bactanade')
                pPlayer:Give('weapon_defibrillator')
                pPlayer:Give('weapon_bactainjector')
	end

        if player_data[character].data.features and player_data[character].data.features['artas'] == true and team.spawn_group != "Eventdroid" and team.spawn_group != "Eventjit" and team.jobID != "massife" and team.spawn_group != "Astromech" and team.spawn_group != "Jediorden" and team.jobID != "ussrpilot" then
		pPlayer:Give('alydus_fusioncutter')
                pPlayer:Give('rw_ammo_distributor')
                pPlayer:Give('fort_datapad')
	end

	for name, effect in pairs(mopp.cfg.EventRoomEffects) do
		if mopp.util.EventRoomEffects and mopp.util.EventRoomEffects[name] then
			effect.on_spawn(pPlayer)
		end
	end
	
	-- Prevent default Loadout.
	return true;
end

function GM:AllowPlayerPickup( pPlayer, eEnt )
	return false;
end

function GM:PlayerUse(pPlayer, ent)
	return (pPlayer:Team() != TEAM_CTO)
end

function GM:PlayerSpray(pPlayer)
	return false;
end

function GM:CanPlayerSuicide(pPlayer)
	return false;
end

function GM:PlayerSpray(client)
    return false
end

function GM:PlayerSpawnProp(pPlayer)
	return pPlayer:GetUserGroup() == 'founder' or serverguard.player:GetImmunity(pPlayer) > 20
end

function GM:PlayerCanHearPlayersVoice(listener, talker)
    if talker.isScanner then return end

    return listener:GetPos():Distance(talker:GetPos()) <= 300, true
end

function GM:PlayerCanSeePlayersChat( strText, bTeam, pListener, pTalker )
	if not IsValid(pListener) or not IsValid(pTalker) then return end
	if pListener:GetPos():Distance( pTalker:GetPos() ) > 300 then return false end
	return true
end

function GM:InitPostEntity()	
	local physData = physenv.GetPerformanceSettings()
	physData.MaxVelocity = 1000
	physData.MaxCollisionChecksPerTimestep = 10000
	physData.MaxCollisionsPerObjectPerTimestep = 2
	physData.MaxAngularVelocity = 3636

	physenv.SetPerformanceSettings(physData)

	game.ConsoleCommand("sv_allowcslua 0\n")
	game.ConsoleCommand("physgun_DampingFactor 0.9\n")
	game.ConsoleCommand("sv_sticktoground 0\n")
	game.ConsoleCommand("sv_airaccelerate 100\n")

	for _, v in ipairs(ents.FindByClass('player_info_spawn')) do
		v:Remove()
	end

	for k, v in ipairs(ents.FindByClass('func_brush')) do
		if v:GetPos() == Vector(-8196.000000, -12480.000000, 86.000000) then
		-- if v:GetPos() == Vector(642.006653, -2238.054199, -2463.968750) then
			v:Remove()
			break
		end
	end
end