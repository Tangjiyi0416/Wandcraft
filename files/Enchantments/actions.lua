dofile("mods/Wandcraft/lib/wand_edit_utilities.lua")
table.insert( actions,{
	id          = "WAND_ENCHANT_RELOAD_TIME",
	name 		= "Reduce Wand Recharge Time",
	description = "It reduces recharge time",
	sprite 		= "files/Enchantments/orb.png",
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
			gun.reload_time = reload_time-10
		end
	end,
})
table.insert( actions,{
	id          = "WAND_ENCHANT_SHUFFLE_DECK_WHEN_EMPTY",
	name 		= "Wand Anti Shuffle",
	description = "It turns shuffle to no",
	sprite 		= "files/Enchantments/orb.png",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "0,4,5,6", 
	spawn_probability                 = "1,1,1,1",
	price = 420,
	mana = 0,
	max_uses = -1,
	action 	= function()
		local abi_com = GetCurrentWandAbilityComponent()
		if abi_com~=nil then
			ComponentObjectSetValue(abi_com , "gun_config", "shuffle_deck_when_empty", "false")
			gun.shuffle_deck_when_empty = false
		end
	end,
})
--[[
table.insert( actions,{
	id          = "WAND_ENCHANT_SHUFFLE_DECK_WHEN_EMPTY",
	name 		= "Anti Shuffle",
	description = "How useful",
	sprite 		= "mods/Wandcraft/files/Enchantments/orb.png",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "0,4,5,6", 
	spawn_probability                 = "1,1,1,1",
	price = 420,
	mana = 0,
	max_uses = -1,
	action 	= function()
		local abi_com = GetCurrentWandAbilityComponent()
		ComponentObjectSetValue(abi_com , "gun_config", "shuffle_deck_when_empty", "false")
		gun.shuffle_deck_when_empty = false
	end,
})--]]