TEAM_JEDIYOUR = mopp.util.addjob("Генерал Армии", {  
    Color = Color(46, 46, 46),  
    WorldModel = "models/helios/custom/jerkai_bathrobes.mdl", 
    Modeles = "models/helios/custom/jerkai_bathrobes.mdl",
    weapons = {"cross_arms_infront_swep","cross_arms_swep","weapon_lightsaber_kiadi"}, 
    jobID = "jediyours", 
	spawn_group = "Jediorden",
	group_id = "ct",
	Categories = "CT",
	PlayerSpawn = function(ply)
		ply:SetHealth(3000) 
		ply:SetMaxHealth(3000) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
end
 
})

TEAM_MARSHALGM = mopp.util.addjob("Маршал Гарнизона", {  
    Color = Color(46, 46, 46),  
    WorldModel = "models/halves/eclipse/gold.mdl", 
    weapons = {"at_sw_dc15s_all","rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep"}, 
    jobID = "marshalgarnizon", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "OficRSB",
	Categories = "MG",
	PlayerSpawn = function(ply)
	ply:SetHealth(400) 
	ply:SetMaxHealth(400) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end

})

TEAM_GARNIZONTRA = mopp.util.addjob("Адмирал Флота Гарнизона", {  
    Color = Color(46, 46, 46 ),  
    WorldModel = "models/nsn/arc/arc_colt.mdl", 
    weapons = {"at_sw_dc15s_all","rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep"}, 
    jobID = "garniztra", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "OficRSB",
	Categories = "MG",
	PlayerSpawn = function(ply)
		ply:SetHealth(400) 
		ply:SetMaxHealth(400) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 4)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
end
 
})

TEAM_GARNIZONTRAA = mopp.util.addjob("Адмирал Флота", {  
    Color = Color(46, 46, 46 ),  
    WorldModel = "models/naval_admiral/pm_naval_admiral.mdl", 
    weapons = {"at_sw_dc15s_all","rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep"}, 
    jobID = "garniztraa", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "OficRSB",
	Categories = "MG",
	PlayerSpawn = function(ply)
		ply:SetHealth(400) 
		ply:SetMaxHealth(400) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 4)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
end
 
})

TEAM_JEDIYOURPAD = mopp.util.addjob("Коммандер Армии", {  
    Color = Color(46, 46, 46),  
    WorldModel = "models/helios/custom/jerkai_t4lk.mdl", 
    weapons = {"cross_arms_infront_swep","cross_arms_swep","weapon_lightsaber_kiadi"}, 
    jobID = "jediyourspad", 
	spawn_group = "Jediorden",
	group_id = "ct",
	Categories = "CT",
	PlayerSpawn = function(ply)
		ply:SetHealth(2000) 
		ply:SetMaxHealth(2000) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 1)
        ply:SetBodygroup(2, 1)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
end
 
})


TEAM_RCOBUCHNIY = mopp.util.addjob("RC", {  
    Color = Color(255, 69, 0 ),  
    WorldModel = "models/player/budds/cgi_clone_commandos/unmarked/cgi_unmarked_rc.mdl", 
    weapons = {"rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep"}, 
    jobID = "rcobuchniy", 
	spawn_group = "FourOne",
	group_id = "bso",
	weapon_id = "BSO",
	Categories = "BSO",
	PlayerSpawn = function(ply)
		ply:SetHealth(400) 
		ply:SetMaxHealth(400) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
end
 
})

TEAM_THORNGUARD = mopp.util.addjob("Коммандер РСБ", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/wf/repint/mjudge/asjudge.mdl", 
    weapons = {"rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","investigation_flashlight","cross_arms_swep"}, 
    jobID = "guardthorn", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "OficRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
	ply:SetHealth(400) 
	ply:SetMaxHealth(400) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 1)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 3)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 2)
        ply:SetBodygroup(9, 1)
end

})

TEAM_ARKGUARD = mopp.util.addjob("РСБ ARC", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/rsb_arc/pm_rsb_arc.mdl", 
    weapons = {"rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","investigation_flashlight","cross_arms_infront_swep","cross_arms_swep","jet_mk5"}, 
    jobID = "arkguard", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "ARCARSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
		ply:SetHealth(300) 
		ply:SetMaxHealth(300) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end
 
})

TEAM_CPTGUARD = mopp.util.addjob("РСБ Ст.Офицер", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/wf/repint/rep2/rep2.mdl", 
    weapons = {"rw_sw_dual_dc17","cross_arms_swep","cross_arms_infront_swep","investigation_flashlight"}, 
    jobID = "guardcpttofficer", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "OficRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
	ply:SetHealth(250) 
	ply:SetMaxHealth(250) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 1)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end
})


TEAM_OFFLTGUARD = mopp.util.addjob("РСБ Офицер", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/wf/repint/rep1/rep1.mdl", 
    weapons = {"cross_arms_swep","investigation_flashlight"}, 
    jobID = "guardltofficer", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "OficRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
	ply:SetHealth(200) 
	ply:SetMaxHealth(200) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 1)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 1)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end

})

