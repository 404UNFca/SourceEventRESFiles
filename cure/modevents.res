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
		"weapon"	"string" 	// weapon name killed used 
		
		"inflictor"	"long" //needed for sacrifice
	}
	
	"zombie_killed"				// a game event, name may be 32 charaters long
	{
		"entindex_killed" 	"long"
		"entindex_attacker"	"long"
		"entindex_inflictor"	"long"
		"damagebits"		"long"
		
		"victimClassname"		"string"
		"attackerClassname"		"string"
		"inflictorClassname"		"string"
		"ammoName"	"string"
		"zombieType"	"short"
	}
	
	"game_win"				// a game event, name may be 32 charaters long
	{
		"strMapName"	"string"	// the map name the game was won on
		"difficulty"	"short"   	// the difficulty
		"wave"			"long"		//for survival the wave number
		"livingplayers"	"short"   	//for survival last man
	}
	
	"game_reset"				// a game event, name may be 32 charaters long
	{
		"difficulty"	"short"   	// the difficulty			 
	}
	
	"game_diff_change"				// a game event, name may be 32 charaters long
	{
		"difficulty"	"short"   	// the difficulty			 
	}
	
	"special_condition"				// a game event, name may be 32 charaters long
	{
		"condType"	"short"   	// id of the special condition
		"playerID"	"short"	 	// user ID who killed
	}
	
	"achievement_earned"				// a game event, name may be 32 charaters long
	{
		"player"	"long"	// the map name the game was won on
		"achievement"	"long"   	// the difficulty			 
	}
	
	"achievement_earned_local"				// a game event, name may be 32 charaters long
	{
		"player"	"long"	// the map name the game was won on
		"achievement"	"long"   	// the difficulty			 
	}
	
}
