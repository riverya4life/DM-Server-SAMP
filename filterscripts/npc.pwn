/*
	NPC System Copy Trinity RP by - Sanya - (vk.com/s.disa2013)
	Боты копировались с помощью скрипта CarRec by OpcodeXe (youtube.com/watch?v=Cws5pUdMiGs)
*/
#include <a_samp>
#define public:%0(%1) forward%0(%1); public%0(%1)
#define MAX_BOTS (30)
new NPC_Name[MAX_PLAYERS][MAX_PLAYER_NAME];
new NPC_ID[MAX_BOTS];
new NPC_Time[MAX_BOTS];
new NPC_Car[MAX_BOTS];
new NPC_Number[MAX_BOTS];
new NPC_City[MAX_BOTS];

public OnFilterScriptInit()
{
	SetTimer("NPC_Timer", 1000, true);

	ConnectNPC("busdriver_1","busdriver_ls");
	NPC_Car[0] = AddStaticVehicle(437, 10000, 10000, 0, 0, 7, 53);
	NPC_Number[0] = 0;
	NPC_City[0] = 0;

	ConnectNPC("busdriver_2","busdriver_ls");
	NPC_Car[1] = AddStaticVehicle(437, 10000, 10000, 0, 0, 3, 80);
	NPC_Number[1] = 1;
	NPC_Time[1] = 150;
	NPC_City[1] = 0;

	ConnectNPC("busdriver_3","busdriver_sf");
	NPC_Car[2] = AddStaticVehicle(437, 10000, 10000, 0, 0, 6, 61);
	NPC_Number[2] = 0;
	NPC_City[2] = 1;

	ConnectNPC("busdriver_4","busdriver_sf");
	NPC_Car[3] = AddStaticVehicle(437, 10000, 10000, 0, 0, 16, 44);
	NPC_Number[3] = 1;
	NPC_Time[3] = 120;
	NPC_City[3] = 1;
	
	ConnectNPC("busdriver_5","busdriver_lv");
	NPC_Car[4] = AddStaticVehicle(437, 10000, 10000, 0, 0, 27, 4);
	NPC_Number[4] = 0;
	NPC_City[4] = 2;
	
	ConnectNPC("busdriver_6","busdriver_lv");
	NPC_Car[5] = AddStaticVehicle(437, 10000, 10000, 0, 0, 174, 149);
	NPC_Number[5] = 1;
	NPC_Time[5] = 120;
	NPC_City[5] = 2;
	return 1;
}

public: NPC_Timer()
{
	for(new i; i < MAX_BOTS; i++)
	{
		if(!NPC_Time[i]) continue;
		NPC_Time[i]--;
		if(!NPC_Time[i]) PutPlayerInVehicle(NPC_ID[i], NPC_Car[i], 0);
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	if(!IsPlayerNPC(playerid)) return 1;
	GetPlayerName(playerid, NPC_Name[playerid], MAX_PLAYER_NAME);
	if(GetString(NPC_Name[playerid], "busdriver_2")) NPC_ID[1] = playerid;
	else if(GetString(NPC_Name[playerid], "busdriver_4")) NPC_ID[3] = playerid;
	else if(GetString(NPC_Name[playerid], "busdriver_6")) NPC_ID[5] = playerid;
	return 1;
}

public OnPlayerSpawn(playerid)
{
	if(!IsPlayerNPC(playerid)) return 1;
	SetPlayerPos(playerid, 10000, 10000, 0);
	if(GetString(NPC_Name[playerid], "busdriver_1"))
	{
		SetPlayerSkin(playerid, 220);
	    SetPlayerColor(playerid, 0x33AA33FF);
		PutPlayerInVehicle(playerid, NPC_Car[0], 0);
	}
	else if(GetString(NPC_Name[playerid], "busdriver_2"))
	{
		SetPlayerSkin(playerid, 220);
	    SetPlayerColor(playerid, 0x33AA33FF);
	}
	else if(GetString(NPC_Name[playerid], "busdriver_3"))
	{
		SetPlayerSkin(playerid, 220);
	    SetPlayerColor(playerid, 0x33AA33FF);
		PutPlayerInVehicle(playerid, NPC_Car[2], 0);
	}
	else if(GetString(NPC_Name[playerid], "busdriver_4"))
	{
		SetPlayerSkin(playerid, 220);
	    SetPlayerColor(playerid, 0x33AA33FF);
	}
	else if(GetString(NPC_Name[playerid], "busdriver_5"))
	{
		SetPlayerSkin(playerid, 220);
	    SetPlayerColor(playerid, 0x33AA33FF);
		PutPlayerInVehicle(playerid, NPC_Car[4], 0);
	}
	else if(GetString(NPC_Name[playerid], "busdriver_6"))
	{
		SetPlayerSkin(playerid, 220);
	    SetPlayerColor(playerid, 0x33AA33FF);
	}
	return 1;
}

public: GetNPC_CarID(npc)
{
	return NPC_Car[npc];
}

public: GetNPC_Number(npc)
{
	return NPC_Number[npc];
}

public: GetNPC_City(npc)
{
	return NPC_City[npc];
}

public: GetNPC_Count()
{
	return 6;
}

stock GetString(param1[], param2[])
{
	return !strcmp(param1, param2, false);
}
