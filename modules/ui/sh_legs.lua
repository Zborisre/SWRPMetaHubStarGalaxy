--[[
gamemodes/starwarsrp/gamemode/modules/ui/sh_legs.lua
--]]
local PLAYER 			= FindMetaTable("Player")
local ENTITY 			= FindMetaTable("Entity")

local bHasShownNotice = false
do
	ENTITY._SetModel = ENTITY._SetModel or ENTITY.SetModel

	function PLAYER:SetModel( model )
		self:_SetModel(model)
		hook.Run("SetModel", self, model)
	end

	function PLAYER:SetLegsModel( model )
		if (SERVER) then
			self:SetNWString( "PlayerMeta.PlayerModel", model )
			self:ConCommand("cl_refreshlegs")
		end
	end

	function PLAYER:GetLegModel()
		local model = self:GetNWString( "PlayerMeta.PlayerModel", false )
		if (!model) then
			model = self:GetModel()
		end
		return model
	end

	hook.Add("SetModel", "GML::SetModel::Hook", function(ply, mdl)
		if (SERVER) then
			ply:SetLegsModel(mdl)
		end
	end)
end

if (CLIENT) then
	local LegsBool      	= CreateConVar("cl_legs", "1", {FCVAR_ARCHIVE}, "Enable/Disable the rendering of the legs")
	local VLegsBool     	= CreateConVar("cl_vehlegs", "1", {FCVAR_ARCHIVE}, "Enable/Disable the rendering of the legs in vehicles")

	local Legs = {}
	Legs.LegEnt = nil

	local g_maxseqgroundspeed = 0
	local g_velocity = 0

	function Legs:CheckDrawVehicle()
		if (LocalPlayer():InVehicle()) then
			if LegsBool:GetBool() && !VLegsBool:GetBool() then
				return true
			end
			return false
		end
	end

	function ShouldDrawLegs()
		if (hook.Run("ShouldDisableLegs") == true) then 
			return false 
		end
		if LegsBool:GetBool() then
			return  IsValid(Legs.LegEnt) &&
					(LocalPlayer():Alive() || (LocalPlayer().IsGhosted && LocalPlayer():IsGhosted())) &&
					!Legs:CheckDrawVehicle()  &&
					GetViewEntity() == LocalPlayer() &&
					!LocalPlayer():ShouldDrawLocalPlayer() &&
					!IsValid(LocalPlayer():GetObserverTarget()) &&
					!LocalPlayer().ShouldDisableLegs &&
					!LocalPlayer():GetNVar("Tased")
		else
			return false
		end
	end

	function GetPlayerLegs(ply)
		return ply && ply != LocalPlayer() && ply || (ShouldDrawLegs() && Legs.LegEnt || LocalPlayer())
	end

	function Legs:SetUp()

		if (!IsValid(self.LegEnt)) then
			self.LegEnt = ClientsideModel(LocalPlayer():GetLegModel(), RENDER_GROUP_OPAQUE_ENTITY)	
		else
			self.LegEnt:SetModel(LocalPlayer():GetLegModel())
		end

		self.LegEnt:SetNoDraw(true)

		for k, v in pairs(LocalPlayer():GetBodyGroups()) do
			local current = LocalPlayer():GetBodygroup(v.id)
			self.LegEnt:SetBodygroup(v.id,  current)
		end

		for k, v in ipairs(LocalPlayer():GetMaterials()) do
			self.LegEnt:SetSubMaterial(k - 1, LocalPlayer():GetSubMaterial(k - 1))
		end

		self.LegEnt:SetSkin(LocalPlayer():GetSkin())
		self.LegEnt:SetMaterial(LocalPlayer():GetMaterial())
		self.LegEnt:SetColor(LocalPlayer():GetColor())
		self.LegEnt.GetPlayerColor = function()
			return LocalPlayer():GetPlayerColor()
		end

		self.LegEnt.Anim = nil
		self.PlaybackRate = 1
		self.Sequence = nil
		self.Velocity = 0
		self.OldWeapon = nil
		self.HoldType = nil

		self.BonesToRemove = {}

		self.BoneMatrix = nil

		self.LegEnt.LastTick = 0

		self:Update(g_maxseqgroundspeed)
	end

	Legs.PlaybackRate = 1
	Legs.Sequence = nil
	Legs.Velocity = 0
	Legs.OldWeapon = nil
	Legs.HoldType = nil

	Legs.BonesToRemove = {}

	Legs.BoneMatrix = nil

	function Legs:WeaponChanged(weap)
		if IsValid(self.LegEnt) then
			for i = 0, self.LegEnt:GetBoneCount() do
				self.LegEnt:ManipulateBoneScale(i, Vector(1,1,1))
				self.LegEnt:ManipulateBonePosition(i, vector_origin)
			end

			self.BonesToRemove =
			{
				"ValveBiped.Bip01_Head1",
				"ValveBiped.Bip01_L_Hand",
				"ValveBiped.Bip01_L_Forearm",
				"ValveBiped.Bip01_L_Upperarm",
				"ValveBiped.Bip01_L_Clavicle",
				"ValveBiped.Bip01_R_Hand",
				"ValveBiped.Bip01_R_Forearm",
				"ValveBiped.Bip01_R_Upperarm",
				"ValveBiped.Bip01_R_Clavicle",
				"ValveBiped.Bip01_L_Finger4",
				"ValveBiped.Bip01_L_Finger41",
				"ValveBiped.Bip01_L_Finger42",
				"ValveBiped.Bip01_L_Finger3",
				"ValveBiped.Bip01_L_Finger31",
				"ValveBiped.Bip01_L_Finger32",
				"ValveBiped.Bip01_L_Finger2",
				"ValveBiped.Bip01_L_Finger21",
				"ValveBiped.Bip01_L_Finger22",
				"ValveBiped.Bip01_L_Finger1",
				"ValveBiped.Bip01_L_Finger11",
				"ValveBiped.Bip01_L_Finger12",
				"ValveBiped.Bip01_L_Finger0",
				"ValveBiped.Bip01_L_Finger01",
				"ValveBiped.Bip01_L_Finger02",
				"ValveBiped.Bip01_R_Finger4",
				"ValveBiped.Bip01_R_Finger41",
				"ValveBiped.Bip01_R_Finger42",
				"ValveBiped.Bip01_R_Finger3",
				"ValveBiped.Bip01_R_Finger31",
				"ValveBiped.Bip01_R_Finger32",
				"ValveBiped.Bip01_R_Finger2",
				"ValveBiped.Bip01_R_Finger21",
				"ValveBiped.Bip01_R_Finger22",
				"ValveBiped.Bip01_R_Finger1",
				"ValveBiped.Bip01_R_Finger11",
				"ValveBiped.Bip01_R_Finger12",
				"ValveBiped.Bip01_R_Finger0",
				"ValveBiped.Bip01_R_Finger01",
				"ValveBiped.Bip01_R_Finger02",
				"ValveBiped.Bip01_Spine4",
				"ValveBiped.Bip01_Spine2",
			}

			if ( LocalPlayer():InVehicle() ) then
				self.BonesToRemove =
				{
					"ValveBiped.Bip01_Head1",
				}
			end

			for k, v in pairs(self.BonesToRemove) do
				local bone = self.LegEnt:LookupBone(v)
				if (bone) then
					self.LegEnt:ManipulateBoneScale(bone, Vector(0,0,0))
					if ( !LocalPlayer():InVehicle() ) then
						self.LegEnt:ManipulateBonePosition(bone, Vector(0,-100,0))
						self.LegEnt:ManipulateBoneAngles(bone, Angle(0,0,0))
					end
				end
			end
		end
	end

	Legs.BreathScale = 0.5
	Legs.NextBreath = 0

	function Legs:Think(maxseqgroundspeed)
		if not LocalPlayer():Alive() then
			Legs:SetUp()
			return
		end

		self:Update(maxseqgroundspeed)
	end

	function Legs:Update(maxseqgroundspeed)
		if IsValid(self.LegEnt) then
			self:WeaponChanged(LocalPlayer():GetActiveWeapon())

			self.Velocity = LocalPlayer():GetVelocity():Length2D()

			self.PlaybackRate = 1

			if self.Velocity > 0.5 then
				if maxseqgroundspeed < 0.001 then
					self.PlaybackRate = 0.01
				else
					self.PlaybackRate = self.Velocity / maxseqgroundspeed
					self.PlaybackRate = math.Clamp(self.PlaybackRate, 0.01, 10)
				end
			end

			self.LegEnt:SetPlaybackRate(self.PlaybackRate)

			self.Sequence = LocalPlayer():GetSequence()

			if (self.LegEnt.Anim != self.Sequence) then
				self.LegEnt.Anim = self.Sequence
				self.LegEnt:ResetSequence(self.Sequence)
			end

			self.LegEnt:FrameAdvance(CurTime() - self.LegEnt.LastTick)
			self.LegEnt.LastTick = CurTime()

			Legs.BreathScale = sharpeye && sharpeye.GetStamina && math.Clamp(math.floor(sharpeye.GetStamina() * 5 * 10) / 10, 0.5, 5) || 0.5

			if Legs.NextBreath <= CurTime() then
				Legs.NextBreath = CurTime() + 1.95 / Legs.BreathScale
				self.LegEnt:SetPoseParameter("breathing", Legs.BreathScale)
			end

			self.LegEnt:SetPoseParameter("move_x", (LocalPlayer():GetPoseParameter("move_x") * 2) - 1) -- Translate the walk x direction
			self.LegEnt:SetPoseParameter("move_y", (LocalPlayer():GetPoseParameter("move_y") * 2) - 1) -- Translate the walk y direction
			self.LegEnt:SetPoseParameter("move_yaw", (LocalPlayer():GetPoseParameter("move_yaw") * 360) - 180) -- Translate the walk direction
			self.LegEnt:SetPoseParameter("body_yaw", (LocalPlayer():GetPoseParameter("body_yaw") * 180) - 90) -- Translate the body yaw
			self.LegEnt:SetPoseParameter("spine_yaw",(LocalPlayer():GetPoseParameter("spine_yaw") * 180) - 90) -- Translate the spine yaw

			if LocalPlayer():InVehicle() then
				self.LegEnt:SetPoseParameter("vehicle_steer", (LocalPlayer():GetVehicle():GetPoseParameter("vehicle_steer") * 2) - 1) -- Translate the vehicle steering
			end
		end
	end

	hook.Add("UpdateAnimation", "GML:UpdateAnimation", function(ply, velocity, maxseqgroundspeed)
		if ply == LocalPlayer() then
			if IsValid(Legs.LegEnt) then
				Legs:Think(maxseqgroundspeed)
				if (string.lower(LocalPlayer():GetLegModel()) != string.lower(Legs.LegEnt:GetModel())) then
					Legs:SetUp()
				end
			else
				Legs:SetUp()
			end
		end
	end)

	Legs.RenderAngle = nil
	Legs.BiaisAngle = nil
	Legs.RadAngle = nil
	Legs.RenderPos = nil
	Legs.RenderColor = {}
	Legs.ClipVector = vector_up * -1
	Legs.ForwardOffset = -24

	function Legs:DoFinalRender()
	   cam.Start3D(EyePos(), EyeAngles())
			if ShouldDrawLegs() then
				local local_player = LocalPlayer()
				if (local_player:Crouching() || local_player:InVehicle()) then
					self.RenderPos = local_player:GetPos()
				else
					self.RenderPos = local_player:GetPos() + Vector(0,0,5)
				end

				if local_player:InVehicle() then
					self.RenderAngle = local_player:GetVehicle():GetAngles()
					self.RenderAngle:RotateAroundAxis(self.RenderAngle:Up(), 90)
				else
					self.BiaisAngles = sharpeye_focus && sharpeye_focus.GetBiaisViewAngles && sharpeye_focus:GetBiaisViewAngles() || local_player:EyeAngles()
					self.RenderAngle = Angle(0, self.BiaisAngles.y, 0)
					self.RadAngle = math.rad(self.BiaisAngles.y)
					self.ForwardOffset = -22
					self.RenderPos.x = self.RenderPos.x + math.cos(self.RadAngle) * self.ForwardOffset
					self.RenderPos.y = self.RenderPos.y + math.sin(self.RadAngle) * self.ForwardOffset

					if local_player:GetGroundEntity() == NULL then
						self.RenderPos.z = self.RenderPos.z + 8
						if local_player:KeyDown(IN_DUCK) then
							self.RenderPos.z = self.RenderPos.z - 28
						end
					end
				end

				self.RenderColor = local_player:GetColor()

				local bEnabled = render.EnableClipping(true)
					render.PushCustomClipPlane(self.ClipVector, self.ClipVector:Dot(EyePos()))
						render.SetColorModulation(self.RenderColor.r / 255, self.RenderColor.g / 255, self.RenderColor.b / 255)
							render.SetBlend(self.RenderColor.a / 255)
									self.LegEnt:SetRenderOrigin(self.RenderPos)
									self.LegEnt:SetRenderAngles(self.RenderAngle)
									self.LegEnt:SetupBones()
									self.LegEnt:DrawModel()
									self.LegEnt:SetRenderOrigin()
									self.LegEnt:SetRenderAngles()
							render.SetBlend(1)
						render.SetColorModulation(1, 1, 1)
					render.PopCustomClipPlane()
				render.EnableClipping(bEnabled)
			end
		cam.End3D()
	end

	hook.Add("PostDrawTranslucentRenderables", "GML:Render::Foot", function()
		 if (LocalPlayer() && !LocalPlayer():InVehicle()) then
			Legs:DoFinalRender()
		end
	end)

	hook.Add("RenderScreenspaceEffects", "GML:Render::Vehicle", function()
		 if (LocalPlayer():InVehicle()) then
			Legs:DoFinalRender()
		end
	end)

	hook.Add("CalcView", "GML::CalcView::ViewCorrection::Vehicle", function( player, origin, angles, fov )
		if (!player:InVehicle()) then
			return
		end 

		if (!VLegsBool:GetBool()) then
			return
		end

		
		local view = {}
		view.origin		= origin
		view.angles		= angles
		view.fov		= fov
		view.znear		= znear
		view.zfar		= zfar
		view.drawviewer	= false

		local Vehicle	= player:GetVehicle()

		if ( IsValid( Vehicle ) && Vehicle:GetThirdPersonMode() ) then 
			return hook.Run( "CalcVehicleView", Vehicle, player, view ) 
		end

		local headBone = player:LookupBone("ValveBiped.Bip01_Head1")
		if (!headBone) then 
			return 
		end

		local pos, ang  = player:GetBonePosition(headBone)
		if (!pos) then 
			return 
		end

		local baseView = {
			origin = Vector(pos.x, pos.y, pos.z + 5),
			fov = 90,
			znear = 1
		}

		return baseView
	end)

	concommand.Add("cl_togglelegs", function()
		if LegsBool:GetBool() then
			RunConsoleCommand("cl_legs", "0")
		else
			RunConsoleCommand("cl_legs", "1")
		end
	end)

	concommand.Add("cl_togglevlegs", function()
		if VLegsBool:GetBool() then
			RunConsoleCommand("cl_vehlegs", "0")
		else
			RunConsoleCommand("cl_vehlegs", "1")
		end
	end)

	concommand.Add("cl_refreshlegs", function()
		Legs:SetUp()
	end)

	g_Legs = Legs

	function SetupLegs()
		g_Legs:SetUp()
	end

	hook.Add("ShouldDisableLegs", "GML::Support::Prone", function()
		if (!PLAYER.IsProne) then
			return
		end

		if (LocalPlayer():IsProne()) then
			return true
		end
	end)

	hook.Add("ShouldDisableLegs", "GML::Support::MorphMod", function()
		if (!pk_pills) then
			return
		end

		if (pk_pills.getMappedEnt(LocalPlayer())) then
			return true
		end
	end)
end