TEAM_SERGGUARD = mopp.util.addjob("РСБ Сержант", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/pepe_pm/rsb_trp.mdl", 
    weapons = {"investigation_flashlight"}, 
    jobID = "guardsergant", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "RyadRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
end

})

TEAM_CPLEGUARD = mopp.util.addjob("РСБ Капрал", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/pepe_pm/rsb_trp.mdl", 
    weapons = {"investigation_flashlight"}, 
    jobID = "guardecpltrooper", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "RyadRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(150)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
end

})

TEAM_RYADGUARD = mopp.util.addjob("РСБ Рядовой", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/pepe_pm/rsb_trp.mdl", 
    weapons = {"investigation_flashlight"}, 
    jobID = "guardtrooper", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "RyadRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(100)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
end

})

TEAM_JETCTRSB = mopp.util.addjob("РСБ Десантник", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/pepe_pm/rsb_trp.mdl", 
    weapons = {"jet_mk5","rw_sw_dual_dc17"}, 
    jobID = "ctrsbjet", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "PRMEDENG",
	Categories = "RSB",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 4)
end

})

TEAM_SPCGUARD = mopp.util.addjob("РСБ Ударники", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/cg_xo/pm_cg_xo.mdl", 
    weapons = {}, 
    jobID = "guardspc", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "ShturmRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
end

})

TEAM_ARTARSB = mopp.util.addjob("РСБ Артиллерист", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/rsb_gunner/pm_rsb_gunner.mdl", 
    weapons = {"rw_sw_dual_dc17","investigation_flashlight"}, 
    jobID = "artarsb", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "Arta",
	Categories = "Arta",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
end

})

TEAM_MEDGUARD = mopp.util.addjob("РСБ Медик", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/cg_medic/pm_cg_medic.mdl", 
    weapons = {"investigation_flashlight"}, 
    jobID = "guardmed", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "PRMEDENGRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_ARFGUARDSC = mopp.util.addjob("РСБ Скаут", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/pepe_pm/rsb_trp.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_bino_dark","investigation_flashlight"}, 
    jobID = "guardarfsc", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "ArfRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
	ply:SetHealth(200) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 1)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_ARFGUARD = mopp.util.addjob("РСБ Охотник", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/pepe_pm/rsb_trp.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_bino_dark","investigation_flashlight"}, 
    jobID = "guardarf", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "SnpRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 1)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_ENGCG = mopp.util.addjob("РСБ Инженер", {  
    Color = Color(139, 0, 0 ),  
    WorldModel = "models/wf/repint/mjudge/mjudge.mdl", 
    weapons = {"rw_sw_dual_dc17","investigation_flashlight"}, 
    jobID = "engcg", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "PRMEDENGRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
		ply:SetHealth(200) 
		ply:SetMaxHealth(200) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end
 
})

TEAM_PILGUARD = mopp.util.addjob("РСБ Пилот", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/cg_pilot/pm_cg_pilot.mdl", 
    weapons = {"alydus_fusioncutter","investigation_flashlight"}, 
    jobID = "guardpil", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "PRMEDENGRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
		ply:SetHealth(100) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
end
 
})

TEAM_RSBSNOWTROOPER = mopp.util.addjob("РСБ Снежный Боец", {  
    Color = Color(139, 0, 0),  
    WorldModel = "models/ct_evo/pm_ct_evo.mdl", 
    weapons = {"investigation_flashlight"}, 
    jobID = "guardsnowtr", 
	spawn_group = "GuardCor",
	group_id = "Guard",
	weapon_id = "RyadRSB",
	Categories = "RSB",
	PlayerSpawn = function(ply)
		ply:SetHealth(150) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
end
 
})

TEAM_COMTHREE = mopp.util.addjob("327th Коммандер", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_bly/pm_327th_bly.mdl", 
    weapons = {"rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep"}, 
    jobID = "threecomande", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "Oficwea",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
end

})


TEAM_ARKTHREE = mopp.util.addjob("327th ARC", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_arc/pm_327th_arc.mdl", 
    weapons = {"rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep","rw_sw_dual_dc17","jet_mk5"}, 
    jobID = "arkthree", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "ARCA",
	Categories = "327",
	PlayerSpawn = function(ply)
		ply:SetHealth(300) 
		ply:SetMaxHealth(300) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end

})

TEAM_CPTTHREE = mopp.util.addjob("327th Ст.Офицер", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_ktrooper/pm_327th_ktrooper.mdl", 
    weapons = {"rw_sw_dual_dc17","cross_arms_swep","cross_arms_infront_swep"}, 
    jobID = "threecptofficer", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "Oficwea",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(250) 
	ply:SetMaxHealth(250) 
	ply:SetArmor(200)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_LTTHREE = mopp.util.addjob("327th Офицер", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_officer/pm_327th_officer.mdl", 
    weapons = {"cross_arms_swep"}, 
    jobID = "threeltofficer", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "Oficwea",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(200) 
	ply:SetMaxHealth(200) 
	ply:SetArmor(200)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 1)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})


