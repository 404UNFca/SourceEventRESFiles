//=========== (C) Copyright 1999 Valve, L.L.C. All rights reserved. ===========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//=============================================================================

// No spaces in event names, max length 32
// All strings are case sensitive
//
// valid data key types are:
//   string : a zero terminated string
//   bool   : unsigned int, 1 bit
//   byte   : unsigned int, 8 bit
//   short  : signed int, 16 bit
//   long   : signed int, 32 bit
//   float  : float, 32 bit
//   local  : any data, but not networked to clients
//
// following key names are reserved:
//   local      : if set to 1, event is not networked to clients
//   unreliable : networked, but unreliable
//   suppress   : never fire this event
//   time	: firing server time
//   eventid	: holds the event ID

"modevents"
{
	"player_active"				// Player has become active in the server
	{
		"userid"	"short"
	}
	
	"player_death"				// a game event, name may be 32 charaters long
	{
		"userid"	"short"   	// user ID who died				
		"attacker"	"short"	 	// user ID who killed, entindex if NPC
		"weapon"	"string" 	// weapon name killed used 
		"npctype"		"byte"		// NPC type, if player was killed by one (0 = player)
	}
	
	"teamplay_round_start"			// round restart
	{
		"full_reset"	"bool"		// is this a full reset of the map
	}
	
	"spec_target_updated"
	{
	}
	
	"achievement_earned"
	{
		"player"	"byte"		// entindex of the player
		"achievement"	"short"		// achievement ID
	}

	"achievement_event"
	{
		"achievement_name"	"string"
		"cur_val"	"int"
		"max_val"	"int"
		"userid"	"int"
	}

	"object_destroyed"			// a game event, name may be 32 charaters long
	{
		"userid"	"short"   	// user ID who died				
		"attacker"	"short"	 	// user ID who killed
		"weapon"	"string" 	// weapon name killed used
	}
	
	"player_hurt"
	{
		"userid"	"short"   	// user ID who was hurt			
		"attacker"	"short"	 	// user ID who attacked
		"weapon"	"string" 	// weapon name attacker used
	}
	
	"player_spawn"
	{
		"userid"	"short"
	}
	
	"game_round_restart"
	{
	}
	
	"nmrih_practice_ending"
	{
	}
	
	"nmrih_reset_map"
	{
	}

	"player_join"
	{
		"index"		"byte"
	}

	"player_leave"
	{
		"index"		"byte"
	}

	"objective_begin"
	{
		"id"		"short"
		"name"		"string"
	}

	"objective_complete"
	{
		"id"			"short"
		"name"			"string"
		"force_extract"	"string"
	}

	"objective_fail"
	{
		"id"		"short"
		"name"		"string"
	}

	"npc_killed"
	{
		"entidx"	"short"
		"killeridx"	"short"
		"isturned"	"bool"
		"weaponid"	"byte" 	// weapon id killer used
		"npctype"		"byte"		// NPC type
	}

	"spec_target_updated"
	{
	}

	"achievement_earned"
	{
		"player"		"short"
		"achievement"	"short"
	}

	"instant_zombie_spawn"
	{
		"spawn_amount"	"short"
		"spawn_brush"	"short"
		"spawn_target"	"string"
		"ignore_visibility"  "bool"
		"check_proximity"	 "bool"
		"track"				 "bool"
		"runner_chance"	"float"
		"child_chance"		"float"
	}

	"WalkieSound"
	{
		"sound_name"	"string"
		"global"		"bool"
		"held"			"bool"
	}

	"ammo_radial_open"
	{
	}

	"ammo_radial_closed"
	{
	}

	"keycode_enter"
	{
		"keypad_idx"	"short"
		"code"			"string"
		"player"		"short"
	}

	"state_change"
	{
		"state"		"short"
		"game_type"	"short"
	}

	"zombie_spawning_enable"
	{
	}

	"zombie_spawning_disable"
	{
	}

	"new_wave"
	{
		"resupply"	"bool"
	}

	"wave_low_zombies"
	{
	}

	"wave_complete"
	{
	}

	"wave_system_begin"
	{
	}

	"wave_system_end"
	{
	}

	"objective_text_changed"
	{
		"text"	"string"
	}

	"zombie_spawn_enabled"
	{
		"id"		"short"
		"enabled"	"bool"
	}

	"zombie_spawn_updated"
	{
		"id"		"short"
	}

	"safe_zone_damage"
	{
		"index"		"short"
	}

	"safe_zone_heal"
	{
		"index"		"short"
		"amount"	"short"
		"health"		"short"
	}
	
	"safe_zone_deactivate"
	{
		"id"		"short"
		"killed"	"bool"
	}
	
	"tokens_changed"
	{
		"tokens"	"short"
	}

	"extraction_complete"
	{
	}

	"extraction_expire"
	{
	}

	"freeze_all_the_things"
	{
		"frozen"	"bool"
	}

	"cure"
	{
		"player_id"	"short"
	}
	
	"map_complete"
	{
	}
	
	"extraction_begin"
	{
	}
	
	"player_extracted"
	{
		"player_id" "short"
	}
	
	"zombie_head_split"
	{
		"player_id" "short"
	}
	
	"arrow_stick"
	{
		"player_id"	"short"
		"victim_id"	"short"
	}
	
	"pills_taken"
	{
		"player_id"	"short"
	}
	
	"vaccine_taken"
	{
		"player_id"	"short"
		"infected"		"bool"
	}
	
	"ammo_checked"
	{
		"player_id"	"short"
		"weapon_id"	"short"
	}
	
	"weapon_picked_up"
	{
		"player_id"	"short"
		"weapon_id"	"short"
	}
	
	"weapon_fired"
	{
		"player_id"	"short"
		"weapon_id"	"short"
	}
	
	"zombie_killed_by_fire"
	{
		"igniter_id"	"short"
		"zombie_id"	"short"
	}
	
	"nmrih_round_begin"
	{
	}
	
	"game_restarting"
	{
	}

	"player_contemplate_suicide"
	{
		"player_id"		"short"
		"contemplating"	"bool"
	}

	"player_commit_suicide"
	{
		"player_id"		"short"
		"infected"		"bool"
		"mute_duration"	"float"
	}
	
	"zombie_shoved"
	{
		"player_id" "short"
		"zombie_id"	"short"
	}
	
	"token_earned"
	{
		"player_id" "short"
		"tokens"	"short"
	}
	
	"weapon_reload"
	{
		"player_id"			"short"
		"weapon_classname"	"string"
	}

	"grab_end"
	{
		"player_index"		"short"
		"causer_index"		"short"
	}

	"base_player_teleported"
	{
		"entindex"			"short"
	}
	
	"challenge_start"
	{
	}
	
	"challenge_end"
	{
		"ticks"	"long"
		"failed"	"bool"
	}
	
	"challenge_checkpoint"
	{
		"ticks"	"long"
	}
	
	"challenge_freeze"
	{
		"curTicks"	"long"
		"frozen"	"bool"
		"restoredTick"	"long"
	}
	
	// Client-side event for recorded bookmarks on demos
	"demo_bookmark"
	{
		"tick"	"short" // Bookmarked tick
	}
}
