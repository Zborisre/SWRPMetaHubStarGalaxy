serverguard.permission:Add("WhitelistControl")
serverguard.permission:Add("WhitelistControlPlus")

function pMeta:isNearWhitelist()

	return serverguard.player:HasPermission(self, "WhitelistControl")

end

function pMeta:isMeetRequirements()

	if serverguard.player:HasPermission(self, "WhitelistControl") then return mopp.jobs end
	
	local group = mopp.jobs[self:Team()].group_id
	
	if !group then return {} end
	
	local tbl = {}
	
	for k, v in ipairs(mopp.jobs) do
	
		if !(k ~= self:Team() and (group == v.group_id or v.jobID == "cadet" or v.jobID == "ctrp")) then continue end
		
		tbl[k] = v
		
	
	end
	
	return tbl

end

function pMeta:GetMaxArmor()

	return self.GetNVar and self:GetNVar("MaxArmor", 100) or 100

end

local num = 1
Ranks = {}
Ranks[num] = 'CAD';
num = num + 1;
Ranks[num] = 'RCT';
num = num + 1;
Ranks[num] = 'PVT';
num = num + 1;
Ranks[num] = 'PFC';
num = num + 1;
Ranks[num] = 'EFT';
num = num + 1;
Ranks[num] = 'CPL';
num = num + 1;
Ranks[num] = 'SCP';
num = num + 1;
Ranks[num] = 'JSG';
num = num + 1;
Ranks[num] = 'SGT';
num = num + 1;
Ranks[num] = 'SSG';
num = num + 1;
Ranks[num] = 'ESN';
num = num + 1;
Ranks[num] = 'JLT';
num = num + 1;
Ranks[num] = 'LT';
num = num + 1;
Ranks[num] = 'SLT';
num = num + 1;
Ranks[num] = 'SESN';
num = num + 1;
Ranks[num] = 'CPT';
num = num + 1;
Ranks[num] = 'MAJ';
num = num + 1;
Ranks[num] = 'LCOL';
num = num + 1;
Ranks[num] = 'COL';
num = num + 1;
Ranks[num] = 'CO';
num = num + 1;
Ranks[num] = 'MC';
num = num + 1;
Ranks[num] = 'BGEN';
num = num + 1;
Ranks[num] = 'GEN';

hook.Add("InitPostEntity", "WhitelistCommandRewrite", function()

	mopp.cmd.add('whitelist',function(ply)
	
		if !ply:isNearWhitelist() then return end
		
		netstream.Start(ply, "WhiteList_OpenMenu")
	
	end)

end)