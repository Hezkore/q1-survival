# Quake 1 Survival Coop
Survival coop mod for Quake 1.

## Rules
* Respawn becomes unavailable after
	* A player is seen by an enemy
	* A player picks up a key/rune
* Dead players will be put into spectator mode
* The map restarts once all players are dead
### Nightmare rules
* Maximum player health is limited to 25

## Installation
### Via release
Download the [latest release](../../releases).\
Extract to your Quake 1 root folder.\
Launch with `+game survival` _(or type `game survival` in the console)_ and start a coop game like normal.


### Via source
Git clone and compile with [FTE QCC](https://fte.triptohell.info/downloads).\
Place your compiled `progs.dat` in a folder labeled `survival` in your Quake 1 root folder.\
Launch with `+game survival` _(or type `game survival` in the console)_ and start a coop game like normal.

## Notes
If you are using the [Bethesda Quake 1 rerelease](https://store.steampowered.com/app/2310); you can start a local split-screen coop game with these launch commands:\
`+game survival +deathmatch 0 +coop 1 +maxplayers 2 +cl_localplayers 2 +map start`