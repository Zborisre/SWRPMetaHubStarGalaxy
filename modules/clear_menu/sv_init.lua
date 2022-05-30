util.AddNetworkString("ChooseCharacteristics")

net.Receive("ChooseCharacteristics",function(_,pl)
	
	if pl:Team() != CharacterSys.DefaultTeam then return end
	
	local frac = net.ReadString()
	local data = net.ReadTable()
	
	if data.name == '' or data.name == nil then
		pl:ChatPrint'Нет имени.'
		return
	end
	
	if data.surname == '' or data.surname == nil then
		pl:ChatPrint'Нет фамилии.'
		return
	end
	
	pl:SavePlayerData('team',CharacterSys.Config[frac]['teams'])
	pl:SetTeam(CharacterSys.Config[frac]['teamind'])
	pl:SavePlayerData('player',data.name..' '..data.surname)
	pl:SetNVar('mo_name', data.name..' '..data.surname, NETWORK_PROTOCOL_PUBLIC)
	pl:SetNWString( "rpname", data.name..' '..data.surname )

	pl:Spawn()
	
end)