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
	"player_death"
	{
		"userid"		"short"
		"attacker"		"short"
		"assistant"		"short"
		"weapon"		"string"
		"headshot"		"bool"
		"dmgbits"		"short"
	}

	"player_spawn"
	{
		"entindex"		"short"
	}

	"player_connected"	// Client Connected
	{
		"name"			"string"
	}

	"player_disconnected"	// Client Disconnected
	{
		"name"			"string"
		"flag"			"short"
		"reason"		"string"
	}

	"map_change"	// On Map Change
	{
		"map"			"string"	// Mapname
	}

	"zombie_lives"	// Zombie lives
	{
		"count"			"byte"
	}

	"ambient_play"
	{
		"sound"			"string"
		"entity"		"short"
		"fade"			"bool"
	}

	"force_song"	// Used by the hammer entity logic_music
	{
		"song"			"string"	// File path for the song
		"title"			"string"	// Custom song title
	}

	"ambient_as"	// Used by Angelscript
	{
		"sound"			"string"
	}
	
	"armmodel_as"	// Used by Angelscript
	{
		"player"		"short"
		"model"			"string"
	}

	"spawned_player"
	{
		"name"			"string"
	}

	"reset_arms"
	{
		"entindex"			"short"
	}

	"discord_callstatusupdate"
	{
		"clientid"		"short"
		"hostname"		"string"
		"serverip"		"string"
		"serverport"	"string"
		"model"			"string"
	}
	
	"angelscript_callevent"		// When the AS calls the function CallEvent()
	{
		"clientid"		"short"
		"typeid"		"short"
		"msg"			"string"
	}

	"cleanupmap"		// When the server calls CleanUpMap(), it will tell the client todo the same for temp and client sided entities
	{
	}

	"round_begins"		// Round has begun
	{
	}

	"round_win"			// Round has ended
	{
		"mapname"		"string"
		"humanwin"		"bool"
	}

	"gravity_change"
	{
		"newgravity"	"float"
	}

	"spec_target_updated"
	{
	}

	"achievement_earned"
	{
		"userid"	"short"
		"achid"		"string"
		"achtitle"	"string"
	}

	"zp_washuman"		// The player was a human player before we turned into zombie team (Only applies if there is no zombie lives left, or if the zombies won)
	{
		"userid"		"short"
	}

	"zp_infected"		// Calls whenver someone got infected
	{
		"userid"		"short"
	}

	"zp_entitypickedup"		// Calls whenever a button is pressed, or if an item is picked up
	{
		"entkey"		"string"	// Entity Key
	}

	"general_hint"
	{
		"userid"		"short"		// The player who activated it
	}

	"movement_hint"
	{
		"userid"		"short"		// The player who needs the hint
	}

	"movement_hint_success"
	{
		"userid"		"short"		// The player succeeded
	}

	"gameinstructor_draw"
	{
	}

	"gameinstructor_nodraw"
	{
	}

	"set_instructor_group_enabled"
	{
		"group"		"string"
		"enabled"	"short"
	}

	"instructor_tutor"		// Called from the instructor tutorial
	{
		"userid"					"long"
		"entindex"					"long"
		"strbind"					"string"
		"strmsg"					"string"
		"icon_onscreen"				"string"
		"icon_offscreen"			"string"
		"nooffscreen"				"bool"
		"posx"						"int"
		"posy"						"int"
	}

	"instructor_server_hint_create" //create a hint using data supplied entirely by the server/map. Intended for hints to smooth playtests before content is ready to make the hint unneccessary. NOT INTENDED AS A SHIPPABLE CRUTCH
	{
		"hint_name"					"string"	// what to name the hint. For referencing it again later (e.g. a kill command for the hint instead of a timeout)
		"hint_replace_key"			"string"	// type name so that messages of the same type will replace each other
		"hint_target"				"long"		// entity id that the hint should display at
		"hint_instance"				"long"		// the hint instance
		"hint_activator_userid"		"short"		// userid id of the activator
		"hint_timeout"				"short"	 	// how long in seconds until the hint automatically times out, 0 = never
		"hint_icon_onscreen"		"string"	// the hint icon to use when the hint is onscreen. e.g. "icon_alert_red"
		"hint_icon_offscreen"		"string"	// the hint icon to use when the hint is offscreen. e.g. "icon_alert"
		"hint_caption"				"string"	// the hint caption. e.g. "#ThisIsDangerous"
		"hint_activator_caption"	"string"	// the hint caption that only the activator sees e.g. "#YouPushedItGood"
		"hint_color"				"string"	// the hint color in "r,g,b" format where each component is 0-255
		"hint_icon_offset"			"float"		// how far on the z axis to offset the hint from entity origin
		"hint_range"				"float"		// range before the hint is culled
		"hint_flags"				"long"		// hint flags
		"hint_binding"				"string"	// bindings to use when use_binding is the onscreen icon
		"hint_allow_nodraw_target"	"bool"		// if false, the hint will dissappear if the target entity is invisible
		"hint_nooffscreen"			"bool"		// if true, the hint will not show when outside the player view
		"hint_forcecaption"			"bool"		// if true, the hint caption will show even if the hint is occluded
		"hint_local_player_only"	"bool"		// if true, only the local player will see the hint
	}

	"instructor_server_hint_stop" //destroys a server/map created hint
	{
		"hint_name"					"string"	// The hint to stop. Will stop ALL hints with this name
	}

	"instructor_survivor_supply"
	{
		"hint_player"				"long"		// entity id that the hint will display for
		"hint_target"				"long"		// entity id that the hint should display at
		"hint_caption"				"string"	// the hint caption. e.g. "#ThisIsDangerous"
	}

	"logicrounds_start"	// Called when the round has started (from logic_rounds)
	{
	}

	"logicrounds_end"	// Called when the round ends (from logic_rounds)
	{
	}
	
	"set_text"
	{
		"txt"		"string"
	}
	
// Client side VoteController talking to HUD
	"vote_ended"
	{
	}
	
	"vote_generic_created"
	{
	}
	
	"vote_generic_clr"
	{
		"option"		"string"
		"red"			"long"
		"green"			"long"
		"blue"			"long"
	}
	
	"vote_started"
	{
		"issue"				"string"
		"param1"			"string"
		"team"				"byte"
		"initiator"			"long" // entity id of the player who initiated the vote
	}
	
	"vote_changed"
	{
		// Default voting
		"vote_option1"			"byte"
		"vote_option2"			"byte"
		"vote_option3"			"byte"
		"vote_option4"			"byte"
		"vote_option5"			"byte"
		
		// YesNo voting
		"yesVotes"				"byte"
		"noVotes"				"byte"
		
		"potentialVotes"		"byte"
	}
	
	"vote_passed"
	{
		"details"		"string"
		"param1"		"string"
		"team"			"byte"
	}
	
	"vote_failed"
	{
		"team"			"byte"
	}
	
	"vote_cast"
	{
		"vote"			"byte"	// yes/no vote
		"team"			"byte"
		"entityid"		"long"	// entity id of the voter
	}
}
