-----------------------------------------------------
if SERVER then

	util.AddNetworkString( "switch_weapon" )

	net.Receive( "switch_weapon", function(l,ply)

		ply:SelectWeapon(net.ReadString())

	end)

end



AddCSLuaFile()



local PREFIX = {Color(71, 141, 255), ""}



local text = Color(71, 141, 255)

local lime = Color(71, 141, 255)

local yellow = Color(255, 255, 255)

local orange = Color(255, 50, 20)



local MESSAGES = {

	{text, "Третье лицо можно включить, используя F1. Настройка через F4 меню!"},

	{text, "Вступай к нам в сообщество https://vk.com/stargalaxystarwarsrp"},

	{text, "Если вы заметили нарушение или есть вопросы к высшим силам в лице администраторов, то создайте рапорт через F5!"},

	{text, "Заходите на наш дискорд, там весело discord.gg/K9ybnbE6dm"},

	{text, "Уважайте ваших сослуживцев и братьев по оружию! Они ваша опора и надежные союзники в бою"},

	{text, "Не подводи администрацию! Отыгрывай РП"},

	{text, "Во время стрельбы не теряй бдительность, рано или поздно она окупиться"},

	{text, "Не нарушай устав и правила сервера!"},

	{text, "Спасибо что играете с нами!"},

	{text, "Признак культурного военнослужащего - отсутствие матов в его речи!"},

	{text, "Находясь на сервере в составе легиона вы обязаны находится в Discord!"},
}


if (SERVER) then

	local CYCLE_TIME = 120

	

	util.AddNetworkString("AutoChatMessage")

	local curmsg = 1

	

	timer.Create("AutoChatMessages", CYCLE_TIME, 0, function()

		net.Start("AutoChatMessage")

			net.WriteUInt(curmsg, 16)

		net.Broadcast()



		curmsg = curmsg + 1

		if (curmsg > #MESSAGES) then

			curmsg = 1

		end

	end)

else

	net.Receive("AutoChatMessage", function()

		local t = {}

		table.Add(t, PREFIX)

		table.Add(t, MESSAGES[net.ReadUInt(16)])

		

		chat.AddText(unpack(t))

	end)

end