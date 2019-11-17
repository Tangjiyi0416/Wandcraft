dofile("lib/wand_edit_utilities.lua")
dofile("config.lua")
table.insert( actions,{
	id          = "WAND_ENCHANT_SHUFFLE_DECK_WHEN_EMPTY",
	name 		= "Wand Anti Shuffle",
	description = "Turn your shuffle wand into a not shuffle wand",
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
			c.fire_rate_wait = c.fire_rate_wait + 10
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
			ComponentObjectSetValue(abi_com , "gunaction_config", "fire_rate_wait", tostring((tonumber(fire_rate_wait)-WANDCRAFT_REDUCE_FIRE_RATE_WAIT)))
			ACTION_DRAW_RELOAD_TIME_INCREASE = fire_rate_wait-10
			RemoveCard(c.action_id)
			c.fire_rate_wait = c.fire_rate_wait + 10
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
			ComponentObjectSetValue(abi_com , "gun_config", "reload_time", tostring((tonumber(reload_time)-WANDCRAFT_REDUCE_RELOAD_TIME)))
			current_reload_time = reload_time-10
			RemoveCard(c.action_id)
			c.fire_rate_wait = c.fire_rate_wait + 10
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
			ComponentSetValue(abi_com , "mana_max", tostring((tonumber(mana_max)+WANDCRAFT_INCREASE_MANA_MAX)))
			mana = mana_max+150
			RemoveCard(c.action_id)
			c.fire_rate_wait = c.fire_rate_wait + 10
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
			ComponentSetValue(abi_com , "mana_charge_speed", tostring((tonumber(mana_charge_speed)+WANDCRAFT_INCREASE_MANA_CHARGE_SPEED)))
			RemoveCard(c.action_id)
			c.fire_rate_wait = c.fire_rate_wait + 10
		end
	end,
})
table.insert( actions,{
	id          = "WAND_ENCHANT_DECK_CAPACITY",
	name 		= "Increase Wand Capacity",
	description = "It increases capacity",
	sprite 		= "files/Enchantments/increase_deck_capacity.png",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "0,4,5,6", 
	spawn_probability                 = "1,1,1,1", 
	price = 210,
	mana = 0,
	action 		= function()
		local abi_com = GetCurrentWandAbilityComponent()
		if abi_com~=nil then  --credit kermit tears for solving the first time loading problem
			local deck_capacity = ComponentObjectGetValue(abi_com , "gun_config", "deck_capacity")
			ComponentObjectSetValue(abi_com , "gun_config", "deck_capacity", tostring((tonumber(deck_capacity)+WANDCRAFT_INCREASE_DECK_CAPACITY)))
			RemoveCard(c.action_id)
		end
	end,
})
table.insert( actions,{
	id          = "WAND_ENCHANT_ACTIONS_PER_ROUND",
	name 		= "Increase Wand Spells Per Cast",
	description = "It increases spells per sast",
	sprite 		= "files/Enchantments/increase_actions_per_round.png",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "0,4,5,6", 
	spawn_probability                 = "1,1,1,1", 
	price = 420,
	mana = 0,
	action 		= function()
		local abi_com = GetCurrentWandAbilityComponent()
		if abi_com~=nil then  --credit kermit tears for solving the first time loading problem
			local actions_per_round = ComponentObjectGetValue(abi_com , "gun_config", "actions_per_round")
			ComponentObjectSetValue(abi_com , "gun_config", "actions_per_round", tostring((tonumber(actions_per_round)+WANDCRAFT_INCREASE_ACTIONS_PER_ROUND)))
			gun.actions_per_round = actions_per_round
			RemoveCard(c.action_id)
			c.fire_rate_wait = c.fire_rate_wait + 10
		end
	end,
})
table.insert( actions,{
	id          = "WAND_ENCHANT_SPREAD_DEGREES",
	name 		= "Reduces Wand Spread Degrees",
	description = "It increases spread degrees",
	sprite 		= "files/Enchantments/reduce_spread_degrees.png",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "0,4,5,6", 
	spawn_probability                 = "1,1,1,1", 
	price = 210,
	mana = 0,
	action 		= function()
		local abi_com = GetCurrentWandAbilityComponent()
		if abi_com~=nil then  --credit kermit tears for solving the first time loading problem
			local spread_degrees = ComponentObjectGetValue(abi_com , "gunaction_config", "spread_degrees")
			ComponentObjectSetValue(abi_com , "gunaction_config", "spread_degrees", tostring((tonumber(spread_degrees)-WANDCRAFT_REDUCE_SPREAD_DEGREES)))
			RemoveCard(c.action_id)
			c.fire_rate_wait = c.fire_rate_wait + 10
		end
	end,
})