void() restart =
{
	about_to_restart = FALSE;
	respawn_promise_broken = FALSE;
	localcmd ("restart\n");
};

void() announce_restart =
{
	bprint ("All players dead, restarting in ");
	bprint (ftos(time_to_restart));
	bprint (" seconds\n");
};

void() respawn =
{
	// ignore all respawn attempts by spectators
	if (self.deadflag == DEAD_SPECTATE)
	{
		return;
	}
	
	if (coop)
	{
		// make a copy of the dead body for appearances sake
		CopyToBodyQue (self);

		// only allow respawn if there are monsters
		// and if no monsters has been killed
		if (!respawn_promise_broken)
		{
			// get the spawn parms as they were at level start
			setspawnparms (self);
			// respawn
			PutClientInServer ();
		}
		else
		{
			PutClientAsSpecator ();
		}
	}
	else if (deathmatch)
	{
		// make a copy of the dead body for appearances sake
		CopyToBodyQue (self);
		// set default spawn parms
		SetNewParms ();
		// respawn
		PutClientInServer ();
	}
	else
	{	// restart the entire server
		//localcmd ("restart\n");
		restart (); // might as well use this instead
	}
};

void() RestartIfAllDead =
{
	if (coop && respawn_promise_broken && !about_to_restart)
	{
		local entity	plr;
		plr = find (world, classname, "player");
		while (plr)
		{	// check if any player has health above 0
			if (plr.deadflag == DEAD_NO && plr.health > 0)
			{
				return;
			}
			plr = find (plr, classname, "player");
		}
		
		about_to_restart = TRUE;
		
		// wait for restart message
		local entity	restart_msg_timer;
		restart_msg_timer = spawn ();
		restart_msg_timer.nextthink = time + 1;
		restart_msg_timer.think = announce_restart;
		
		// wait for for level restart
		local entity	restart_timer;
		restart_timer = spawn ();
		restart_timer.nextthink = time + time_to_restart + 1;
		restart_timer.think = restart;
	}
};

void() PutClientAsSpecator =
{
	self.deadflag = DEAD_SPECTATE;
	
	self.classname = "spectator";
	self.health = 100;
	self.takedamage = DAMAGE_NO;
	self.solid = SOLID_NOT;
	self.movetype = MOVETYPE_NOCLIP;
	self.show_hostile = 0;
	self.max_health = 100;
	self.flags = FL_CLIENT;
	self.air_finished = time + 12;
	self.dmg = 2;   		// initial water damage
	self.super_damage_finished = 0;
	self.radsuit_finished = 0;
	self.invisible_finished = 0;
	self.invincible_finished = 0;
	self.effects = 0;
	self.invincible_time = 0;

	player_run ();
	
	self.currentammo = 0;
	self.weaponmodel = "";
	self.weaponframe = 0;

	self.attack_finished = time;
	self.th_pain = player_pain;
	self.th_die = PlayerDie;
	
// paustime is set by teleporters to keep the player from moving a while
	self.pausetime = 0;
	
//	spot = SelectSpawnPoint ();

	self.fixangle = TRUE;		// turn this way immediately

// oh, this is a hack!
	setmodel (self, "progs/eyes.mdl");

	setmodel (self, "progs/eyes.mdl");

	setsize (self, VEC_HULL_MIN, VEC_HULL_MAX);
	
	self.view_ofs = '0 0 22';

	player_stand1 ();
};