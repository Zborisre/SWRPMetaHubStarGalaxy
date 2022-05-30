mopp.cfg.default_team = TEAM_CADET
mopp.cfg.SuperGroups = {
	'founder'
}

mopp.cfg.EventroomAllowedGroups = {
	'founder',
	'eventmanager',
	'curator',
	'sudocurator',
}

mopp.cfg.servername = "The Forces Unleashed"

mopp.cfg.DefaultMainMap = 'rp_anaxes_tfu'

mopp.cfg.features = {
	{title = 'Наземка', prefix = 'land'},
	{title = 'Воздушка', prefix = 'air'},
	{title = 'Наручи', prefix = 'handcuff'},
	{title = 'Крюк', prefix = 'hookes'},
        {title = 'Мед', prefix = 'medics'},
        {title = 'Инженер', prefix = 'artas'},
}

mopp.cfg.DefaultSpawnGroup = 'Clones'
mopp.cfg.DefaultIDGroup = 'Jediorden'

mopp.cfg.EventRoomEffects = {
	flashlights = {
		title = 'Фонарики',
		activate = function()
			for _, v in pairs(player.GetAll()) do
				v:AllowFlashlight(true)
			end
		end,
		deactivate = function()
			for _, v in pairs(player.GetAll()) do
				v:Flashlight( false )
				v:AllowFlashlight(false)
			end
		end,
		on_spawn = function(player)
			player:AllowFlashlight(true)
		end
	},
	-- drop_weapons = {
	-- 	title = 'Выбрасывать оружия',
	-- 	activate = function()

	-- 	end
	-- }
}