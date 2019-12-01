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
		"userid"	"short"   	// user ID who died
		"attacker"	"short"	 	// user ID who killed
		"assistid"	"short"		// user ID of kill assister
		"weapon"	"string" 	// weapon name killed used
		"special"	"bool"		// special attack
		"grail"		"bool"		// grail graced kill
		"suiassist"	"bool"		// suicide assist
		"kicksuiassist"	"bool"	// suicide assist by kick
		"headshot"	"bool"		// headshot
		"debuffed"	"bool"		// killed player was debuffed?
		"nemesis"	"bool"		// attacker is nemesis of the victim?
		"revenge"	"bool"		// attacker killed their nemesis?
		"isatkrbot" "bool"
		"isvictimbot" "bool"
	}

	"player_changeteam"
	{
		"userid"	"short"		// user ID who changed team
		"oldteam"	"short"		// Team number of previous team
		"newteam"	"short"		// Team number of new team
	}

	"player_changeclass"
	{
		"userid"	"short"		// user ID who changed class
		"old_class"	"short"		// class ID of old class
		"new_class"	"short"		// class ID of new class
	}


	"player_spawn"
	{
		"userid"	"short"		// user ID who just spawned
	}

	"player_objective"
	{
		"userid"	"short"		// user ID of person who did objective
		"groupids"	"string"	// string of user IDs for a list of players doing an objective
		"assistid"	"short"		// user ID of any assistant with objective (0 means unused)
		"enemyid"	"short"		// user ID of possible enemy (0 means unused)
		"extra"		"string"	// string of extra data that is placed in #EXTRA# section of the score string
		"text"		"string"	// text to append to the userid's name ( The string is searched and uses: #I# is userid, #ASSIST# is assistid, and #ENEMY# is enemyid )
	}

	"player_points"
	{
		"userid"	"short"		// user ID of person who gained points
		"points"	"float"		// Points the user earned
		"sid"		"short"		// Score ID (These are the indices of the different specific scoring metrics, for example: killing someone who stole your chest recently)
	}

	"player_stats_updated"
	{
		"forceupload"	"bool"
	}

	"player_nemesis"
	{
		"userid"	"short" // user ID of player who caused the nemesis
		"victim"	"short" // user ID of player who was the victim
		"isbot"		"bool" // whether the player is a bot
		"dominations"	"short" // how many players is attacker already dominating
	}
	
	"player_nemesis_overkill"
	{
		"userid"	"short" // user ID of the nemesis
		"victim"	"short" // user ID of dominated player that was killed again
		"overkills"	"short"	// total count of overkills
	}

	"player_revenge"
	{
		"userid"	"short" //user ID of player who achieved revenge
		"victim"	"short" //user ID of player who was the nemesis
		"overkills"	"short"	// how many times nemesis killed victim after dominating
	}

	"npc_death"
	{
		"userid"	"short"   	// user ID whose parrot/npc died
		"attacker"	"short"	 	// user ID who killed
		"weapon"	"string" 	// weapon name killed used
		"special"	"bool"		// special attack
		"type"		"string"	// classname of the npc entity (npc_parrot/npc_vulture)
	}

	"player_hurt"
	{
		"userid"	"short"
		"health"	"short"
		"priority"	"short"
		"attacker"	"short"
		"damagetype" "long"
	}

	"player_jump"
	{
		"userid"	"short"		// user ID of player who jumped
	}

	"player_special"
	{
		"userid"	"short"		// user ID of player who used their special
		"duration"	"float"		// how long this special is expected to last in seconds
		"warmup"	"float"		// if special has a warmup (eg. Man-at-Arms), this is duration of it in seconds
	}

	"player_special_full"
	{
		"userid"	"short"		// user ID of player whose special bar is full
	}

	"player_throw_explosive"
	{
		"userid"	"short"		// user ID of player who tossed it
		"weapon"	"string"	// explosive type tossed (is the weapon name like powderkeg)
	}

	"player_bomb_explode"
	{
		"userid"	"short"		// user ID of player who tossed it
		"victims"	"string"	// aray of chars representing user IDs of players who were hit (if any)
		"weapon"	"string"	// explosive type (is weapon name like powderkeg)
		"damage"	"float"		// How much total damage was done
		"debuffed"	"bool"		// did it hit a debuffed player
	}

	"player_melee_swing"
	{
		"userid"	"short"		// user ID of player who swung
		"victims"	"string"	// array of chars representing user IDs of players who were hit (if any)
		"weapon"	"string"	// weapon that was swung
		"atkdir"	"short"		// melee attack direction
		"damage"	"float"		// how much damage was dealt total with the swing
		"hitper"	"float"		// what percentage of the swing arc hit actual targets
		"debuffed"	"bool"		// did it hit a debuffed player
	}

	"player_fire_projectile"
	{
		"userid"	"short"		// user ID of player who fired it
		"weapon"	"string"	// projectile type fired (is the weapon name like longbow)
		"ducking"	"bool"		// was the player ducking
	}

	"player_ranged_impact" //This also is fired when a powderkeg or chest hits a player. The weapon will be thrownkeg or chest
	{
		"userid"	"short"		// user ID of player who fired
		"victim"	"short"		// entindex of entity that was hit (if any)
		"weapon"	"string"	// weapon that was fired
		"damage"	"float"		// how much damage was dealt, if 0 obviously missed or blocked by shield if victim is set
		"headshot"	"bool"		// headshot
		"debuffed"	"bool"		// was the victim debuffed
	}

	"player_special_hit"
	{
		"userid"	"short"		// user ID of attacker
		"victim"	"short"		// user ID of victim
		"damage"	"float"		// how much damage was dealt
		"debuffed"	"bool"		// was the victim debuffed
		"type"		"short"		// special damage type, possible values are: 0 = skirmlunge 1 = shieldcharge, 2 = spearcharge, 3 = hkspecial, 4 = fart
	}

	"player_perfect_parry"
	{
		"userid"	"short" 	// user ID of player who performed a Perfect Parry
		"attacker"	"short" 	// user ID of the attacker
	}

	"player_counter_attack"
	{
		"userid"	"short"		// User ID of player who performed a counter-attack
	}

	"player_shield_damage"
	{
		"userid"		"short"		// User ID of player whose shield took damage
		"attacker"		"short"		// User ID of attacker
		"strength"		"short"		// New shield strength
		"maxstrength"	"short"		// Maximum shield strength
		"damage"		"short"		// Absolute damage amount. (Includes damage if shield strength WOULD be negative)
		"ranged"		"bool"		// Was attack a ranged weapon
	}
	
	"player_roll"
	{
		"userid"	"short"	// user ID of person who rolled
	}
	
	"player_kick"
	{
		"userid"	"short"		// user ID of player who kicked
		"victim"	"short"		// user ID of the player that was kicked, 0 if missed or not a player
		"entindex"	"short"		// entindex of the ent that was hit, 0 if missed
		"damage"	"float"		// how much damage was dealt, 0 if missed
	}

	"player_debuff"
	{
		"userid"	"short" // user ID of player who got debuffed
		"attacker"	"short"	// if player, user ID of attacker. else entindex
	}

	"player_debuff_end"
	{
		"userid"	"short" // user ID of player who was debuffed
	}

	"player_fart_end"
	{
		// Fired when MAA special fully ends (no clouds lingering)
		"userid"	"short"
	}

	"player_poisoned"
	{
		"userid"	"short" // user ID of player who got poisoned
		"attacker"	"short"	// user ID of attacker
		"duration"	"float" // how long the poison lasts
	}

	"player_hunter"
	{
		"userid"	"short"
	}

	"player_hunter_end"
	{
		"userid"	"short"
	}

	//For the next two events, to best detect these you would listen for the player_ranged_impact and trigger on your player's userid matching
	//store the victim id and then listen for a player_ranged_impale. If one comes within a short time with the same victim id you know it was your
	//player who impaled him and you will know what weapon was used.

	//It is the same for projectile_bounce just in reverse. You would listen for the bounce first then the player_ranged_impact if you wanted to know
	//that a player was ballin' and bounced the projectile off a surface for the kill

	"player_ranged_impale"	//Fired when a player is impaled to a surface with a ranged weapon (only client-side)
	{
		"victim"	"short"		// user ID of player who was impaled
	}

	"projectile_bounce" // Fired when a projectile has bounced off a surface
	{
		"userid"	"short"		// user ID of player who shot this projectile
		"weapon"	"string"	// weapon that was fired
	}

	"projectile_pickup"
	{
		"userid"	"short"		// user ID of player who picked up this projectile
		"type"		"short"		// model type
	}

	"player_healtheffect" // Fired when a player has a health effect applied to him, Food Pickups, Freebooter Poison
	{
		"userid"	"short" // user ID of player who is having the health effect applied to
		"health"	"float" // the health amount being added per second
		"duration"	"float" // how long this effect will last. Total health change for this effect is (health * duration)
		"type"		"short" // type of the effect
	}

	"keg_flintlockhit" // Someone shot a keg with Skirmisher flintlock
	{
		"userid"	"short" // user ID of player who shot it
	}

	"item_pickup"
	{
		"userid"	"short" // user ID of player who picked up this item
		"type"		"short"	// type of pickup, 0 = Food, 1 = Armor, 2 = Ranged Ammo (Since you have userid you can get specific type of armor/ammo from the team number of that player)
		"event_id" 	"long"
	}

	"chest_pickup"
	{
		"userid"		"short"	// user ID of player who picked up the chest
		"chestid"		"short" // entity index of the chest that was picked up
		"last_owner"	"byte"  // Team Number of the last owner of this chest; 2 = Pirates, 3 = Vikings, 4 = Knights (Last zone it was in essentially, if not in a zone initially it will be 1)
		"captured"	"bool"	// true if the chest was owned by a team before it was picked up
	}

	"chest_drop"
	{
		"userid"		"short" // user ID of player who dropped the chest
		"chestid"		"short"	// entity index of the new chest that was dropped
		"oldid"			"short"	// index of the old chest that was being carried. Chests get a new index every drop because of code to reduce latency in dropping them.
		"last_owner"	"byte"	// Team Number of the last owner of this chest; 2 = Pirates, 3 = Vikings, 4 = Knights (Last zone it was in essentially, if not in a zone initially it will be 1)
		"bashid"		"short" // user ID of the player (if any) that bashed the carrier to cause him to drop it
	}

	"chest_capture"
	{
		"userid"		"short" // user ID of player who captured this chest
		"cappers"		"string" // array of entindices for capturer (always first) and assisters
		"chestid"		"short" // index of the chest that was captured
		"last_owner"	"short" // team that owned this chest previously, 0 if none
	}
	
	//This event fires after the chest counts are incremented
	"chest_postcapture"
	{
		"userid"		"short" // user ID of player who captured this chest
		"chestid"		"short" // index of the chest that was captured
		"new_owner"		"short" //team that now owns this chest
		"chestcount"	"short" // new chest count of team that captured
	}

	"chest_respawn"
	{
		"chestid"	"short" // entity index of the chest that respawned back to its owner
	}

	"chest_special"
	{
		"userid"		"short" // user ID of player who initiated the special
		"chestid"		"short"	// index of the chest that this special was performed with
	}
	
	"flag_capture"
	{
		"userid"		"short" // user ID of player who captured this flag
		"flagid"		"short" // index of the flag that was captured
	}
	
	"flag_drop"
	{
		"userid"	"short"		// user ID of player who dropped the flag
		"team"		"short"		// team of player who dropped the flag
		"killerid"	"short"		// user ID of player who killed the flag carrier
	}
	
	"flag_pickup"
	{
		"team"		"short"		// Team whose flag was picked up
		"userid"	"short"		// user ID of player who picked up the flag
	}

	"grail_pickup"
	{
		"team"		"short"		// Team whose trinket was picked up
		"userid"	"short"		// user ID of player who picked up trinket
		"victim"	"short"		// user ID of player who was killed to get trinket, otherwise 0
		"assistid"	"short"		// user ID of player who assisted in killing the victim if was a non-kill pickup will always be 0
		"initial"	"bool"		// true on round start
	}

	//Does not fire a drop if the carrier was killed and his attacker automatically recieved the grail because a grail_pickup will instead fire containing this same info except he will be the victim not userid.
	"grail_drop"
	{
		"userid"	"short"		// user ID of player who dropped trinket
		"team"		"short"		// team of player who dropped trinket
		"killerid"	"short"		// user ID of player who killed the trinket carrier
	}

	"grail_grace"
	{
		"userid"	"short"		// user ID of player who is getting grace points
	}

	"grail_despawn"
	{
		"team"	"short"			// team whose trinket despawned
	}

	"trinket_heal"
	{
		"team"		"short"		// team whose trinket this is
		"amount"	"short"		// total amount healed to teammates by the trinket
	}

	"round_end"
	{
		"winner"	"short"
	}

	"gamemode_suddendeath_begin" //Sudden Death has been entered in Last Team Standing
	{
		"plpirate"	"short"	// Number of players that are left alive
		"plviking"	"short"
		"plknight"	"short"
	}
	
	"gamemode_lts_death" // A player died in LTS mode
	{
		"team"		"short"	// Team of the player who died
		"palive"	"short"	// Pirates alive
		"valive"	"short"	// Vikings alive
		"kalive"	"short"	// Knights alive
	}

	"gamemode_roundrestart" //The round is restarting
	{
		//Nada
	}

	"gamemode_matchpoint"
	{
	}

	"gamemode_overtime"
	{
	}

	"gamemode_firstround_wait_begin" // Fired when the game starts the Waiting for Players time period when first playing a new map
	{
	}

	"gamemode_firstround_wait_end" // Fired when the game ends the Waiting for Players time period when first playing a new map
	{
		"plpirate"	"short" // Number of players on Pirates when this is fired
		"plviking"	"short" // Number of players on Vikings when this is fired
		"plknight"	"short" // Number of players on Knights when this is fired
	}
	
	"gamemode_territory_enter"
	{
		"userid"	"short"	// user ID of player who entered territory
		"tindex"	"short" // entindex of the territory that was entered
	}
	
	"gamemode_territory_exit"
	{
		"userid"	"short"	// user ID of player who exited territory
		"tindex"	"short" // entindex of the territory that was exited
	}

	"gamemode_territory_capture"
	{
		"userids"	"string"		// Each character is the user id of a player who captured it
		"team"		"short"			// Team that captured
		"tindex"	"short"			// entindex of the territory that was captured
		"territory"	"short"			// Territory index, don't confuse with "tindex"
		"pcontrol"	"short"			// Number of territories owned by Pirates after the capture
		"vcontrol"	"short"			// Number of territories owned by Vikings after the capture
		"kcontrol"	"short"			// Number of territories owned by Knights after the capture
		"event_id"	"long"			// Event ID
	}

	"gamemode_territory_guard"
	{
		"userid"	"short"		// user ID of player getting guard points
	}

	"gamemode_territory_contested"
	{
		"team"		"short"		// Team whose territory is contested
		"tindex"	"short"		// Territory entity index
		"territory"	"short"		// Territory index, don't confuse with "tindex"
		"event_id"	"long"		// Event ID
	}

	"gamemode_territory_unoccupied"
	{
		"team"		"short"		// Team that previously owned the territory
		"tindex"	"short"		// Territory that became unoccupied
		"territory"	"short"		// Territory index, don't confuse with "tindex"
		"event_id"	"long"		// Event ID
	}

	"gamemode_territory_uncontested"
	{
		"team"		"short"		// Team that previously owned the territory
		"tindex"	"short"		// Territory that became unoccupied
		"territory"	"short"		// Territory index, don't confuse with "tindex"
		"event_id"	"long"		// Event ID
	}

	"gamemode_booty_winning"
	{
		"team"	"short"		// Team that is currently about to win
	}

	"gamemode_booty_chestzone_enter"
	{
		"userid"	"short"		// Who entered the chestzone?
		"team"		"short"		// Which team owns this chestzone?
		"timer"		"float"		// How many tickets are left for the team that owns it
		"chests"	"short"		// Amount of chests in the zone
	}

	"gamemode_booty_chestzone_exit"
	{
		"userid"	"short"		// Who exited the chestzone?
		"team"		"short"		// Which team owns this chestzone?
		"timer"		"float"		// How many tickets are left for the team that owns it
		"chests"	"short"		// Amount of chests in the zone
		"duration"	"float"		// How long did the player stay inside the zone?
	}

	"gamemode_tdm_30sec" // Fired when TDM match has only 30 secs left
	{
	}

	"gamemode_tdm_10sec" // Fired when TDM match has only 10 secs left
	{
	}

	"gamemode_tdm_bonus_start"
	{
		"type"	"short"
		"goal"	"short"
		"duration"	"float"
	}

	"gamemode_tdm_bonus_end"
	{
		"type"	"short"
		"goal"	"short"
		"duration"	"float"
	}

	"gamemode_tdm_bonus_add"
	{
		"userid"	"short"
		"count"		"short"
		"goal"		"short"
	}

	"gamemode_tdm_bonus_completed"
	{
		"userid"	"short"
	}
	
	"gamemode_ctf_30sec" // Fired when CTF match has only 30 secs left
	{
	}

	"gamemode_ctf_10sec" // Fired when CTF match has only 10 secs left
	{
	}

	"gamemode_countdown"
	{
		"secs"		"short"
	}

	"game_end"
	{
	}

	// These two "match" events are fired on all games, not just in "mp_matchbased 1" servers
	"match_start"
	{
		"event_id" "long"
	}

	"match_end"
	{
		"winner"	"short"
		"wins_p"	"short"
		"wins_v"	"short"
		"wins_k"	"short"
	}

	"match_clinched"
	{
		"team"		"short"
	}
	
	"update_mvp_panel"
	{
		"winner"	"short"
		"pid_1"		"short"
		"pid_2"		"short"
		"pid_3"		"short"
		"pscore_1"	"short"
		"pscore_2"	"short"
		"pscore_3"	"short"
		"pdmg_1"	"float"
		"pdmg_2"	"float"
		"pdmg_3"	"float"
	}

	"spec_target_updated"
	{
	}

	"leaderboard_leader_alert"
	{
		"player"		"byte"
		"boardid"		"short"
	}

	"reputation_rank_earned"
	{
		"player"		"byte"
		"repid"			"short"
		"rank"			"short"
	}

	"achievement_earned"
	{
		"player"	"byte"		// entindex of the player
		"achievement"	"short"		// achievement ID
	}

	"achievement_event_almost"
	{
		"achievement_name"	"string"
		"my_val"			"short"
		"req_val"			"short"
	}

	"achievement_event"
	{
		"achievement_name"	"string"
		"cur_val"			"short"
		"max_val"			"short"
	}

	"achievement_event_comp"
	{
		"achievement_name"	"string"
		"cur_val"			"short"
		"max_val"			"short"
		"comp_val"			"short"
	}

	"rank_awarded"
	{
		"userid"	"short"
		"amount"	"short"
	}
	
	//Client-side event for initiating the frozen part of the death cam
	"freezecam_started"
	{
	}

	//The freeze frame has been taken
	"freezecam_freeze"
	{
	}

	//Starts the death cam up and begins zooming towards the killer
	"show_freezepanel"
	{
		"killer"			"short"	//entindex
	}

	//Death cam finished event client-side only
	"hide_freezepanel"
	{
	}

	// Client-side event when the player starts blocking
	"localplayer_melee_start_block"
	{
	}

	// Client-side event when the player starts a charged attack
	"localplayer_melee_start_charge"
	{
	}

	// Client-side event when the player releases an attack
	"localplayer_melee_attack"
	{
		"charge"		"float"	// Amount of charge
	}

	// Client-side event when the player performs a shield bash
	"localplayer_melee_shield_bash"
	{
	}

	// Client-side event when the player looks towards an entity
	"localplayer_spotted_entity"
	{
		"entindex"		"short"	// Entity index of spotted entity
	}
	
	// Client-side event for recorded bookmarks on demos
	"demo_bookmark"
	{
		"tick"	"short" // Bookmarked tick
	}
	
	"rank_message"
	{
		"value"	"short"
		"data"	"long"
	}

	"item_respawn"
	{
		"event_id" "long"
		"dtype" "long"
	}
}