TEAM_SERGTHREE = mopp.util.addjob("327th Сержант", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_nco/pm_327th_nco.mdl", 
    weapons = {}, 
    jobID = "threesergaunt", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "Ryad",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_CPLFTHREE = mopp.util.addjob("327th Капрал", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_trp/pm_327th_trp.mdl", 
    weapons = {}, 
    jobID = "threetroopercpl", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "Ryad",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(150)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 1)
        ply:SetBodygroup(6, 1)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_RYATHREE = mopp.util.addjob("327th Рядовой", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_trp/pm_327th_trp.mdl", 
    weapons = {}, 
    jobID = "threetrooper", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "Ryad",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(100)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 1)
        ply:SetBodygroup(6, 1)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_RYADTHREEBX = mopp.util.addjob("327th Рядовой (BX)", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/player/jr/disguised_commando/327th/327th_commando.mdl", 
    weapons = {"rw_sw_e5", "rw_sw_nade_thermal","rw_sw_bino_dark","rw_sw_bx_blade"}, 
    jobID = "threetrooperbx", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "Ryad",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_JETTHREE = mopp.util.addjob("327th Десантник", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_trp/pm_327th_trp.mdl", 
    weapons = {"jet_mk5","rw_sw_dual_dc17"}, 
    jobID = "threejet", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "PRMEDENG",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 3)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_MEDTHREE = mopp.util.addjob("327th Медик", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_medic/pm_327th_medic.mdl", 
    weapons = {}, 
    jobID = "threemed", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "PRMEDENG",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
end

})

TEAM_ARFGTHREESC = mopp.util.addjob("327th Скаут", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_arf/pm_327th_arf.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_bino_white"}, 
    jobID = "threearfsc", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "ArfRSB",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(200) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
end

})

TEAM_ARFGTHREE = mopp.util.addjob("327th Снайпер", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_arf/pm_327th_arf.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_bino_white"}, 
    jobID = "threearf", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "Snp",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 1)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
end

})

TEAM_PILTHREE = mopp.util.addjob("327th Пилот", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/ayer/vrp/redpilot.mdl", 
    weapons = {"alydus_fusioncutter"}, 
    jobID = "threepil", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "PRMEDENG",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
end

})

TEAM_ARTATHREE = mopp.util.addjob("327th Артиллерист", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_gunner/pm_327th_gunner.mdl", 
    weapons = {"rw_sw_dual_dc17"}, 
    jobID = "artathree", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "Arta",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end
 
})

TEAM_SHTURMTHREE = mopp.util.addjob("327th Штурмовик", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_officer/pm_327th_officer.mdl", 
    weapons = {}, 
    jobID = "threeshturm", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "Shturm",
	Categories = "327",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 1)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end
 
})

TEAM_ENGTHREE = mopp.util.addjob("327th Инженер", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_deviss/pm_327th_deviss.mdl", 
    weapons = {"rw_sw_dual_dc17"}, 
    jobID = "engthree", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "PRMEDENG",
	Categories = "327",
	PlayerSpawn = function(ply)
		ply:SetHealth(200) 
		ply:SetMaxHealth(200) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
end
 
})

TEAM_THREESNOWSHTORM = mopp.util.addjob("327th Снежный Боец", {  
    Color = Color(255, 215, 0),  
    WorldModel = "models/327th_evo/pm_327th_evo.mdl", 
    weapons = {}, 
    jobID = "threesnowstr", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "Ryad",
	Categories = "327",
	PlayerSpawn = function(ply)
		ply:SetHealth(150) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
end
 
})


TEAM_COMFOUR = mopp.util.addjob("41st Коммандер", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/41st_co/pm_41st_co.mdl", 
    weapons = {"rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep"}, 
    jobID = "fourcomande", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "Oficwea",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(5, 1)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})


TEAM_ARKFOUR = mopp.util.addjob("41st ARC", {  
    Color = Color(0, 100, 0),   
    WorldModel = "models/pepe_pm/41st_arc.mdl", 
    weapons = {"rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep","rw_sw_dual_dc17","jet_mk5"}, 
    jobID = "arkfour", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "ARCA",
	Categories = "41",
	PlayerSpawn = function(ply)
		ply:SetHealth(300) 
		ply:SetMaxHealth(300) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end

})

TEAM_CPTFOUR = mopp.util.addjob("41st Ст.Офицер", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/41st_xo/pm_41st_xo.mdl", 
    weapons = {"rw_sw_dual_dc17","cross_arms_swep","cross_arms_infront_swep"}, 
    jobID = "fourcptofficer", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "Oficwea",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(250) 
	ply:SetMaxHealth(250) 
	ply:SetArmor(200)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_LTFOUR = mopp.util.addjob("41st Офицер", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/pepe_pm/41st_ofc.mdl", 
    weapons = {"cross_arms_swep"}, 
    jobID = "fourltofficer", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "Oficwea",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(200) 
	ply:SetMaxHealth(200) 
	ply:SetArmor(200)
        ply:SetBodygroup(5, 1)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})


