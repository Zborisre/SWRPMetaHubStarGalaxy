function pMeta:SavePlayerData(name,value)
	MySQLite.query( "UPDATE `mopple_player_data` SET " .. name .. " = '" .. value .. "' WHERE steam_id = '" .. self:SteamID() .. "'" )
end

local function setdefault(ply)
	local name = ply:Name() == '' and ply:Name() or ply:Nick()
	local team = {team = mopp.jobs[TEAM_CADET].jobID, index = TEAM_CADET}

	local rpid = string.char(math.random(48,57))..string.char(math.random(48,57))..string.char(math.random(48,57))..string.char(math.random(48,57))
	local player_data = {
		[1] = {
			name = name,
			rpid = rpid,
			team = team,
			data = {
				rank = "CAD",
				legion = "CT | 875th",
				features = {},
			},
		},
	}

	ply:SetNVar('mo_data', player_data, NETWORK_PROTOCOL_PUBLIC)
	ply:SetNVar('mo_team', team, NETWORK_PROTOCOL_PUBLIC)
	ply:SetNVar('mo_rpid', rpid, NETWORK_PROTOCOL_PUBLIC)
	ply:SetNVar('mo_character', 1, NETWORK_PROTOCOL_PUBLIC)
	ply:SetNVar('mo_name', name, NETWORK_PROTOCOL_PUBLIC)
	ply:SetNWString( "rpname", name )

	ply:SetTeam(TEAM_CADET)
	ply:Spawn()
	return player_data
end

function InitPlayerData( pPlayer )
	MySQLite.query( "SELECT * FROM `mopple_player_data` WHERE steam_id = '"..pPlayer:SteamID().."'",function(data)
		local player_data = setdefault(pPlayer)
		if (data and istable(data)) then
			
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
			/*

			pPlayer:SetNVar('mo_data', player_data, NETWORK_PROTOCOL_PUBLIC)
			pPlayer:SetNVar('mo_team', team, NETWORK_PROTOCOL_PUBLIC)
			pPlayer:SetNVar('mo_rpid', data[1].rpid, NETWORK_PROTOCOL_PUBLIC)
			pPlayer:SetNVar('mo_name', data[1].player, NETWORK_PROTOCOL_PUBLIC)
			pPlayer:SetNWString( "rpname", data[1].player )

			pPlayer:SetTeam(team.index)
			pPlayer:Spawn()*/
			netstream.Start(pPlayer, "CharacterSystemOpenMenu", player_data)
			return
		else
			MySQLite.query(string.format("INSERT INTO mopple_player_data VALUES(%s, %s, %s, %s);", 
				MySQLite.SQLStr(pPlayer:SteamID()),
				MySQLite.SQLStr(pPlayer:SteamID()),
				MySQLite.SQLStr(pPlayer:Name() == '' and pPlayer:Name() or pPlayer:Nick()),
				MySQLite.SQLStr(util.TableToJSON(player_data))
			))
		end
		netstream.Start(pPlayer, "CharacterSystemOpenMenu", player_data)
	end )
	--[[MySQLite.query( "SELECT * FROM `mopple_discord_integration` WHERE steamid = '"..pPlayer:SteamID64().."'",function(data)
		if (data and istable(data)) then
			pPlayer:SetNVar('DiscordToken',data[1].token,NETWORK_PROTOCOL_PRIVATE)
		else
			local RandomToken = ""
			for i = 1, 6 do
				RandomToken = RandomToken .. string.char( math.random( 65, 90 ) )
			end
			MySQLite.query( "INSERT INTO `mopple_discord_integration` VALUES('".. tostring(pPlayer:SteamID64()).."', '"..tostring(RandomToken).."','0');" )
			pPlayer:SetNVar('DiscordToken', RandomToken, NETWORK_PROTOCOL_PRIVATE)
		end
	end )]]
	-- MySQLite.query( "SELECT * FROM `sp_ips_log` WHERE steamid = '"..pPlayer:SteamID64().."'",function(data)
	-- 	if !(data and istable(data)) then
	-- 		MySQLite.query( "INSERT INTO `sp_ips_log` VALUES('".. tostring(pPlayer:SteamID64()).."', '"..tostring(pPlayer:IPAddress()).."');" )
	-- 	end
	-- end )
end
hook.Add("PlayerIsLoaded","InitPlayerData",InitPlayerData)

function pMeta:ChangeTeam(index)
	self:SetTeam(index)

	hook.Call( "PlayerLoadout", GAMEMODE, self );
end

mopp.cfg.Jails = {
	
}
function pMeta:Arrest(time, pPlayer)
	--if !self:GetNVar("Arrested") then
		--if game.GetMap() == mopp.cfg.DefaultMainMap then
			time = time or 600

			self:StripWeapons()
			self:StripAmmo()

			-- self:SetPos(Vector(3573.202637, 766.800293, -10461.968750))
			-- self:SetPos(Vector(-360.165619, -2021.855835, -2436.218994))
			self:SetPos(table.Random(mopp.cfg.Jails[game.GetMap()]))
			self:SetPos(table.Random(mopp.cfg.Jails[game.GetMap()]))
			--self:SetNVar("Arrested", true, NETWORK_PROTOCOL_PUBLIC)
			self:SetNWBool( 'mo_arrest', true )

			if pPlayer and pPlayer:IsPlayer() then
				GmLogger.PostMessageInDiscord(pPlayer:NameWithSteamID()..' арестовал игрока '..self:NameWithSteamID())
			end
			timer.Create("Arrested_"..self:SteamID64(), time, 1, function()
				self:UnArrest()
			end)
		--else
		--	pPlayer:ChatPrint('Вы не можете арестовавать на этой карте.')
		--end
	--end
end

function pMeta:UnArrest(pPlayer)
	self:SetNWBool( 'mo_arrest', false )
	self:Spawn()
	timer.Remove("Arrested_"..self:SteamID64())
end

local tblNoFallDamage = {
	TEAM_ANAKIN,
	TEAM_KIADI,
	TEAM_AHSOKA,
	TEAM_PLOKUNE,
	TEAM_OBIONE
}

function GM:GetFallDamage( pPlayer, flFallSpeed )
	-- print(pPlayer:Team())
local teams = mopp.jobs[pPlayer:Team()]
if teams and teams.spawn_group then
        if teams.spawn_group == "Jediorden" then	
           return 0
        else 
           return (flFallSpeed/10)
        end
end
end

util.AddNetworkString('TalkIconChat')

net.Receive('TalkIconChat', function(_, ply)
	local bool = net.ReadBool()
	ply:SetNW2Bool('mopp_istyping', (bool ~= nil) and bool or false)
end)