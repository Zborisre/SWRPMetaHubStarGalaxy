concommand.Add("clear_menu", function()
  local base = vgui.Create("FFrame")
	base:SetSize(ScrW()*0.3, ScrH()*0.15)
	base:MakePopup()
	base:Center()
	base:FadeIn(0.5)
	base:SetTitle("Меню очистки карты")

  local list = base:Add("FList")
	list:SetPos(5, 30)
	list:SetSize(base:GetWide()-10, base:GetTall()-30-5)
	function list:Paint(w,h)
		draw.Box(0, 0, w, h, Color(5,5,5,100))
	end

  local strs = {}
  strs['Удалить все пропы'] = function() netstream.Start('delete_props', nil) end
  strs['Удалить всех NPC'] = function() netstream.Start('delete_npcs', nil) end

  for k,v in pairs(strs) do
    local button = vgui.Create("FButton")
    button:SetDark(true)
    button:SetSize(list:GetWide()-10, 25)
    button:SetName(k)
    list:AddItem(button)
    function button:DoClick()
      v()
    end
  end


end)
