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
	"player_death"				// a game event, name may be 32 charaters long
	{
		"userid"		"short"   	// user ID who died				
		"attacker"		"short"	 	// user ID who killed
		"weapon"		"string" 	// weapon name killed used 
		//"assister"		"short"		// user id of the assister
		"weaponid"		"short"		// weapon id
		"damagebits"	"long"		// bits
		"customkill"	"long"		// custom bits
		"priority"		"short"
	}
	
	"player_hurt"
	{
		"userid"	"short"   	// user ID who was hurt
		"attacker"	"local"	 	// user id who attacked (short)
		"health"	"local"		// remaining health points (short)
		"weapon"	"local"	// weapon name attacker used, if not the world (string)
		"dmg_health"	"short"	// damage done to health
		"hitgroup"	"local"		// hitgroup that was damaged (byte)
		"type"		"local"		// damage type (long)
	}
	
	"player_changeclass"		// Called when a player changes class
	{
		"userid"	"short"
		"class"		"short"
		"subclass"	"short"
	}
	
	"spec_target_updated"
	{
	}
	
	"achievement_earned"
	{
		"player"	"short"
		"achievement"	"short"
	}
	
	"player_spawned_at_tgate"
	{
		"userid"	"short"
	}
	
	//-----------------------------------------------------------------------------
	// Structure
	//-----------------------------------------------------------------------------
	"structure_death"			// fired when we sell a structure
	{
		"type"		"short"		// type of structure sold
		"team"		"short"		// the team the structure belonged to
		"entindex"	"short"		// The entidx of the structure
		"attacker"	"short"		// userid of attacking player
		"weapon"	"local" 	// weapon name the attacker used
	}
	
	"structure_damage_sparse"	// is only fired for every 100hp taken. no spamz here
	{
		"entindex"	"short"		// entity index of structure being damaged
		"ownerteam"	"short"		// team that owns the structure  - Todo: optimize this out!
		"bunker" "bool"			// was it the bunker?
		"userid"	"local"		// user id that damaged the structure
		"nosound"	"bool"
	}
	
	"structure_sold"			// fired when we sell a structure
	{
		"type"		"short"		// type of structure sold
		"ownerteam"	"short"		// the team the structure belonged to
	}
	
	"structure_fully_auto_repaired"	// fired when a damaged structure gets healed to 100% hp using auto repair
	{
		"type"		"short"		// type of structure repaired
		"entindex"	"short"		// entity index of repaired structure
		"ownerteam"	"short"		// team that the structure belongs to
	}
	
	"structure_fully_man_repaired"	// fired when a damaged structure gets healed to 100% hp by supports
	{
		"type"		"short"		// type of structure repaired
		"entindex"	"short"		// entity index of repaired structure
		"ownerteam"	"short"		// team that the structure belongs to
		"userid"	"local"		// user id that repaired the sturcture
	}
	
	"structure_built"		// structure fully built. fired client-side. commander only. same team. 
	{
		"entindex"		"short"		// structure entity index
	}

	"structure_power_outage"		// structure out of power. fired client-side. commander only. same team. 
	{
		"entindex"		"short"		// structure entity index
	}
	
	//-----------------------------------------------------------------------------
	// Resource Points
	//-----------------------------------------------------------------------------
	// Used to show the capture hud panel
	"resource_start_capture"
	{
		"userid"	"short"		// user id that is starting the capture
		"entindex"	"short"		// resource point getting capped
		"type"		"short"		// type of resource point
		"capteam"	"short"		// team that is capping
		"ownerteam"	"short"		// team that currently owns the point (check for unassigned)
	}
	
	// Used to hide the capture hud panel
	"resource_end_capture"
	{
		"userid"	"short"		// user id that is starting the capture
		"entindex"	"short"		// resource point that got captured
	}
	
	"resource_break_capture"
	{
		"entindex"	"short"
		"time_remaining"	"float"
	}
		
	// Resource point has extracted some resources
	"resource_extract"
	{
		"entindex"	"short"		// resource point that extracted the resources
		"amount"	"short"		// resource point that extracted the resources
	}
	
	// When a resource point gets fully captured by a team
	"resource_captured"
	{
		"entindex"	"short"		// entity index of the captrd point
		"type"		"short"		// the resource point type that got captured
		"team"		"short"		// team that captured the point
	}
	
	
	//-----------------------------------------------------------------------------
	// Power system events
	//-----------------------------------------------------------------------------
	// An entity is requesting a power connection
	"power_requested"
	{
		"teamid"	"short"		// The team who's power system got updated
		"entid"		"short"		// The entity index that is requesting a power connection
	}
	
	// An entity is requesting a power connection
	"power_removed"
	{
		"teamid"	"short"		// The team who's power system got updated
		"entid"		"short"		// The entity index that is requesting a power connection
	}
	
	// When the power nexus gets updated
	"power_updated"
	{
	}
	
	//-----------------------------------------------------------------------------
	// Game Rules
	//-----------------------------------------------------------------------------
	"enter_pregame"
	{}
	
	
	//-----------------------------------------------------------------------------
	// Blueprints events
	//-----------------------------------------------------------------------------
	//"blueprint_update"
	//{
	//	"teamid"	"short"		// The team who's power system got updated
	//	"blueprint"	"short"		// The blueprint that is updated
	//	"state"		"short"		// 1 = earned, 0 = not earned..
	//}
	
	//-----------------------------------------------------------------------------
	// Vehicle events
	//-----------------------------------------------------------------------------
	"enter_vehicle"
	{
		"userid"	"short"
		"seat"		"short"
		"entidx"	"short"
	}
	
	"exit_vehicle"
	{
		"userid"	"short"
		"seat"		"short"
		"entidx"	"short"
	}
	
	"show_freezepanel"
	{
		"killer"	"short"		// entindex of the killer entity
	}

	"hide_freezepanel"
	{
	}

	"freezecam_started"
	{
	}
	
	// Called when a tgate is built, removed, or power state changes
	"spawn_map_changed"
	{
		"teamid"	"short"
	}
	
	"overviewmap_key_released"
	{
	}
	
	"slot_key_pressed"
	{
		"slot"	"short"
	}
	
	"ironsight_key_pressed"
	{
	}
	
	"ability_key_pressed"
	{
	}
	
	"weapon_reload"
	{
		"userid"	"short"
		"manual"	"bool"		// player manually started the reload
	}
	
	"weapon_fire_at_40"
	{
		"userid"	"short"
		"weapon"	"string" 	// used weapon name
		"weaponid"	"short"		// used weapon ID
		"count"		"short"		// number of bullets
	}
	
	"entity_visible"
	{
		"userid"	"short"		// The player who sees the entity
		"subject"	"long"		// Entindex of the entity they see
		"classname"	"string"	// Classname of the entity they see
		"entityname" "string"	// name of the entity they see
	}
	
	"player_left_bunker_building"
	{
		"userid"	"short"		// The player who left the bunker
		"entidx"	"short"		// The bunker they left
	}
	
	"player_entered_bunker_building"
	{
		"userid"	"short"		// The player who entered the bunker
		"entidx"	"short"		// The bunker they entered
	}
	
	"player_entered_commander_mode"
	{
		"userid"	"short"		// Player who entered commander mode
	}
	
	"player_enter_commander_mode_failed"
	{
		"userid"	"short"		// Player who tried to enter commander mode
	}
	
	"player_left_commander_mode"
	{
		"userid"	"short"		// Player who left commander mode
	}
	
	"player_restocked_from_supply_struct"
	{
		"userid"	"short"		// Player who was restocked
		"entidx"	"short"		// Entity they got supply from
	}
	
	"player_opened_armoury_menu"
	{
		"userid"	"short"		// Player opened kit menu from armoury
	}
	
	"commander_move_2d"
	{
		"local"		"1"			// Local only
		"userid"	"short"		// Player that moved the commander camera
	}
	
	"commander_move_z"
	{
		"local"		"1"			// Local only
		"userid"	"short"		// Player that moved the commander camera up/down
	}
	
	"commander_minimap_move"
	{
		"local"		"1"
		"userid"	"short"		// Player that moved the commander camera
	}
	
	"player_exited_tgate"
	{
		"userid"	"short"		// Player that left the gate
	}
		
	"commander_left_valid_area"
	{
		"userid"	"short"		// The commander that left valid "airspace"
	}
	
	"commander_entered_valid_area"
	{
		"userid"	"short"		// The commander that entered valid "airspace"
	}
	
	"round_win"
	{
		"team"		"short"		// The winning team
		"type"		"short"		// Type of win
	}
	
	"transport_gate_created"
	{
		"teamid"		"short"		// Team that created the gate
		"entindex"	"short"		// Entity id of the new gate
	}
	
	"last_tgate_destroyed"
	{
		"teamid"		"short"		// Team who's last tgate got pwnd
	}
	
	"player_stats_updated"
	{
		"forceupload"	"bool"
	}
	
	"failed_to_build"
	{
		"local"		"1"
		"userid"	"short"		// the commander that tried to build something with no power
		"reason"	"short"		// (eBuildErrorReason) 0: Ok, 1: No Power, 2: No Line of sight, 3: obstruction, 4: invalid build area
	}
	
	"commander_hint_closed"		// The local commander closed a hint (used to re-evaluate tiered hints)
	{
		"local"		"1"
	}
	
	"commander_selected_structure"	// The local commander selected a structure
	{
		"local"		"1"
		"type"		"short"			// structure type
		"entindex"	"short"			// Entity id of the selected structure
	}
	
	"commander_flash_assembler_start"	// Causes the assembler to flash
	{
		"local"		"1"
	}
	
	"commander_flash_assembler_stop"	// Causes the assembler to stop flashing
	{
		"local"		"1"
	}
	
	"commander_start_build_mode"	// Local commander is in structure placement mode
	{
		"local"		"1"
		"type"		"short"			// structure type
	}
	
	"commander_flash_supply_icon_start"		// Start flashing the supply station build icon
	{
		"local"		"1"
	}
	
	"commander_flash_supply_icon_stop"		// Stop flashing the supply station build icon
	{
		"local"		"1"
	}
	
	"commander_start_structure_build"		// Start a structure building
	{
		"team"	"short"						// The team that is building the structure
		"type"	"short"						// The structure type
	}
	
	"promoted_to_commander"
	{
		"userid"	"short"					// The user that got promoted to commander
		"teamid"	"short"					// The team of the promoted commander
	}
	
	"timeleft_10m"							// 10 minutes left of the round
	{	
		"local"		"1"
	}
	
	"timeleft_5m"							// 5 minutes left of the round
	{	
		"local"		"1"
	}
	
	"timeleft_1m"							// 1 minute left of the round
	{	
		"local"		"1"
	}
	
	"timeleft_30s"							// 30 seconds left of the round
	{	
		"local"		"1"
	}
	
	"timeleft_10s"							// 10 seconds left of the round
	{	
		"local"		"1"
	}
	
	"timeleft_5s"							// 5 seconds left of the round
	{	
		"local"		"1"
	}
	
	"ach_hospital_duty_progress"		// progress towards hospital duty achievement. fired client-side. commander only. same team. 
	{
		"progress"		"short"
	}
	
	"ach_high_maintenance_progress"	// progress towards high maintenance achievement. fired client-side. commander only. same team. 
	{
		"progress"		"short"
	}
	
	"forward_spawn_created"			// Fired once a forward spawn has been created. A forward spawn is defined by 
	{								// any created spawn point that causes the spawn cluster centroid to be split
		"teamid"	"short"
	}
	
	"research_complete"				// Fired when a research has finished researching
	{
		"teamid"	"short"
		"researchid"	"short"
	}
	
	"show_annotation"
	{
		"worldPosX" "float"
		"worldPosY" "float"
		"worldPosZ" "float"
		"worldNormalX" "float"
		"worldNormalY" "float"
		"worldNormalZ" "float"
		"id" "long"
		"text"		"string"	// name (unlocalized)
		"lifetime"	"float"
		"visibilityBitfield"	"long" // bitfield of the players that can see this
		"follow_entindex"	"long" // if this is set, follow this entity
		"show_distance"		"bool"
		"play_sound"		"string"
		"show_effect"		"bool"
	}

	"hide_annotation"
	{
		"id" "long"
	}
	
	"end_training_session"
	{
		"course"	"string"
		"successful"	"bool"
	}
	
	"nav_blocked"
	{
		"area"		"long"
		"blocked"	"bool"
	}
	
	"nav_generate"
	{
	}
	
	"medkit_heal"
	{
		"local"	"1"
		"entindex"	"local"		// entity index of medkit
		"ownerid"	"local"		// user id of medkit owner
		"userid"	"local"		// user id of player healed
		"amount"	"local"		// amount of health restored
	}
	
	"emp_structure"
	{
		"local"	"1"
		"entindex"	"local"		// entity index of structure
		"userid"	"local"		// user id of player
	}
	
	"setup_compass_rotation"
	{
		"rotation"	"long"
	}
	
	"tgate_use"
	{
		"userid"	"short"
	}
	
	"attacked_radarkit"
	{
		"userid"	"short"
	}
	
	// Client-side only
	"squad_gizmo_changed"
	{
		"team"		"byte"
		"squad"		"byte"
		"gizmo"		"byte"
	}
	
	// Client-side only
	"squad_changed"
	{
		"userid"	"short"
		"team"		"byte"
		"squad"		"byte"
	}
	
	// Client-side only
	"upgrade_eligibility_change"
	{
	}
}

