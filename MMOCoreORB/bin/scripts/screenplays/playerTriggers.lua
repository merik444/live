PlayerTriggers = { }

function PlayerTriggers:playerLoggedIn(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return nil
	end


	-- One-time per player check for legacy FRS skills	
	local skillCheckCompleted = readScreenPlayData(pPlayer,"login_skill_check", "Completed")
	
	if (skillCheckCompleted ~= "true") then

		if (PlayerObject(pGhost):hasAbility("cert_onehandlightsaber_gen4")) and not (CreatureObject(pPlayer):hasSkill("force_discipline_light_saber_master")) then
			PlayerObject(pGhost):removeAbility("cert_onehandlightsaber_gen4")
			PlayerObject(pGhost):removeAbility("cert_polearmlightsaber_gen4")
			PlayerObject(pGhost):removeAbility("cert_twohandlightsaber_gen4")
		end

		if (PlayerObject(pGhost):hasAbility("healAllSelf2")) and not (CreatureObject(pPlayer):hasSkill("force_discipline_healing_damage_04")) then
			PlayerObject(pGhost):removeAbility("healAllSelf2")
		end

		if (PlayerObject(pGhost):hasAbility("avoidIncapacitation")) and not (CreatureObject(pPlayer):hasSkill("force_discipline_defender_master")) then
			PlayerObject(pGhost):removeAbility("avoidIncapacitation")
		end

		if (PlayerObject(pGhost):hasAbility("regainConsciousness")) and not (CreatureObject(pPlayer):hasSkill("force_discipline_enhancements_master")) then
			PlayerObject(pGhost):removeAbility("regainConsciousness")
		end

		local skillManager = LuaSkillManager()

		local result = skillManager:awardForceFromSkills(pPlayer)

		writeScreenPlayData(pPlayer, "login_skill_check", "Completed", "true") 

	end

	--[[ Quarterly check for FRS reset, reserved for potential future use
	local FRSResetCompleted = readScreenPlayData(pPlayer,"FRSReset20200401", "Completed")

	if (FRSResetCompleted ~= "true") then

		-- Reset FRS xp to zero regardless of Jedi state / skills
		local xpAmount = PlayerObject(pGhost):getExperience("force_rank_xp")
		CreatureObject(pPlayer):awardExperience("force_rank_xp", xpAmount * -1, false)

		if ((CreatureObject(pPlayer):hasSkill("force_rank_light_novice")) or (CreatureObject(pPlayer):hasSkill("force_rank_dark_novice"))) then  

			local rankResult = PlayerObject(pGhost):setFrsRank(pGhost,0)

		end

		writeScreenPlayData(pPlayer, "FRSReset20200401", "Completed", "true") -- Save screenplay state for current quarter

	end
	--]]


	BestineElection:playerLoggedIn(pPlayer)

end

function PlayerTriggers:playerLoggedOut(pPlayer)
	if (pPlayer == nil) then
		return
	end
end