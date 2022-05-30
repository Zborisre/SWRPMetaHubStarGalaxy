local matrix = Matrix()
local matrixAngle = Angle(0, 0, 0)
local matrixScale = Vector(0, 0, 0)
local matrixTranslation = Vector(0, 0, 0)

c_bblack = Color(0,0,0,120)
c_blublack = Color(0,0,0,180)
c_black = Color(0,0,0,255)
c_brown = Color(30,30,30,255)
c_bwhite = Color(200,200,200,255)
c_comw = Color(234, 32, 39)
c_white = Color(255,255,255,255)
c_dblue = Color(74, 105, 189)

function IconBetter( x, y, w, h, col, mat )
	surface.SetDrawColor( col )
	surface.SetMaterial( mat )
	surface.DrawTexturedRect( x, y, w, h )
end

function DrawHudBar( x, y, w, h, val, max, col)
    draw.RoundedBox(0, x, y, w, h, c_bblack)
    draw.RoundedBox(0, x + 1, y + 1, val/max * (w - 2), h - 2, col)
end

function DrawBetterText(text, font, x, y, col)
	draw.SimpleText(text, font, x, y, col, 0, 0)
	draw.SimpleText(text, font, x + 1, y + 1, c_bblack, 0, 0)
end

function ESCButton( text, font, parent, mat, click )
	local ButtonName = vgui.Create( "DButton", parent )
    ButtonName:DockMargin(5, 5, 5, 0)
	ButtonName:SetParent( parent )
	ButtonName:Dock(TOP)
	ButtonName:SetHeight(50)
	ButtonName:SetText( "" )
    ButtonName.Paint = function(self, w, h)
        draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 220 ) )
		draw.SimpleText(text, font, w * .5, h * .5, Color( 255, 255, 255, 255 ), 1, 1)
		IconBetter( 5, 10, 30, 30, c_white, Material(mat))
    end
	ButtonName.OnCursorEntered = function()
		ButtonName.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 140, 140, 140, 220 ) )
			draw.SimpleText(text, font, w * .5, h * .5, c_brown, 1, 1)
			IconBetter( 5, 10, 30, 30, c_brown, Material(mat))
		end
	end
	ButtonName.OnCursorExited = function()
		ButtonName.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 220 ) )
			draw.SimpleText(text, font, w * .5, h * .5, Color( 255, 255, 255, 255 ), 1, 1)
			IconBetter( 5, 10, 30, 30, c_white, Material(mat))
		end
	end
	function ButtonName:DoClick()
		click()
	end
end

function draw.TextRotated(text, font, x, y, xScale, yScale, angle, color, bshadow)
	render.PushFilterMag( TEXFILTER.LINEAR )
	render.PushFilterMin( TEXFILTER.LINEAR )
		matrix:SetTranslation( Vector( x, y ) )
		matrix:SetAngles( Angle( 0, angle, 0 ) )

		surface.SetFont( font )
		
		if bshadow then
			surface.SetTextColor( Color(0,0,0,90) )

			matrixScale.x = xScale
			matrixScale.y = yScale
			matrix:Scale(matrixScale)
			
			surface.SetTextPos(1, 1)
			
			cam.PushModelMatrix(matrix)
				surface.DrawText(text)
			cam.PopModelMatrix()
		end

		surface.SetTextColor( color )
		surface.SetTextPos(0, 0)
		
		cam.PushModelMatrix(matrix)
			surface.DrawText(text)
		cam.PopModelMatrix()
	render.PopFilterMag()
	render.PopFilterMin()
end

function draw.ShadowSimpleText( text, font, x, y, color, xalign, yalign, sh, color_shadow )
	local sh = sh or 1
	draw.SimpleText(text, font, x+sh, y+sh, color_shadow or Color(0,0,0,190), xalign, yalign)
	draw.SimpleText(text, font, x, y, color, xalign, yalign)
end

function draw.SimpleTextOutlined(text, font, x, y, colour, xalign, yalign, outlinewidth, outlinecolour)
	local steps = ( outlinewidth * 2 ) / 3
	if ( steps < 1 ) then steps = 1 end

	for _x = -outlinewidth, outlinewidth, steps do
		for _y = -outlinewidth, outlinewidth, steps do
			draw.SimpleText( text, font, x + _x, y + _y, outlinecolour, xalign, yalign )
		end
	end

	return draw.SimpleText( text, font, x, y, colour, xalign, yalign )
end

function draw.ShadowText(text, font, x, y, colortext, colorshadow, dist, xalign, yalign)
	draw.SimpleText(text, font, x + dist, y + dist, colorshadow, xalign, yalign)
	draw.SimpleText(text, font, x, y, colortext, xalign, yalign)
end

function draw.DrawPolyLine(tblVectors, tblColor)
	surface.SetDrawColor( tblColor )
	draw.NoTexture()
	surface.DrawPoly( tblVectors )
end

function draw.Icon( x, y, w, h, Mat, tblColor )
	surface.SetMaterial(Mat)
	surface.SetDrawColor(tblColor or Color(255,255,255,255))
	surface.DrawTexturedRect(x, y, w, h)
end

local blur = Material("pp/blurscreen", "noclamp")
function draw.DrawBlur(x, y, w, h, amount)
	render.ClearStencil()
	render.SetStencilEnable( true )
	render.SetStencilReferenceValue( 1 )
	render.SetStencilTestMask( 1 )
	render.SetStencilWriteMask( 1 )

	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_NEVER )
	render.SetStencilFailOperation( STENCILOPERATION_REPLACE )
	render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
	render.SetStencilZFailOperation( STENCILOPERATION_REPLACE )

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawRect(x,y,w,h)

	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
	render.SetStencilFailOperation( STENCILOPERATION_KEEP )
	render.SetStencilPassOperation( STENCILOPERATION_KEEP )
	render.SetStencilZFailOperation( STENCILOPERATION_KEEP )

	surface.SetMaterial( blur )
	surface.SetDrawColor( 255, 255, 255, 255 )

	for i = 0, 1, 0.33 do
		blur:SetFloat( '$blur', i * (amount or 0.2) )
		blur:Recompute()
		render.UpdateScreenEffectTexture()

		surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )
	end
	render.SetStencilEnable( false )
end

function draw.StencilBlur( panel, w, h )
	render.ClearStencil()
	render.SetStencilEnable( true )
	render.SetStencilReferenceValue( 1 )
	render.SetStencilTestMask( 1 )
	render.SetStencilWriteMask( 1 )

	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_NEVER )
	render.SetStencilFailOperation( STENCILOPERATION_REPLACE )
	render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
	render.SetStencilZFailOperation( STENCILOPERATION_REPLACE )

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawRect( 0, 0, w, h )

	render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
	render.SetStencilFailOperation( STENCILOPERATION_KEEP )
	render.SetStencilPassOperation( STENCILOPERATION_KEEP )
	render.SetStencilZFailOperation( STENCILOPERATION_KEEP )

		surface.SetMaterial( blur )
		surface.SetDrawColor( 255, 255, 255, 255 )

		for i = 0, 1, 0.33 do
			blur:SetFloat( '$blur', 5 *i )
			blur:Recompute()
			render.UpdateScreenEffectTexture()

			local x, y = panel:GetPos()

			surface.DrawTexturedRect( -x, -y, ScrW(), ScrH() )
		end

	render.SetStencilEnable( false )
end

local blur = Material("pp/blurscreen")
function DrawBlur(panel, amount)
    local scrW, scrH = ScrW(), ScrH()
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)
    for i = 1, 3 do
        blur:SetFloat("$blur", (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(0 , 0, scrW, scrH)
    end
end