#if defined _fixobject_included
	#endinput
#endif
#define _fixobject_included

stock fo_CreateDynamicObject(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid = -1, interiorid = -1, playerid = -1, Float:streamdistance = 300.0, Float:drawdistance = 300.0, areaid = -1, priority = 0)
{
    if(streamdistance < 100.0) streamdistance = 100.0;
	else if(streamdistance > 600.0) streamdistance = 600.0;
    return CreateDynamicObject(modelid, x, y, z, rx, ry, rz, worldid, interiorid, playerid, streamdistance, drawdistance, areaid, priority);
}
#if defined _ALS_CreateDynamicObject
	#undef CreateDynamicObject
#else
	#define _ALS_CreateDynamicObject
#endif
#define CreateDynamicObject fo_CreateDynamicObject

public OnGameModeInit()
{
    Streamer_SetVisibleItems(STREAMER_TYPE_OBJECT, 1000);
    #if defined fo_OnGameModeInit
		return fo_OnGameModeInit();
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif
#if defined fo_OnGameModeInit
	forward fo_OnGameModeInit();
#endif
#define OnGameModeInit fo_OnGameModeInit

public OnFilterScriptInit()
{
    Streamer_SetVisibleItems(STREAMER_TYPE_OBJECT, 1000);
    #if defined fo_OnFilterScriptInit
		return fo_OnFilterScriptInit();
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnFilterScriptInit
	#undef OnFilterScriptInit
#else
	#define _ALS_OnFilterScriptInit
#endif
#if defined fo_OnFilterScriptInit
	forward fo_OnFilterScriptInit();
#endif
#define OnFilterScriptInit fo_OnFilterScriptInit
