
function GetWandAbilityComponent(entity_id) --credit Zatherz && Horscht for the idea

    local components = EntityGetAllComponents(entity_id)--all components in wand
	if components == nil then
		print("can't get coms in wand")
		return nil
	else
		for i, component_id in ipairs(components) do
			local members = ComponentGetMembers(component_id)
			for k, v in pairs(members) do
				if(k == "mItemRecoil") then
					return component_id
				end
			end
		end
	end
end

function GetCurrentWandAbilityComponent()
	local wand_id = ComponentGetValue(EntityGetFirstComponent(GetUpdatedEntityID(), "Inventory2Component"), "mActiveItem")
	
	if wand_id == nil then
		print("can't find the wand")
		return nil
	end
	return GetWandAbilityComponent(wand_id)
end
--[[
function GetWandActions( wand )
    local actions = {};
    local children = EntityGetAllChildren( wand );
    for i,v in ipairs( children ) do
        local all_comps = EntityGetAllComponents( v );
        local action_id = nil;
        local permanent = false;
        for i, c in ipairs( all_comps ) do
            action_id = ComponentGetValueDefault( c, "action_id", action_id );
            permanent = ComponentGetValueDefault( c, "permanently_attached", permanent );
        end
        if action_id ~= nil then
            table.insert( actions, {action_id=action_id, permanent=permanent} );
        end
    end
    return actions;
end
--]]