TEAM_SERGFOUR = mopp.util.addjob("41st Сержант", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/pepe_pm/41st_nco.mdl", 
    weapons = {}, 
    jobID = "foursergaunt", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "Ryad",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_CPLFFOUR = mopp.util.addjob("41st Капрал", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/pepe_pm/41st_trp.mdl", 
    weapons = {}, 
    jobID = "fourtroopercpl", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "Ryad",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(150)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_RYAFOUR = mopp.util.addjob("41st Рядовой", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/pepe_pm/41st_trp.mdl", 
    weapons = {}, 
    jobID = "fourtrooper", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "Ryad",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(100)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_RYADFOURBX = mopp.util.addjob("41st Рядовой (BX)", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/player/jr/disguised_commando/41st/41st_commando.mdl", 
    weapons = {"rw_sw_e5", "rw_sw_nade_thermal","rw_sw_bino_dark","rw_sw_bx_blade"}, 
    jobID = "fourtrooperbx", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "Ryad",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_JETFOUR = mopp.util.addjob("41st Десантник", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/pepe_pm/41st_trp.mdl", 
    weapons = {"jet_mk5","rw_sw_dual_dc17"}, 
    jobID = "fourjet", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "PRMEDENG",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 5)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_MEDFOUR = mopp.util.addjob("41st Медик", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/41st_medic/pm_41st_medic.mdl", 
    weapons = {}, 
    jobID = "fourmed", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "PRMEDENG",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_ARFGFOURSC = mopp.util.addjob("41st Скаут", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/pepe_pm/41st_trp.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_bino_white"}, 
    jobID = "fourarfsc", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "ArfRSB",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(200) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 1)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})


TEAM_ARFGFOUR = mopp.util.addjob("41st Снайпер", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/pepe_pm/41st_trp.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_bino_white"}, 
    jobID = "fourarf", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "Snp",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 1)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_PILFOUR = mopp.util.addjob("41st Пилот", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/pepe_pm/41st_pilot.mdl", 
    weapons = {"alydus_fusioncutter"}, 
    jobID = "fourpil", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "PRMEDENG",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_ARTAFOUR = mopp.util.addjob("41st Артиллерист", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/41st_gunner/pm_41st_gunner.mdl", 
    weapons = {"rw_sw_dual_dc17"}, 
    jobID = "artafour", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "Arta",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end
 
})

TEAM_SHTURMFOUR = mopp.util.addjob("41st Штурмовик", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/pepe_pm/41st_nco.mdl", 
    weapons = {}, 
    jobID = "fourshturm", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "Shturm",
	Categories = "41",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 1)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end
 
})

TEAM_ENGFOUR = mopp.util.addjob("41st Инженер", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/41st_draa/pm_41st_draa.mdl", 
    weapons = {"rw_sw_dual_dc17"}, 
    jobID = "engfour", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "PRMEDENG",
	Categories = "41",
	PlayerSpawn = function(ply)
		ply:SetHealth(200) 
		ply:SetMaxHealth(200) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
end
 
})

TEAM_FOURSNOWSHTORM = mopp.util.addjob("41st Снежный Боец", {  
    Color = Color(0, 100, 0),  
    WorldModel = "models/ct_evo/pm_ct_evo.mdl", 
    weapons = {}, 
    jobID = "foursnowstr", 
	spawn_group = "FourOne",
	group_id = "Four",
	weapon_id = "Ryad",
	Categories = "41",
	PlayerSpawn = function(ply)
		ply:SetHealth(150) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
end
 
})

TEAM_COMFOURTWOONE = mopp.util.addjob("21st Коммандер", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/player/jr/21st/keller/keller.mdl", 
    weapons = {"rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep"}, 
    jobID = "fourcomandetwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "Oficwea",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 1)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})


TEAM_ARKFOURTWOONE = mopp.util.addjob("21st ARC", {  
    Color = Color(75, 0, 130),   
    WorldModel = "models/player/jr/21st/arc/arc.mdl", 
    weapons = {"rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep","rw_sw_dual_dc17","jet_mk5"}, 
    jobID = "arkfourtwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "ARCA",
	Categories = "21",
	PlayerSpawn = function(ply)
		ply:SetHealth(300) 
		ply:SetMaxHealth(300) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end

})

TEAM_CPTFOURTWOONE = mopp.util.addjob("21st Ст.Офицер", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/player/jr/21st/officer/officer.mdl", 
    weapons = {"rw_sw_dual_dc17","cross_arms_swep","cross_arms_infront_swep"}, 
    jobID = "fourcptofficertwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "Oficwea",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(250) 
	ply:SetMaxHealth(250) 
	ply:SetArmor(200)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 1)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_LTFOURTWOONE = mopp.util.addjob("21st Офицер", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/player/jr/21st/officer/officer.mdl", 
    weapons = {"cross_arms_swep"}, 
    jobID = "fourltofficertwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "Oficwea",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(200) 
	ply:SetMaxHealth(200) 
	ply:SetArmor(200)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})


