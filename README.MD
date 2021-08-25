# Quake 1 Survival Coop
A simple mod for Quake 1.

## Rules
* Respawn becomes unavailable after...
	* A player is seen by an enemy
	* A player picks up a key/rune
* Dead players will be put into spectator mode
* The map restarts once all players are dead

## Installation
Git clone and compile with [FTE QCC](https://fte.triptohell.info/downloads).\
Make sure `progs.dat` is inside a `survival` folder in your Quake 1 root folder.\
Launch with `+game survival` and start a coop game like normal.\
\
If you are using the [Bethesda Quake 1 rerelease](https://store.steampowered.com/app/2310) you can start a local split-screen coop game with these launch commands `+game survival +deathmatch 0 +coop 1 +maxplayers 2 +cl_localplayers 2 +map start`