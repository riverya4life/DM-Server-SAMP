#define FILTERSCRIPT

#include <a_samp>

new TimerRespawnVehicle;

IsVehicleOccupied(vehicleid)
{
	for(new i; i < GetMaxPlayers(); i++)
	{
		if(!IsPlayerConnected(i)) continue;
		if(IsPlayerInVehicle(i,vehicleid)) return true;
	}
	return false;
}


public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if(hittype == BULLET_HIT_TYPE_VEHICLE){
		if(!IsVehicleOccupied(hitid)){
			new panels, doors, lights, tires, Float:health;
			GetVehicleDamageStatus(hitid, panels, doors, lights, tires);
			switch(random(3)){
			case 0: panels = encode_panels(1, 1, 1, 1, 3, 3, 3);
			case 1: doors = encode_doors(4, 4, 4, 4);
			case 2: lights = encode_lights(1, 1, 1, 1);
			}
			GetVehicleHealth(hitid, health);
			SetVehicleHealth(hitid, (health -(weaponid * 1)));
			UpdateVehicleDamageStatus(hitid, panels, doors, lights, tires);
		}
	}
	return true;
}

public OnFilterScriptInit()
{
	TimerRespawnVehicle = SetTimer("RespawnVehicle",60000*5, true);
	return true;
}

public OnFilterScriptExit()
{
	KillTimer(TimerRespawnVehicle);
	return true;
}


forward RespawnVehicle();
public RespawnVehicle(){
	for(new i = NULL; i <= MAX_VEHICLES; i++){
		if(i == INVALID_VEHICLE_ID) continue;
		if(!IsVehicleOccupied(i))  SetVehicleToRespawn(i);
	}
	return true;
}

encode_lights(light1, light2, light3, light4) return light1 | (light2 << 1) | (light3 << 2) | (light4 << 3);
encode_doors(bonnet, boot, driver_door, passenger_door)return bonnet | (boot << 8) | (driver_door << 16) | (passenger_door << 24);
encode_panels(flp, frp, rlp, rrp, windshield, front_bumper, rear_bumper) return flp | (frp << 4) | (rlp << 8) | (rrp << 12) | (windshield << 16) | (front_bumper << 20) | (rear_bumper << 24);