TEAM_SERGFOURTWOONE = mopp.util.addjob("21st Сержант", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/player/jr/21st/nco/nco.mdl", 
    weapons = {}, 
    jobID = "foursergaunttwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "Ryad",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_CPLFFOURTWOONE = mopp.util.addjob("21st Капрал", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/player/jr/21st/trooper/trooper.mdl", 
    weapons = {}, 
    jobID = "fourtroopercpltwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "Ryad",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(150)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_RYAFOURTWOONE = mopp.util.addjob("21st Рядовой", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/player/jr/21st/trooper/trooper.mdl", 
    weapons = {}, 
    jobID = "fourtroopertwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "Ryad",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(100)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_JETFOURTWOONE = mopp.util.addjob("21st Десантник", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/pepe_pm/21st_trooper.mdl", 
    weapons = {"jet_mk5","rw_sw_dual_dc17"}, 
    jobID = "fourjettwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "PRMEDENG",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 5)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_MEDFOURTWOONE = mopp.util.addjob("21st Медик", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/player/jr/21st/medic/medic.mdl", 
    weapons = {}, 
    jobID = "fourmedtwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "PRMEDENG",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_ARFGFOURSCTWOONE = mopp.util.addjob("21st Скаут", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/pepe_pm/21st_trooper.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_bino_white"}, 
    jobID = "fourarfsctwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "ArfRSB",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(200) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 1)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})


TEAM_ARFGFOURTWOONE = mopp.util.addjob("21st Снайпер", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/pepe_pm/21st_trooper.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_bino_white"}, 
    jobID = "fourarftwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "Snp",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 1)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_PILFOURTWOONE = mopp.util.addjob("21st Пилот", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/nsn/pilots/pilot_axe.mdl", 
    weapons = {"alydus_fusioncutter"}, 
    jobID = "fourpiltwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "PRMEDENG",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_ARTATWOONE = mopp.util.addjob("21st Артиллерист", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/pepe_pm/21st_trooper.mdl", 
    weapons = {"rw_sw_dual_dc17"}, 
    jobID = "artatwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "Arta",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 1)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 1)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end
 
})


TEAM_SHTURMFOURTWOONE = mopp.util.addjob("21st Штурмовик", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/jajoff/sps/cgi21s/tc13j/marine.mdl", 
    weapons = {}, 
    jobID = "fourshturmtwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "Shturm",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end
 
})

TEAM_AVANGUARDMFOURTWOONE = mopp.util.addjob("21st Авангард", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/jajoff/sps/cgi21s/tc13j/marine.mdl", 
    weapons = {}, 
    jobID = "avanguardtwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "ShadowSPEC",
	Categories = "21",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end
 
})

TEAM_ENGFOURTWOONE = mopp.util.addjob("21st Инженер", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/player/jr/21st/ku_evo/ku_evo.mdl", 
    weapons = {"rw_sw_dual_dc17"}, 
    jobID = "engfourtwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "PRMEDENG",
	Categories = "21",
	PlayerSpawn = function(ply)
		ply:SetHealth(200) 
		ply:SetMaxHealth(200) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
end
 
})

TEAM_FOURSNOWSHTORMTWOONE = mopp.util.addjob("21st Снежный Боец", {  
    Color = Color(75, 0, 130),  
    WorldModel = "models/player/jr/21st/21st_evo/21st_evo.mdl", 
    weapons = {}, 
    jobID = "foursnowstrtwoone", 
	spawn_group = "OneZero",
	group_id = "TwoOne",
	weapon_id = "Ryad",
	Categories = "21",
	PlayerSpawn = function(ply)
		ply:SetHealth(150) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
end
 
})

TEAM_ARKCTCO = mopp.util.addjob("CT ARC Коммандер", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/nsn/arc/arc_commander.mdl", 
    weapons = {"rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep","rw_sw_dual_dc17","jet_mk5"}, 
    jobID = "arkctco", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "ARCA",
	Categories = "CT",
	PlayerSpawn = function(ply)
		ply:SetHealth(300) 
		ply:SetMaxHealth(300) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end

})

TEAM_COMCT = mopp.util.addjob("CT Коммандер", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_co/pm_ct_co.mdl", 
    weapons = {"rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep"}, 
    jobID = "ctcomande", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "Oficwea",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
end

})


TEAM_ARKCTCPT = mopp.util.addjob("CT ARC Ст.Офицер", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/nsn/arc/arc_captain.mdl", 
    Modeles = "models/nsn/arc/arc_captain.mdl",
    weapons = {"rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep","rw_sw_dual_dc17","jet_mk5"}, 
    jobID = "arkctcpt", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "ARCA",
	Categories = "CT",
	PlayerSpawn = function(ply)
		ply:SetHealth(300) 
		ply:SetMaxHealth(300) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end

})

TEAM_CPTCT = mopp.util.addjob("CT Ст.Офицер", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_cpt/pm_ct_cpt.mdl", 
    weapons = {"rw_sw_dual_dc17","cross_arms_swep","cross_arms_infront_swep"}, 
    jobID = "ctcptofficer", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "Oficwea",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(250) 
	ply:SetMaxHealth(250) 
	ply:SetArmor(200)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
end

})

