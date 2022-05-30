--[[
gamemodes/starwarsrp/gamemode/modules/ui/cl_hud.lua
--]]
surface.CreateFont( "hud.name", {
	font = "Electrolize [RUS by Daymarius]",
	size = 20,
	weight = 1000,
	extended = true,
});
surface.CreateFont( "hud.sub", {
	font = "Electrolize [RUS by Daymarius]",
	size = 18,
	weight = 600,
	extended = true,
});
surface.CreateFont( "hud.percs", {
	font = "Electrolize [RUS by Daymarius]",
	size = 18,
	weight = 500,
	extended = true,
	underline = true,
});
surface.CreateFont( "hud.percs.2", {
	font = "Electrolize [RUS by Daymarius]",
	size = 14,
	weight = 500,
	extended = true,
	underline = true,
});
surface.CreateFont( "hud.abovehead", {
	font = "Electrolize [RUS by Daymarius]",
	size = 50,
	weight = 600,
	extended = true,
});
surface.CreateFont( "hud.abovehead.s", {
	font = "Electrolize [RUS by Daymarius]",
	size = 40,
	weight = 500,
	extended = true,
});

local bHUDJIT = surface.GetTextureID("hudmenutfu/hudmenujit")
local bHUDTWOONE = surface.GetTextureID("hudmenutfu/hudmenutwoone")
local bHUDCLONE = surface.GetTextureID("hudmenutfu/hudmenutfu")
local bHUDCIS = surface.GetTextureID("hudmenutfu/hudmenutfucis")
local bHUDJEDI = surface.GetTextureID("hudmenutfu/hudmenutfujedi")
local bHUDMAND = surface.GetTextureID("hudmenutfu/hudmenutfumand")
local bHUDPIRAT = surface.GetTextureID("hudmenutfu/hudmenutfupirat")
local bHUDASTRO = surface.GetTextureID("hudmenutfu/hudmenutfuastromeh")
local bHUDFIVEZERO = surface.GetTextureID("hudmenutfu/hudmenufivezero")
local bHUDFOURONE = surface.GetTextureID("hudmenutfu/hudmenufourones")
local bHUDGUARD = surface.GetTextureID("hudmenutfu/hudmenuguard")
local bHUDONEZERO = surface.GetTextureID("hudmenutfu/hudmenutwoonef")
local bHUDTHREEWTO = surface.GetTextureID("hudmenutfu/hudmenuthreetwoseven")
local bHUDOSN = surface.GetTextureID("hudmenutfu/hudnew")
local wpcl = surface.GetTextureID("weapom/weaponcl")
local wpcis = surface.GetTextureID("weapom/weaponcis")
local wppirat = surface.GetTextureID("weapom/weaponpirat")
local wpastro = surface.GetTextureID("weapom/weaponastro")
local wpjedi = surface.GetTextureID("weapom/weaponjedi")
local wpjit = surface.GetTextureID("weapom/weaponjit")

local clrs = Color(30, 55, 153)
timer.Create("colorUpdate", 15, 0, function()
	clrs = table.Random({Color(153, 128, 250), Color(163, 203, 56), Color(18, 203, 196), Color(255, 195, 18), Color(237, 76, 103), Color(184, 233, 148), Color(235, 47, 6)});
end);

local elements = {
	{ x = -450, letter = "", color = Color(29,161,242) },

	{ x = -360, letter = "Север", color = Color(29,161,242) },

	{ x = -315, letter = "СЗ", color = Color(29,161,242) },

	{ x = -270, letter = "Запад", color = Color(29,161,242) },

	{ x = -225, letter = "ЮЗ", color = Color(29,161,242) },

	{ x = -180, letter = "Юг", color = Color(29,161,242) },

	{ x = -135, letter = "ЮЗ", color = Color(29,161,242) },

	{ x = -90, letter = "Запад", color = Color(29,161,242) },

	{ x = -45, letter = "СЗ", color = Color(29,161,242) },



	{ x = 0, letter = "Север", color = Color(252,175,23) },



	{ x = 45, letter = "СВ", color = Color(29,161,242) },

	{ x = 90, letter = "Восток", color = Color(29,161,242) },

	{ x = 135, letter = "ЮВ", color = Color(29,161,242) },

	{ x = 180, letter = "Юг", color = Color(29,161,242) },

	{ x = 225, letter = "ЮЗ", color = Color(29,161,242) },

	{ x = 270, letter = "Запад", color = Color(29,161,242) },

	{ x = 315, letter = "СЗ", color = Color(29,161,242) },

	{ x = 360, letter = "Север", color = Color(29,161,242) },

	{ x = 450, letter = "Запад", color = Color(29,161,242) },

	{ x = 15 },
	{ x = 30 },
	{ x = 60 },
	{ x = 75 },
	{ x = 105 },
	{ x = 120 },
	{ x = 150 },
	{ x = 165 },
	{ x = 195 },
	{ x = 210 },
	{ x = 240 },
	{ x = 255 },
	{ x = 285 },
	{ x = 300 },
	{ x = 330 },
	{ x = 345 },

	{ x = -15 },
	{ x = -30 },
	{ x = -60 },
	{ x = -75 },
	{ x = -105 },
	{ x = -120 },
	{ x = -150 },
	{ x = -165 },
	{ x = -195 },
	{ x = -210 },
	{ x = -240 },
	{ x = -255 },
	{ x = -285 },
	{ x = -300 },
	{ x = -330 },
	{ x = -345 },
};

