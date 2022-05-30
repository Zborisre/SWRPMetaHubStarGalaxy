CharacterSys = {}

hook.Add("PostGamemodeLoaded","ChooseFrac",function()

	CharacterSys.DefaultTeam = TEAM_CADET
		
	CharacterSys.Config = {
		["USA"] = {
			["teams"] = 'Cadett',
			["teamind"] = TEAM_CADETT,
		},
		["Russian"] = {
			["teams"] = 'Cadettt',
			["teamind"] = TEAM_CADETTT,
		},
	}
	
end)