TEAM_ARKCT = mopp.util.addjob("CT ARC Офицер", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/nsn/arc/arc_lieutenant.mdl", 
    weapons = {"rw_sw_dual_dc17","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep","rw_sw_dual_dc17","jet_mk5"}, 
    jobID = "arkct", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "ARCA",
	Categories = "CT",
	PlayerSpawn = function(ply)
		ply:SetHealth(300) 
		ply:SetMaxHealth(300) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end

})

TEAM_LTCT = mopp.util.addjob("CT Офицер", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_lt/pm_ct_lt.mdl", 
    weapons = {"cross_arms_swep"}, 
    jobID = "ctltofficer", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "Oficwea",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(200) 
	ply:SetMaxHealth(200) 
	ply:SetArmor(200)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 3)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
end

})


TEAM_SERGCT = mopp.util.addjob("CT Сержант", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_sgt/pm_ct_sgt.mdl", 
    weapons = {}, 
    jobID = "ctsergaunt", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "Ryad",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 3)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
end

})

TEAM_CPLFCT = mopp.util.addjob("CT Капрал", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_trp/pm_ct_trp.mdl", 
    weapons = {}, 
    jobID = "cttroopercpl", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "Ryad",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(150)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 1)
end

})

TEAM_RYADCT = mopp.util.addjob("CT Рядовой", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_trp/pm_ct_trp.mdl", 
    weapons = {}, 
    jobID = "cttrooper", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "Ryad",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(100)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_RYADCTBX = mopp.util.addjob("CT Рядовой (BX)", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/player/jr/disguised_commando/ct/ct_commando.mdl", 
    weapons = {"rw_sw_e5", "rw_sw_nade_thermal","rw_sw_bino_dark","rw_sw_bx_blade"}, 
    jobID = "cttrooperbx", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "Ryad",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_JETCT = mopp.util.addjob("CT Десантник", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_cmd/pm_ct_cmd.mdl", 
    weapons = {"jet_mk5","rw_sw_dual_dc17"}, 
    jobID = "ctjet", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "PRMEDENG",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 3)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 1)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 3)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
end

})

TEAM_MEDCT = mopp.util.addjob("CT Медик", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_medic/pm_ct_medic.mdl", 
    weapons = {}, 
    jobID = "ctmed", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "PRMEDENG",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
end

})

TEAM_ARFGCTSC = mopp.util.addjob("CT Скаут", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_arf/pm_ct_arf.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_bino_white"}, 
    jobID = "ctarfsc", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "ArfRSB",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(200) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
end

})


TEAM_ARFGCT = mopp.util.addjob("CT Снайпер", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_arf/pm_ct_arf.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_bino_white"}, 
    jobID = "ctarf", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "Snp",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
end

})

TEAM_PILCT = mopp.util.addjob("CT Пилот", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_pilot/pm_ct_pilot.mdl", 
    weapons = {"alydus_fusioncutter"}, 
    jobID = "ctpil", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "PRMEDENG",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(100) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
end

})

TEAM_ARTACT = mopp.util.addjob("CT Артиллерист", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_gunner/pm_ct_gunner.mdl", 
    weapons = {}, 
    jobID = "artact", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "Arta",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end
 
})

TEAM_SHTURMCT = mopp.util.addjob("CT Штурмовик", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_heavy/pm_ct_heavy.mdl", 
    weapons = {}, 
    jobID = "ctshturm", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "Shturm",
	Categories = "CT",
	PlayerSpawn = function(ply)
	ply:SetHealth(300) 
	ply:SetMaxHealth(300) 
	ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 2)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
end
 
})

TEAM_ENGCT = mopp.util.addjob("CT Инженер", {  
    Color = Color(255, 255, 255 ),  
    WorldModel = "models/ct_eod/pm_ct_eod.mdl", 
    weapons = {"rw_sw_dual_dc17"}, 
    jobID = "engct", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "PRMEDENG",
	Categories = "CT",
	PlayerSpawn = function(ply)
		ply:SetHealth(200) 
		ply:SetMaxHealth(200) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
        ply:SetBodygroup(5, 0)
end
 
})

TEAM_CTSHCASNOWTROOPER = mopp.util.addjob("CT Снежный Боец", {  
    Color = Color(255, 255, 255),  
    WorldModel = "models/ct_evo/pm_ct_evo.mdl", 
    weapons = {}, 
    jobID = "ctshkasnowtr", 
	spawn_group = "Clones",
	group_id = "Ct",
	weapon_id = "Ryad",
	Categories = "CT",
	PlayerSpawn = function(ply)
		ply:SetHealth(150) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
end
 
})

TEAM_NAEMNIC = mopp.util.addjob("Наемник", {  
    Color = Color(0, 191, 255),  
    WorldModel = "models/mando/clan/nerr.mdl", 
    weapons = {"rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep","rw_sw_westar11","rw_sw_dual_westar35","jet_mk5"}, 
    jobID = "naemnic", 
	spawn_group = "FiveZero",
	group_id = "FiveZ",
	weapon_id = "ARCA",
	Categories = "327",
	PlayerSpawn = function(ply)
		ply:SetHealth(300) 
		ply:SetMaxHealth(300) 
		ply:SetArmor(200)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 0)
end

})