local function LerpColor(frac, from, to)
	return Color(
		Lerp(frac, from.r, to.r),
		Lerp(frac, from.g, to.g),
		Lerp(frac, from.b, to.b),
		Lerp(frac, from.a, to.a)
	);
end;

local function Box(x, y, w, h, c)
	surface.SetDrawColor( c.r, c.g, c.b, c.a );
	surface.DrawRect( x, y, w, h );
end;

local health_Lerp = 100;
local armor_Lerp = 0;

local delay = 0;
local yPos = ScrH();

local hp_clr = Color(214, 48, 49);
local arm_clr = Color(6, 82, 221);
local clr_job = Color(255,255,255,0);

local function drawWeapon()
    if (not IsValid(LocalPlayer():GetActiveWeapon())) then return end
	if mopp.jobs[LocalPlayer():Team()] and mopp.jobs[LocalPlayer():Team()].spawn_group then
	if mopp.jobs[LocalPlayer():Team()].spawn_group == "Clones" or mopp.jobs[LocalPlayer():Team()].spawn_group == "GuardCor" or mopp.jobs[LocalPlayer():Team()].spawn_group == "TwoTwo" or mopp.jobs[LocalPlayer():Team()].spawn_group == "Doomsq" or mopp.jobs[LocalPlayer():Team()].spawn_group == "FourOne" or mopp.jobs[LocalPlayer():Team()].spawn_group == "OneZero" or mopp.jobs[LocalPlayer():Team()].spawn_group == "FiveZero" then
		surface.SetTexture(wpcl)
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(ScrW() - 242 , ScrH() - 100 , 195 , 80)
	elseif mopp.jobs[LocalPlayer():Team()].spawn_group == "Eventjit" then
		surface.SetTexture(wpjit)
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(ScrW() - 242 , ScrH() - 100 , 195 , 80)
	elseif (mopp.jobs[LocalPlayer():Team()].spawn_group == "Eventdroid") then
		surface.SetTexture(wpcis)
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(ScrW() - 242 , ScrH() - 100 , 195 , 80)
	elseif (mopp.jobs[LocalPlayer():Team()].spawn_group == "Astromech") then
		surface.SetTexture(wpastro)
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(ScrW() - 242 , ScrH() - 100 , 195 , 80)
	elseif (mopp.jobs[LocalPlayer():Team()].spawn_group == "Jediorden") then
		surface.SetTexture(wpjedi)
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(ScrW() - 242 , ScrH() - 100 , 195 , 80)
	elseif (mopp.jobs[LocalPlayer():Team()].spawn_group == "Mand") then
		surface.SetTexture(wppirat)
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(ScrW() - 242 , ScrH() - 100 , 195 , 80)
	elseif (mopp.jobs[LocalPlayer():Team()].spawn_group == "Pirat") then
		surface.SetTexture(wppirat)
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(ScrW() - 242 , ScrH() - 100 , 195 , 80)
    else
		surface.SetTexture(wpcl)
		surface.SetDrawColor(color_white)
		surface.DrawTexturedRect(ScrW() - 242 , ScrH() - 100 , 195 , 80)
end
end
draw.SimpleText(LocalPlayer():GetActiveWeapon():GetPrintName() , "hud.sub" , ScrW() - 242 + 192 / 2 , ScrH() - 88 , Color(255,255,255) , TEXT_ALIGN_CENTER)
    if (LocalPlayer():GetActiveWeapon():Clip1() <= 0) then
        draw.SimpleText((LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()) > 0 and LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()) or " Нет ") .. "патронов" , "hud.sub" , ScrW() - 242 + 192 / 2 , ScrH() - 68 , Color(255,255,255) , TEXT_ALIGN_CENTER)
    else
        draw.SimpleText(LocalPlayer():GetActiveWeapon():Clip1() .. " / " .. LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()) , "hud.sub" , ScrW() - 242 + 192 / 2 , ScrH() - 68 , Color(200 , 180 , 130) , TEXT_ALIGN_CENTER)
    end
