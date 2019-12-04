# SourceRESFiles
Contains any event-related .res files from Source Engine games compatible with SourceMod. Very useful for engine-specific plugin development.

## Regarding Garry's Mod
SourceMod no longer supports Garry's Mod (hasn't for years) but it's got a res file so I'm including it any way.

## Currently missing event .RES files for
*Some of these mods don't have an events article on the AlliedModders Wiki [but do have EngineVersion support](https://sm.alliedmods.net/new-api/halflife/EngineVersion) in SourceMod*
- Dark Messiah
- Bloody Good Time
- E.Y.E. Divine Cybermancy
- Blade Symphony
- Contagion
- Black Mesa Multiplayer
- Day of Infamy
- Half-Life 2: Capture the Flag
- Neotokyo
- Iron Grip: Source
- SourceForts
- Perfect Dark: Source
- Hidden: Source
- Empires
- Dystopia
- DOTA 2
- ~~The Ship~~
- ~~Codename Cure~~
- ~~Pirates, Vikings & Knights II~~
- ~~Zombie Panic! Source~~
- ~~No More Room in Hell~~

## Easiest way to locate .RES files
`.res` files can be in one of two places in most cases. For this example, we'll use Team Fortress 2;

**1.** `C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\tf2_misc_dir.vpk`

Within the `resource` folder inside `tf2_misc_dir.vpk` are all the `.res` files for that game. The usual file you're looking for will be called `modevents.res`, although in some cases the name can be different, such as Black Mesa: Source where the file is also called `gameevents.res`, sharing the same name as the Half-Life 2 shared resource's `gameevents.res` file.

**2.** `C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\hl2\hl2_misc_dir.vpk`

Within the `resource` folder inside `hl2_misc_dir.vpk` are all the `.res` files for Half-Life 2. The usual four you'll find in any game's `hl2` shared resources are `gameevents.res`, `hltvevents.res`, `replayevents.res` and `serverevents.res`. This may vary from game to game.

There are also some cases where the `.res` files are instead stored directly inside a game's resource folder, i.e. `C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\resource` *(however in the case of Team Fortress 2, this is not the case as all `.res` files are stored within the `tf2_misc_dir.vpk` file)*.

**If the `.res` files are inside a folder:** Navigate to wherever the mod's files are stored, i.e. `C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf` and search for `*events.res`.

**If the `.res` files are inside a `.vpk` file:** Use GCFScape to view the contents of the `.vpk` file. Also use GCFScape's built-in search functionality to search for `events.res` with `Match:` field set to `substring` and case sensitive unchecked.
