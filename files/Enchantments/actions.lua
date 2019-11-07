dofile("mods/Wandcraft/lib/wand_edit_utilities.lua")
table.insert( actions,{
	id          = "WAND_ENCHANT_SHUFFLE_DECK_WHEN_EMPTY",
	name 		= "Wand Anti Shuffle",
	description = "It turns shuffle to no",
	sprite 		= "files/Enchantments/anti_shuffle.png",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "0,4,5,6", 
	spawn_probability                 = "1,1,1,1",
	price = 640,
	mana = 0,
	max_uses = -1,
	action 	= function()
		local abi_com = GetCurrentWandAbilityComponent(ItemActionComponent)
		if abi_com~=nil then
			ComponentObjectSetValue(abi_com , "gun_config", "shuffle_deck_when_empty", "false")
			gun.shuffle_deck_when_empty = false
			RemoveCard(c.action_id)
		end
	end,
})
table.insert( actions,{
	id          = "WAND_ENCHANT_FIRE_RATE_WAIT",
	name 		= "Reduce Wand Cast Delay",
	description = "It reduces CD",
	sprite 		= "files/Enchantments/reduce_fire_rate_wait.png",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "0,4,5,6", 
	spawn_probability                 = "1,1,1,1",
	price = 120,
	mana = 0,
	max_uses = -1,
	action 	= function()
		local abi_com = GetCurrentWandAbilityComponent()
		if abi_com~=nil then  --credit kermit tears for solving the first time loading problem
			local fire_rate_wait = ComponentObjectGetValue(abi_com, "gunaction_config", "fire_rate_wait")
			ComponentObjectSetValue(abi_com , "gunaction_config", "fire_rate_wait", tostring((tonumber(fire_rate_wait)-10)))
			c.fire_rate_wait = fire_rate_wait-10
			RemoveCard(c.action_id)
		end
	end,
})
table.insert( actions,{
	id          = "WAND_ENCHANT_RELOAD_TIME",
	name 		= "Reduce Wand Recharge Time",
	description = "It reduces recharge time",
	sprite 		= "files/Enchantments/reduce_reload.png",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "0,4,5,6", 
	spawn_probability                 = "1,1,1,1", 
	price = 420,
	mana = 0,
	action 		= function()
		local abi_com = GetCurrentWandAbilityComponent()
		if abi_com~=nil then  --credit kermit tears for solving the first time loading problem
			local reload_time = ComponentObjectGetValue(abi_com, "gun_config", "reload_time")
			ComponentObjectSetValue(abi_com , "gun_config", "reload_time", tostring((tonumber(reload_time)-10)))
			current_reload_time = reload_time-10
			RemoveCard(c.action_id)
		end
	end,
})
table.insert( actions,{
	id          = "WAND_ENCHANT_MANA_MAX",
	name 		= "Increase Wand Maximum Mana",
	description = "It increases max mana",
	sprite 		= "files/Enchantments/increase_mana_max.png",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "0,4,5,6", 
	spawn_probability                 = "1,1,1,1", 
	price = 70,
	mana = 0,
	action 		= function()
		local abi_com = GetCurrentWandAbilityComponent()
		if abi_com~=nil then  --credit kermit tears for solving the first time loading problem
			local mana_max = ComponentGetValue(abi_com, "mana_max")
			ComponentSetValue(abi_com , "mana_max", tostring((tonumber(mana_max)+150)))
			mana = mana_max+150
			RemoveCard(c.action_id)
		end
	end,
})
table.insert( actions,{
	id          = "WAND_ENCHANT_MANA_CHARGE_SPEED",
	name 		= "Increase Wand Mana Charge Speed",
	description = "It increases mana charge speed",
	sprite 		= "files/Enchantments/increase_mana_mana_charge_speed.png",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "0,4,5,6", 
	spawn_probability                 = "1,1,1,1", 
	price = 210,
	mana = 0,
	action 		= function()
		local abi_com = GetCurrentWandAbilityComponent()
		if abi_com~=nil then  --credit kermit tears for solving the first time loading problem
			local mana_charge_speed = ComponentGetValue(abi_com, "mana_charge_speed")
			ComponentSetValue(abi_com , "mana_charge_speed", tostring((tonumber(mana_charge_speed)+35)))
			RemoveCard(c.action_id)
		end
	end,
})