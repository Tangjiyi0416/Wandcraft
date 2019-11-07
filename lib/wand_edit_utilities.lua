
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

function RemoveCard(action_id)
	local children = EntityGetAllChildren(ComponentGetValue(EntityGetFirstComponent(GetUpdatedEntityID(), "Inventory2Component"), "mActiveItem"))
	if children == nil then
		--print("lonely and cold a childless wand can feel.")
		return false
	end
	
	for k,v in pairs(children) do
		local comps = EntityGetAllComponents(v)
		for k2,v2 in pairs(comps) do
			local members = ComponentGetMembers(v2)
			for k3,v3 in pairs(members) do
				if k3 == "action_id" and action_id == v3 then
					EntityKill(v)
					return true
				end
			end
		end
	end
	
end