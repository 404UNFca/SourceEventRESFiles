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
// Player events
//////////////////////////////////////////////////////////////////////
	
	"player_team"				// player change his team
	{
		"userid"	"short"		// user ID on server
		"team"		"byte"		// team id
		"oldteam"	"byte"		// old team id
	}
	
	"player_squad"				// a player changed his class
	{
		"userid"	"short"		// user ID on server
		"squad"		"short"		// squad id
		"slot"		"short"		// slot id
		"oldsquad"	"short"		// old squad id
		"oldslot"	"short"		// old slot id
	}
	
	"player_death"				// a game event, name may be 32 charaters long
	{
		"userid"	"short"   	// user ID who died				
		"attacker"	"short"	 	// user ID who killed
		"type"		"byte"		// type of death
		"nodeath"	"bool"		// true if death messages were off when player died
	}
	
	"player_spawn"				// player spawned in game
	{
		"userid"	"short"		// user ID on server
		"team"		"byte"		// team spawned as
		"dead"		"bool"		// true when spawned dead to the game
	}

	"player_hurt"				// player has been hurt
	{
		"userid"		"short"		// user ID on server
		"attacker"		"short"		// user ID on server of the attacker
		"dmg_health"	"short"		// lost health points
		"hitgroup"		"short"			// Hit groups
		"weapon"		"string"		// Weapon name, like WEAPON_AK47
	}

	"player_changename"
	{
		"userid"	"short"		// user ID on server
		"oldname"	"string"	// players old (current) name
		"newname"	"string"	// players new name
	}
	
//////////////////////////////////////////////////////////////////////
// Comms events
//////////////////////////////////////////////////////////////////////

	"comms_event"				// A player used the comms system
	{
		"userid"	"short"		// user ID on server
		"groupid"	"short"		// comms group id
		"optionid"  "short"		// comms option id
	}
	
	"comms_waypoint"			// A player used the comms system to place a waypoint
	{
		"userid"	"short"		// user ID on server
		"posx"		"float"		// x position of the waypoint
		"posy"		"float"		// y position of the waypoint
		"posz"		"float"		// z position of the waypoint
	}
	
//////////////////////////////////////////////////////////////////////
// Squad events
//////////////////////////////////////////////////////////////////////	

	"squad_order"
	{
		"squad"		"long"		// squad ID on client
		"update"	"bool"		// updated
	}

//////////////////////////////////////////////////////////////////////
// Game events
//////////////////////////////////////////////////////////////////////

	"game_newmap"				// send when new map is completely loaded
	{
		"mapname"	"string"	// map name
	}
	
	"game_squadupdate"
	{
		"teamid"	"byte"		// which team has changed
	}

	"round_reset"
	{
		// nothing?
	}
	
	"round_end"
	{
		"winner"	"byte"		// which team won
	}	
	
	"round_unfrozen"
	{
		// nothing?	
	}
	
//////////////////////////////////////////////////////////////////////
// misc events
//////////////////////////////////////////////////////////////////////	
	
	"gravity_change"
	{
		"newgravity"	"float"
	}	
}