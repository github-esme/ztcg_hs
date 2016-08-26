ZTCG_CARD
{
    "NAME" "Sattelite Beam"
    "IMAGE" "sattelite_beam.png"
    "TYPE" "ACTION"
    "ELEMENT" "WIND"
    "RARITY" "3"
    "INFO" "Wind - Tactic - Strategy"
    "COST" "1200"

    TYPE_ACT
    {
        "LEVEL" "50"
        "TEXT" "Until your next turn starts, silence every opponent monster on the field. Opponent monsters spawned after the activation of this card will be immediately silenced as well."
    }

    LVL_ACTION
    {
        "LEVEL" "999"   -- one-shot skill requires LEVEL set at 999
        "TEXT" "Concussive Purge - Choose an opponent monster on the field and silence it for 2 turns."
    }

    function onThinkAction(player)
        applyGlobalSilence(player)
    end

    function onLevelActionTrigger(player)
        local menu = makeFilteredTableList(player, "ONLY_ADVSRY", 0, "ZTCG_DONTCARE", "ZTCG_DONTCARE", "TYPE_ANYMOB", "ELEM_ANY", "ZTCG_NIL")
        local chosen = menuCards(player,menu,"SATTELITE BEAM: choose a monster to silence for 2 turns.", "ZTCG_PEEK")

        local card = getCARD(chosen)    -- get the game card descriptor from the cell list ('chosen')
        applySilence(player,card, 2)    -- apply silence on this game card descriptor

        destroyList(menu)   -- optional but recommended; game automatically frees unfreed lists at the end of the match.
    end
}