TEAM_OBSLPER = mopp.util.addjob("Обслуживающий персонал", {  
    Color = Color(20, 150, 20 ),  
    WorldModel = "models/naval_eng/pm_naval_eng.mdl", 
    weapons = {"cross_arms_infront_swep","cross_arms_swep","alydus_fusioncutter","weapon_firehose_infinite"}, 
    jobID = "obsluper", 
	spawn_group = "Clones",
	group_id = "Clones",
	Categories = "CAD",
	PlayerSpawn = function(ply)
		ply:SetHealth(250) 
		ply:SetMaxHealth(250) 
		ply:SetArmor(200)
end
 
})

TEAM_MASSIF = mopp.util.addjob("Массив", {  
    Color = Color(20, 150, 20 ),  
    WorldModel = "models/mrpounder1/player/massif.mdl", 
    weapons = {"weapon_fists"}, 
    jobID = "massif", 
	spawn_group = "Clones",
	group_id = "Clones",
	Categories = "CAD",
	PlayerSpawn = function(ply)
		ply:SetHealth(250) 
		ply:SetMaxHealth(250) 
		ply:SetArmor(200)
end
 
})

TEAM_SUKALANI = mopp.util.addjob("Ивент Супер-Тактический Дроид", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/super_tactical_stuxnet/pm_droid_tactical_stuxnet.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_se14","weapon_swrc_det","rw_sw_e5","weapon_defibrillator","weapon_bactainjector","weapon_bactanade","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep"}, 
    jobID = "sukalani", 
	spawn_group = "Eventdroid",
	group_id = "Eventdroid",
	Categories = "CIS",
	PlayerSpawn = function(ply)
		ply:SetHealth(400) 
		ply:SetMaxHealth(400) 
		ply:SetArmor(200)
end
 
})

TEAM_TACTICDOID = mopp.util.addjob("Ивент Тактический Дроид", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/tactical_blue/pm_droid_tactical_blue.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_se14","weapon_swrc_det","rw_sw_e5","weapon_defibrillator","weapon_bactainjector","weapon_bactanade","rw_sw_nade_thermal","rw_sw_nade_smoke","cross_arms_infront_swep","cross_arms_swep"}, 
    jobID = "tacticdroid", 
	spawn_group = "Eventdroid",
	group_id = "Eventdroid",
	Categories = "CIS",
	PlayerSpawn = function(ply)
		ply:SetHealth(400) 
		ply:SetMaxHealth(400) 
		ply:SetArmor(200)
end
 
})

TEAM_EVENTJEDIPAD = mopp.util.addjob("Падший Джедай", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/player/dathomir/pm_nightbrother_brawler.mdl", 
    weapons = {"cross_arms_infront_swep","cross_arms_swep","weapon_lightsaber_kiadi"}, 
    jobID = "eventscijeidpad", 
	spawn_group = "Jediorden",
	group_id = "Eventdroid",
	Categories = "CIS",
	PlayerSpawn = function(ply)
		ply:SetHealth(2000) 
		ply:SetMaxHealth(2000) 
		ply:SetArmor(200)
end
 
})

TEAM_EVENTSCIENT = mopp.util.addjob("Ивент Ученый КНС", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/4/pm_scientist_corona.mdl", 
    weapons = {"cross_arms_infront_swep","cross_arms_swep"}, 
    jobID = "eventsci", 
	spawn_group = "Eventdroid",
	group_id = "Eventdroid",
	Categories = "CIS",
	PlayerSpawn = function(ply)
		ply:SetHealth(400) 
		ply:SetMaxHealth(400) 
		ply:SetArmor(200)
end
 
})

TEAM_EVENTPLACELK = mopp.util.addjob("Ивент Наемник", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/hazo/dw/deathwatch_the_mandalorian.mdl", 
    weapons = {"cross_arms_infront_swep","cross_arms_swep"}, 
    jobID = "eventplacelk", 
	spawn_group = "Eventdroid",
	group_id = "Eventdroid",
	Categories = "ENM",
	PlayerSpawn = function(ply)
		ply:SetHealth(400) 
		ply:SetMaxHealth(400) 
		ply:SetArmor(200)
end

})

TEAM_BONE = mopp.util.addjob("Ивент Дроид B1", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/b1/pm_droid_cis_b1.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_se14","rw_sw_e5"}, 
    jobID = "bone", 
	spawn_group = "Eventdroid",
	group_id = "Eventdroid",
	Categories = "CIS",
	PlayerSpawn = function(ply)
		ply:SetHealth(100) 
		ply:SetArmor(100)
end
 
})

TEAM_BXECO = mopp.util.addjob("Ивент Дроид BX Командир", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/bx_captain/pm_droid_cis_bx_captain.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_se14","rw_sw_e5","rw_sw_bx_blade","rw_sw_e5s", "realistic_hook"}, 
    jobID = "bonexxco", 
	spawn_group = "Eventdroid",
	group_id = "Eventdroid",
	Categories = "CIS",
	PlayerSpawn = function(ply)
		ply:SetHealth(400) 
		ply:SetArmor(100)
end
 
})