end

function GAMEMODE:HUDPaint()
	local player = LocalPlayer();
	if !IsValid(player) then return end;
	if !player:Alive() then return end;
	local health = player:Health() or 0;
	local health_Maximum = player:GetMaxHealth() or 0;
	local armor = player:Armor() or 0;
	local armor_Maximum = player:GetNVar('MaxArmor') or 100;
	local job = player:Team() or 0;
	local name = player:Name() or 'UKNOWN';
	local rpid = player:GetNVar('mo_rpid') or '0000';
	local voice = player:GetNVar('voice_id') or '';

	local width = ScrW()*0.13;
	
	local xScreenRes = 1920
    local yScreenRes = 1080
    local wMod = ScrW() / xScreenRes
    local hMod = ScrH() / yScreenRes

local TimeString = os.date("%H:%M | %D" , os.time())
local TimeStrings = os.date("%H:%M" , os.time())

surface.SetTexture(bHUDOSN)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
				
local teams = mopp.jobs[LocalPlayer():Team()]
if teams and teams.spawn_group then
if teams.spawn_group == "Clones" then
		surface.SetTexture(bHUDCLONE)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)		
elseif teams.spawn_group == "Eventjit" then
		surface.SetTexture(bHUDJIT)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
elseif teams.spawn_group == "Doomsq" then
		surface.SetTexture(bHUDDOOM)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
elseif teams.spawn_group == "TwoTwo" then
		surface.SetTexture(bHUDTWOONE)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
elseif (teams.spawn_group == "Eventdroid") then
		surface.SetTexture(bHUDCIS)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
elseif (teams.spawn_group == "Astromech") then
		surface.SetTexture(bHUDASTRO)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
elseif (teams.spawn_group == "Jediorden") then
		surface.SetTexture(bHUDJEDI)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
elseif (teams.spawn_group == "Mand") then
		surface.SetTexture(bHUDMAND)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
elseif (teams.spawn_group == "Pirat") then
		surface.SetTexture(bHUDPIRAT)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
elseif (teams.spawn_group == "GuardCor") then
		surface.SetTexture(bHUDGUARD)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
elseif (teams.spawn_group == "FourOne") then
		surface.SetTexture(bHUDFOURONE)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
elseif (teams.spawn_group == "OneZero") then
		surface.SetTexture(bHUDCLONE)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
elseif (teams.spawn_group == "FiveZero") then
		surface.SetTexture(bHUDTHREEWTO)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)			
else
		surface.SetTexture(bHUDCLONE)
                surface.SetDrawColor(color_white)
                surface.DrawTexturedRect(wMod*10 , hMod * 932 , wMod*130 , hMod*130)
end
end

	health_Lerp = Lerp(FrameTime()*3, health_Lerp, math.Clamp(health, 0, health_Maximum));
	armor_Lerp = Lerp(FrameTime()*3, armor_Lerp, math.Clamp(armor, 0, armor_Maximum));

	if input.IsKeyDown( KEY_C ) then
		yPos = Lerp(FrameTime()*5, yPos, ScrH()-30 + 6/2);
		clr_job = LerpColor(FrameTime()*5, clr_job, team.GetColor(job));
	else
		yPos = Lerp(FrameTime()*5, yPos, ScrH());
		clr_job = LerpColor(FrameTime()*5, clr_job, Color(255,255,255,0));
	end;

if ScrW() < 1620 then
	draw.ShadowSimpleText(health.." / "..health_Maximum, "hud.fontssmile.2", wMod*400, hMod * 960, Color(5,5,5,200),TEXT_ALIGN_RIGHT);
	draw.ShadowSimpleText(health.." / "..health_Maximum, "hud.fontssmile.2", wMod*400, hMod * 960, Color(255,255,255),TEXT_ALIGN_RIGHT);
	draw.ShadowSimpleText(armor.." / "..armor_Maximum, "hud.fontssmile.2", wMod*398, hMod * 1013, Color(5,5,5,200),TEXT_ALIGN_RIGHT);
	draw.ShadowSimpleText(armor.." / "..armor_Maximum, "hud.fontssmile.2", wMod*398, hMod * 1013, Color(255,255,255),TEXT_ALIGN_RIGHT);
	draw.ShadowSimpleText(TimeString , "hud.fontssmile.2" , wMod*150, hMod * 1013 , Color(5,5,5,200) , TEXT_ALIGN_LEFT)
	draw.ShadowSimpleText(TimeString , "hud.fontssmile.2" , wMod*150, hMod * 1013 , Color(255,255,255) , TEXT_ALIGN_LEFT)
	draw.ShadowSimpleText('IDN | ' .. (LocalPlayer():GetNVar('mo_rpid') or 0),'hud.fontssmile.2',wMod*150, hMod * 960,Color(5,5,5,200),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP,1)
	draw.ShadowSimpleText('IDN | ' .. (LocalPlayer():GetNVar('mo_rpid') or 0),'hud.fontssmile.2',wMod*150, hMod * 960,Color(255,255,255,240),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP,1)
