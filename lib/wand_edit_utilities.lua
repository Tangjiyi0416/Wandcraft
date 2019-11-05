
function GetWandAbilityComponent(entity_id) --credit Zatherz && Horscht for the idea

    local components = EntityGetAllComponents(entity_id)
    for i, component_id in ipairs(components) do
      for k, v in pairs(ComponentGetMembers(component_id)) do
        if(k == "mItemRecoil") then
          return component_id
        end
      end
    end
	
end

function GetCurrentWandAbilityComponent()
	local wand_id = ComponentGetValue(EntityGetFirstComponent(GetUpdatedEntityID(), "Inventory2Component"), "mActiveItem")
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