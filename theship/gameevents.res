//=========== (C) Copyright 1999 Valve, L.L.C. All rights reserved. ===========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//=============================================================================

// No spaces in event names, max length 32
// All strings are case sensitive
// total game event byte length must be < 1024
//
// valid data key types are:
//   none   : value is not networked
//   string : a zero terminated string
//   bool   : unsigned int, 1 bit
//   byte   : unsigned int, 8 bit
//   short  : signed int, 16 bit
//   long   : signed int, 32 bit
//   float  : float, 32 bit



"gameevents"
{	
//////////////////////////////////////////////////////////////////////
// Ship Player-Related Events
//////////////////////////////////////////////////////////////////////

	"kill_quarry"
	{
		"victim"	"short"		// user ID of victim
		"killer"	"short"		// user ID of killer
		"bribe"		"bool"		// was the kill made possible by a bribed guard?
		"weapon"	"short"		// WeaponType used in this kill
		"money"		"short"		// Amount of money awarded for this kill
		"killerteam" "byte"		// Number of the killer's team
		"victimteam" "byte"		// Number of the victim's team
	}
	
	"kill_hunter"
	{
		"victim"	"short"		// user ID of victim
		"killer"	"short"		// user ID of killer
	}
	
	"kill_innocent"
	{
		"victim"	"short"		// user ID of victim
		"killer"	"short"		// user ID of killer
	}
	
	"kill_suicide"
	{
		"victim"	"short"		// user ID of victim
	}
	
	"player_arrested"
	{
		"userid"	"short"		// user ID of arrested player
	}
	
	"player_sentenced"
	{
		"userid"	"short"		// user ID of sentenced player	
		"sentence"	"short"		// length of sentence	
	}
	
	"player_fined"
	{
		"userid"	"short"		// user ID of sentenced player	
		"fine"		"short"		// amount of fine
	}
	
	"player_released"
	{
		"userid"	"short"		// user ID of player released from jail
	}

	"player_changename"
	{
		"userid"	"short"		// user ID on server
		"oldname"	"string"	// players old (current) name
		"newname"	"string"	// players new name
	}
	
	"player_team"				// player change his team
	{
		"name"		"string"
		"userid"	"short"		// user ID on server
		"team"		"byte"		// team id
		"oldteam"	"byte"		// old team id
		"disconnect" "bool"	// team change because player disconnects
	}
	
	"player_death"				// a game event, name may be 32 charaters long
	{
		"userid"	"short"   	// user ID who died				
		"attacker"	"short"	 	// user ID who killed
	}
	
	"player_hurt"
	{
		"userid"	"short"   	// player index who was hurt				
		"attacker"	"short"	 	// player index who attacked
		"health"	"byte"		// remaining health points
	}
	
	"player_chat"				// a public player chat
	{
		"teamonly"	"bool"		// true if team only chat
		"userid" 	"short"		// chatting player 
		"text" 	 	"string"	// chat text
	}
	
	"player_spawn"				// player spawned in game
	{
		"userid"	"short"		// user ID on server
	}
	
	"player_shoot"				// player shoot his weapon
	{
		"userid"	"short"		// user ID on server
		"weapon"	"byte"		// weapon ID
		"mode"		"byte"		// weapon mode
	}
	
	"kill_tk"					// Team kill
	{
		"victim"	"short"		// user ID of victim
		"killer"	"short"		// user ID of killer
	}
	
	"kill_opp_tk"				// Opposing team kill
	{
		"victim"	"short"		// user ID of victim
		"killer"	"short"		// user ID of killer
	}
	
	"team_new_king"
	{
		"teamnum"	"short"		// Number of team whose king this is
		"kingid"	"short"		// User ID of new king
		"oldkingid"	"short"		// User ID of previous king
		"kingname"	"long"		// PersonNameType of king's identity
	}
	
	"team_quarry_changed"
	{
		"hunter_team"	"short"		// Team which has been assigned a new quarry
		"quarry_team"	"short"		// Team which is now being hunted by hunter_team
	}

//////////////////////////////////////////////////////////////////////
// Ship Economy events
//////////////////////////////////////////////////////////////////////

	"interaction_cost_changed"
	{
		"interaction_name"	"string"
		"cash"				"long"
		"bank"				"long"
	}	

//////////////////////////////////////////////////////////////////////
// Ship Needs events
//////////////////////////////////////////////////////////////////////
	"need_timer_started"
	{
		"userid"			"short"
		"needtype"			"byte"
	}
	
	"need_timer_expired"
	{
		"userid"			"short"
		"needtype"			"byte"
	}

//////////////////////////////////////////////////////////////////////
// GAME EVENTS
//////////////////////////////////////////////////////////////////////

	"game_waiting"
	{
	}

	"game_countdown_start"
	{
		"time_remaining"	"short"		// time remaining until start of new game
	}
		
	"game_newmap"				// send when new map is completely loaded
	{
		"mapname"	"string"	// map name
	}
	
	"game_changing_map"			// send before changing map
	{
		"mapname"	"string"	// map name
	}
	
	"game_start"				// a new game starts
	{
		"cashlimit"	"long"		// amount of cash required to win
		"timelimit"	"long"		// time limit
	}
	
	"game_end"				// a game ended
	{
		"time_remaining"	"short"		// Indicates amount of time remaining to announce player victory at end of game
		"winner"			"short"		// winner team/user id
		"winner_outfit"		"long"		// Network type describing the winner's outfit
		"winner_features"	"long"		// Network type describing the winner's features
		"winner_identity"	"long"		// Name ID of this player's identity
		"winner_money"		"long"		// Amount of money winner won with
		"winner_murders"	"short"		// Number of successful murders by winner
	}
	
	"game_most_arrests"
	{
		"arrests"	"byte"	// number of arrests
		"userid"	"short"	// userid of player with most arrests
	}
	
	
//////////////////////////////////////////////////////////////////////
// HUNT EVENTS
//////////////////////////////////////////////////////////////////////
		
	"hunt_round_end"		// "The hunt is over"
	{
	}
	
	"round_count_start"	// "New hunt will start in ... seconds"
	{
		"time_remaining"	"short"		// Time until hunt starts
	}
	
	"hunt_round_count_end"		// "... seconds left to kill your quarry" (not for the 'winner')
	{
		"winner"			"short"		// User ID of the player who's quarry kill triggered the count to end
		"loser"				"short"		// User ID of whoever got killed to end this round
		"time_remaining"	"short"		// Time until hunt ends
	}
	
	"hunt_hurry"
	{
		"time_remaining"	"short"		// Time until hunt ends
	}
	
	
//////////////////////////////////////////////////////////////////////
// DUEL EVENTS
//////////////////////////////////////////////////////////////////////
		
	"duel_round_end"		// "The duel is over"
	{
	}
	
	"duel_game_end"
	{
		"winner"	"short"	// The player who has won the overall duel
	}
	
	
//////////////////////////////////////////////////////////////////////
// DEATHMATCH EVENTS
//////////////////////////////////////////////////////////////////////
	
	"deathmatch_end"
	{
		"winner"	"short"
	}
	
	"deathmatch_kill"
	{
		"killer"	"short"
		"victim"	"short"
	}
	
//////////////////////////////////////////////////////////////////////
// ELIMINATION MODE EVENTS
//////////////////////////////////////////////////////////////////////

	"elimination_kill"
	{		
		"victim"	"short"		// user ID of victim
		"killer"	"short"		// user ID of killer
	}
	
	"elimination_round_end"
	{
		"eliminator"	"short"	// The player who has won the elimination
		"reward"		"short"	// The amount the eliminator won as a bonus
	}
	
	"team_elimination_round_end"
	{
		"eliminator"	"short"	// The team who has won the elimination
		"roundloser"	"short"	// The team who has been eliminated this round
		"reward"		"short"	// The amount the eliminator won as a bonus
	}
	
	"elimination_game_end"
	{
		"winner"	"short"	// The player who has won the overall elimination
	}
	
	
//////////////////////////////////////////////////////////////////////
// MISCELLANEOUS EVENTS
//////////////////////////////////////////////////////////////////////
	
	"game_message"				// a message send by game logic to everyone
	{
		"target"	"byte"		// 0 = console, 1 = HUD
		"text"		"string"	// the message text
	}
	
	"round_start"
	{
		"timelimit"	"long"		// round time limit in seconds
		"fraglimit"	"long"		// frag limit in seconds
		"objective"	"string"	// round objective
	}
	
	"round_end"
	{
		"winner"	"short"		// winner team/user i
		"reason"	"byte"		// reson why team won
		"message"	"string"	// end round message 
	}

	"break_breakable"
	{
		"entindex"	"long"
		"userid"		"short"
		"material"	"byte"	// BREAK_GLASS, BREAK_WOOD, etc
	}

	"break_prop"
	{
		"entindex"	"long"
		"userid"	"short"
	}
	
	"player_footstep"
	{
		"userid"	"short"
	}
	
	"player_falldamage"
	{
		"userid"	"short"
		"damage"	"float"
		"priority"	"short"
	}
	
	"door_moving"
	{
		"entindex"	"long"
		"userid"	"short"
	}
	
	"door_closing"
	{
		"entindex"	"long"
	}
	
	"weapon_fire"
	{
		"userid"	"short"
	}
	
	"weapon_fire_on_empty"
	{
		"userid"	"short"
	}
	
	"weapon_reload"
	{
		"userid"	"short"
	}
	
	"bullet_impact"
	{
		"userid"	"short"
		"x"		"float"
		"y"		"float"
		"z"		"float"
	}
	
	"nav_blocked"
	{
		"area"		"long"
		"blocked"	"short"
	}
	
	"special_item_prespawn"
	{
		"item_type"			"short"		// DB Item type of special item which will spawn, e.g. SPECIAL_TYPE_MONEYBAG
		"spawn_location"	"long"		// DB unique ID of the room in which this item will spawn
		"time_to_spawn"		"short"		// Time in seconds after this event at which the item will spawn
		"money_bag_value"	"long"		// If this item is a money bag, how much money is in it
	}
	
	"special_item_spawn"
	{
		"item_type"			"short"		// DB Item type of special item which has spawned, e.g. SPECIAL_TYPE_MONEYBAG
		"spawn_location"	"long"		// DB unique ID of the room in which this item has spawned
		"money_bag_value"	"long"		// If this item is a money bag, how much money is in it
		"lifespan"			"short"		// Length of time for which this item will be around
	}
	
	"special_item_picked_up"
	{
		"player_userid"		"long"	// id of player who picked it up
		"item_type"			"short"
		"location"			"long"
		"money_bag_value"	"long"		// If this item is a money bag, how much money is in it
	}
	
	"special_item_cleaned_up"
	{
		"item_type"		"short"
		"location"		"long"		// DB unique ID of the room in which this item has spawned
	}
	
	"autobalance_teams"
	{
	}
	
	"restart_round"	// "Round will restart in ... seconds"
	{
		"time"		"short"		// Time until round resets
	}
	
	"team_round_start" // "A new round will begin shortly"
	{
	}
//////////////////////////////////////////////////////////////////////
// SICKBAY EVENTS
//////////////////////////////////////////////////////////////////////
	
	"doctor_healing_message"
	{
		"hunterID"	"short"		// user ID of hunter			
	}
	"sickbay_healing_message"
	{
		"hunterID"	"short"		// user ID of hunter			
	}
	"psych_healing_message"
	{
		"hunterID"	"short"		// user ID of hunter			
	}
	"doctor_healed_message"
	{
		"hunterID"	"short"		// user ID of hunter	
	}
	"sickbay_healed_message"
	{
		"hunterID"	"short"		// user ID of hunter	
	}
	"psych_healed_message"
	{
		"hunterID"	"short"		// user ID of hunter
	}
	
//////////////////////////////////////////////////////////////////////
// MONEY EVENTS
//////////////////////////////////////////////////////////////////////
	"pickup_purse"
	{
		"picker"	"short"		// user ID of person picking up the cash
		"amount"	"long"		// amount they've picked up
	}
	
//////////////////////////////////////////////////////////////////////
// EXPLOIT EVENTS
//////////////////////////////////////////////////////////////////////
	"kick_close_warning"
	{
		"userid"	"short"   	// player index who is being warned they are close to being kicked
		"reason"	"byte"		// reason : 1 - innocent kills, 2 - low cash
	}
	"kick_notification"
	{
		"userid"	"short"   	// player index who will soon be kicked
		"reason"	"byte"		// reason : 1 - innocent kills, 2 - low cash
		"minutes"	"short"		// number of minutes the ban will last
	}	
	"rejoin_jail"
	{
		"userid"	"short"   	// player index who is rejoining
	}
	"rejoin_normal"
	{
		"userid"	"short"   	// player index who is rejoining
	}
	"vote_against_you"
	{
		"userid"	"short"		//player being voted against
	}
	"vote_in_progress"
	{
		"userid"	"short"		//player being voted against
	}
	"vote_failed"
	{
		"userid"	"short"		//player being voted against
	}
	"vote_for_server"
	{
		"userid"	"short"		//player voting for server
	}
	"you_can't_vote"
	{
		"userid"	"short"
	}
	"vote_yes_registered"
	{
		"userid"	"short"		//player voting
	}
	"vote_already_yes"
	{
		"userid"	"short"		//player voting
	}
	"vote_already_no"
	{
		"userid"	"short"		//player voting
	}
	"vote_changed_to_yes"
	{
		"userid"	"short"		//player voting
	}
	"vote_changed_to_no"
	{
		"userid"	"short"		//player voting
	}
	"vote_no_registered"
	{
		"userid"	"short"		//player voting
	}
	"vote_not_valid"
	{
		"userid"	"short"		//player voting
	}
	"vote_already_running"
	{
		"userid"	"short"		//player voting
	}
	"cant_vote_self"
	{
		"userid"	"short"		//player voting
	}
	"map_change_notification"
	{
		"newMapName"	"string" //map to change to
	}
	"vote_map_in_progress"
	{
		"newMapName"	"string" //map to change to
	}
	"vote_map_failed"
	{
	}
	"not_valid_mapname"
	{
		"newMapName"	"string" //map to change to
		"userid"		"short"	//ID of voter
	}
	"already_on_that_map"
	{
		"newMapName"	"string" //map to change to
		"userid"		"short"	  //ID of voter
	}
	"in_arcade_mode"
	{
		"userid"		"short"	//ID of voter
	}
	"no_vote_running"
	{
		"userid"		"short"//ID of voter
	}
	"not_valid_mode"
	{
		"newModeName"	"string" //Mode to change to
		"userid"		"short"  //ID of voter
	}
	"already_in_that_mode"
	{
		"newModeName"	"string" //Mode to change to
		"userid"		"short"  //ID of voter
	}
	"vote_mode_failed"
	{
		"newModeName"	"string" //Mode to change to
	}
	"mode_change_notification"
	{
		"newModeName"	"string" //Mode to change to
	}
	"vote_mode_in_progress"
	{
		"newModeName"	"string" //Mode to change to
	}
	"current_map"
	{
		"currentMap"	"string"
		"userid"	"short"
	}
	"current_mode"
	{
		"userid"	"short"
	}
	"votemode_disabled"
	{
		"userid"	"short"
	}
	"votekick_disabled"
	{
		"userid"	"short"
	}
	"votemap_disabled"
	{
		"userid"	"short"
	}
	"Votes_tally"
	{
		"neededVotes"	"short"
		"yesVotes"	"short"
		"noVotes"	"short"
	}
	"Votes_final"
	{
		"yesVotes"	"short"
		"noVotes"	"short"
	}
	"Votes_tally_enough"
	{
		"yesVotes"	"short"
		"noVotes"	"short"
	}
	"not_enough_players"
	{
		"userid"	"short"
	}
	"vote_too_soon"
	{
		"userid"	"short"
		"time"		"short"
	}
		
//////////////////////////////////////////////////////////////////////
// STATS EVENTS
//////////////////////////////////////////////////////////////////////
	"stat_top_kill"
	{
		"kill_rank"		"byte"		// Rank of this kill in round - e.g. 1st (best), 2nd, 3rd...
		"killer_name"	"string"	// Name of player who made the kill
		"weapon"		"short"		// Weapon Type used
		"money"			"short"		// MFK awarded
	}
	
	"stat_show_top_kills"
	{
		"time"	"short"		// Number of seconds for which to show list of top kills
	}
	
//////////////////////////////////////////////////////////////////////
// SINGLE PLAYER EVENTS
//////////////////////////////////////////////////////////////////////
	"player_in_room"
	{
		"userid"	"short"		// user ID of player
		"roomID"	"long"		// room ID for the room the player has entered
	}
	"person_bribed"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of person that has been bribed
	}
	"person_damaged"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of person that has been damaged
	}
	"item_picked_up"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of item entity that has been picked up
	}
	"item_found"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of item entity that has been found
	}
	"item_used"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of item entity that has been used
	}
	"talked_to_person"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of person entity that has been talked to
	}
	"item_given"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of item entity that has been given
	}
	"at_location"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of location entity the player is at
	}
	"item_damaged"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of item entity that has been damaged
	}
	"time_limit_exceeded"
	{
		"userid"	"short"		// user ID of player
	}
	"person_killed"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of entity that has been killed
	}
	"person_poisoned"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of entity that has been poisoned
	}
	"person_drugged"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of entity that has been drugged
	}
	"sp_hint"
	{
		"text"	"string"		// text of the hint to be shown
	}
	"csi_menu_show"
	{
		"userid"	"short"		// user ID of player
		"name"		"string"	// the name of the CSI Menu shown
	}
	"objective_complete"
	{
		// no data
	}
	"objectives_updated"
	{
		// no data
	}
	"mission_failed"
	{
		// no data
	}
	"mission_complete"
	{
		// no data
	}
	
//////////////////////////////////////////////////////////////////////
// CLIENT-SIDE ONLY EVENTS
//////////////////////////////////////////////////////////////////////
	"cl_player_outfit_changed"
	{
	}
	"cl_player_features_changed"
	{
	}
	"cl_quarry_memory_updated"
	{
	}
}
