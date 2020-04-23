APG.Detours = APG.Detours or {}

if AdvDupe2.InitPastingQueue then 
	APG.Detours["AdvDupePastingQueue"] = APG.Detours["AdvDupePastingQueue"] or AdvDupe2.InitPastingQueue
	APG.Detours["AdvDupePaste"] = APG.Detours["AdvDupePaste"] or AdvDupe2.duplicator.Paste
	
	function AdvDupe2.InitPastingQueue(Player, PositionOffset, AngleOffset, OrigPos, Constrs, Parenting, DisableParents, DisableProtection)
		local maxScale = APG.cfg[ "maxScale" ].value
		for k,v in pairs(Player.AdvDupe2.Entities) do 
			if v.ModelScale and v.ModelScale > maxScale then
				v.ModelScale = maxScale
			end
		end 

		APG.Detours["AdvDupePastingQueue"](Player, PositionOffset, AngleOffset, OrigPos, Constrs, Parenting, DisableParents, DisableProtection)
	end

	function AdvDupe2.duplicator.Paste( Player, EntityList, ConstraintList, Position, AngleOffset, OrigPos, Parenting)
		if ConstraintList && APG.cfg["ropeSpam"].value then
			for k, Constraint in pairs( ConstraintList ) do
				if(Constraint.type ~= "Rope") then continue end
				Entity = CreateConstraintFromTable( Constraint, CreatedEntities, EntityList, Player )
				if(IsValid(Entity))then
					table.insert( CreatedConstraints, Entity )
				end
			end
		end

		APG.Detours["AdvDupePaste"]( Player, EntityList, ConstraintList, Position, AngleOffset, OrigPos, Parenting)
	end
	
end