else
	draw.ShadowSimpleText(health.." / "..health_Maximum, "hud.fontssmile", wMod*400, hMod * 960, Color(5,5,5,200),TEXT_ALIGN_RIGHT);
	draw.ShadowSimpleText(health.." / "..health_Maximum, "hud.fontssmile", wMod*400, hMod * 960, Color(255,255,255),TEXT_ALIGN_RIGHT);
	draw.ShadowSimpleText(armor.." / "..armor_Maximum, "hud.fontssmile", wMod*398, hMod * 1013, Color(5,5,5,200),TEXT_ALIGN_RIGHT);
	draw.ShadowSimpleText(armor.." / "..armor_Maximum, "hud.fontssmile", wMod*398, hMod * 1013, Color(255,255,255),TEXT_ALIGN_RIGHT);
	draw.ShadowSimpleText(TimeString , "hud.fontssmile" , wMod*150, hMod * 1013 , Color(5,5,5,200) , TEXT_ALIGN_LEFT)
	draw.ShadowSimpleText(TimeString , "hud.fontssmile" , wMod*150, hMod * 1013 , Color(255,255,255) , TEXT_ALIGN_LEFT)
	draw.ShadowSimpleText('IDN | ' .. (LocalPlayer():GetNVar('mo_rpid') or 0),'hud.fontssmile',wMod*150, hMod * 960,Color(5,5,5,200),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP,1)
	draw.ShadowSimpleText('IDN | ' .. (LocalPlayer():GetNVar('mo_rpid') or 0),'hud.fontssmile',wMod*150, hMod * 960,Color(255,255,255,240),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP,1)
end

	/* Полоска здоровья */
	Box(wMod*150, hMod * 986, width, 6, Color(5,5,5,60));
	Box(wMod*150, hMod * 986, width, 6, Color(255,255,255,60));
	Box(wMod*150, hMod * 986, width/health_Maximum * health_Lerp, 8, Color(hp_clr.r-10, hp_clr.g-10, hp_clr.b-10, 255));
	Box(wMod*150, hMod * 986, width/health_Maximum * health_Lerp, 8, hp_clr);

	/* Полоска брони */
	Box(wMod*150, hMod * 1000, width, 6, Color(5,5,5,60));
	Box(wMod*150, hMod * 1000, width, 6, Color(255,255,255,60));
	Box(wMod*150, hMod * 1000, width/armor_Maximum * armor_Lerp, 8, Color(arm_clr.r-10, arm_clr.g-10, arm_clr.b-10, 255));
	Box(wMod*150, hMod * 1000, width/armor_Maximum * armor_Lerp, 8, arm_clr );

	/* Данные о игроке */
	draw.SimpleText(name.." | IDN:"..rpid, "hud.name", ScrW()/2-width-15, yPos+1, Color(5,5,5,clr_job.a-55), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER);
	draw.SimpleText(name.." | IDN:"..rpid, "hud.name", ScrW()/2-width-15, yPos, Color(184, 233, 148,clr_job.a), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER);

	draw.SimpleText(team.GetName(job), "hud.name", ScrW()/2+width+15, yPos+1, Color(5,5,5,clr_job.a-55), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER);
	draw.SimpleText(team.GetName(job), "hud.name", ScrW()/2+width+15, yPos, clr_job, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER);

	/* Компасс */
	do
		local offLimit = ScrW() / 6;
		local offset = LocalPlayer():GetAngles().y;
		for i, el in ipairs(elements) do
			local x = (el.x + offset) * 4;
			if x < -offLimit then continue end;
			if x > offLimit then continue end;

			local alpha = (offLimit - math.abs(x)) / offLimit * 255;
			local draw_x = ScrW() / 2 + x;

			surface.SetDrawColor(Color(255,255,255,alpha));
			local color = el.color and Color(el.color.r,el.color.g,el.color.b,alpha*6) or Color(255,255,255,alpha);
			if el.letter then
				surface.DrawLine(draw_x-2, 5, draw_x-2, 15);
				draw.ShadowSimpleText( el.letter, "hud.percs", draw_x-2, 15, color, 1, 0, 1, Color(0,0,0,alpha/2));
			else
				surface.DrawLine(draw_x-1, 5, draw_x-1, 13);

				local x_ = el.x > 0 and el.x or 360 + el.x;
				draw.ShadowSimpleText( x_, "hud.percs", draw_x, 15, color, 1, 0, 1, Color(0,0,0,alpha/2));
			end;
		end;
		draw.SimpleText("▼", "hud.percs", ScrW()/2, -4, color_white, 1, 0);
	end;
	
