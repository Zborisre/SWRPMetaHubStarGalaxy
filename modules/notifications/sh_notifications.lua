NOTIFY_TYPES = {
    ['yellow'] = Color(221, 174, 100),
    ['red'] = Color(183, 81, 52),
    ['blue'] = Color(123, 168, 196),
    ['green'] = Color(140, 160, 93),
    ['purple'] = Color(176, 100, 149),
    ['cyan'] = Color(136, 219, 216)
}

NOTIFY_DATE_FORMAT = "%H:%M"

if SERVER then

	function mopp.util.Notify(type, target, ...)

		ChatAddText(target, NOTIFY_TYPES[type], '['..os.date(NOTIFY_DATE_FORMAT , os.time())..'] ', color_white, ...)

	end

else

	function mopp.util.Notify(type, ...)

		chat.AddText(NOTIFY_TYPES[type], '['..os.date(NOTIFY_DATE_FORMAT , os.time())..'] ', color_white, ...)

	end

end



function mopp.util.NotifyAll(type, ...)

	ChatAddTextAll(NOTIFY_TYPES[type], '['..os.date(NOTIFY_DATE_FORMAT , os.time())..'] ', color_white, ...)

end

