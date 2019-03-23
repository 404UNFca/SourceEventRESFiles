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

"ModEvents"
{
	"player_death"
	{
		// this extents the original player_death 
		"userid"	"short"   	// user ID who died				
		"attacker"	"short"	 	// user ID who killed
		"weapon"	"string" 	// weapon name killed used
		"dominated"	"bool"
		"revenge"	"bool"
	}
	
	"player_hurt"
	{
		"userid"	"short"   	// user ID who was hurt			
		"attacker"	"short"	 	// user ID who attacked
		"weapon"	"string" 	// weapon name attacker used
		"health"	"byte"		// health remaining
		"damage"	"byte"		// how much damage in this attack
		"hitgroup"	"byte"		// what hitgroup was hit
	}
	
	"player_changeclass"
	{
		"userid"	"short"		// user ID who changed class
		"class"		"short"		// class that they changed to
	}

	"dod_round_start"				// round restart
	{
		// nothing for now
	}
	
	"dod_round_active"				// called when round is active, players can move
	{
		// nothing for now
	}
	
	"dod_hint"
	{
		"hintmessage"	"string"	// localizable string of a hint
	}
	
	"dod_warmup_begins"
	{
		// nothing for now
	}
	
	"dod_warmup_ends"
	{
		// nothing for now
	}
	
	"dod_round_start"
	{
		// nothing for now
	}
	
	"dod_restart_round"
	{
		// nothing for now
	}
	
	"dod_ready_restart"
	{
		// nothing for now
	}
	
	"dod_allies_ready"
	{
		// nothing for now
	}
	
	"dod_axis_ready"
	{
		// nothing for now
	}
	
	"dod_round_restart_seconds"
	{
		"seconds"	"short"
	}
	
	"dod_team_scores"
	{
		"allies_caps"	"short"		// how many rounds won by Allies
		"allies_tick"	"short"		// how many tick points Allies have
		"allies_players"	"byte"	// how many players Allies have
		"axis_caps"		"short"		// .. same for Axis.
		"axis_tick"		"short"
		"axis_players"	"byte"
	}

	"dod_point_captured"
	{
		"cp"		"byte"			// index of the point that was captured
		"cpname"	"string"		// name of the point
		"cappers"	"string"		// string where each character is a player index of someone that capped
		"bomb"		"bool"			// was this a bomb exploding
	}
	
	"dod_capture_blocked"
	{
		"cp"		"byte"			// index of the point that was blocked
		"cpname"	"string"		// name of the point
		"blocker"	"byte"			// index of the player that blocked the cap
		"bomb"		"bool"			// was the block on a defuse or a plant?
	}
	
	"dod_round_win"
	{
		"team"		"byte"		// which team won the round
	}
	
	"dod_tick_points"
	{
		"team"			"byte"		// which team scored tick points
		"score"			"byte"		// how many did they score
		"totalscore"	"short"		// the new total score
	}
	
	"dod_game_over"
	{
		"reason"	"string"	// why the game is over ( timelimit, winlimit )
	}
			
	"dod_broadcast_audio"
	{
		"sound"		"string"	//sound to play
	}
	
	"dod_stats_weapon_attack"
	{
		"attacker"	"short"
		"weapon"	"byte"
	}

	"dod_stats_player_damage"
	{
		"attacker"	"short"		// userid of the attacker
		"victim"	"short"		// userid of the victim
		"weapon"	"byte"		// weapon id
		"damage"	"short"		// total damage in this shot
		"damage_given"	"byte"	// applied damage, not to exceed health
		"distance"	"float"		// distance of the shot
		"hitgroup"	"byte"		// hitgroup that was hit
	}
	
	"dod_stats_player_killed"
	{
		"attacker"	"byte"
		"victim"	"byte"
		"weapon"	"byte"
	}		
	
	"dod_win_panel"			
	{
		"show_timer_defend"	"bool"
		"show_timer_attack"	"bool"
		"timer_time"		"short"
		
		"final_event"		"byte"		// 0 - no event, 1 - bomb exploded, 2 - flag capped, 3 - timer expired
		
		"category_left"		"byte"		// 0-4: none, bombers, cappers, defenders, killers
		"left_1"			"byte"		// player index if first 
		"left_score_1"		"byte"
		"left_2"			"byte"
		"left_score_2"		"byte"
		"left_3"			"byte"
		"left_score_3"		"byte"

		"category_right"	"byte"
		"right_1"			"byte"
		"right_score_1"		"byte"
		"right_2"			"byte"
		"right_score_2"		"byte"
		"right_3"			"byte"
		"right_score_3"		"byte"
	}
	
	"dod_timer_time_added"
	{
		"seconds_added"	"short"		// how many seconds were added to the round timer	
	}
	
	"dod_timer_flash"
	{
		"time_remaining"	"short"	// how many seconds until the round ends
	}	
		
	"dod_map_time_remaining"
	{
		"seconds"	"short"
	}
	
	// clientside only
	"dod_tnt_pickup"
	{
	}
	
	"dod_bomb_planted"
	{
		"cp"		"byte"			// index of the point where the bomb was planted
		"cpname"	"string"		// name of the point
		"userid"	"short"			// user ID of the player that planted the bomb
		"team"		"byte"			// team that planted
	}
	
	"dod_bomb_exploded"
	{
		"cp"		"byte"			// index of the point where the bomb exploded
		"cpname"	"string"		// name of the point
		"userid"	"short"			// user ID of the player that planted the bomb
	}
	
	"dod_bomb_defused"
	{
		"cp"		"byte"			// index of the point where the bomb was defused
		"cpname"	"string"		// name of the point
		"userid"	"short"			// user ID of the player that defused the bomb
		"team"		"byte"			// team that defused
	}
	
	"dod_kill_planter"
	{
		"userid"	"short"			// user ID of the player killed the planter
		"victimid"	"short"			// user ID of the player that was killed
	}
	
	"dod_kill_defuser"
	{
		"userid"	"short"			// user ID of the player killed the defuser
		"victimid"	"short"			// user ID of the player that was killed
	}

	"spec_target_updated"
	{
	}
	
	"achievement_earned"
	{
		"player"		"byte"		// entindex of the player
		"achievement"	"short"		// achievement ID
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
	
	"christmas_gift_grab"
	{
		"userid"	"short"
	}
}