drawWeapon()
end;

local lerp = 0;
local lerp2 = 0;
hook.Add("PostPlayerDraw", "Hud.Player", function(target)
	local player = LocalPlayer();
	if !IsValid(player) then return end;
	if !IsValid(target) then return end;
	if (target == player) then return end;
	if !target:Alive() then return end;

	local distance = player:GetPos():Distance( target:GetPos() );
	local name = target:Name() or 'UNKNOWN';
	local job = target:Team() or 0;
	local id = target:GetNVar('mo_rpid') or '0000';
	local data = target:GetNVar('mo_data');

	if distance < 512 then
		local offset = target:Crouching() and Vector( 0, 0, 45 ) or Vector( 0, 0, 85 );
		local angle = player:EyeAngles();
		local position = target:GetPos() + offset + angle:Up();

		angle:RotateAroundAxis(angle:Forward(), 90);
		angle:RotateAroundAxis(angle:Right(), 90);

		cam.Start3D2D(position, Angle(0, angle.y, 90), 0.075)
			draw.SimpleText(id.." "..name, "hud.abovehead", 0, 1, Color(5,5,5), TEXT_ALIGN_CENTER);
			draw.SimpleText(id.." "..name, "hud.abovehead", 0, 0, Color(255,255,255), TEXT_ALIGN_CENTER);
			draw.SimpleText(team.GetName(job), "hud.abovehead.s", 0, 50+1+lerp, Color(5,5,5), TEXT_ALIGN_CENTER);
			draw.SimpleText(team.GetName(job), "hud.abovehead.s", 0, 50+lerp, team.GetColor(job), TEXT_ALIGN_CENTER);
		cam.End3D2D();

		if (target:IsSpeaking() || target:IsTyping()) then
			local text = target:IsSpeaking() and 'говорит...' or 'печатает...';
			lerp = Lerp(FrameTime()*3, lerp, 60);
			cam.Start3D2D(position, Angle(0, angle.y, 90), 0.075);
				draw.SimpleText(text, "hud.abovehead.s", 0, 50+1, Color(5,5,5), TEXT_ALIGN_CENTER);
				draw.SimpleText(text, "hud.abovehead.s", 0, 50, clrs, TEXT_ALIGN_CENTER);
			cam.End3D2D();
		else
			lerp = Lerp(FrameTime()*3, lerp, 0);
		end;
                local character = target:GetNVar('mo_character')
		if !data then return end;
		local rank = data[character].data.rank or '';
		local legion = data[character].data.legion or '';

		if legion ~= '' then
			if (player:GetEyeTrace().Entity == target) then
				lerp2 = Lerp(FrameTime()*5, lerp2, 255);
			else
				lerp2 = Lerp(FrameTime()*5, lerp2, 0);
			end;

			cam.Start3D2D(position, Angle(0, angle.y, 90), 0.075)
				draw.SimpleText("["..legion.."] "..rank, "hud.abovehead.s", 0, -50+1, Color(5,5,5, lerp2), TEXT_ALIGN_CENTER);
				draw.SimpleText("["..legion.."] "..rank, "hud.abovehead.s", 0, -50, Color(255,255,255, lerp2), TEXT_ALIGN_CENTER);
			cam.End3D2D();
		end;

	end;
end);

hook.Add('StartChat', 'TalkIcon', function(isteam)
	netstream.Start("TalkIconChat", true)
end)

hook.Add('FinishChat', 'TalkIcon', function()
	netstream.Start("TalkIconChat", false)
end)

function GAMEMODE:HUDDrawTargetID()
	return false
end

function GAMEMODE:DrawDeathNotice()
	return false
end

hook.Add('Think', 'LowHP_DSP', function()
	if LocalPlayer():Health() < 25 then
		LocalPlayer():SetDSP(3)
	else
		LocalPlayer():SetDSP(0)
	end;
end);


