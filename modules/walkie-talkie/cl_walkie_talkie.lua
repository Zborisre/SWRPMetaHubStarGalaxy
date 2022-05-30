surface.CreateFont( "hud.sub", {
	font = "Electrolize [RUS by Daymarius]",
	size = 18,
	weight = 600,
	extended = true,
});

surface.CreateFont( "hud.sube", {
	font = "Electrolize [RUS by Daymarius]",
	size = 50,
	weight = 900,
	extended = true,
});

local time = CurTime()

	local xScreenRes = 1920
    local yScreenRes = 1080
    local wMod = ScrW() / xScreenRes
    local hMod = ScrH() / yScreenRes

radio_s = radio_s or false

micro_s = micro_s or false



hook.Add( "Think", "WalkieTalkie_Think", function()

    -- local job = meta.jobs[LocalPlayer():Team()]



    local radio = LocalPlayer():GetNVar('meta_radio')



    if not radio then return end

	if time > CurTime() then return end



	if input.IsKeyDown(KEY_LSHIFT) and input.IsKeyDown(KEY_M) then

		netstream.Start("WalkieTalkie.SpeakerToggle")

		radio_s = not radio_s

        time = CurTime() + 0.2

	end



	if input.IsKeyDown(KEY_LSHIFT) and input.IsKeyDown(KEY_T) then

		netstream.Start("WalkieTalkie.MicroToggle")

		micro_s = not micro_s

        time = CurTime() + 0.2

	end

end )



hook.Add("HUDPaint", "WalkieTalkie_HUDPaint", function()

	local ply = LocalPlayer()



	if not ply or not ply:GetNVar('meta_radio') then return end

	local should_show = ply:GetNVar('meta_radio') and true or false



	if not should_show then return end



	local phrase_s = radio_s and "<color=50,200,50>включена</color>" or "<color=200,50,50>выключена</color>"

	local phrase_m = micro_s and "<color=50,200,50>включен</color>" or "<color=200,50,50>выключен</color>"



    local phrase_i = string.format("<color=240,182,41>%s</color>", tostring(LocalPlayer():GetNVar('meta_radio')) or 'Нету')



	local mark = markup.Parse("<hud.sube>Рация: "..phrase_s.." (Shift+M)")

	mark:Draw(wMod*10, hMod * 10, TEXT_ALIGN_LEFT)


	local mark = markup.Parse("<hud.sube>Микрофон: "..phrase_m.." (Shift+T)")

	mark:Draw(wMod*10, hMod * 25, TEXT_ALIGN_LEFT)



    local mark = markup.Parse("<hud.sube>Текущий канал "..phrase_i..".")

	mark:Draw(wMod*10, hMod * 40, TEXT_ALIGN_LEFT)

end)

