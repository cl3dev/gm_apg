APG.Detours = APG.Detours or {}

if AdvDupe2.InitPastingQueue then 
    APG.Detours["AdvDupePastingQueue"] = APG_Detours["AdvDupePastingQueue"] or AdvDupe2.InitPastingQueue
    function AdvDupe2.InitPastingQueue(Player, PositionOffset, AngleOffset, OrigPos, Constrs, Parenting, DisableParents, DisableProtection)
        for k,v in pairs(Player.AdvDupe2.Entities) do 
		    if v.ModelScale and v.ModelScale > 1 then v.ModelScale = 1 end
        end 
        APG.Detours["AdvDupePastingQueue"](Player, PositionOffset, AngleOffset, OrigPos, Constrs, Parenting, DisableParents, DisableProtection)
    end
end
