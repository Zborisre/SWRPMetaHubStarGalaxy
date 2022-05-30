surface.CreateFont( "ModernNotification", {
	font = "Electrolize [RUS by Daymarius]",
	extended = true,
	size = 20,
} )

local delay = 0;
local lastMessage = '';
netstream.Hook('notify_receive', function(text)
	if (delay > CurTime()) && (text == lastMessage) then return end
	delay = CurTime() + 1;
	lastMessage = text;

  notification.AddLegacy( text, 0, 3 );
end)

local ScreenPos = ScrH() - 200
local Notifications = {}
local timer = 0

local function DrawNotification( x, y, w, h, text, icon, col )
	local clr = Color(47, 54, 64)
	draw.GradientBox(x, y-1, w-h, h, 1, clr, Color(clr.r-20, clr.g-20, clr.b-20, clr.a))
	draw.LinBox(x, y, w-h, h, 1, Color(5,5,5,50))

	draw.SimpleText( text, "ModernNotification", x + 5, y + h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
end

function notification.AddLegacy( text, type, time )
	surface.SetFont( "ModernNotification" )

	local w = surface.GetTextSize( text ) + 20 + 32
	local h = 32
	local x = ScrW()
	local y = ScreenPos

	table.insert( Notifications, 1, {
		x = x,
		y = y,
		w = w,
		h = h,

		text = text,
		col = nil,
		icon = nil,
		time = CurTime() + time,

		progress = false,
	} )
end

function notification.AddProgress( id, text )
	surface.SetFont( "ModernNotification" )

	local w = surface.GetTextSize( text ) + 20 + 32
	local h = 32
	local x = ScrW()
	local y = ScreenPos

	table.insert( Notifications, 1, {
		x = x,
		y = y,
		w = w,
		h = h,

		id = id,
		text = text,
		col = LoadingColor,
		icon = LoadingIcon,
		time = math.huge,

		progress = true,
	} )
end

function notification.Kill( id )
	for k, v in ipairs( Notifications ) do
		if v.id == id then v.time = 0 end
	end
end

hook.Add( "HUDPaint", "DrawNotifications", function()
	for k, v in ipairs( Notifications ) do
		DrawNotification( math.floor( v.x ), math.floor( v.y ), v.w, v.h, v.text, v.icon, v.col )

		v.x = Lerp( FrameTime() * 10, v.x, v.time > CurTime() and ScrW() - v.w - 10 or ScrW() + 1 )
		v.y = Lerp( FrameTime() * 10, v.y, ScreenPos - ( k - 1 ) * ( v.h + 5 ) )
	end

	for k, v in ipairs( Notifications ) do
		if v.x >= ScrW() and v.time < CurTime() then
			table.remove( Notifications, k )
		end
	end
end )