TEAM_BXE = mopp.util.addjob("Ивент Дроид BX", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/bx/pm_droid_cis_bx.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_se14","rw_sw_e5","rw_sw_bx_blade","rw_sw_e5s", "realistic_hook"}, 
    jobID = "bonexx", 
	spawn_group = "Eventdroid",
	group_id = "Eventdroid",
	Categories = "CIS",
	PlayerSpawn = function(ply)
		ply:SetHealth(400) 
		ply:SetArmor(100)
end
 
})

TEAM_BONEGEO = mopp.util.addjob("Ивент Дроид B1 Геонозис", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/b1_geo/pm_droid_cis_b1_geo.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_se14","rw_sw_e5"}, 
    jobID = "bonegeo", 
	spawn_group = "Eventdroid",
	group_id = "Eventdroid",
	Categories = "CIS",
	PlayerSpawn = function(ply)
		ply:SetHealth(100) 
		ply:SetArmor(100)
end
 
})

TEAM_BONECOM = mopp.util.addjob("Ивент Коммандер B1", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/b1_co/pm_droid_cis_b1_co.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_se14","rw_sw_e5"}, 
    jobID = "bonecom", 
	spawn_group = "Eventdroid",
	group_id = "Eventdroid",
	Categories = "CIS",
	PlayerSpawn = function(ply)
		ply:SetHealth(150) 
		ply:SetMaxHealth(150) 
		ply:SetArmor(100)
end
 
})

TEAM_BONECOMGEO = mopp.util.addjob("Ивент Коммандер B1 Геонозис", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/b1_geo_co/pm_droid_cis_b1_geo_co.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_se14","rw_sw_e5"}, 
    jobID = "bonecomgeo", 
	spawn_group = "Eventdroid",
	group_id = "Eventdroid",
	Categories = "CIS",
	PlayerSpawn = function(ply)
		ply:SetHealth(150) 
		ply:SetMaxHealth(150) 
		ply:SetArmor(100)
end
 
})

TEAM_BTWO = mopp.util.addjob("Ивент Дроид B2", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/tfa/comm/gg/pm_sw_droid_b2.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_b2rp_blaster"}, 
    jobID = "btwo", 
	spawn_group = "Eventdroid",
	group_id = "Eventdroid",
	Categories = "CIS",
	PlayerSpawn = function(ply)
		ply:SetHealth(100) 
		ply:SetArmor(300)
end
 
})

TEAM_BTWOCOM = mopp.util.addjob("Ивент Десантник B2", {  
    Color = Color(200, 0, 0 ),  
    WorldModel = "models/tfa/comm/gg/pm_sw_droid_b2_gunvariant.mdl", 
    weapons = {"alydus_fusioncutter","rw_sw_b2rp_blaster","jet_mk5"}, 
    jobID = "btwocom", 
	spawn_group = "Eventdroid",
	group_id = "Eventdroid",
	Categories = "CIS",
	PlayerSpawn = function(ply)
		ply:SetHealth(100) 
		ply:SetArmor(200)
end
 
})


TEAM_RECRUT = mopp.util.addjob("Рекрут", {  
    Color = Color(20, 150, 20 ),  
    WorldModel = "models/cadet_red/pm_training_cadet_bravo.mdl", 
    weapons = {}, 
    jobID = "recrut", 
	spawn_group = "Clones",
	group_id = "Cadet",
	weapon_id = "Recruit",
	Categories = "CAD",
	PlayerSpawn = function(ply)
	 ply:SetHealth(100)
	 ply:SetArmor(50)
        ply:SetBodygroup(1, 0)
        ply:SetBodygroup(2, 0)
        ply:SetBodygroup(3, 0)
        ply:SetBodygroup(4, 3)
        ply:SetBodygroup(5, 0)
        ply:SetBodygroup(6, 0)
        ply:SetBodygroup(7, 0)
        ply:SetBodygroup(8, 0)
        ply:SetBodygroup(9, 0)
        ply:SetBodygroup(10, 0)
        ply:SetBodygroup(11, 0)
        ply:SetBodygroup(12, 0)
end

})

TEAM_CADET = mopp.util.addjob('Кадет', {
	Color = Color(20, 150, 20 ),
	WorldModel = 'models/player/clone cadet/clonecadet.mdl',
	jobID = 'cadet',
	spawn_group = "Clones",
	group_id = "Cadet",
	weapon_id = "None",
	Categories = "CAD",
	PlayerSpawn = function(ply)
     ply:SetHealth(100) 
	 ply:SetArmor(50) 
end

})

TEAM_ADMIN = mopp.util.addjob("Администратор", {
    Color = Color(46, 139, 87),
    WorldModel = "models/tfa/pistolshell.mdl",
    weapons = {"gmod_tool","weapon_physgun"},
    jobID = "admin",
    spawn_group = "Adminese",
	group_id = "Admin",
	Categories = "None",
    PlayerSpawn = function(ply) 
     ply:SetHealth(1000) 
     ply:SetMaxHealth(1000)  
     ply:SetArmor(100)
end

})

