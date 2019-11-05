dofile("mods/Wandcraft/lib/wand_edit_utilities.lua")
table.insert( actions,{
	id          = "WAND_ENCHANT_RELOAD_TIME",
	name 		= "Reduce Recharge Time",
	description = "How useful",
	sprite 		= "mod/Wandcraft/files/Enchantments/orb.png",
	type 		= ACTION_TYPE_PASSIVE,
	spawn_level                       = "0,4,5,6", -- BERSERK_FIELD
	spawn_probability                 = "1,1,1,1", -- BERSERK_FIELD
	price = 420,
	mana = 0,
	max_uses = -1,
	action 	= function()
		local abi_com = GetCurrentWandAbilityComponent()
		local reload_time = ComponentObjectGetValue(abi_com, "gun_config", "reload_time")
		--print(tostring(reload_time))
		ComponentObjectSetValue(abi_com , "gun_config", "reload_time", tostring((tonumber(reload_time)-10)))
		gun.reload_time = reload_time-10	
	end,
})
table.insert( actions,{
	id          = "WAND_ENCHANT_SHUFFLE_DECK_WHEN_EMPTY",
	name 		= "No Shuffle",
	description = "How useful",
	sprite 		= "mod/Wandcraft/files/Enchantments/orb.png",
	type 		= ACTION_TYPE_PASSIVE,
	spawn_level                       = "0,4,5,6", -- BERSERK_FIELD
	spawn_probability                 = "1,1,1,1", -- BERSERK_FIELD
	price = 420,
	mana = 0,
	max_uses = -1,
	action 	= function()
		local abi_com = GetCurrentWandAbilityComponent()
		ComponentObjectSetValue(abi_com , "gun_config", "shuffle_deck_when_empty", "false")
		gun.shuffle_deck_when_empty = false
	end,
})