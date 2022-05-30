MySQLite.initialize({
	EnableMySQL = true,
	Host = '',
	Username = '',
	Password = '',
	Database_name = '',
	Database_port = ,
	Preferred_module = 'mysqloo'
})


hook.Add( "DatabaseInitialized", "DatabaseInitialized", function()
	MySQLite.query([[
		CREATE TABLE IF NOT EXISTS mopple_player_data(
			steam_id varchar(25),
			community_id TEXT,
			player varchar(255),
			data TEXT,
			PRIMARY KEY (`steam_id`)
		);
	]])
	MySQLite.query([[
		CREATE TABLE IF NOT EXISTS mopple_discord_integration(
			steamid VARCHAR(255),
			token VARCHAR(255),
			used VARCHAR(255),
			PRIMARY KEY (`steamid`)
		);
	]])
	MySQLite.query([[
		CREATE TABLE IF NOT EXISTS mopple_others_timers(
			steam_id varchar(25),
			data_timers TEXT,
			PRIMARY KEY (`steam_id`)
		);
	]])
	-- MySQLite.query([[
	-- 	CREATE TABLE IF NOT EXISTS sp_ips_log(
	-- 		steamid VARCHAR(255),
	-- 		address VARCHAR(255),
	-- 		PRIMARY KEY (`steamid`)
	-- 	);
	-- ]])
end)
