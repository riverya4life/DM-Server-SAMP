//=============================[ ������� ]=============================//
#include <a_samp>
#include <streamer>
#include <sscanf2>
#include <foreach>
#include <YSF>
#include <a_mysql>
#include <core>
#include <float>
#include <Pawn.CMD>
#include <dynamicmaps>
#include ../library/Includes/a_vehiclenames
//=============================[ ��������� ���� ]=============================//
//�������� �������
#define SERVER_NAME			"Trinity"
#define SERVER_NUMBER		"1"
#define SERVER_VERSION		"0.6"
//������ �� ��
#define MYSQL_HOST			"127.0.0.1"
#define MYSQL_USER      	"root"
#define MYSQL_DB        	"trinity"
#define MYSQL_PASSWORD  	""
//=============================[ ���������� ]=============================//
//===[ ���������� (TextDraw) ]===//
new Text:Select_TD[5];//���������� ������
new Text:Logo;//�������
new Text:GOLOD[6];
new Text:CarName_Global[2];//�������� ���� ����� ����� �������
new Text:GreenZone_TD;//������� ����
new Text:Black_Background[2];//������ ������ ������ � �����
new PlayerText:Time_TD[MAX_PLAYERS][2];//����� ������� ��� ������
new PlayerText:CarName_Player[MAX_PLAYERS];//�������� ���� ����� ����� �������
//===[ ���������� (Other) ]===//
new gruzrazlv;
new kassalv[2];
new razdevalkalv[2];
new PortedlvName[3][32] = {"�����", "�����", "�����"};
new kassirlv;
new bool:ActorHandsuplv[MAX_ACTORS];
new PortedlsName[3][32] = {"�������", "�������", "�������"};
new kassirls;
new bool:ActorHandsupls[MAX_ACTORS];
new gruzrazls;
new gruzrazsf;
new razdevalkals[2];
new kassals[2];
new kassasf[2];
new razdevalkasf[2];
new PortedsfName[3][32] = {"��������", "��������", "��������"};
new kassirsf;
new bool:ActorHandsupsf[MAX_ACTORS];
forward Kicker(playerid);
new Iterator:Admins<MAX_PLAYERS>;
new str_fmt[4096];//���������� ������ (��� ���� ����� �� �������� ����)
new mysql;//id ����
new Actor[MAX_ACTORS];//��� ������
new ActorTalk[MAX_ACTORS];//����� �� �������� � ������� (1 �� | 0 ���)

new Float:random_camera[9][10] =//������� ��������� ����� ��� ������� �� ������ <<<, >>> � �.�
{
	{404.5463, -1898.4084, 1.0087, 539.2126, -1870.7793, 8.7474, 388.4152,-1898.5267,-2.7097,281.5944},
	{328.3336, -1517.8082, 72.3909, 462.9807, -1570.3113, 39.3040, 304.3750,-1535.4847,36.0391,0.0000},
	{-1698.4014, 801.5182, 60.0339, -1762.9686, 850.9774, 33.5006, -1683.3479,812.9704,53.1904,76.2890},
	{-1802.7817, -2283.4885, 66.8412, -1795.1852, -2424.5564, 54.9615, -1802.4427,-2275.8540,57.4756,177.9034},
	{-1698.4014, 801.5182, 60.0339, -1762.9686, 850.9774, 33.5006, -1683.3479,812.9704,53.1904,76.2890},
	{328.3336, -1517.8082, 72.3909, 462.9807, -1570.3113, 39.3040, 304.3750,-1535.4847,36.0391,0.0000},
	{-281.7087, 1345.1073, 84.1129, -159.2082, 1157.7959, 25.5689, -290.2365,1356.0061,67.0294,226.0638},
	{2093.7422, 1174.9044, 23.1826, 2033.4520, 1317.3606, 15.1298, 2094.1260,1169.5430,14.5625,22.8758},
	{-2680.4614, -295.5879, 40.2937, -2734.5061, -136.1472, 10.7261, -2682.4434,-307.8390,33.7551,0.2651}
};
enum cityinfo
{
	CityName[30],//�������� ������
	Float:CityCamPos[6],//������� ������ ��� ������������
	Float:CityCamPlayerPos[3]//������� ������ ��� ���������������� � ����
}
new CityInfo[3][cityinfo] =//����� ������ ��� �����������
{
	{"~y~US of Arcadia", {1757.4297, -1139.1707, 85.4141, 1617.2888, -1065.3325, 85.4141}, {1757.4297,-1139.1707,105.4141}},
	{"~g~Aurora Federation", {-1340.3208, 737.4349, 45.4765, -1554.3126, 741.5575, 91.1096}, {-1340.3208,737.4349,65.4765}},
	{"~r~Respublica Constantia", {2115.5767, 2153.9744, 13.4077, 2212.3984, 2133.8354, 55.3012}, {2115.5767,2153.9744,33.4077}}
};

new RegSkins[][] =//����� ��� �����������
{
	{233, 151, 214, 150, 41, 131, 40, 148, 65, 9, 13, 76, 169, 225, 224, 263},//�������
    {188, 59, 101, 202, 47, 30, 48, 184, 7, 19, 21, 28, 210, 229, 57, 60}//�������
};
enum pickup
{
	pModel,
	pText[32],
	Float:pPos[3],
	Float:pPosEnter[4],
	pInterior,
	pVirtualWorld,
	pInteriorEnter,
	pVirtualWorldEnter,
	pID
}
enum pinfo//������ ������
{
	tRegPassword[16],//������ ��� �����������
	tRegSex,//��� ��� �����������
	tRegReferal[20],//������� ��� �����������
	tRegCity,//����� ��� �����������
	tRegSkin,//���� ��� �����������
	tLoginAttempts,//������� ��� �����������
	tGPS,//������� �� GPS
	tSelectedActor,//��������� ���
	tSelectedTD,//��������� ��� ����������
	tTimer,//������ ������
	tLoginTime,//����� �� �����������
	tBrightnessColor,//������� ����������
	tBikeArend,//������������ �����
	tAFK,//� ��� �� �����
	bool:tGreenZone,//� ������� ���� �� �����
    tGreenZoneTime,//����� �������� ������������ ����� ������� ����
    Text3D:tDescriptionLabel,//3� ����� �������� ���������
    bool:tDescriptionUpdate,//���������� 3� ������ �������� ���������
    tCameraObject,//������ ������
	tCameraStage,//���� ������
	tPlaneObject,//������ �������� ��� �����������
 	tFreezeTime,// ������ ���������
	bool:tLogged,//������������� �� �����
	bool:tSpawned,//��������� �� �����
	pID,//�� ������
	pName[MAX_PLAYER_NAME],//��� ������
	pPassword[16],//������ ������
	pLevel,//������� ������
	pSex,//��� ������
	pCity,//����� ������
	pSkin,//���� ������
	pMoney,//������ ������
	pDescription[100],//�������� ������
	pAdmin,
	pAdminPassword,
}
new pInfo[MAX_PLAYERS][pinfo];//���������� ������� ������

enum bikearend
{
	Float:ArendPos[3],//������� ������
	Float:ArentPosTP[4]//������� �� ��� ������
}
new BikeArend[][bikearend] =//������ �������
{
	{{1630.3879, -2260.1016, 12.4941}, {1626.8546, -2261.1504, 13.0838, 90.0}},//LS Spawn
	{{-1451.1064, -271.2626, 13.1484}, {-1455.3387, -272.7280, 13.7350, 244.7559}},//SF Spawn
	{{1703.4656, 1392.9520, 9.6866}, {1708.5726, 1388.7473, 10.2336, 313.9955}}//LV Spawn
};

enum busstop
{
	City,
	Float:MiniMapPos[4],
	DynamicMap:MiniMapObject,
	Point:MiniMapPosObject[2]
}
new BusStop[][busstop] =//���������� ���������
{
    //LS ��������
	{0, {1665.764526, -2245.958984, 14.168700, 270.0}},
    //LS �������� ������
	{0, {2562.261963, -2239.712646, 14.303400, 0.0}},
	//SF ��������
	{1, {-1398.946777, -314.338013, 14.751200, 270.0}},
	//SF ������
	{1, {-1887.928955, -1747.380737, 22.312599, 180.0}},
	//LV �����
	{2, {1723.729004, 1534.459595, 11.591400, 0.0}},
	//LV �������������
	{2, {2484.060059, 1960.976685, 11.303800, 360.0}}
};

enum greenzone
{
	Float:gPos[4],
	gWorld,
	gInterior,
	gZone
}
new GreenZone[][greenzone] =//������� ����
{
	{{1553.0988, -2170.8477, 1809.9324, -2405.7610}, 0, 0}
};

new BrightnessColors[][] =//����� ������� ��� ���������� CarName_Player
{
	{0xFFFFFF00, 0x00000000},
	{0xFFFFFF11, 0x00000011},
	{0xFFFFFF22, 0x00000022},
	{0xFFFFFF33, 0x00000033},
	{0xFFFFFF44, 0x00000044},
	{0xFFFFFF55, 0x00000055},
	{0xFFFFFF66, 0x00000066},
	{0xFFFFFF77, 0x00000077},
	{0xFFFFFF88, 0x00000088},
	{0xFFFFFF99, 0x00000099},
	{0xFFFFFFAA, 0x000000AA},
	{0xFFFFFFBB, 0x000000BB},
	{0xFFFFFFCC, 0x000000CC},
	{0xFFFFFFDD, 0x000000DD},
	{0xFFFFFFEE, 0x000000EE},
	{0xFFFFFFFF, 0x000000FF},
	{0xFFFFFFEE, 0x000000EE},
	{0xFFFFFFDD, 0x000000DD},
	{0xFFFFFFCC, 0x000000CC},
	{0xFFFFFFBB, 0x000000BB},
	{0xFFFFFFAA, 0x000000AA},
	{0xFFFFFF99, 0x00000099},
	{0xFFFFFF88, 0x00000088},
	{0xFFFFFF77, 0x00000077},
	{0xFFFFFF66, 0x00000066},
	{0xFFFFFF55, 0x00000055},
	{0xFFFFFF44, 0x00000044},
	{0xFFFFFF33, 0x00000033},
	{0xFFFFFF22, 0x00000022},
	{0xFFFFFF11, 0x00000011},
	{0xFFFFFF00, 0x00000000}
};

//=============================[ �������/������� ]=============================//
#define PN(%0) pInfo[%0][pName]
#define public:%0(%1) forward%0(%1); public%0(%1)
#define void%0[%1]; static %0[%1]; %0[0] = EOS;
public: PlayKick(playerid) Kick(playerid);
#define Kick(%0) SetTimerEx("PlayKick", 500, false, "d", %0)
#define SCM	SendClientMessage
#define SCMf SendClientMessagef
#define SPD	ShowPlayerDialog
//=============================[ ����� ]=============================//
#define COLOR_GREY 						0xAFAFAFFF
#define COLOR_GREEN 					0x34C924FF
#define COLOR_PURPLE 					0xC2A2DAFF
#define COLOR_YELLOW 					0xFFCC00FF
#define COLOR_RED 						0xbd8471aAA
#define COLOR_ORANGE 					0xff7c00AA
#define COLOR_WHITE 					0xFFFFFFFF
#define COLOR_GOLD                      0xFFD700FF
#define COLOR_BLUE                      0x94B0C1FF
#define COLOR_LIME                      0x10F441FF
//=============================[ ������� ]=============================//
main(){}
public OnPlayerConnect(playerid)
{
	    NullPlayer(playerid);//��������� ������
		new pname[MAX_PLAYER_NAME], string[22 + MAX_PLAYER_NAME];
        GetPlayerName(playerid, pname, sizeof(pname));
        format(string, sizeof(string), "%s ����������� � �������.", pname);
        SendAdminMessage(COLOR_GREY, string);

	GetPlayerName(playerid, pInfo[playerid][pName], 25);//������ ���� � ������
	
    TextDrawShowForPlayer(playerid, Logo);//����������� ��������

    SetPlayerColor(playerid, 0xFFFFFFAA);
	for(new u; u < 6; u++)
	TextDrawShowForPlayer(playerid, GOLOD[u]);
	
	CreatePlayerTextDraws(playerid);//�������� ����������� ��� ������
	RemoveObjectForPlayer(playerid);//�������� �������� ��� ������
	
	EnablePlayerCameraTarget(playerid, 1);
	
	format(str_fmt, 144, "SELECT * FROM `accounts` WHERE `NickName` = '%s' LIMIT 1", PN(playerid));
	mysql_tquery(mysql, str_fmt, "CheckPlayerAccount", "i", playerid);//�������� ��������������� �� �����

	for(new i; i < 30; i++) SCM(playerid, COLOR_GREY, "�");

	if(pInfo[playerid][pAdmin] >= 1) Iter_Add(Admins,playerid);
	
	pInfo[playerid][tTimer] = SetTimerEx("PlayerTimer", 1000, true, "i", playerid);//������ ������
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
	if(pInfo[playerid][tBikeArend] != -1) DestroyVehicle(pInfo[playerid][tBikeArend]);
	if(pInfo[playerid][tCameraObject] != -1) DestroyPlayerObject(playerid, pInfo[playerid][tCameraObject]);
	if(pInfo[playerid][tPlaneObject] != -1) DestroyPlayerObject(playerid, pInfo[playerid][tPlaneObject]);
	KillTimer(pInfo[playerid][tTimer]);//������ ������
	NullPlayer(playerid);//��������� ������� ������
	if(pInfo[playerid][pAdmin] >= 1) Iter_Remove(Admins,playerid);
	new pname[MAX_PLAYER_NAME], string[39 + MAX_PLAYER_NAME];
        GetPlayerName(playerid, pname, sizeof(pname));
        switch(reason)
        {
                case 0: format(string, sizeof(string), "%s ���������� �� �������.", pname);
        }
        SendAdminMessage(COLOR_GREY, string);
        return 1;
}
public: CheckPlayerAccount(playerid)
{
	if(IsPlayerNPC(playerid)) return 1;
	pInfo[playerid][tLoginTime] = gettime() + 90;
    PlayerPlaySound(playerid, 1187, 0.0, 0.0, 0.0);
	SetPlayerVirtualWorld(playerid, playerid + 50);//����������� ��� ��� ���� ����� ������ �� ������ ���� ����� ��� �����������/�����������
	SCMf(playerid, COLOR_GREY, "{F5DEB3}����� ����������, %s. ��������, ��� �� ������ ��������� ����� � ���.", PN(playerid));
	
	//���� ����� �� ������ � ����
	if(!cache_get_row_count(mysql)) return SPD(playerid, 1, DIALOG_STYLE_INPUT, "{34C924}"SERVER_NAME" GTA", "\n{FFFFFF}������������ ��� �� ����� �������. ��� ��� �������� � �������� ��� �����������.\n\n ������ ��� ���������� ��������� ������ � ������ ��� � ����, ����������� ����:\n ", "�����", "�����");

    pInfo[playerid][pID] = cache_get_field_content_int(0, "ID", mysql);//������ ��� ������ � ������
	cache_get_field_content(0, "Password", pInfo[playerid][pPassword], mysql);//������ ������ � ������
 	SPD(playerid, 2, DIALOG_STYLE_PASSWORD, "{34C924}"SERVER_NAME" GTA", "{FFFFFF}������������ ��� �� ����� �������. ������� � ������ ����� ��� ���-�� ���������������.\n���� ��� ��� ������� � �� ������ ������ �� ����, ������� ��� � ����, ������������� ����.\n\n���� �� �� ��������� ���������� ����� ��������, �� ������ ����� �� ���� �������� {abcdef}/q{ffffff},\n�������� ��� � ���� sa-mp ������� � ���������������� ����� ������� �� ����� �������.\n\n���� ��� ��� ������� � �� ������ ������, ��� ������� ��� � �������� �������� email �����\n������������� ���, �� ������ ����� � ���� ������ ������, ����� {fbec5d}HELP{ffffff} � ���� ��� �����.\n\n{FF8282}�������, ��� ��� ����� ������������� ������ ����� 5-� ���, ��� IP ����� ����� �������.", "�����", "");
	return 1;
}
public: OnPlayerRegisterMysql(playerid)
{
    pInfo[playerid][pID] = cache_insert_id(mysql);
	OnPlayerLogin(playerid);
    return 1;
}
public: OnPlayerLoginMysql(playerid)
{
    pInfo[playerid][pID] = cache_get_field_content_int(0, "ID", mysql);
    pInfo[playerid][pLevel] = cache_get_field_content_int(0, "Level", mysql);
    pInfo[playerid][pSkin] = cache_get_field_content_int(0, "Skin", mysql);
    pInfo[playerid][pCity] = cache_get_field_content_int(0, "City", mysql);
    pInfo[playerid][pMoney] = cache_get_field_content_int(0, "Money", mysql);
    pInfo[playerid][pAdmin] = cache_get_field_content_int(0, "Admin", mysql);
    pInfo[playerid][pAdminPassword] = cache_get_field_content_int(0, "AdminPassword", mysql);
    cache_get_field_content(0, "Description", pInfo[playerid][pDescription], mysql);
    PlayerTextDrawSetString(playerid, Time_TD[playerid][1], GetTime(1));
    PlayerTextDrawSetString(playerid, Time_TD[playerid][0], GetTime(2));
	for(new i; i < 2; i++) PlayerTextDrawShow(playerid, Time_TD[playerid][i]);
    pInfo[playerid][tLogged] = true;
	SetPlayerScore(playerid, pInfo[playerid][pLevel]);
	SetPlayerMoney(playerid, pInfo[playerid][pMoney]);
    PlayerSpawn(playerid);
	if(strlen(pInfo[playerid][pDescription])) SCMf(playerid, 0xF5DEB3FF, "���� ��������: {FFFFFF}%s", pInfo[playerid][pDescription]);
    return 1;
}
public OnPlayerRequestClass(playerid,classid)
{
	SetSpawnInfo(playerid, 255, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0);
	if(IsPlayerNPC(playerid)) return 1;
	if(pInfo[playerid][tLogged]) return PlayerSpawn(playerid);
	SetPlayerRandomCamera(playerid);
    return 0;
}
public OnPlayerRequestSpawn(playerid)
{
	if(IsPlayerNPC(playerid)) return 1;
	if(!pInfo[playerid][tLogged]) return 0;
	return 1;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new uncorrect;
	for(new i; i < strlen(inputtext); i++)//������ �� ����� ������� � �.�
	{
		if(inputtext[i] == '%')
		{
			inputtext[i] = '#';
			uncorrect = 1;
		}
		else if(inputtext[i] == '\\')
		{
			inputtext[i] = '#';
			uncorrect = 1;
		}
		else if(inputtext[i] == '{' && inputtext[i+7] == '}')
		{
			strdel(inputtext, i, i+8);
			uncorrect = 1;
		}
	}
	if(dialogid == 104)
	{
		if(!response) return 1;
		SetPlayerSkin(playerid, pInfo[playerid][pSkin]);
		GivePlayerMoney(playerid, (GetPVarInt(playerid,"porter")-1)*10);
		DeletePVar(playerid, "porter");
		DisablePlayerCheckpoint(playerid);
	}
	if(dialogid == 105)
	{
		if(!response) return 1;
		SetPlayerSkin(playerid, pInfo[playerid][pSkin]);
  		GivePlayerMoney(playerid, (GetPVarInt(playerid,"porterls")-1)*10);
		DeletePVar(playerid, "porterls");
		DisablePlayerCheckpoint(playerid);
	}
		if(dialogid == 106)
	{
		if(!response) return 1;
		SetPlayerSkin(playerid, pInfo[playerid][pSkin]);
		DeletePVar(playerid, "porterlv");
		DisablePlayerCheckpoint(playerid);
	}
	switch(dialogid)
	{
	    case 1:
	    {
	        if(!response)
	        {
	            SCM(playerid, 0xF5DEB3FF, "�� �������, �� �������� ������� ��� ����� �� ����� �������.");
	            SetPlayerRandomCamera(playerid);
	            Kick(playerid);
	            return 1;
	        }
	        if(!strlen(inputtext)) return SPD(playerid, 1, DIALOG_STYLE_INPUT, "{34C924}"SERVER_NAME" GTA", "\n{FFFFFF}������������ ��� �� ����� �������. ��� ��� �������� � �������� ��� �����������.\n\n ������ ��� ���������� ��������� ������ � ������ ��� � ����, ����������� ����:\n ", "�����", "�����");
			if(strlen(inputtext) > 16)
			{
				SCM(playerid, COLOR_GREY, "������������ ����� ������ {33aa33}16{afafaf} ��������, ���������� ������ ��������.");
				SPD(playerid, 1, DIALOG_STYLE_INPUT, "{34C924}"SERVER_NAME" GTA", "\n{FFFFFF}������������ ��� �� ����� �������. ��� ��� �������� � �������� ��� �����������.\n\n ������ ��� ���������� ��������� ������ � ������ ��� � ����, ����������� ����:\n ", "�����", "�����");
				return 1;
			}
			if(uncorrect)
			{
				SCM(playerid, COLOR_GREY, "{F5DEB3}������ ����� �������� ������ �� ���������� ��� ������� ���� � ����.");
				SPD(playerid, 1, DIALOG_STYLE_INPUT, "{34C924}"SERVER_NAME" GTA", "\n{FFFFFF}������������ ��� �� ����� �������. ��� ��� �������� � �������� ��� �����������.\n\n ������ ��� ���������� ��������� ������ � ������ ��� � ����, ����������� ����:\n ", "�����", "�����");
				return 1;
			}
			SPD(playerid, 3, DIALOG_STYLE_MSGBOX, "{34C924}"SERVER_NAME" GTA", "{FFFFFF}��������� ����� ����� ����� ���� ������ ���������", "�������", "�������");
			SetString(pInfo[playerid][tRegPassword],inputtext);
	    }
	    case 2:
	    {
	        if(!response || !strlen(inputtext)) return SPD(playerid, 2, DIALOG_STYLE_PASSWORD, "{34C924}"SERVER_NAME" GTA", "{FFFFFF}������������ ��� �� ����� �������. ������� � ������ ����� ��� ���-�� ���������������.\n���� ��� ��� ������� � �� ������ ������ �� ����, ������� ��� � ����, ������������� ����.\n\n���� �� �� ��������� ���������� ����� ��������, �� ������ ����� �� ���� �������� {abcdef}/q{ffffff},\n�������� ��� � ���� sa-mp ������� � ���������������� ����� ������� �� ����� �������.\n\n���� ��� ��� ������� � �� ������ ������, ��� ������� ��� � �������� �������� email �����\n������������� ���, �� ������ ����� � ���� ������ ������, ����� {fbec5d}HELP{ffffff} � ���� ��� �����.\n\n{FF8282}�������, ��� ��� ����� ������������� ������ ����� 5-� ���, ��� IP ����� ����� �������.", "�����", "");
	       	if(strlen(inputtext) > 16) return SPD(playerid, 5, DIALOG_STYLE_MSGBOX, " ", "{afafaf}������������ ����� ������ {33aa33}16{afafaf} ��������.", "X", "");
			if(!GetString(pInfo[playerid][pPassword], inputtext))
			{
			    pInfo[playerid][tLoginAttempts]--;
			    if(!pInfo[playerid][tLoginAttempts])
			    {
					SCM(playerid, 0xD8A903FF, "�� ��������� ���������� ����� ������� ����� � �������. ��� IP ����� ������������ � ����� ������������.");
					SCM(playerid, 0xD8A903FF, "���������� ����� ������������� ����� ����� {ffffff}10{D8A903} �����, � �� ������� ���������� ���� ���� �� ����� �������.");
                	TogglePlayerControllable(playerid, false);
					SetPlayerPos(playerid, 1410.9698,-1625.3530,43.0128);
					SetPlayerFacingAngle(playerid, 214.6142);
					SetPlayerCameraPos(playerid, 1422.7959, -1631.9661, 50.4452);
					SetPlayerCameraLookAt(playerid, 1495.0242, -1656.5164, 30.8696);
					Kick(playerid);
			        return 1;
			    }
			    format(str_fmt, 200, "{afafaf}�� ����� ������������ ������. �������� {FF8282}%d{afafaf} �������.",pInfo[playerid][tLoginAttempts]);
			    SPD(playerid, 5, DIALOG_STYLE_MSGBOX, " ", str_fmt, "X", "");
			    return 1;
			}
			SCM(playerid, COLOR_GREY, "{FFFFFF}� ������������, �� ������� ����� � ���� �������.");
			OnPlayerLogin(playerid);
	    }
	    case 3:
		{
   			SPD(playerid, 630, DIALOG_STYLE_LIST, "{34C924}��� �� ������ � ����� �������?", "� �� ���� ��� �� ���� ��������\n������� �� YouTube\n������� ���������\n������� � ������������\n������� � ������ ������\n����� ������ �� ������� hosted\n� ����� �� ������ ��������\n��� �� ������ ��� ������� �� �������\n����� �������� ��� � ���� ������", "�����", "");
			pInfo[playerid][tRegSex] = response;
		}
		case 5: SPD(playerid, 2, DIALOG_STYLE_PASSWORD, "{34C924}"SERVER_NAME" GTA", "{FFFFFF}������������ ��� �� ����� �������. ������� � ������ ����� ��� ���-�� ���������������.\n���� ��� ��� ������� � �� ������ ������ �� ����, ������� ��� � ����, ������������� ����.\n\n���� �� �� ��������� ���������� ����� ��������, �� ������ ����� �� ���� �������� {abcdef}/q{ffffff},\n�������� ��� � ���� sa-mp ������� � ���������������� ����� ������� �� ����� �������.\n\n���� ��� ��� ������� � �� ������ ������, ��� ������� ��� � �������� �������� email �����\n������������� ���, �� ������ ����� � ���� ������ ������, ����� {fbec5d}HELP{ffffff} � ���� ��� �����.\n\n{FF8282}�������, ��� ��� ����� ������������� ������ ����� 5-� ���, ��� IP ����� ����� �������.", "�����", "");
		case 68:
		{
			new city = pInfo[playerid][pCity];
			ApplyActorAnimation(Actor[city], "ON_LOOKERS", "wave_loop", 4.0, 0, 0, 0, 0, 0);
			ApplyAnimation(playerid, "PED", "roadcross_gang", 4.1, 1, 0, 0, 0, 0);
			SetCameraToActor(playerid, Actor[city], 5);
			
		    if(city == 0) SCMf(playerid, 0x00BFFFFF, "Francesco Schettino �������: ��, %s, ������� �� ���. � ���� ���� ��� ���� ���������� �����������.", PN(playerid));
		    else if(city == 1) SCMf(playerid, 0x00BFFFFF, "Ralf Sikorsky �������: ��, %s, ������� �� ���. � ���� ���� ��� ���� ���������� �����������.", PN(playerid));
		    else if(city == 2) SCMf(playerid, 0x00BFFFFF, "Francua Lemark �������: ��, %s, ������� �� ���. � ���� ���� ��� ���� ���������� �����������.", PN(playerid));
		
		    SPD(playerid, 69, DIALOG_STYLE_MSGBOX, "{fbec5d}����������� ���� ������ ������!", "{ffffff}����� ���� ����� {abcdef}NPC{ffffff}, ������� ������� ��� ���������� ����� �� ������ �����.\n������ ��������� � ���� ������� � �������� � ������ ��� ������ ������� {33aa33}/talk{ffffff}.", "X", "");
		}
		case 69, 46:
		{
		    TogglePlayerControllable(playerid, true);
			SetCameraBehindPlayer(playerid);
		}
		case 630:
		{
		    if(!response) return SPD(playerid, 630, DIALOG_STYLE_LIST, "{34C924}��� �� ������ � ����� �������?", "� �� ���� ��� �� ���� ��������\n������� �� YouTube\n������� ���������\n������� � ������������\n������� � ������ ������\n����� ������ �� ������� hosted\n� ����� �� ������ ��������\n��� �� ������ ��� ������� �� �������\n����� �������� ��� � ���� ������", "�����", "");
		    SPD(playerid, 631, DIALOG_STYLE_INPUT, "{34C924}������� ��� ������������� ��� ������", "{ffffff}����� �� ������ ������� ��� ������, ������� ��������� ��� �� ������. ����� ����, ��� �� ��������� {fbec5d}24{ffffff} ����, �� ������� {33aa33}50000 ${ffffff}.", "����", "�������");
		}
		case 631:
		{
			if(!response) return SPD(playerid, 634, DIALOG_STYLE_INPUT, "{34C924}� ��� ���� ��������?", "{ffffff}���� � ��� ���� �������� �� Youtube ������ ��� �������� � ��������� �����, ������� ��� ����:", "����", "�������");
			if(!strlen(inputtext)) return SPD(playerid, 631, DIALOG_STYLE_INPUT, "{34C924}������� ��� ������������� ��� ������", "{ffffff}����� �� ������ ������� ��� ������, ������� ��������� ��� �� ������. ����� ����, ��� �� ��������� {fbec5d}24{ffffff} ����, �� ������� {33aa33}50000 ${ffffff}.", "����", "�������");
			if(strlen(inputtext) > 20) return SPD(playerid, 632, DIALOG_STYLE_MSGBOX, " ", "{afafaf}���� ��� ������ ��� � ������������ ������.", "X", "");
			format(str_fmt, 200, "{ffffff}�������. ��� ������ �� ��������� {fbec5d}24{ffffff} ����, �����, � ������ ������ ��������� ����� {abcdef}%s{ffffff}, ������� {33aa33}50000 ${ffffff}.", inputtext);
		    SPD(playerid, 633, DIALOG_STYLE_MSGBOX, " ", str_fmt, "X", "");
		    SetString(pInfo[playerid][tRegReferal],inputtext);
		}
		case 632: SPD(playerid, 631, DIALOG_STYLE_INPUT, "{34C924}������� ��� ������������� ��� ������", "{ffffff}����� �� ������ ������� ��� ������, ������� ��������� ��� �� ������. ����� ����, ��� �� ��������� {fbec5d}24{ffffff} ����, �� ������� {33aa33}50000 ${ffffff}.", "����", "�������");
		case 633: SPD(playerid, 634, DIALOG_STYLE_INPUT, "{34C924}� ��� ���� ��������?", "{ffffff}���� � ��� ���� �������� �� Youtube ������ ��� �������� � ��������� �����, ������� ��� ����:", "����", "�������");
		case 634:
		{
		    //������� ����� �����.
			if(response)
			{
			    if(!strlen(inputtext)) return SPD(playerid, 634, DIALOG_STYLE_INPUT, "{34C924}� ��� ���� ��������?", "{ffffff}���� � ��� ���� �������� �� Youtube ������ ��� �������� � ��������� �����, ������� ��� ����:", "����", "�������");
				SPD(playerid, 635, DIALOG_STYLE_MSGBOX, " ", "{afafaf}���������� ���� ��������� �� ����������.", "X", "");
				return 1;
			}
			for(new i; i < 30; i++) SCM(playerid, -1, "�");
			SPD(playerid, 6, DIALOG_STYLE_MSGBOX, "{34C924}"SERVER_NAME" GTA", "\n{ffffff}����� �� ���������� San Andreas ���������� ��� �����������.\n\n������ ��� ������� ������� � ����� �� ����� �� ����������.\n ", "X", "");
            PlayerSpawn(playerid);
            TogglePlayerControllable(playerid, false);
			SelectRegCity(playerid, 0);
			for(new i; i < 5; i++) TextDrawShowForPlayer(playerid, Select_TD[i]);
			SelectTextDraw(playerid, 0x87CBFFFF);
			pInfo[playerid][tSelectedTD] = 1;
			return 1;
		}
		case 635: SPD(playerid, 634, DIALOG_STYLE_INPUT, "{34C924}� ��� ���� ��������?", "{ffffff}���� � ��� ���� �������� �� Youtube ������ ��� �������� � ��������� �����, ������� ��� ����:", "����", "�������");
		case 3830:
		{
		    if(!response)
		    {
			    TogglePlayerControllable(playerid, true);
				SetCameraBehindPlayer(playerid);
		        return 1;
		    }
		    SPD(playerid, 3831, DIALOG_STYLE_LIST, "{34C924}��� �� ������ ������� ����� ��������?", "��� �� � ��� ����� �������?\n��� �� ������ �� �����������?\n� ����� ������� �� ��� ������!", "��������", "��� ����");
		}
		case 3831:
		{
		    if(!response)
		    {
			    TogglePlayerControllable(playerid, true);
				SetCameraBehindPlayer(playerid);
		        return 1;
		    }
			if(pInfo[playerid][tSelectedActor] == 0)
			{
			    switch(listitem)
			    {
			        case 0:
					{
						TalkActor(playerid);
					    format(str_fmt, 600, "\n\n{abcdef}-  %s:{ffffff} ��� �� � ��� ����� �������?\n\n{F5DEB3}-  Francesco Schettino:{ffffff} � ������� ���������� ��������� ����� Santa Huila, � ��� �����, ������� ������� ��� � ���������� �����.\n\n", PN(playerid));
						SPD(playerid, 3832, DIALOG_STYLE_MSGBOX, "{ffffff}NPC {9ACD32}Francesco Schettino", str_fmt, "X", "");
					}
					case 1:
					{
						TalkActor(playerid);
					    format(str_fmt, 600, "\n\n{abcdef}-  %s:{ffffff} ��� �� ������ �� �����������?\n\n{F5DEB3}-  Francesco Schettino:{ffffff} ��� ����� ����� ��������� ��������� ������ � ������� �� �����.\n\n", PN(playerid));
						SPD(playerid, 3832, DIALOG_STYLE_MSGBOX, "{ffffff}NPC {9ACD32}Francesco Schettino", str_fmt, "X", "");
					}
					case 2:
					{
						EnableGPS(playerid, 1669.6284, -2246.1707, 13.5595);
						TalkActor(playerid);
						format(str_fmt, 600, "\n\n{abcdef}-  %s:{ffffff} � ����� ������� �� ��� ������!\n\n{F5DEB3}-  Francesco Schettino:{ffffff} �������, ����������� �� �������� ������. ������ � �����-����������, ��� �������� ������ ������.\n\n\n{fbec5d}���������:{ffffff} ���������, �� ������� � ���� ����� ���������� �������, �������� �� ����� ������.\n", PN(playerid));
						SPD(playerid, 46, DIALOG_STYLE_MSGBOX, "{ffffff}NPC {9ACD32}Francesco Schettino", str_fmt, "X", "");
					}
				}
			}
			else if(pInfo[playerid][tSelectedActor] == 1)
			{
				switch(listitem)
			    {
			        case 0:
					{
						TalkActor(playerid);
					    format(str_fmt, 600, "\n\n{abcdef}-  %s:{ffffff} ��� �� � ��� ����� �������?\n\n{F5DEB3}-  Ralf Sikorsky:{ffffff} � �������� ������������� ������ Whetstone, ����� � ��� ����� ������� �������� �� ����.\n\n", PN(playerid));
						SPD(playerid, 3832, DIALOG_STYLE_MSGBOX, "{ffffff}NPC {9ACD32}Ralf Sikorsky", str_fmt, "X", "");
					}
					case 1:
					{
						TalkActor(playerid);
					    format(str_fmt, 600, "\n\n{abcdef}-  %s:{ffffff} ��� �� ������ �� �����������?\n\n{F5DEB3}-  Ralf Sikorsky:{ffffff} ��� ����� ����� ������ ��� ��������� ���� ������ �������� � ��������� �� � ������������.\n\n", PN(playerid));
						SPD(playerid, 3832, DIALOG_STYLE_MSGBOX, "{ffffff}NPC {9ACD32}Ralf Sikorsky", str_fmt, "X", "");
					}
					case 2:
					{
						EnableGPS(playerid, -1395.6385, -318.0240, 14.1544);
						TalkActor(playerid);
						format(str_fmt, 600, "\n\n{abcdef}-  %s:{ffffff} � ����� ������� �� ��� ������!\n\n{F5DEB3}-  Ralf Sikorsky:{ffffff} �������, ����������� �� ������. ��� �� ������� ���������� � ����� ����������.\n\n\n{fbec5d}���������:{ffffff} ���������, �� ������� �� ������ ����� ���������� �������, �������� �� ����� ������.\n", PN(playerid));
						SPD(playerid, 46, DIALOG_STYLE_MSGBOX, "{ffffff}NPC {9ACD32}Ralf Sikorsky", str_fmt, "X", "");
					}
				}
			}
			else if(pInfo[playerid][tSelectedActor] == 2)
			{
				switch(listitem)
			    {
			        case 0:
					{
						TalkActor(playerid);
					    format(str_fmt, 600, "\n\n{abcdef}-  %s:{ffffff} ��� �� � ��� ����� �������?\n\n{F5DEB3}-  Francua Lemark:{ffffff} � �������� ����������� ������������ ��������, ����� � ��� �����, ������� ����������� �� �������.\n\n", PN(playerid));
						SPD(playerid, 3832, DIALOG_STYLE_MSGBOX, "{ffffff}NPC {9ACD32}Francua Lemark", str_fmt, "X", "");
					}
					case 1:
					{
						TalkActor(playerid);
					    format(str_fmt, 600, "\n\n{abcdef}-  %s:{ffffff} ��� �� ������ �� �����������?\n\n{F5DEB3}-  Francua Lemark:{ffffff} ��� ����� ����� ��������� ��������� ����� �� ������ ����� � ������.\n\n", PN(playerid));
						SPD(playerid, 3832, DIALOG_STYLE_MSGBOX, "{ffffff}NPC {9ACD32}Francua Lemark", str_fmt, "X", "");
					}
					case 2:
					{
						EnableGPS(playerid, 1723.6770, 1529.3956, 10.8203);
						TalkActor(playerid);
						format(str_fmt, 600, "\n\n{abcdef}-  %s:{ffffff} � ����� ������� �� ��� ������!\n\n{F5DEB3}-  Francua Lemark:{ffffff} �������, ����������� �� �������������. ��� �� ������� ���������� � ����� ����������.\n\n\n{fbec5d}���������:{ffffff} ���������, �� ������� �� ������������� ����� ���������� �������, �������� �� ����� ������.\n", PN(playerid));
						SPD(playerid, 46, DIALOG_STYLE_MSGBOX, "{ffffff}NPC {9ACD32}Francua Lemark", str_fmt, "X", "");
					}
				}
			}
		}
		case 3832: SPD(playerid, 3831, DIALOG_STYLE_LIST, "{34C924}��� �� ������ ������� ����� ��������?", "��� �� � ��� ����� �������?\n��� �� ������ �� �����������?\n� ����� ������� �� ��� ������!", "��������", "��� ����");
		case 4490:
		{
		    if(!response) return 1;
		    if(IsPlayerInAnyVehicle(playerid)) return SPD(playerid, 45, DIALOG_STYLE_MSGBOX, " ", "{afafaf}�� �� ������ ��������������� ������� ������� � ������ ������.", "X", "");
		    new arend = GetPlayerBikeArendID(playerid);
			if(arend == -1) return SPD(playerid, 45, DIALOG_STYLE_MSGBOX, " ", "{afafaf}���������� ��� ������� ������� �����������.", "X", "");
		    pInfo[playerid][tBikeArend] = AddStaticVehicle(510, BikeArend[arend][ArentPosTP][0], BikeArend[arend][ArentPosTP][1], BikeArend[arend][ArentPosTP][2], BikeArend[arend][ArentPosTP][3], random(10), random(10));
		    PutPlayerInVehicle(playerid, pInfo[playerid][tBikeArend], 0);
		    SPD(playerid, 45, DIALOG_STYLE_MSGBOX, " ", "{ffffff}��������� ���������. ����������� {fbec5d}/bike{ffffff} �����, ����� ������� ���.", "X", "");
		}
		case 4491:
		{
		    if(!response) return 1;
		    DestroyVehicle(pInfo[playerid][tBikeArend]);
		    pInfo[playerid][tBikeArend] = -1;
		    SPD(playerid, 45, DIALOG_STYLE_MSGBOX, " ", "{ffffff}�� ���������� �� ������. ��������� ��� ��������� � ������ �������.", "X", "");
		}
 }
 return 1;
}
public: PlayerSpawn(playerid)
{
	if(IsPlayerNPC(playerid)) return 1;
    if(IsPlayerInAnyVehicle(playerid))//���� ������ ��� ������ � ����
	{
	    new Float:X, Float:Y, Float:Z;
	    GetPlayerPos(playerid, X, Y, Z);
		SetPlayerPos(playerid, X ,Y, Z);
	    SetTimerEx("PlayerSpawn", 50, false, "i", playerid);
	    return 1;
	}
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
 	SettingSpawn(playerid);
	SpawnPlayer(playerid);
	return 1;
}
public OnPlayerSpawn(playerid)
{
    if(IsPlayerNPC(playerid)) return 1;
    pInfo[playerid][tSpawned] = true;
    PlayerStopSound(playerid);
	return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
    if(IsPlayerNPC(playerid)) return 1;
    if(!pInfo[playerid][tLogged]) return 0;
    if(!pInfo[playerid][tSpawned]) return 0;
	pInfo[playerid][tSpawned] = false;
   	return 1;
}
public OnPlayerText(playerid, text[])
{
	if(!pInfo[playerid][tLogged]) return 0;
	if(AntiFlood(playerid)) return 0;
	format(str_fmt, 144, "%s ������: %s", PN(playerid), text);
	ProxDetector(25.0, playerid, str_fmt, COLOR_GREEN);
	SetPlayerChatBubble(playerid, text, COLOR_GREEN, 10.0, 10000);
	switch(random(3))
	{
	    case 0: ApplyAnimation(playerid, !"PED", !"IDLE_CHAT", 4.1, 0, 1, 1, 1, 1, 1);
	    case 1: ApplyAnimation(playerid, !"LOWRIDER", !"prtial_gngtlkH", 4.1, 0, 1, 1, 1, 1, 1);
	    case 2: ApplyAnimation(playerid, !"GANGS", !"prtial_gngtlkB", 4.1, 0, 1, 1, 1, 1, 1);
	}
	SetTimerEx("ClearAnim", 100 * strlen(text), false, "d", playerid);
	return 0;
}
public: ClearAnim(playerid) return ApplyAnimation(playerid, !"CARRY", !"crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    if(!pInfo[playerid][tLogged]) return 0;
    if(result == -1)
	{
		SCM(playerid, -1, !"SERVER: Unknown command.");
		return 0;
	}
    return 1;
}
public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
    if(!pInfo[playerid][tLogged]) return 0;
	return 1;
}
public OnGameModeInit()
{
	//razd int
	CreateDynamicObject(2706, -2203.124023, 407.813843, 2166.829834, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2382, -2201.924072, 407.213867, 2165.829834, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2372, -2201.024170, 404.713867, 2165.179932, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2704, -2206.524170, 407.813843, 2166.829834, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2689, -2205.324219, 407.813843, 2166.829834, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2706, -2203.124023, 407.813843, 2166.829834, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2382, -2201.924072, 407.213867, 2165.829834, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2394, -2201.624023, 404.513794, 2165.869873, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2372, -2201.024170, 404.713867, 2165.179932, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2372, -2201.024170, 407.413818, 2165.179932, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2213.724121, 405.813232, 2166.729980, 0.000000, 0.000000, 179.994507, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2204.224121, 409.913818, 2166.729980, 0.000000, 0.000000, 179.994507, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2704, -2206.524170, 407.813843, 2166.829834, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2689, -2205.324219, 407.813843, 2166.829834, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2706, -2203.124023, 407.813843, 2166.829834, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2382, -2201.924072, 407.213867, 2165.829834, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2204.124512, 405.813232, 2163.679932, 0.000000, 180.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2372, -2201.024170, 407.413818, 2165.179932, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2204.124512, 405.813232, 2169.729980, 0.000000, 0.000000, 179.994507, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2213.724121, 405.813232, 2166.729980, 0.000000, 0.000000, 179.994507, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2394, -2201.624023, 404.513794, 2165.869873, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2372, -2201.024170, 404.713867, 2165.179932, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2204.124023, 401.713867, 2166.729980, 0.000000, 0.000000, 179.994507, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2194.724121, 405.813232, 2166.729980, 0.000000, 0.000000, 179.994507, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2704, -2206.524170, 407.813843, 2166.829834, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2689, -2205.324219, 407.813843, 2166.829834, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2204.124512, 405.813232, 2163.679932, 0.000000, 180.000000, 180.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2706, -2203.124023, 407.813843, 2166.829834, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2204.124512, 405.813232, 2169.729980, 0.000000, 0.000000, 179.994507, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2204.124023, 401.713867, 2166.729980, 0.000000, 0.000000, 179.994507, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2204.224121, 409.913818, 2166.729980, 0.000000, 0.000000, 179.994507, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2382, -2201.924072, 407.213867, 2165.829834, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2394, -2201.624023, 404.513794, 2165.869873, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2372, -2201.024170, 404.713867, 2165.179932, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(2372, -2201.024170, 407.413818, 2165.179932, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2213.724121, 405.813232, 2166.729980, 0.000000, 0.000000, 179.994507, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	CreateDynamicObject(1684, -2194.724121, 405.813232, 2166.729980, 0.000000, 0.000000, 179.994507, -1, -1, -1, STREAMER_OBJECT_SD, 100.0); // 0
	//kassa int
	CreateObject(1684, -2204.22412, 409.91382, 2166.72998,   0.00000, 0.00000, 179.99451);
	CreateObject(2063, -2202.52417, 412.41382, 2166.12988,   0.00000, 0.00000, 180.00000);
	CreateObject(2200, -2208.52417, 413.21387, 2165.22998,   0.00000, 0.00000, 90.00000);
	CreateObject(2165, -2202.52417, 413.51379, 2165.18994,   0.00000, 0.00000, 90.00000);
	CreateObject(1684, -2204.12451, 414.01379, 2163.67993,   0.00000, 180.00000, 180.00000);
	CreateObject(1684, -2204.12402, 414.01379, 2169.72998,   0.00000, 0.00000, 179.99451);
	CreateObject(1806, -2200.42407, 413.81384, 2165.19800,   0.00000, 0.00000, 92.00000);
	CreateObject(2164, -2207.32422, 415.91382, 2165.22998,   0.00000, 0.00000, 0.00000);
	CreateObject(1684, -2213.72412, 414.01379, 2166.72998,   0.00000, 0.00000, 179.99451);
	CreateObject(2000, -2200.62402, 415.41382, 2165.22998,   0.00000, 0.00000, 318.00000);
	CreateObject(1684, -2204.22412, 418.11377, 2166.72998,   0.00000, 0.00000, 179.99451);
	CreateObject(1684, -2194.72412, 414.01379, 2166.72998,   0.00000, 0.00000, 179.99451);

    gruzrazlv = CreatePickup(1275, 23, -2200.9893, 405.8916, 2166.0300, 19);
    gruzrazls = CreatePickup(1275, 23, -2200.9893, 405.8916, 2166.0300, 18);
	gruzrazsf = CreatePickup(1275, 23, -2200.9893, 405.8916, 2166.0300, 17);
		kassalv[0] = CreatePickup(1318, 23, 2441.5339, 1954.7220, 10.8050,0);
	kassalv[1] = CreatePickup(19198, 23, -2207.5896, 412.1147, 2166.5894,19);
	razdevalkalv[0] = CreatePickup(1318, 23, 2481.2900, 1958.3840, 10.6360,0);
	razdevalkalv[1] = CreatePickup(19198, 23, -2207.5020, 403.8684, 2166.5894,19);
	kassals[0] = CreatePickup(1318, 23, 2604.7083,-2238.2229,13.5469,0);
	kassals[1] = CreatePickup(19198, 23, -2207.5896, 412.1147, 2166.5894,18);
	razdevalkals[0] = CreatePickup(1318, 23, 2589.9338,-2239.5322,13.5392,0);
	razdevalkals[1] = CreatePickup(19198, 23, -2207.5020, 403.8684, 2166.5894,18);
	kassasf[0] = CreatePickup(1318, 23, -1826.2610, -1639.8510, 21.7500,0);
	kassasf[1] = CreatePickup(19198, 23, -2207.5896, 412.1147, 2166.5894,17);
	razdevalkasf[0] = CreatePickup(1318, 23, -1837.7490, -1647.7460, 21.7560,0);
	razdevalkasf[1] = CreatePickup(19198, 23, -2207.5020, 403.8684, 2166.5894,17);

	new currenttime = GetTickCount();
	if(!MySQLConnect()) return 0;
	LoadActors();
	LoadVehicles();
	LoadOther();
	LoadMap();
	LoadBusStop();
	SendRconCommand("hostname |       "SERVER_NAME" Roleplay  �"SERVER_NUMBER"      |");
	SetGameModeText(""SERVER_NAME" GM v "SERVER_VERSION" Roleplay");
	SetTimer("Pawno",90000,1);
	CreateTextDraws();
	kassirsf = CreateActor(150, -2201.3462, 414.0446, 2166.2390, 84.8916);
	SetActorVirtualWorld(kassirsf, 17);
	SetActorInvulnerable(kassirsf);
	kassirls = CreateActor(150, -2201.3462, 414.0446, 2166.2390, 84.8916);
	SetActorVirtualWorld(kassirls, 18);
	kassirlv = CreateActor(150, -2201.3462, 414.0446, 2166.2390, 84.8916);
	SetActorVirtualWorld(kassirlv, 19);
	SetActorInvulnerable(kassirlv);
	Create3DTextLabel("�����",0xFBEC5DFF, 2604.6230, -2238.1990, 15.1470, 6.0000, 0, 1);
	Create3DTextLabel("����������", 0xFBEC5DFF, 2589.9509, -2239.7490, 15.1390, 6.0000, 0, 1);
	Create3DTextLabel("����������", 0xFBEC5DFF, 2481.2900, 1958.3840, 12.2360, 6.0000, 0, 1);
	Create3DTextLabel("�����", 0xFBEC5DFF, 2441.5339, 1954.7220, 12.4050, 6.0000, 0, 1);
	Create3DTextLabel("������� {abcdef}������ ������ ����{ffffff}, ����� ����� �����.", 0xFFFFFFFF, 2430.4773, 1933.2249, 6.6156, 5.0000, 0, 0);
	new hour;
	gettime(hour, _, _);
	SetWorldTime(hour);
	ShowPlayerMarkers(0);
   	EnableStuntBonusForAll(0);
 	DisableInteriorEnterExits();
    SetTimer("SecondTimer", 1000, true);
	return printf("[ServerLoad] OnGameModeInit ���������� ��: %i ms", GetTickCount() - currenttime);
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == 128)
	{
		new playerTargetActor = GetPlayerCameraTargetActor(playerid);
		if(playerTargetActor != INVALID_ACTOR_ID)
		{
			new b_msg[144];

		if(!ActorHandsupsf[playerTargetActor])
		{
			if(GetPVarInt(playerid,"BoxInHands")) return ShowPlayerDialog(playerid,999,DIALOG_STYLE_MSGBOX,"{FFFFFF} NPC {66CC33}������","\n- {66CC33}������: {FFFFFF}���� ������ ������������ ������� ������ �������","�","");
			if(GetPVarInt(playerid,"porter") >= 1 && GetPVarInt(playerid,"porter") !=999)
			{
			format(b_msg, 144, "\n- {66CC33}������: {FFFFFF}�� ����� ��� ���������� %d %s � ��������� %d$.\n������ ������� ���� ������ � ��������� ����� ?\n", GetPVarInt(playerid,"porter")-1,PortedsfName[decline(GetPVarInt(playerid,"porter")-1)],(GetPVarInt(playerid,"porter")-1)*10);
			ShowPlayerDialog(playerid,104,DIALOG_STYLE_MSGBOX,"{FFFFFF}NPC {66CC33}������",b_msg,"��","���");
			}
		}
	}
	if(IsPlayerInRangeOfPoint(playerid,3.0,-1818.4871,-1613.6453,23.0156) || IsPlayerInRangeOfPoint(playerid,3.0,-1796.1337,-1648.6320,30.7626))
	{
		if(GetPVarInt(playerid,"porter") == 999) return true;
		if(IsPlayerInRangeOfPoint(playerid,3.0,-1818.4871,-1613.6453,23.0156) && !GetPVarInt(playerid,"BoxInHands")) return true;
		if(IsPlayerInRangeOfPoint(playerid,3.0,-1796.1337,-1648.6320,30.7626) && GetPVarInt(playerid,"BoxInHands")) return true;
		if(GetPVarInt(playerid,"porter") >= 1){
			ApplyAnimation(playerid, "CARRY", "liftup", 4.0, 0, 1, 1, 1, 1, 1);
			SetTimerEx("climb",500,false,"i",playerid);
		}
	}
}
    	if(newkeys == 128)
	{
		new playerTargetActor = GetPlayerCameraTargetActor(playerid);
		if(playerTargetActor != INVALID_ACTOR_ID)
		{
			new b_msg[144];

		if(!ActorHandsupls[playerTargetActor])
		{
			if(GetPVarInt(playerid,"BoxlsInHands")) return ShowPlayerDialog(playerid,999,DIALOG_STYLE_MSGBOX,"{FFFFFF} NPC {66CC33}������","\n- {66CC33}������: {FFFFFF}���� ������ ������������ ������� ������ �������","�","");
			if(GetPVarInt(playerid,"porterls") >= 1 && GetPVarInt(playerid,"porterls") !=999)
			{
			format(b_msg, 144, "\n- {66CC33}������: {FFFFFF}�� ����� ��� ���������� %d %s � ��������� %d$.\n������ ������� ���� ������ � ��������� �����?\n", GetPVarInt(playerid,"porterls")-1,PortedlsName[decline(GetPVarInt(playerid,"porterls")-1)],(GetPVarInt(playerid,"porterls")-1)*10);
			ShowPlayerDialog(playerid,105,DIALOG_STYLE_MSGBOX,"{FFFFFF}NPC {66CC33}������",b_msg,"��","���");
			}
		}
	}
	if(IsPlayerInRangeOfPoint(playerid,3.0,2617.1833,-2215.5986,13.5469) || IsPlayerInRangeOfPoint(playerid,3.0,2638.9019,-2276.5688,7.7059))
	{
		if(GetPVarInt(playerid,"porterls") == 999) return true;
		if(IsPlayerInRangeOfPoint(playerid,3.0,-2620.5974,-2215.2061,13.8841) && !GetPVarInt(playerid,"BoxlsInHands")) return true;
		if(IsPlayerInRangeOfPoint(playerid,3.0,2638.9019,-2276.5688,7.7059) && GetPVarInt(playerid,"BoxlsInHands")) return true;
		if(GetPVarInt(playerid,"porterls") >= 1){
			ApplyAnimation(playerid, "CARRY", "liftup", 4.0, 0, 1, 1, 1, 1, 1);
			SetTimerEx("climbls",500,false,"i",playerid);
		}
	}
}
    	if(newkeys == 128)
	{
		new playerTargetActor = GetPlayerCameraTargetActor(playerid);
		if(playerTargetActor != INVALID_ACTOR_ID)
		{
			new b_msg[144];

		if(!ActorHandsuplv[playerTargetActor])
		{
			if(GetPVarInt(playerid,"BoxlvInHands")) return ShowPlayerDialog(playerid,999,DIALOG_STYLE_MSGBOX,"{FFFFFF}NPC {66CC33}������ ","\n- {66CC33}������: {FFFFFF}���� ������ ������������ ������� ������ �������","�","");
			if(GetPVarInt(playerid,"porterlv") >= 1 && GetPVarInt(playerid,"porterlv") !=999)
			{
			format(b_msg, 144, "\n- {66CC33}������: {FFFFFF}�� ����� ��� ���������� %d %s � ��������� %d$.\n������ ������� ���� ������ � ��������� �����?\n", GetPVarInt(playerid,"porterlv")-1,PortedlvName[decline(GetPVarInt(playerid,"porterlv")-1)],(GetPVarInt(playerid,"porterlv")-1)*10);
			ShowPlayerDialog(playerid,106,DIALOG_STYLE_MSGBOX,"{FFFFFF}NPC {66CC33}������",b_msg,"��","���");
			}
		}
	}
	if(IsPlayerInRangeOfPoint(playerid,3.0,2476.6833,1929.6899,10.4738) || IsPlayerInRangeOfPoint(playerid,3.0,2430.3347,1933.1698,6.0156))
	{
		if(GetPVarInt(playerid,"porterlv") == 999) return true;
		if(IsPlayerInRangeOfPoint(playerid,3.0,2476.6833,1929.6899,10.4738) && !GetPVarInt(playerid,"BoxlvInHands")) return true;
		if(IsPlayerInRangeOfPoint(playerid,3.0,2430.3347,1933.1698,6.0156) && GetPVarInt(playerid,"BoxlvInHands")) return true;
		if(GetPVarInt(playerid,"porterlv") >= 1){
			ApplyAnimation(playerid, "CARRY", "liftup", 4.0, 0, 1, 1, 1, 1, 1);
			SetTimerEx("climblv",500,false,"i",playerid);
		}
	}
}
	return 1;
}
public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(_:clickedid == INVALID_TEXT_DRAW)
	{
	    if(pInfo[playerid][tSelectedTD]) return SelectTextDraw(playerid, 0x87CBFFFF);
	}
	if(pInfo[playerid][tSelectedTD] == 1)
	{
		if(clickedid == Select_TD[0])
		{
		    CancelSelectTextDraw(playerid);
			for(new i; i < 5; i++) TextDrawHideForPlayer(playerid, Select_TD[i]);
		    SpawnPlayer(playerid);
		    pInfo[playerid][tRegSkin] = 0;
			SetPlayerSkin(playerid, RegSkins[pInfo[playerid][tRegSex]][0]);
		    SetPlayerPos(playerid, -719.0372,171.1268,23.8403);
		    SetPlayerFacingAngle(playerid, 192.8139);
			SetPlayerCameraPos(playerid, -718.3121, 167.7302, 24.0460);
			SetPlayerCameraLookAt(playerid, -719.0372, 171.1268, 23.8403);
			for(new i; i < 4; i++) TextDrawShowForPlayer(playerid, Select_TD[i]);
			SelectTextDraw(playerid, 0x87CBFFFF);
			pInfo[playerid][tSelectedTD] = 2;
			return 1;
		}
		if(clickedid == Select_TD[1])
		{
		    new next;
		    if(pInfo[playerid][tRegCity] == 2) next = 0;
			else next = pInfo[playerid][tRegCity] + 1;
		    SelectRegCity(playerid, next);
			return 1;
		}
		if(clickedid == Select_TD[2])
		{
		    new prev;
		    if(pInfo[playerid][tRegCity] == 0) prev = 2;
			else prev = pInfo[playerid][tRegCity] - 1;
		    SelectRegCity(playerid, prev);
			return 1;
		}
	}
	else if(pInfo[playerid][tSelectedTD] == 2)
	{
		if(clickedid == Select_TD[0])
		{
		    CancelSelectTextDraw(playerid);
			for(new i; i < 4; i++) TextDrawHideForPlayer(playerid, Select_TD[i]);
			ShowRegisterCutscene(playerid);
			pInfo[playerid][tSelectedTD] = 0;
			return 1;
		}
		if(clickedid == Select_TD[1])
		{
			if(pInfo[playerid][tRegSkin] == 15) pInfo[playerid][tRegSkin] = 0;
			else pInfo[playerid][tRegSkin] += 1;
		    SetPlayerSkin(playerid, RegSkins[pInfo[playerid][tRegSex]][pInfo[playerid][tRegSkin]]);
			return 1;
		}
		if(clickedid == Select_TD[2])
		{
			if(pInfo[playerid][tRegSkin] == 0) pInfo[playerid][tRegSkin] = 15;
			else pInfo[playerid][tRegSkin] -= 1;
		    SetPlayerSkin(playerid, RegSkins[pInfo[playerid][tRegSex]][pInfo[playerid][tRegSkin]]);
			return 1;
		}
 }
	return 1;
}
public: SecondTimer()
{
	new hour, minute, second;
	gettime(hour, minute, second);
	if(minute == 0 && second == 0) PayDay();
	UpdateBusMap();
	return 1;
}
public: PlayerTimer(playerid)
{
	if(IsPlayerNPC(playerid)) return 1;
	new hour, minute, second;
	gettime(hour, minute, second);
	if(second == 0)
	{
	    PlayerTextDrawSetString(playerid, Time_TD[playerid][1], GetTime(1));
	    PlayerTextDrawSetString(playerid, Time_TD[playerid][0], GetTime(2));
	}
	if(!pInfo[playerid][tLogged] && pInfo[playerid][tLoginTime] < gettime())
	{
	    SCM(playerid, 0xF5DEB3FF, "�� �� ������ ����� � ������� �� ���������� ��� ����� �����, � ���� ������� �� ����������� ������������.");
	    SetPlayerRandomCamera(playerid);
	    Kick(playerid);
	}
	if(GetTickCount() - pInfo[playerid][tAFK] > 1200) SetPlayerChatBubble(playerid, "<{34C924} AFK {ffffff}>", -1, 8.0, 3000);
	if(pInfo[playerid][tGreenZoneTime])
	{
		pInfo[playerid][tGreenZoneTime]--;
		if(!pInfo[playerid][tGreenZoneTime]) SPD(playerid, -1, 0, " ", " ", " ", " ");
	}
	if(strlen(pInfo[playerid][pDescription]) && !pInfo[playerid][tDescriptionUpdate])
	{
		ShowDescription(pInfo[playerid][pDescription], str_fmt);
	    pInfo[playerid][tDescriptionLabel] = CreateDynamic3DTextLabel(str_fmt, 0xAFAFAFEE, 0.0, 0.0, -0.6, 10.0, playerid);
	    pInfo[playerid][tDescriptionUpdate] = true;
	}
	else if(!strlen(pInfo[playerid][pDescription]) && pInfo[playerid][tDescriptionUpdate])
	{
	    DestroyDynamic3DTextLabel(pInfo[playerid][tDescriptionLabel]);
	    pInfo[playerid][tDescriptionUpdate] = false;
	}
	if(pInfo[playerid][tCameraObject] != -1 && !IsPlayerObjectMoving(playerid, pInfo[playerid][tCameraObject]))
	{
	    if(pInfo[playerid][tRegCity] == 0 && pInfo[playerid][tCameraStage] == 1)
	    {
			ObjectCameraPos(playerid, 1500.7531, -2519.8330, 14.5368, 1532.6957, -2461.8044, 14.7832, 1685.455, -2436.981, 13.555, 270.0, 45);
			MovePlayerObject(playerid, pInfo[playerid][tPlaneObject], 1740.288, -2494.586, 14.653, 80, 0.0, 0.0, 270.0);
			pInfo[playerid][tCameraStage] = 2;
	    }
	    else if(pInfo[playerid][tRegCity] == 1 && pInfo[playerid][tCameraStage] == 1)
	    {
			ObjectCameraPos(playerid, -1400.237, 140.717, 15.469, -1420.6990, -174.3088, 14.1484, -1419.899, -168.452, 14.478, 0.0, 45);
			MovePlayerObject(playerid, pInfo[playerid][tPlaneObject], -1632.914, -140.205, 15.275, 80, 0.0, 0.0, 135.0);
			pInfo[playerid][tCameraStage] = 2;
	    }
	    else if(pInfo[playerid][tRegCity] == 2 && pInfo[playerid][tCameraStage] == 1)
	    {
			ObjectCameraPos(playerid, 1361.442, 1315.747, 10.820, 1512.3481, 1270.4568, 12.2447, 1587.191, 1447.770, 10.834, 0.0, 70);
			MovePlayerObject(playerid, pInfo[playerid][tPlaneObject], 1477.338, 1600.000, 11.977, 60, 0.0, 0.0, 0.0);
			pInfo[playerid][tCameraStage] = 2;
	    }
	    else if(pInfo[playerid][tCameraStage] == 2)
	    {
			TextDrawShowForPlayer(playerid, Logo);
			for(new i; i < 2; i++) TextDrawHideForPlayer(playerid, Black_Background[i]);
			DestroyPlayerObject(playerid, pInfo[playerid][tCameraObject]);
			DestroyPlayerObject(playerid, pInfo[playerid][tPlaneObject]);
	        pInfo[playerid][tCameraObject] = -1;
	        pInfo[playerid][tPlaneObject] = -1;
			OnPlayerRegister(playerid);
			TogglePlayerSpectating(playerid, false);
		    SPD(playerid, 68, DIALOG_STYLE_MSGBOX, "{34C924}�� ���� ������ ��� �� ����� �������!", "{ffffff}������ ���� ��� ������� ������� ������� ��������� � NPC ����������. �� ����� �� ������������.", "X", "");
	    }
	}
	if(pInfo[playerid][tFreezeTime])
	{
		pInfo[playerid][tFreezeTime] --;
		if(pInfo[playerid][tFreezeTime]) TogglePlayerControllable(playerid, true);
	}
	return 1;
}
public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	if(checkpointid == pInfo[playerid][tGPS])
	{
	    DestroyDynamicCP(pInfo[playerid][tGPS]);
	    pInfo[playerid][tGPS] = -1;
	}
	return 1;
}
public OnPlayerEnterDynamicArea(playerid, areaid)
{
	for(new i; i < sizeof(GreenZone); i++)
	{
	    if(areaid != GreenZone[i][gZone]) continue;
	    if(GetPlayerVirtualWorld(playerid) != GreenZone[i][gWorld]) continue;
	    if(GetPlayerInterior(playerid) != GreenZone[i][gInterior]) continue;
	    TextDrawShowForPlayer(playerid, GreenZone_TD);
	    pInfo[playerid][tGreenZone] = true;
	    break;
	}
    return 1;
}
public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	for(new i; i < sizeof(GreenZone); i++)
	{
	    if(areaid != GreenZone[i][gZone]) continue;
	    TextDrawHideForPlayer(playerid, GreenZone_TD);
	    pInfo[playerid][tGreenZone] = false;
		break;
	}
    return 1;
}
public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid, bodypart)
{
	if(pInfo[playerid][tGreenZone])
	{
		ApplyAnimation(playerid, "PED", "GAS_CWR", 4.1, 0, 0, 0, 0, 0);
 		SPD(playerid, 271, DIALOG_STYLE_MSGBOX, "{34C924}�� � ������� ����", "\n{ffffff}�� ���� ���������� �� �� ������� ������� ���� ������ �������. ��� ��������� ������������� ��������� ����� {abcdef}3{ffffff} �������.\n", "X", "");
	    pInfo[playerid][tGreenZoneTime] = 3;
		return 0;
	}
	return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER && pInfo[playerid][tBrightnessColor] == -1)
    {
        new carid = GetPlayerVehicleID(playerid);
		new model = GetVehicleModel(carid);
		
		#include ../library/TextDraws/Player/CarName

		for(new i; i < 2; i++) TextDrawShowForPlayer(playerid, CarName_Global[i]);
		PlayerTextDrawShow(playerid, CarName_Player[playerid]);

	    pInfo[playerid][tBrightnessColor] = 0;
		ShowCarName(playerid);
	}
	return 1;
}
public OnPlayerUpdate(playerid)
{
	pInfo[playerid][tAFK] = GetTickCount();
	return 1;
}
public: ShowCarName(playerid)
{
	new color = pInfo[playerid][tBrightnessColor];
    PlayerTextDrawColor(playerid, CarName_Player[playerid], BrightnessColors[color][0]);
    PlayerTextDrawBackgroundColor(playerid, CarName_Player[playerid], BrightnessColors[color][1]);
	PlayerTextDrawShow(playerid, CarName_Player[playerid]);
	if(color < sizeof(BrightnessColors) - 1)
	{
	    pInfo[playerid][tBrightnessColor]++;
	    SetTimerEx("ShowCarName", 50, false, "i", playerid);
	}
	else
	{
	    pInfo[playerid][tBrightnessColor] = -1;
		for(new i; i < 2; i++) TextDrawHideForPlayer(playerid, CarName_Global[i]);
		PlayerTextDrawDestroy(playerid, CarName_Player[playerid]);
	}
}
public: PlaneMove(playerid, Float:dest_x, Float:dest_y, Float:dest_z, speed, Float:rot_x, Float:rot_y, Float:rot_z)
{
	MovePlayerObject(playerid, pInfo[playerid][tPlaneObject], dest_x, dest_y, dest_z, speed, rot_x, rot_y, rot_z);
	return 1;
}
forward climb(playerid);
public climb(playerid)
{
	if(!GetPVarInt(playerid,"BoxInHands") && IsPlayerInRangeOfPoint(playerid,3.0,-1795.9360,-1648.8014,30.9435))
	{
		SetPlayerAttachedObject(playerid, 0,1025,1,0.354999,0.494999,0.000000,0.000000,0.000000,91.400077,1.000000,1.000000,1.000000);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
		ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,0,1,1,1,1);
		DisablePlayerCheckpoint(playerid);
		SetPlayerCheckpoint(playerid, -1818.4871,-1613.6453,23.0156, 3.0);
		SetPVarInt(playerid,"BoxInHands",true);
	}
	if(GetPVarInt(playerid,"BoxInHands") && IsPlayerInRangeOfPoint(playerid,3.0,-1818.4871,-1613.6453,23.0156))
	{
		new string[32];
		new money = GetPVarInt(playerid,"money");
		DisablePlayerCheckpoint(playerid);
		SetPVarInt(playerid,"porter",GetPVarInt(playerid,"porter")+1);
		format(string,sizeof(string),"�� ��������� {a52a2a}%d{FFFFFF} %s.",GetPVarInt(playerid,"porter")-1,PortedsfName[decline(GetPVarInt(playerid,"porter")-1)]);
		SendClientMessage(playerid,0xFFFFFFAA,string);
		SendClientMessage(playerid, COLOR_WHITE, "{9acd32}�����������: �� ������ ���������� ��������� �����. ��� ������ �� �������� �������� ������ - ������������� �� �����.");
	 	GivePlayerMoney(playerid, money);
		

		SetPlayerCheckpoint(playerid, -1795.9360,-1648.8014,30.9435, 3.0);
		RemovePlayerAttachedObject(playerid, 0);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		ApplyAnimation(playerid,"PED","IDLE_tired",4.1,0,1,1,0,1);
		SetPVarInt(playerid,"BoxInHands",false);
	}
}
forward climbls(playerid);
public climbls(playerid)
{
		if(!GetPVarInt(playerid,"BoxlsInHands") && IsPlayerInRangeOfPoint(playerid,3.0,2638.9019,-2276.5688,7.7059))
		{
		SetPlayerAttachedObject(playerid, 0, 3052, 5, -0.013999, 0.090999, 0.169999, -83.699974, -8.700000, -73.000007, 1.000000, 1.000000, 1.000000, 0, 0);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
		ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,0,1,1,1,1);
		DisablePlayerCheckpoint(playerid);
		SetPlayerCheckpoint(playerid, 2617.1833,-2215.5986,13.5469, 3.0);
		SetPVarInt(playerid,"BoxlsInHands",true);
	}
	if(GetPVarInt(playerid,"BoxlsInHands") && IsPlayerInRangeOfPoint(playerid,3.0,2617.1833,-2215.5986,13.5469))
	{
		new string[32];
		new money = GetPVarInt(playerid,"money");
		DisablePlayerCheckpoint(playerid);
		SetPVarInt(playerid,"porterls",GetPVarInt(playerid,"porterls")+1);
		format(string,sizeof(string),"�� ��������� {a52a2a}%d{FFFFFF} %s.",GetPVarInt(playerid,"porterls")-1,PortedlsName[decline(GetPVarInt(playerid,"porterls")-1)]);
		SendClientMessage(playerid,0xFFFFFFAA,string);
		SendClientMessage(playerid, COLOR_WHITE, "{9acd32}�����������: �� ������ ���������� ��������� �����. ��� ������ �� �������� �������� ������ - ������������� �� �����.");
	 	GivePlayerMoney(playerid, money);
	 	
		SetPlayerCheckpoint(playerid, 2638.9019,-2276.5688,7.7059, 3.0);
		RemovePlayerAttachedObject(playerid, 0);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		ApplyAnimation(playerid,"PED","IDLE_tired",4.1,0,1,1,0,1);
		SetPVarInt(playerid,"BoxlsInHands",false);
	}
}
forward climblv(playerid);
public climblv(playerid)
{
		if(!GetPVarInt(playerid,"BoxlvInHands") && IsPlayerInRangeOfPoint(playerid,3.0,2430.3347,1933.1698,6.0156))
		{
	 	SetPlayerAttachedObject(playerid, 9, 2960, 5, 0.0100, 0.3500, 0.2000, -80.0000, 0.0000, 105.0000, 1.0000, 1.0000, 1.0000, 0, 0);
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
		ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,0,1,1,1,1);
		DisablePlayerCheckpoint(playerid);
		SetPlayerCheckpoint(playerid, 2476.6833,1929.6899,10.4738, 3.0);
		SetPVarInt(playerid,"BoxlvInHands",true);
	}
	if(GetPVarInt(playerid,"BoxlvInHands") && IsPlayerInRangeOfPoint(playerid,3.0,2476.6833,1929.6899,10.4738))
	{
		new string[32];
		new money = GetPVarInt(playerid,"money");
		DisablePlayerCheckpoint(playerid);
		SetPVarInt(playerid,"porterlv",GetPVarInt(playerid,"porterlv")+1);
		format(string,sizeof(string),"�� ��������� {a52a2a}%d{FFFFFF} %s.",GetPVarInt(playerid,"porterlv")-1,PortedlvName[decline(GetPVarInt(playerid,"porterlv")-1)]);
		SendClientMessage(playerid,0xFFFFFFAA,string);
		SendClientMessage(playerid, COLOR_WHITE, "{9acd32}�����������: �� ������ ���������� ��������� �����. ��� ������ �� �������� �������� ������ - ������������� �� �����.");
	 	GivePlayerMoney(playerid, money);

		SetPlayerCheckpoint(playerid, 2430.3347,1933.1698,6.0156, 3.0);
		RemovePlayerAttachedObject(playerid, 9);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		ApplyAnimation(playerid,"PED","IDLE_tired",4.1,0,1,1,0,1);
		SetPVarInt(playerid,"BoxlvInHands",false);
	}
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == gruzrazlv)
	{
	if(IsPlayerInRangeOfPoint(playerid,1.0,-2200.9893, 405.8916, 2166.0300) && GetPVarInt(playerid,"porterlv") == 999)
	SetPlayerCheckpoint(playerid, 2430.3347,1933.1698,6.0156, 3.0);
	SetPVarInt(playerid,"porterlv",1);

	SetPlayerSkin(playerid, 27);
	}
    if(pickupid == gruzrazsf)
	{
	if(IsPlayerInRangeOfPoint(playerid,1.0,-2200.9893, 405.8916, 2166.0300) && GetPVarInt(playerid,"porter") == 999)
	SetPlayerCheckpoint(playerid, -1795.9360,-1648.8014,30.9435, 3.0);
	SetPVarInt(playerid,"porter",1);

	SetPlayerSkin(playerid, 27);
	}
 	if(pickupid == gruzrazls)
	{
	if(IsPlayerInRangeOfPoint(playerid,1.0,-2200.9893, 405.8916, 2166.0300) && GetPVarInt(playerid,"porterls") == 999)
	SetPlayerCheckpoint(playerid, -1795.9360,-1648.8014,30.9435, 3.0);
	SetPVarInt(playerid,"porterls",1);

	SetPlayerSkin(playerid, 27);
	}
	 	if(pickupid == kassalv[0])
	{
		SetPlayerPos(playerid,-2207.1367,413.5559,2166.2390);
		SetPlayerFacingAngle(playerid,279.2227);        // �������� � ��������
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 19);
	}
	if(pickupid == kassalv[1])
	{
		SetPlayerPos(playerid,2444.5320,1954.6080,10.7648);
		SetPlayerFacingAngle(playerid,267.8200);        // �������� �� ���� ( ����� )
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 0);
	}
 	if(pickupid == razdevalkalv[0])
	{
		SetPlayerPos(playerid,-2206.4502,405.7142,2166.2390);
		SetPlayerFacingAngle(playerid,274.1064);        // �������� � ��������
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 19);
	}
	if(pickupid == razdevalkalv[1])
	{
		SetPlayerPos(playerid,2477.8081,1957.0229,10.5827);
		SetPlayerFacingAngle(playerid,91.4110);        // �������� �� ���� ( ����� )
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 0);
	}
     	if(pickupid == kassasf[0])
	{
		SetPlayerPos(playerid,-2207.1367,413.5559,2166.2390);
		SetPlayerFacingAngle(playerid,279.2227);        // �������� � ��������
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 17);
	}
	if(pickupid == kassasf[1])
	{
		SetPlayerPos(playerid,-1826.1158,-1642.5795,21.7500);
		SetPlayerFacingAngle(playerid,183.2108);        // �������� �� ���� ( ����� )
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 0);
	}
 	if(pickupid == razdevalkasf[0])
	{
		SetPlayerPos(playerid,-2206.4502,405.7142,2166.2390);
		SetPlayerFacingAngle(playerid,274.1064);        // �������� � ��������
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 17);
	}
	if(pickupid == razdevalkasf[1])
	{
		SetPlayerPos(playerid,-1834.3531,-1647.4879,21.7500);
		SetPlayerFacingAngle(playerid,270.8433);        // �������� �� ���� ( ����� )
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 0);
	}
 	if(pickupid == kassals[0])
	{
		SetPlayerPos(playerid,-2207.1367,413.5559,2166.2390);
		SetPlayerFacingAngle(playerid,279.2227);        // �������� � ��������
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 18);
	}
	if(pickupid == kassals[1])
	{
		SetPlayerPos(playerid,2606.3625,-2238.2285,13.5469);
		SetPlayerFacingAngle(playerid,273.5977);        // �������� �� ���� ( ����� )
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 0);
	}
 	if(pickupid == razdevalkals[0])
	{
		SetPlayerPos(playerid,-2206.4502,405.7142,2166.2390);
		SetPlayerFacingAngle(playerid,274.1064);        // �������� � ��������
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 18);
	}
	if(pickupid == razdevalkals[1])
	{
		SetPlayerPos(playerid,2590.0081,-2238.3777,13.5392);
		SetPlayerFacingAngle(playerid,357.8852);        // �������� �� ���� ( ����� )
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid, 0);
	}
	return 1;
}
public: Kicker(playerid)
{
	DeletePVar(playerid, "Kick");
	Kick(playerid);
}
stock KickEx(playerid)
{
	SetTimerEx("Kicker",950,0,"%d", playerid);
	SetPVarInt(playerid, "Kick", 1);
}
public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	new vehicleid = GetPlayerVehicleID(playerid); // ������ ���� ���� � ������� ����� ����
	if(vehicleid > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER) // ���� ���� � ���������� � �� ��������
	{
	    SetVehiclePos(vehicleid, fX, fY, fZ); // �������� �/�
	}
	else // ���� ����� �� ��������� � �/�
	{
		SetPlayerPos(playerid, fX, fY, fZ); // �������� ������
	}
return 1;
}
//=============================[ ����� ]=============================//
stock SendAdminMessage(color, const string[])
{
	foreach(new i: Player)
	{
		if(pInfo[i][pAdmin] >= 1)
		{
			SendClientMessage(i, color, string);
		}
	}
	return 1;
}
stock gpname(playerid)
{
        new pName[MAX_PLAYER_NAME];
        GetPlayerName(playerid, pName, sizeof pName);
        return pName;
}
stock asend(color, string[])
{
        for(new i; i < MAX_PLAYERS; i++)
        {
                if(IsPlayerConnected(i))
                {
                   if(pInfo[i][pAdmin] >= 1) SCM(i, color, string);
                }
        }
        return 1;
}
stock weaponname(weaponid)
{
	new weapon[32];
	GetWeaponName(weaponid, weapon, sizeof(weapon));
	if(weaponid == 0) format(weapon, sizeof(weapon), "None");
	return weapon;
}
stock Freeze(playerid, time)
{
    TogglePlayerControllable(playerid, false);
	pInfo[playerid][tFreezeTime] = time;
	return 1;
}
stock UpdatePlayerData(playerid, fields [], data)
{
    #pragma unused playerid
	new str[128];
	mysql_format(mysql, str, 128, "UPDATE `accounts` SET `%s` = '%d' WHERE `pName` = '%s' LIMIT 1", fields, data, pName);
	mysql_query(mysql, str);
	return true;
}
stock AdminMessage(color,const string[],level)
{
    #if defined foreach
        foreach(new i : Admins)
    #else
        for(new i = GetPlayerPoolSize(); i != -1; --i)
            if(IsPlayerConnected(i))
    #endif
        if(pInfo[i][pAdmin] >= level) SendClientMessage(i, color, string);
    return true;
}
stock decline(n)
{
	if(n == 0) return 0;
	n = n % 100;
	new n1 = n % 10;
	if (n > 10 && n < 20) return 0;
	if (n1 > 1 && n1 < 5) return 1;
	if (n1 == 1) return 2;
	return 0;
}

stock LoadActors()
{
	new currenttime = GetTickCount();
	
    Actor[0] = CreateActor(182, 1650.5518, -2245.0125, 13.5059, 54.8339);
    CreateDynamic3DTextLabel("NPC {D8A903}Francesco Schettino\n\n{ffffff}������� {33aa33}/talk{ffffff} ��� ���������.", 0xFFFFFFFF, 1650.5518, -2245.0125, 14.6059, 7.0);
    ActorTalk[0] = 1;

	Actor[1] = CreateActor(259, -1412.5531, -301.8500, 14.1411, 32.9003);
	CreateDynamic3DTextLabel("NPC {D8A903}Ralf Sikorsky\n\n{ffffff}������� {33aa33}/talk{ffffff} ��� ���������.", 0xFFFFFFFF, -1412.5531, -301.8500, 15.2411, 7.0);
	ActorTalk[1] = 1;
	
	Actor[2] = CreateActor(153, 1684.8441, 1456.8380, 10.7704, 126.9012);
	CreateDynamic3DTextLabel("NPC {D8A903}Francua Lemark\n\n{ffffff}������� {33aa33}/talk{ffffff} ��� ���������.", 0xFFFFFFFF, 1684.8441, 1456.8380, 11.8704, 7.0);
	ActorTalk[2] = 1;

	return printf("[ServerLoad] LoadActors ���������� ��: %i ms", GetTickCount() - currenttime);
}
stock LoadVehicles()
{
	new currenttime = GetTickCount();
	//������ �� ��������� LS
	AddStaticVehicleEx(510,2596.8999000,-2215.3000000,13.2000000,180.0000000,157,152,15); //Mountain Bike
	AddStaticVehicleEx(510,2598.2000000,-2215.3000000,13.2000000,180.0000000,157,152,15); //Mountain Bike
	AddStaticVehicleEx(510,2599.5000000,-2215.3999000,13.2000000,180.0000000,157,152,15); //Mountain Bike
	AddStaticVehicleEx(510,2600.8999000,-2215.3999000,13.2000000,180.0000000,157,152,15); //Mountain Bike
	AddStaticVehicleEx(510,2602.3000000,-2215.3999000,13.2000000,180.0000000,157,152,15); //Mountain Bike
	//������ �� ������ LS
	AddStaticVehicle(510,1646.9980,-2261.9978,12.9972,23.9966,0,0);
	AddStaticVehicle(510,1644.9977,-2261.9980,12.9974,23.9970,2,2);
	AddStaticVehicle(510,1642.9958,-2261.9919,13.0672,23.9904,1,1);
	AddStaticVehicle(510,1640.9414,-2261.8704,13.0542,24.0031,6,6);
	AddStaticVehicle(510,1638.9967,-2261.9919,13.0685,24.0037,6,6);
	AddStaticVehicle(510,1636.8531,-2261.9841,13.0824,26.3218,0,0);
	AddStaticVehicle(510,1634.6066,-2261.9829,13.0845,24.8369,1,1);
	AddStaticVehicle(510,1632.5875,-2261.8015,13.0647,37.5726,3,3);
	AddStaticVehicle(510,1630.7531,-2261.9329,13.0879,37.0385,6,6);
	//������ �� ������ SF
	AddStaticVehicle(510,-1448.6892,-272.2679,13.7568,166.7677,99,99);
	AddStaticVehicle(510,-1446.5740,-273.3124,13.7435,181.5998,86,86);
	AddStaticVehicle(510,-1444.5811,-274.3478,13.7295,176.1971,1,1);
	AddStaticVehicle(510,-1442.6281,-275.0656,13.7421,177.1072,183,183);
	AddStaticVehicle(510,-1440.6580,-275.9871,13.7411,180.5303,0,0);
	AddStaticVehicle(510,-1438.5780,-277.1244,13.7492,178.9331,1,1);
	AddStaticVehicle(510,-1436.5861,-278.3296,13.7241,176.5024,53,53);
	AddStaticVehicle(510,-1434.6860,-279.6298,13.7435,181.2422,3,3);
	//������ �� ������ LV
	AddStaticVehicle(510,1695.9755,1420.2261,10.3570,290.3063,0,0);
	AddStaticVehicle(510,1696.5345,1417.5355,10.3557,298.7068,5,5);
	AddStaticVehicle(510,1697.1173,1413.8571,10.3509,293.6135,6,6);
	AddStaticVehicle(510,1697.9757,1409.3436,10.3476,294.1116,123,123);
	AddStaticVehicle(510,1698.9601,1405.2988,10.3225,292.0309,24,24);
	AddStaticVehicle(510,1700.3170,1400.5416,10.3176,288.0652,3,3);
	AddStaticVehicle(510,1702.4247,1396.1923,10.2938,295.0168,1,1);
	return printf("[Serve Load] LoadVehicles ���������� ��: %i ms", GetTickCount() - currenttime);
}
stock LoadOther()
{
	new currenttime = GetTickCount();
	//������ �����������
	for(new i; i < sizeof(BikeArend); i++)
	{
	    CreatePickup(1237, 1, BikeArend[i][ArendPos][0], BikeArend[i][ArendPos][1], BikeArend[i][ArendPos][2], -1);
	    CreateDynamic3DTextLabel("�� ������� ����������?\n\n{ffffff}����������� {33aa33}/bike{ffffff}, �����\n���������� ��������� �� ������.", 0xD8A903FF, BikeArend[i][ArendPos][0]-0.05, BikeArend[i][ArendPos][1]-0.05, BikeArend[i][ArendPos][2]+1.9, 7.0);
	}
	//������� ����
	for(new i; i < sizeof(GreenZone); i++)
	{
		GreenZone[i][gZone] = CreateDynamicRectangle(GreenZone[i][gPos][0], GreenZone[i][gPos][1], GreenZone[i][gPos][2], GreenZone[i][gPos][3], GreenZone[i][gWorld], GreenZone[i][gInterior]);
	}
	return printf("[ServerLoad] LoadOther ���������� ��: %i ms", GetTickCount() - currenttime);
}
stock LoadMap()
{
	new currenttime = GetTickCount();
   	CallRemoteFunction("LoadMaping", "");
	return printf("[ServerLoad] LoadMap ���������� ��: %i ms", GetTickCount() - currenttime);
}
stock LoadBusStop()
{
	new currenttime = GetTickCount(), object;
	
	for(new i; i < sizeof(BusStop); i++)
	{
		if(BusStop[i][City] == 0) object = 19171;
		else if(BusStop[i][City] == 1) object = 19170;
		else if(BusStop[i][City] == 2) object = 19169;
		BusStop[i][MiniMapObject] = CreateDynamicMapObject(object, BusStop[i][MiniMapPos][0], BusStop[i][MiniMapPos][1], BusStop[i][MiniMapPos][2], BusStop[i][MiniMapPos][3]);//������ ���������
		for(new d; d < 2; d++) BusStop[i][MiniMapPosObject][d] = CreatePointForDynamicMap(BusStop[i][MiniMapObject], 19256, 0.01);//������ ������� �������� �� ���������
	}

	return printf("[ServerLoad] LoadBusStop ���������� ��: %i ms", GetTickCount() - currenttime);
}
stock UpdateBusMap()
{
	new Float:vX, Float:vY, Float:vZ, carid, count, number, city;
	count = CallRemoteFunction("GetNPC_Count", "");
	for(new i; i < count; i++)
	{
    	carid = CallRemoteFunction("GetNPC_CarID", "i", i);
    	number = CallRemoteFunction("GetNPC_Number", "i", i);
    	city = CallRemoteFunction("GetNPC_City", "i", i);
	    GetVehiclePos(carid, vX, vY, vZ);
	    if(vX == 10000 || vY == 10000) continue;
	    for(new d; d < sizeof(BusStop); d++)
	    {
	        if(BusStop[d][City] != city) continue;
			MovePointForPos(BusStop[d][MiniMapPosObject][number], vX, vY);
	    }
	}
}
stock MySQLConnect()
{
	new currenttime = GetTickCount();
	mysql = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_DB, MYSQL_PASSWORD);
	switch(mysql_errno())
	{
		case 0, 1146: printf("����������� � ���� ������ �������");
	    case 1044: return print("����������� � ���� ������ �� �������, �������� ���� �����������! [������� �������������� ��� ������������]");
	    case 1045: return print("����������� � ���� ������ �� �������, �������� ���� �����������! [������ ������������ ������]");
	    case 1049: return print("����������� � ���� ������ �� �������, �������� ���� �����������! [������� �������������� ���� ������]");
	    case 2003: return print("����������� � ���� ������ �� �������, �������� ���� �����������! [������� � ����� ������ ����������]");
	    case 2005: return print("����������� � ���� ������ �� �������, �������� ���� �����������! [������ ������������ ����� ��������]");
	    default: return printf("����������� � ���� ������ �� �������, �������� ���� �����������! [����������� ������. ��� ������: %d]", mysql_errno());
	}
    printf("[ServerLoad] MySQL ���������� ��: %i ms", GetTickCount() - currenttime);
	return 1;
}
stock CreateTextDraws()
{
	#include ../library/TextDraws/Global/Other
	return 1;
}
stock CreatePlayerTextDraws(playerid)
{
	#include ../library/TextDraws/Player/Other
	return 1;
}
stock SetString(param_1[], param_2[], size = 300) return strmid(param_1, param_2, 0, strlen(param_2), size);
stock GetString(param1[],param2[]) return !strcmp(param1, param2, false);
stock GetTime(type)
{
    static time[40], number[3];
    new month, day, hour, minute;
    gettime(hour, minute, _); getdate(_, month, day);
    switch(day)
    {
        case 1, 21, 31: number = "st";
        case 2, 22: number = "nd";
        case 3, 23: number = "rd";
		default: number = "th";
    }
    if(type == 1) format(time, sizeof(time), "%02d:%02d", hour, minute);
    else if(type == 2)
	{
    	static const mtext[12][20] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
		format(time, sizeof(time), "%d%s %s", day, number, mtext[month - 1]);
	}
    return time;
}
stock TalkActor(playerid)
{
	new actor = GetPlayerActorID(playerid);
	if(actor == -1) return 0;
	ApplyActorAnimation(actor, "PED", "IDLE_CHAT", 4.0, 0, 0, 0, 0, 0);
	return 1;
}
stock SetCameraToActor(playerid, actor, Float:distance = 1.5)
{
	new Float:pX, Float:pY, Float:pZ;
	new Float:aX, Float:aY, Float:aZ;
	GetPlayerPos(playerid, pX, pY, pZ);
	GetActorTurn(actor, aX, aY, aZ, distance, 180);
	InterpolateCameraPos(playerid, pX, pY, pZ, aX, aY, aZ+0.4, 1000);
	GetActorPos(actor, aX, aY, aZ);
	SetPlayerFacingPos(playerid, aX, aY);
	InterpolateCameraLookAt(playerid, pX, pY, pZ, aX, aY, aZ+0.4, 1000);
	TogglePlayerControllable(playerid, false);
	return 1;
}
stock GetActorTurn(actor, &Float:x, &Float:y, &Float:z, Float:distance, turn)
{
    new Float:angle,Float:dis;
    dis = dis/2 - distance;
    GetActorPos(actor, x, y, z),GetActorFacingAngle(actor, angle);
    x += (dis * floatsin(-angle+turn, degrees)),y += (dis * floatcos(-angle+turn, degrees));
    return 1;
}
stock SetPlayerFacingPos(playerid, Float:x, Float:y)
{// by Daniel_Cortez | pro-pawn.ru
    static Float:ax, Float:ay, Float:az;
    if(GetPlayerPos(playerid, ax, ay, az) == 0)
        return 0;
    return SetPlayerFacingAngle(playerid, atan2(y-ay, x-ax)-90.00);
}
stock GetPlayerActorID(playerid)
{
	new actor = -1;
	new Float:x, Float:y, Float:z;
	for(new i; i < MAX_ACTORS; i++)
	{
		if(!IsActorStreamedIn(i, playerid)) continue;
		if(GetActorVirtualWorld(i) != GetPlayerVirtualWorld(playerid)) continue;
		if(!ActorTalk[i]) continue;
		GetActorPos(i, x, y, z);
		if(!IsPlayerInRangeOfPoint(playerid, 5, x, y, z)) continue;
		actor = i;
		break;
	}
	return actor;
}
stock GetPlayerBikeArendID(playerid)
{
	if(GetPlayerVirtualWorld(playerid) != 0 && GetPlayerInterior(playerid) != 0) return -1;
	new arend = -1;
	for(new i; i < sizeof(BikeArend); i++)
	{
		if(!IsPlayerInRangeOfPoint(playerid, 10, BikeArend[i][ArendPos][0], BikeArend[i][ArendPos][1], BikeArend[i][ArendPos][2])) continue;
		arend = i;
		break;
	}
	return arend;
}
stock EnableGPS(playerid, Float:x, Float:y, Float:z)
{
	if(pInfo[playerid][tGPS] != -1) DestroyDynamicCP(pInfo[playerid][tGPS]);
	pInfo[playerid][tGPS] = CreateDynamicCP(x, y, z, 3.00);
	return true;
}
stock RemoveObjectForPlayer(playerid)
{
	#include ../library/Map/remove
	return 1;
}
stock SettingSpawn(playerid)
{
    if(IsPlayerNPC(playerid)) return 1;
    if(pInfo[playerid][tLogged]) TogglePlayerControllable(playerid, true);
	new skin = pInfo[playerid][pSkin];
	if(pInfo[playerid][pCity] == 0) return SetSpawnInfoEx(playerid, skin, 1642.9904, -2239.6443, 13.4922, 180.3134);
	else if(pInfo[playerid][pCity] == 1) return SetSpawnInfoEx(playerid, skin, -1417.9692, -292.5034, 14.1484, 147.2435);
	else if(pInfo[playerid][pCity] == 2) return SetSpawnInfoEx(playerid, skin, 1676.5919, 1451.7231, 10.7840, 274.0734);
	return 1;
}

stock SetSpawnInfoEx(playerid, skin, Float:x, Float:y, Float:z, Float:a)
{
    return SetSpawnInfo(playerid, 255, skin, x, y, z-0.2, a, 0, 0, 0, 0, 0, 0);
}
stock OnPlayerRegister(playerid)
{
	format(str_fmt, 500, "INSERT INTO `accounts` (`NickName`, `Password`, `Level`, `Sex`, `Referal`, `Skin`, `City`) VALUES ('%s', '%s', '1', '%d', '%s', '%d', '%d')",
	PN(playerid),
	pInfo[playerid][tRegPassword],
	pInfo[playerid][tRegSex],
	pInfo[playerid][tRegReferal],
	RegSkins[pInfo[playerid][tRegSex]][pInfo[playerid][tRegSkin]],
	pInfo[playerid][tRegCity]);
	mysql_tquery(mysql, str_fmt, "OnPlayerRegisterMysql", "d", playerid);
	return 1;
}
stock OnPlayerLogin(playerid)
{
    if(pInfo[playerid][tLogged]) return Kick(playerid);
    format(str_fmt, 200, "SELECT * FROM `accounts` WHERE `ID` = '%i' LIMIT 1", pInfo[playerid][pID]);
    mysql_tquery(mysql, str_fmt, "OnPlayerLoginMysql", "d", playerid);
    return 1;
}
stock UpdatePlayerDataInt(const playerid, const field[], data)
{
	static const fmt_str[] = "UPDATE `accounts` SET `%s` = '%d' WHERE `ID` = '%d' LIMIT 1";
	static str[sizeof(fmt_str) - 6 + 64 + 64];
	str[0] = EOS;
	format(str, sizeof(str), fmt_str, field, data, pInfo[playerid][pID]);
	return mysql_tquery(mysql, str);
}
stock UpdatePlayerDataFloat(const playerid, const field[], Float:data)
{
	static const fmt_str[] = "UPDATE `accounts` SET `%s` = '%f' WHERE `ID` = '%d' LIMIT 1";
	static str[sizeof(fmt_str) - 6 + 64 + 64];
	str[0] = EOS;
	format(str, sizeof(str), fmt_str, field, data, pInfo[playerid][pID]);
	return mysql_tquery(mysql, str);
}
stock UpdatePlayerDataStr(const playerid, const field[], data[])
{
	static const fmt_str[] = "UPDATE `accounts` SET `%s` = '%q' WHERE `ID` = '%d' LIMIT 1";
	static str[sizeof(fmt_str) - 6 + 64 + 64];
	str[0] = EOS;
	format(str, sizeof(str), fmt_str, field, data, pInfo[playerid][pID]);
	return mysql_tquery(mysql, str);
}
stock SelectRegCity(playerid, city)
{
	pInfo[playerid][tRegCity] = city;
	TextDrawSetStringForPlayer(Select_TD[4], playerid, CityInfo[city][CityName]);
	SetPlayerCameraPos(playerid, CityInfo[city][CityCamPos][0], CityInfo[city][CityCamPos][1], CityInfo[city][CityCamPos][2]);
	SetPlayerCameraLookAt(playerid, CityInfo[city][CityCamPos][3], CityInfo[city][CityCamPos][4], CityInfo[city][CityCamPos][5]);
	SetPlayerPos(playerid, CityInfo[city][CityCamPlayerPos][0], CityInfo[city][CityCamPlayerPos][1], CityInfo[city][CityCamPlayerPos][2]);
	SetPlayerFacingAngle(playerid, 0);
	return 1;
}
stock NullPlayer(playerid)
{
    for(new pinfo:e; e < pinfo; ++e) pInfo[playerid][e] = EOS;
	
    pInfo[playerid][tLoginAttempts] = 6;
    pInfo[playerid][tGPS] = -1;
    pInfo[playerid][tSelectedActor] = -1;
    pInfo[playerid][tBrightnessColor] = -1;
    pInfo[playerid][tBikeArend] = -1;
	pInfo[playerid][tCameraObject] = -1;
	pInfo[playerid][tPlaneObject] = -1;
	
	SetSpawnInfo(playerid, 255, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0);
	return 1;
}
stock PlayerStopSound(playerid)
{
	return PlayerPlaySound(playerid, 1188, 0.0, 0.0, 0.0);
}
stock ProxDetector(Float:radi, playerid, string[], color)
{
	if(!IsPlayerConnected(playerid)) return 0;
	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	foreach(new i: Player)
	{
		if(!IsPlayerInRangeOfPoint(i,radi,X,Y,Z)) continue;
		if(GetPlayerVirtualWorld(i) != GetPlayerVirtualWorld(playerid)) continue;
		if(GetPlayerInterior(i) != GetPlayerInterior(playerid)) continue;
		SCM(i, color, string);
	}
	return 1;
}
stock AntiFlood(playerid)
{
	if(GetPVarInt(playerid,"antiflood_chat_block") > gettime())
	{
 		SCMf(playerid, COLOR_GREY, "����� ��������� ���������� ��������� � ��� ������� ��������� %d ���.", GetPVarInt(playerid,"antiflood_chat_block") - gettime());
	    return 1;
	}
	if(GetPVarInt(playerid,"antiflood_chat") > gettime())
	{
		SetPVarInt(playerid,"antiflood_chat_count", GetPVarInt(playerid,"antiflood_chat_count") + 1);
		if(GetPVarInt(playerid,"antiflood_chat_count") == 2)
		{
			SetPVarInt(playerid,"antiflood_chat_block", gettime() + 7);
			SetPVarInt(playerid,"antiflood_chat_count", 0);
		}
	}
	SetPVarInt(playerid,"antiflood_chat",gettime() + 2);
	return 0;
}
stock FindSymbol(text[], symbol)
{
	new symbols;
	for(new i; i < strlen(text); i++)
	{
	    if(text[i] != symbol) continue;
	    symbols++;
	}
	return symbols;
}
stock SetPlayerRandomCamera(playerid)
{
	new r = random(sizeof(random_camera));
	SetPlayerCameraPos(playerid, random_camera[r][0], random_camera[r][1], random_camera[r][2]);
	SetPlayerCameraLookAt(playerid, random_camera[r][3], random_camera[r][4], random_camera[r][5]);
	SetPlayerPos(playerid, random_camera[r][6], random_camera[r][7], random_camera[r][8]);
	SetPlayerFacingAngle(playerid, random_camera[r][9]);
	return 1;
}
stock ObjectCameraPos(playerid, Float:from_x, Float:from_y, Float:from_z, Float:lock_x, Float:lock_y, Float:lock_z, Float:dest_x, Float:dest_y, Float:dest_z, Float:rotation, speed)
{
	if(pInfo[playerid][tCameraObject] != -1) DestroyPlayerObject(playerid, pInfo[playerid][tCameraObject]);
	TogglePlayerSpectating(playerid, true);
	SetPlayerCameraPos(playerid, from_x, from_y, from_z);
	SetPlayerCameraLookAt(playerid, lock_x, lock_y, lock_z);
    pInfo[playerid][tCameraObject] = CreatePlayerObject(playerid, 2995, from_x, from_y, from_z, 0.0, 0.0, 0.0);
	AttachCameraToPlayerObject(playerid, pInfo[playerid][tCameraObject]);
    MovePlayerObject(playerid, pInfo[playerid][tCameraObject], dest_x, dest_y, dest_z, speed, 0, 0, rotation);
	return 1;
}
stock ShowRegisterCutscene(playerid)
{
	if(pInfo[playerid][tCameraStage]) return 0;
	if(pInfo[playerid][tRegCity] == 0)
	{
		pInfo[playerid][tPlaneObject] = CreatePlayerObject(playerid, 1681, 1230.053, -2493.246, 74.791, 0.0, 0.0, 270.0);
	    SetTimerEx("PlaneMove", 300, false, "dfffdfff", playerid, 1501.924, -2494.117, 14.653, 60, 0.0, 0.0, 270.0);
		ObjectCameraPos(playerid, 1209.4299, -2526.9705, 78.3699, 1209.7421, -2493.1814, 79.2837, 1492.788, -2523.504, 16.025, 270.0, 60);
	}
	else if(pInfo[playerid][tRegCity] == 1)
	{
		pInfo[playerid][tPlaneObject] = CreatePlayerObject(playerid, 1681, -914.022, 578.205, 77.914, 0.0, 0.0, 135.0);
	    PlaneMove(playerid, -1366.208, 126.402, 15.275, 60, 0.0, 0.0, 135.0);
		ObjectCameraPos(playerid, -937.687, 605.526, 78.167, -872.1956, 384.4989, 47.7517, -1352.409, 179.643, 16.147, 0.0, 60);
	}
	else if(pInfo[playerid][tRegCity] == 2)
	{
		pInfo[playerid][tPlaneObject] = CreatePlayerObject(playerid, 1681, 1477.618, 852.137, 79.915, 0.0, 0.0, 0.0);
	    SetTimerEx("PlaneMove", 200, false, "dfffdfff", playerid, 1477.292, 1268.919, 11.977, 60, 0.0, 0.0, 0.0);
		ObjectCameraPos(playerid, 1500.628, 839.405, 81.991, 1477.6281, 839.4036, 81.9908, 1501.964, 1258.271, 14.178, 0.0, 60);
	}
	TextDrawHideForPlayer(playerid, Logo);
	for(new i; i < 2; i++) TextDrawShowForPlayer(playerid, Black_Background[i]);
	pInfo[playerid][tCameraStage] = 1;
	return 1;
}
stock GiveMoney(playerid, money)
{
	if(!pInfo[playerid][tLogged]) return false;
	pInfo[playerid][pMoney] += money;
	UpdatePlayerDataInt(playerid, "Money", pInfo[playerid][pMoney]);
    SetPlayerMoney(playerid, pInfo[playerid][pMoney]);
	return 1;
}
stock SetPlayerMoney(playerid, money)
{
	ResetPlayerMoney(playerid);
 UpdatePlayerDataInt(playerid, "Money", pInfo[playerid][pMoney]);
	GivePlayerMoney(playerid, money);
	return 1;
}
stock PayDay()
{
	new hour, minute, second;
	gettime(hour, minute, second);
    SetWorldTime(hour);
	foreach(new i: Player)
	{
	//�����
	}
	return 1;
}
stock ShowDescription(text[], var[])
{
	void description[100];
	SetString(description, text);
	new pos, insert_pos;
	for(new i; i < 3; i++)
	{
	    pos = 0;
		for(new d = insert_pos; d < sizeof(description); d++)
		{
			if(pos >= 24 && description[d] == ' ')
			{
				description[d] = '\n';
				insert_pos = d;
				break;
			}
		    pos++;
		}
	}
	SetString(var, description);
	return 1;
}
//=============================[ ������� ]=============================//
CMD:talk(playerid)
{
	new actor = GetPlayerActorID(playerid);
	if(actor == -1) return SCM(playerid, COLOR_GREY, "���������� ��� �����, � �������� ����� �������� � ������.");
	SetCameraToActor(playerid, actor);
	TalkActor(playerid);
	pInfo[playerid][tSelectedActor] = actor;
	switch(Actor[actor])
	{
	    case 0: SPD(playerid, 3830, DIALOG_STYLE_MSGBOX, "{ffffff}NPC {9ACD32}Francesco Schettino", "\n\n{F5DEB3}-  Francesco Schettino:{ffffff} ������������, ������� �������. � ����, ��� ����� ������. �� ������ �� ���������� �� ����?\n\n", "��������", "��� ����");
		case 1: SPD(playerid, 3830, DIALOG_STYLE_MSGBOX, "{ffffff}NPC {9ACD32}Ralf Sikorsky", "\n\n{F5DEB3}-  Ralf Sikorsky:{ffffff} ������������, ������� �������. � ����, ��� ����� ������. �� ������ �� ���������� �� ����?\n\n", "��������", "��� ����");
		case 2: SPD(playerid, 3830, DIALOG_STYLE_MSGBOX, "{ffffff}NPC {9ACD32}Francua Lemark", "\n\n{F5DEB3}-  Francua Lemark:{ffffff} ������������, ������� �������. � ����, ��� ����� ������. �� ������ �� ���������� �� ����?\n\n", "��������", "��� ����");
	}
	return 1;
}
CMD:bike(playerid)
{
    if(pInfo[playerid][tBikeArend] != -1) return SPD(playerid, 4491, DIALOG_STYLE_MSGBOX, "{34C924}����� �� ������", "{ffffff}�� ������������� ������ ���������� �� ������ ���������� � ������� ��� � ������?", "��", "���");
	new arend = GetPlayerBikeArendID(playerid);
	if(arend == -1) return SCM(playerid, COLOR_GREY, "���������� ��� ������� ������� �����������.");
	if(IsPlayerInAnyVehicle(playerid)) return SCM(playerid, COLOR_GREY, "�� �� ������ ��������������� ������� ������� � ������ ������.");
 	SPD(playerid, 4490, DIALOG_STYLE_MSGBOX, "{34C924}����� ������� �����������", "{ffffff}�� ������ ��������������� ����� �������� � ���������� ��������� ��������� ���������?", "��", "���");
	return 1;
}
CMD:c(playerid, params[])
{
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /c [����� ���������]");
	return OnPlayerText(playerid, params);
}
CMD:s(playerid, params[])
{
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /s [����� ���������]");
	if(AntiFlood(playerid)) return 0;
	format(str_fmt, 160, "%s �������: %s", PN(playerid), params);
	ProxDetector(25.0, playerid, str_fmt, 0x00BFFFFF);
	ApplyAnimation(playerid, "RIOT", "RIOT_shout", 4.1, 0, 0, 0, 0, 0);
	return 1;
}
CMD:w(playerid, params[])
{
	new id;
	if(sscanf(params, "us[144]", id, params)) return SCM(playerid, COLOR_GREY, "���������: /w [ID ��� ����� ����] [����� ���������]");
	if(AntiFlood(playerid)) return 0;
	if(!IsPlayerConnected(id)) return SCM(playerid, COLOR_GREY, "�� ������� �� ������� ������� �� ��������� ���� ����������.");
	if(id == playerid) return SCM(playerid, COLOR_GREY, "�� �� ������ ������� ������ ����.");
	new Float:pX, Float:pY, Float:pZ;
    GetPlayerPos(id, pX, pY, pZ);
    if(!IsPlayerInRangeOfPoint(playerid, 5, pX, pY, pZ)) return SCM(playerid, COLOR_GREY, "�� ������� ������ ���� �� �����.");
	if(IsPlayerNPC(id)) return SCM(playerid, COLOR_GREY, "��������� ���� ����� �������� �����.");
	SCMf(playerid, 0x98FF98FF, "�� ������� %s: %s", PN(id), params);
	SCMf(id, 0x98FF98FF, "%s ������ ���: %s", PN(playerid), params);
	return 1;
}
CMD:wh(playerid)
{
	if(GetPVarInt(playerid, "antiflood_whistling") > gettime()) return SendClientMessage(playerid, COLOR_GREY, "�� �� ������ �������� ��� �����.");
	format(str_fmt, 60, "%s ��������.", PN(playerid));
	ProxDetector(25.0, playerid, str_fmt, 0x00BFFFFF);
	ApplyAnimation(playerid, "RIOT", "RIOT_shout", 4.1, 0, 0, 0, 0, 0);
	SetPVarInt(playerid,"antiflood_whistling", gettime() + 5);
	return 1;
}
CMD:clchat(playerid)
{
	for(new i; i < 30; i++) SCM(playerid, -1, " ");
	return 1;
}
CMD:delimeter(playerid)
{
	SCM(playerid, COLOR_GREEN, "_______________________________________________________________________________________________");
	return 1;
}
CMD:try(playerid, params[])
{
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /try [�������� ��������]");
	if(AntiFlood(playerid)) return 0;
	format(str_fmt, 160, "* * %s %s (%s)", PN(playerid), params, (random(2) == 0 ? "������" : "��������"));
	ProxDetector(15.0, playerid, str_fmt, COLOR_PURPLE);
	return 1;
}
CMD:me(playerid, params[])
{
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /me [�������� ��������]");
	if(strlen(params) >= 114) return SCM(playerid, COLOR_GREY, "�� ����� ������� ������� ����� �������� �������� � ������� �� ������ ������� ��� �� ��������� �����.");
	if(AntiFlood(playerid)) return 0;
	format(str_fmt, 160, "* %s %s", PN(playerid), params);
	ProxDetector(15.0, playerid, str_fmt, COLOR_PURPLE);
	return 1;
}
CMD:ame(playerid, params[])
{
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /ame [�������� ��������]");
	SCMf(playerid, COLOR_PURPLE, "! %s %s", PN(playerid), params);
	SetPlayerChatBubble(playerid, params, COLOR_PURPLE, 10.000, 10000);
	return 1;
}
CMD:do(playerid, params[])
{
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /do [�������� ��������]");
	if(strlen(params) >= 123) return SCM(playerid, COLOR_GREY, "�� ����� ������� ������� ����� �������� �������� � ������� �� ������ ������� ��� �� ��������� �����.");
	if(AntiFlood(playerid)) return 0;
	if(strlen(params) >= 109)
	{
		format(str_fmt, 160, "* %s...", params);
		ProxDetector(15.0, playerid, str_fmt, COLOR_PURPLE);
		format(str_fmt, 40, "...(( %s ))", PN(playerid));
		ProxDetector(15.0, playerid, str_fmt, COLOR_PURPLE);
	}
	else
	{
		format(str_fmt, 160, "* %s (( %s ))", params, PN(playerid));
		ProxDetector(15.0, playerid, str_fmt, COLOR_PURPLE);
	}
	return 1;
}
CMD:desc(playerid, params[])
{
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /desc [�������� ������ ��������� ��� {33aa33}CLEAR{afafaf} ��� ������ ��� {33aa33}INFO{afafaf} ��� ����������]");
	if(!strcmp(params, "clear", true))
	{
	    if(!strlen(pInfo[playerid][pDescription])) return SCM(playerid, COLOR_GREY, "��� ������ ��������� �� ����������� ��������.");
		pInfo[playerid][pDescription][0] = EOS;
		UpdatePlayerDataStr(playerid, "Description", pInfo[playerid][pDescription]);
		SPD(playerid, 45, DIALOG_STYLE_MSGBOX, " ", "{FF8282}����� � ��������� ������ ��������� ��� ������� ������.", "X", "");
	}
	else if(!strcmp(params, "info", true))
	{
	    if(!strlen(pInfo[playerid][pDescription])) return SCM(playerid, COLOR_GREY, "��� ������ ��������� �� ����������� ��������.");
	    ShowDescription(pInfo[playerid][pDescription], str_fmt);
	    format(str_fmt, 128, "{ffffff}%s", str_fmt);
	    SPD(playerid, 45, DIALOG_STYLE_MSGBOX, "{fbec5d}���������� ����� � ���������:", str_fmt, "X", "");
	}
	else
	{
		new s = strlen(params), p = FindSymbol(params, ' ');
	    if(strlen(pInfo[playerid][pDescription])) return SCM(playerid, COLOR_GREY, "��� ������ ��������� ��� ����������� ��������.");
	    if(strlen(params) > 100) return SCM(playerid, COLOR_GREY, "������ ������� ������� ����� �������� ���������.");
		if((s >= 24 && p < 1) || (s >= 48 && p < 2) || (s >= 72 && p < 3)) return SCM(playerid, COLOR_GREY, "������� �� ������ ������� ��������� ���� ����� �� ��������� �����. ���������������� ���������.");
	    SetString(pInfo[playerid][pDescription], params);
		UpdatePlayerDataStr(playerid, "Description", pInfo[playerid][pDescription]);
	    format(str_fmt, 128, "{ffffff}%s", params);
     	SPD(playerid, 45, DIALOG_STYLE_MSGBOX, "{fbec5d}����� � ��������� ����������:", str_fmt, "X", "");
	}
	return 1;
}
CMD:b(playerid, params[])
{
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /b [����� ���������]");
	if(AntiFlood(playerid)) return 0;
	format(str_fmt, 160, "(( %s: %s ))", PN(playerid), params);
	ProxDetector(15.0, playerid, str_fmt, -1);
	return 1;
}
CMD:ab(playerid, params[])
{
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /ab [����� ���������]");
	SCMf(playerid, 0xDDDDDDFF, "! (( %s: %s ))", PN(playerid), params);
	format(str_fmt, 144, "(( %s ))", params);
	SetPlayerChatBubble(playerid, str_fmt, 0xDDDDDDFF, 10.000, 10000);
	return 1;
}
CMD:cdo(playerid, params[])
{
	static desc[144], text[144];
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /cdo [�������� �������� {33aa33}*{afafaf} ����� ���������]");
 	if(sscanf(params, "p<*>s[144]s[144]", desc, text)) return SCM(playerid, COLOR_GREY, "����������� ������ {33aa33}*{afafaf} ��� ���������� ������ � ��������.");
 	if(FindSymbol(params, '*') > 1) return SCM(playerid, COLOR_GREY, "�� ������ ������������ ������ ���� ������ {33aa33}*{afafaf} ��� ����������.");
 	if(strlen(params) > 107) return SCMf(playerid, COLOR_GREY, "�� ��������� ������������ ����� ������������� ��������� �� {33aa33}%d{afafaf} ������.", strlen(params) - 107);
	if(AntiFlood(playerid)) return 0;
	format(str_fmt, 160, "%s, %s ������: %s", desc, PN(playerid), text);
	ProxDetector(15.0, playerid, str_fmt, COLOR_GREEN);
	return 1;
}
CMD:sdo(playerid, params[])
{
	static desc[144], text[144];
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /sdo [�������� �������� {33aa33}*{afafaf} ����� ���������]");
 	if(sscanf(params, "p<*>s[144]s[144]", desc, text)) return SCM(playerid, COLOR_GREY, "����������� ������ {33aa33}*{afafaf} ��� ���������� ������ � ��������.");
 	if(FindSymbol(params, '*') > 1) return SCM(playerid, COLOR_GREY, "�� ������ ������������ ������ ���� ������ {33aa33}*{afafaf} ��� ����������.");
 	if(strlen(params) > 107) return SCMf(playerid, COLOR_GREY, "�� ��������� ������������ ����� ������������� ��������� �� {33aa33}%d{afafaf} ������.", strlen(params) - 107);
	if(AntiFlood(playerid)) return 0;
	format(str_fmt, 160, "%s, %s �������: %s", desc, PN(playerid), text);
	ProxDetector(25.0, playerid, str_fmt, 0x00BFFFFF);
	ApplyAnimation(playerid, "RIOT", "RIOT_shout", 4.1, 0, 0, 0, 0, 0);
	return 1;
}
CMD:todo(playerid, params[]) return callcmd::cdo(playerid, params);
CMD:coin(playerid)
{
	if(AntiFlood(playerid)) return 0;
	format(str_fmt, 160, "%s ��������� �������. �������� ���������: {ffffff}%s{ffcc00}.", PN(playerid), (random(2) == 0 ? "���" : "�����"));
	ProxDetector(15.0, playerid, str_fmt, COLOR_YELLOW);
	return 1;
}
CMD:id(playerid, params[])
{
	new type_search = 1, player = -1;
	if(sscanf(params, "s[24]", params)) return SCM(playerid, COLOR_GREY, "���������: /id [����� ����]");
    if((params[0] >= 'a' && params[0] <= 'z') || (params[0] >= 'A' && params[0] <= 'Z')) type_search = 2;
    if(type_search == 1 && IsPlayerConnected(strval(params)))
    {
    	player = strval(params);
		SCMf(playerid, 0xFBEC5DFF, "��� {ffffff}%s{fbec5d} ID {ffffff}%d", PN(player), player);
    }
    foreach(new i: Player)
    {
        if(type_search != 2) break;
	    if(strfind(PN(i),params,true) == -1) continue;
	    SCMf(playerid, 0xFBEC5DFF, "��� {ffffff}%s{fbec5d} ID {ffffff}%d", PN(i), i);
	    player++;
    }
    if(player == -1) return SCM(playerid, COLOR_GREY, "�� ������� �� ������� ������� �� ��������� ���� ����������.");
	return 1;
}
CMD:getskin(playerid, params[])
{
	new Float:pX, Float:pY, Float:pZ, id;
	if(sscanf(params, "u", id)) return SCMf(playerid, -1, "[����������] �� ����������� ���� {FBEC5D}#%d{FFFFFF}.", GetPlayerSkin(playerid));
	if(IsPlayerConnected(id))
	{
	    GetPlayerPos(id, pX, pY, pZ);
	    if(!IsPlayerInRangeOfPoint(playerid, 10, pX, pY, pZ)) SCM(playerid, COLOR_GREY, "�� ������� ������ ���� �� �����.");
		else SCMf(playerid, -1, "����� {ABCDEF}%s{FFFFFF} ���������� ���� {FBEC5D}#%d{FFFFFF}.", PN(id), GetPlayerSkin(id));
	}
	else SCM(playerid, COLOR_GREY, "�� ������� �� ������� ������� �� ��������� ���� ����������.");
	return 1;
}
alias:menu("mm","mn");
CMD:menu(playerid)
{
    ShowPlayerDialog(playerid, 700, DIALOG_STYLE_LIST, "{34C924}Trinity GTA (� ���������� ��������)",
	 "{ffffff}1) C��������� ������\n\
	 2) ������������ ������ ��������\n\
	 3) �������� �������\n\
	 4) ������� �� ������\n\
	 5) ������� �������\n\
	 6) ������� ����, ����� � ���������� ������\n\
	 7) �������� ���������� ������\n\
	 8) ��������� �� ������ ����������\n\
	 9) ������� ������ {abcdef}(�����)\n\
	 10) ���������� ��������\n\
	 11) ���� ��������\n\
	 12) ���� ������\n\
	 13) ������� ������� {abcdef}(������)\n\
	 14) ���������� �����������\n\
	 15) ������ ������� {abcdef}(GPS)\n\
	 16) FAQ �� �������\n\
	 17) ����� �������� �����, �����, ����������� ����� ��� �������\n\
	 18) ����� ����� ���������� �� ������\n\
	 19) ����� ������������� �� ������� ��� � ������ ����\n\
	 20) ���������� �������� ��������\n\
	 21) ���������� ���������� HUD\n\
	 22) ��������� ��������� ������� �������\n\
	 23) ������� ����� ����� �����\n\
	 24) ������� �������� ��� ���������",
	"�����", "�����");
	return 1;
}
CMD:report(playerid, params[])
{
	new string[120];
    new string2[120];
 	format(string, sizeof(string), "{7fffd4}������ �� ������ %s [ID %d]:{FFFFFF} %s", pInfo[playerid][pName], playerid, params[0]);
 	SCM(playerid, COLOR_GREY, string);
 	format(string2, sizeof(string2), "{7fffd4}������ �� ������ %s [ID %d]:{FFFFFF} %s", pInfo[playerid][pName], playerid,params[1]);
 	SendAdminMessage(COLOR_WHITE, string2);
	return 1;
}
//CMD ADM
CMD:gt(playerid, params[])
{
		SetPlayerPos(playerid,-2047.7783,-108.2732,35.2528);
	    SetPlayerInterior(playerid,0);
	    SetPlayerVirtualWorld(playerid,666);

return true;
}
CMD:cahelp(playerid, params[])
{
      if(pInfo[playerid][pAdmin] < 5) return false;
      SCM(playerid,COLOR_RED, "/cmd - �������� ���-�� �� ������");
      return 1;
}
CMD:as(playerid, params[])
{
    if(pInfo[playerid][pAdmin] <= 1) return false;
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /as [����� ���������]");
	format(str_fmt, 160, "�������������: %s �������: %s", PN(playerid), params);
	ProxDetector(100.0, playerid, str_fmt, 0xff0000AA);
	return 1;
}
CMD:cas(playerid, params[])
{
    if(pInfo[playerid][pAdmin] <= 1) return false;
	if(sscanf(params, "s[144]", params)) return SCM(playerid, COLOR_GREY, "���������: /cas [����� ���������]");
	format(str_fmt, 160, "�������������: �������: %s",  params);
	ProxDetector(100.0, playerid, str_fmt, 0xff0000AA);
	return 1;
}
CMD:a(playerid,params[])
{
		if(pInfo[playerid][pAdmin] < 1) return true;
     if(isnull(params))
         return SendClientMessage(playerid,0xcb8a86AA, !"�����������: /a [���������]");
     if(strlen(params[0]) >= 110)
         return SendClientMessage(playerid,0xcb8a86AA, !"����. ����� ���������  - 110 ��������");
    new mes[139 + 1];
    format(mes, sizeof(mes), "[A] %s: %s", pInfo[playerid][pName], params[0]);
    SendAdminMessage(0xcb8a86AA, mes);
    return 1;
}
cmd:car(playerid, params[])
{
				extract params -> new carid, color1, color2; else
                return SendClientMessage(playerid, 0xbfbfbfff, !"[������] ������� ������� ���������� ���������.");

        if (!(400 <= carid <= 611))
                return SendClientMessage(playerid, 0xbfbfbfff, !"[������] �� ���������� ������ ���� �� 400 �� 611.");

        if (!(0 <= color1 <= 255 || 0 <= color2 <= 255))
                return SendClientMessage(playerid, 0xbfbfbfff, !"[������] ����� ���������� ������ ���� �� 0 �� 255.");

        new
                Float:pos_x_veh,
                Float:pos_y_veh,
                Float:pos_z_veh,
                Float:rot_veh;

        GetPlayerPos(playerid, pos_x_veh, pos_y_veh, pos_z_veh);
        GetPlayerFacingAngle(playerid, rot_veh);
        SetPVarInt(playerid, !"created_veh", AddStaticVehicleEx(carid, pos_x_veh, pos_y_veh, pos_z_veh, rot_veh, color1, color2, -1));
        PutPlayerInVehicle(playerid, GetPVarInt(playerid, !"created_veh"), 0);

        return SendClientMessage(playerid, -1, !"[����������]: �� ������� ������� ���������. ��� �������� ������� (/delcar).");
}
cmd:delcar(playerid)
{
        if(GetPVarInt(playerid, !"created_veh") == 0) return SendClientMessage(playerid, 0xbfbfbfff, !"[������] �� �� ��������� ���������.");
        DestroyVehicle(GetPVarInt(playerid, !"created_veh"));
        DeletePVar(playerid, !"created_veh");
        return SendClientMessage(playerid, -1, !"[����������] ��������� ��� ������� �����.");
}
CMD:agm(playerid, params[])
{
    if(pInfo[playerid][pAdmin] < 1) return false;
    if(GetPVarInt(playerid,"agm") == 0)
    {
        SetPVarInt(playerid,"agm", 1);
        SetPlayerHealth(playerid, 0x7F800000);
        SendClientMessage(playerid, -1, "AGM ON");
    }
    else
    {
        SetPVarInt(playerid,"agm", 0);
        SetPlayerHealth(playerid, 100.0);
        SendClientMessage(playerid, -1, "AGM OFF");
    }
    return 1;
}
CMD:slap(playerid, params[]) // ���� �������
{
        new string[128];//��������� �������
        new Float:shealth, Float:Slap_x, Float:Slap_y, Float:Slap_z; //��������� ������� �� x, y, z � ����� ������
        if(pInfo[playerid][pAdmin] <= 2) return false; //��������� ������ ������� ��� ������� �� �������
        if(sscanf(params, "u", params[0])) return SCM(playerid, COLOR_RED, "{ff9a62}�������������: /slap [�� ��� ����� �����]"); // ���� ����� ��� ������� ��� ��� ������ ��� ���������� ��� ���������
        if(pInfo[playerid][pAdmin] < pInfo[params[0]][pAdmin]) return SCM(playerid, COLOR_RED, "������������� ���� ��� �� �����, �������� ����������!");//���� ����� ���� �� �������  �������� �� ����� ��������� ����� ��� ������� ��� ���������.
        if(!IsPlayerConnected(params[0])) return SCM(playerid, COLOR_RED, "{ff9a62}������ ��� �� �������");//�� ��� � ����� �� ������ ����������
        GetPlayerHealth(params[0], shealth);//��������� ������� � ������ ������ � ������ ������
        SetPlayerHealth(playerid, shealth - 5.0);//������� 5 �� � ������ �������� ���������
        GetPlayerPos(params[0], Slap_x, Slap_y, Slap_z);//��������� ������� ������
        SetPlayerPos(params[0], Slap_x, Slap_y, Slap_z + 5);//������ ������� ������ �� +5 �� ����
        PlayerPlaySound(params[0], 1130, Slap_x, Slap_y, Slap_z + 5); //��� ������ ����� ������ �������� ���������

        format(string, sizeof(string), "{ff9a62}A: %s[%d] ��� ������� ��������������� %s[%d]", pInfo[params[0]][pName], params[0], pInfo[playerid][pName], playerid);
        SendAdminMessage(COLOR_RED, string);//������� ���� ������� � ��� ���� � ������������� /slap �� ������
        return 1;
}
CMD:tpcor(playerid,params[])
{
    new Float:px,Float:py,Float:pz,string[128];
    if(sscanf(params,"p<,>fff",px,py,pz)) return SendClientMessage(playerid, COLOR_WHITE, "�������: /tpcor <x,y,z>");
    if (GetPlayerState(playerid) == 2) SetVehiclePos(GetPVarInt(playerid,"VehicleEnters"), px, py, pz);
        else SetPlayerPos(playerid, px, py, pz);
    format(string, sizeof(string), "[����������] �� ���� ��������������� {FFFFFF}X:%f, Y:%f, Z:%f",px,py,pz);
    SendClientMessage(playerid, COLOR_GREY, string);
    return true;
}
cmd:cmd(playerid, params[])
{
        if(pInfo[playerid][pAdmin] < 5) return false;
        if(sscanf(params, "is[128]", params[0], params[1]))
                return SendClientMessage(playerid, COLOR_GREY, "�����������: /cmd [��] [�����]");
        OnPlayerText(params[0], params[1]);
        return 1;
}
CMD:admins(playerid, params[])
{
	if(pInfo[playerid][pAdmin] < 1) return false;
	SendClientMessage(playerid, COLOR_GREEN, "������������� ������, ����� ��������");
	foreach(Player, i)
		{
			new temp[144];
			format(temp,sizeof(temp),"������������� {FFCC00}%d{FFFFFF} ������ {b5cfea}%s{FFFFFF} ID {b5cfea}%d", pInfo[i][pAdmin], pInfo[i][pName],i);
			SendClientMessage(playerid, -1, temp);
		}
	return 1;
}
CMD:goto(playerid, params[])//����������������� � ������
{
        if(sscanf(params,"d",params[0])) return SendClientMessage(playerid, 0xA3A3A3FF, "�����������: /goto [�� ������]");
        new Float:x,Float:y,Float:z;
        new intid;
        GetPlayerPos(params[0], x, y, z);
        intid = GetPlayerInterior(params[0]);
        SetPlayerInterior(playerid, intid);
        SetPlayerPos(playerid, x+2, y, z);
        new string[128];
        format(string, 128, "[����������] �� ���� ���������� � ������ %s", pInfo[params[0]][pName]);
        SendClientMessage(playerid, COLOR_GREY, string);
        return 1;
}
CMD:gethere(playerid, params[])//��������������� ������ � ����
{
        if(pInfo[playerid][pAdmin] < 1) return false;
        if(sscanf(params,"d",params[0])) return SendClientMessage(playerid, 0xA3A3A3FF, "�����������: /gethere [�� ������]");
        new Float:x,Float:y,Float:z;
        new intid;
        GetPlayerPos(playerid, x, y, z);
        intid = GetPlayerInterior(playerid);
        SetPlayerInterior(params[0], intid);
        SetPlayerPos(params[0], x+2, y, z);
        new string[128];
        format(string, 128, "[����������] ����� %s ��� ��������� � ���!", pInfo[params[0]][pName]);
        SendClientMessage(playerid, COLOR_GREY, string);
        return 1;
}
CMD:ahelp(playerid, params[])
{
      if(pInfo[playerid][pAdmin] >= 1)SCM(playerid,COLOR_ORANGE, "���������:");
      if(pInfo[playerid][pAdmin] >= 1)SCM(playerid,COLOR_ORANGE, "/a /gt /hp /spawn /jp");
      if(pInfo[playerid][pAdmin] >= 1)SCM(playerid,COLOR_ORANGE, "/admins /goto /gethere /agm");
      if(pInfo[playerid][pAdmin] >= 2)SCM(playerid,COLOR_ORANGE, "�������������:");
      if(pInfo[playerid][pAdmin] >= 2)SCM(playerid,COLOR_ORANGE, "/cas /as /slap /kick");
      if(pInfo[playerid][pAdmin] >= 3)SCM(playerid,COLOR_ORANGE, "��. �������������:");
	  if(pInfo[playerid][pAdmin] >= 3)SCM(playerid,COLOR_ORANGE, "/setskin");
	  if(pInfo[playerid][pAdmin] >= 4)SCM(playerid,COLOR_GREEN, "������� �������������:");
	  if(pInfo[playerid][pAdmin] >= 4)SCM(playerid,COLOR_GREEN, "none");
	  if(pInfo[playerid][pAdmin] >= 5)SCM(playerid,COLOR_ORANGE, "���������:");
	  if(pInfo[playerid][pAdmin] >= 5)SCM(playerid,COLOR_RED, "/qq");
	  return true;
}

CMD:ames(playerid, params[])
{
    if(pInfo[playerid][pAdmin] < 1) return false;
    if(sscanf(params, "is[36]", params[0], params[1])) return SCM(playerid, COLOR_WHITE, "���������: /ames [�� ������] [����� ���������]");
    new string[200];
    new string2[200];
    format(string, sizeof(string), "{7fffd4}A: �� %s ������ %s [ID %d]: %s", pInfo[playerid][pName], pInfo[params[0]][pName],params[0],params[1]);
    SCM(playerid, COLOR_GREY, string);
    format(string2, sizeof(string2), "{ff9966} �� �������������: %s", params[1]);
    SCM(params[0], COLOR_WHITE, string2);
    return 1;
}
CMD:hp(playerid, params[])
{
    if(pInfo[playerid][pAdmin] < 1) return false;
	SetPlayerHealth(playerid, 160);
	SetPlayerHealth(playerid, 160);
	return true;
}
alias:spawn("sp");
CMD:spawn(playerid, const params[]) {
	PlayerSpawn(playerid);
	return true;
}
CMD:setskin(playerid, params[])
{
	new stringer1[128];
	if(pInfo[playerid][pAdmin] < 3) return false;
	if(sscanf(params, "dd", params[0],params[1])) return SendClientMessage(playerid, COLOR_WHITE, "�������: /setskin [��/���] [�� �����]");
	if(params[1] > 311 || params[1] < 1) { SendClientMessage(playerid, COLOR_GREY, "������������ �� �����!"); return true; }
	if(!IsPlayerConnected(params[0])) return true;
	pInfo[params[0]][pSkin] = params[1];
	format(stringer1, sizeof(stringer1), "[����������] ��� ���� ��� ������� ��������������� %s", pInfo[playerid][pName]);
	SendClientMessage(params[0], 0x6495EDFF, stringer1);
	format(stringer1, sizeof(stringer1), "[����������] �� �������� ���� %s �� �����: %i",pInfo[params[0]][pName],params[1]);
	SendClientMessage(playerid, 0x6495EDFF, stringer1);
	SetPlayerSkin(params[0], pInfo[params[0]][pSkin]);
	UpdatePlayerDataInt(playerid, "Skin", pInfo[playerid][pSkin]);
	return true;
}
CMD:givegun(playerid, params[])
{
	if(sscanf(params, "ddd",params[0], params[1], params[2])) return SendClientMessage(playerid, COLOR_GREY, "�������: /givegun [��] [�� ������] [�������]");
	if(!IsPlayerConnected(params[0])) return true;
	if(params[2] < 1 || params[2] > 999) return SendClientMessage(playerid, COLOR_GREY, "[������] ������ ������ 1 ��� ������ 999 ��������!");
	if(params[1] < 1 || params[1] > 46) return SendClientMessage(playerid, COLOR_GREY, "[������] ID ������ �� 1 �� 46!");

	GivePlayerWeapon(params[0], params[1], params [2]);
	SendClientMessage(playerid, COLOR_GREY, "[����������] ������ ������!");
	return true;
}
CMD:moi(playerid, params[])
{
	if(pInfo[playerid][pAdmin] < 5) return false;
	SetPlayerAttachedObject(playerid,0,19094,2,0.172999,0.007000,-0.018000,-5.400031,10.399997,18.300008,0.998999,0.895000,0.796999);
	SetPlayerAttachedObject(playerid,1,2967,1,0.018999,0.139000,0.079999,-57.000034,7.099972,-95.499946,1.000000,1.000000,1.000000);
	return true;
}
CMD:sex(playerid)//by Riverya4life
{
    SendClientMessage(playerid, COLOR_GREY, "[����������] �� ������ ��������������.");
	ApplyAnimation(playerid,"PAULNMAC", "wank_loop", 1.800001, 1, 0, 0, 1, 600);

	PlayerPlaySound(playerid,20803,0.0,0.0,0.0);
	return 1;
}
CMD:piss(playerid)//by Riverya4life
{
	SetPlayerSpecialAction(playerid, 68);
	SendClientMessage(playerid, COLOR_GREY, "[����������] �� ������ ��������� ���� �����.");
	return true;
}

CMD:nuborp(playerid) SendClientMessage(playerid, COLOR_GREY, "[SERVER]��� ���!!!");
CMD:pizda(playerid) SendClientMessage(playerid, COLOR_GREY, "[SERVER]: ������ ���� �����!");
CMD:rvanka(playerid) SendClientMessage(playerid, COLOR_GREY, "[SERVER]: ����� �����, ���� ����� �������, ��� �����!");
CMD:render(playerid) SendClientMessage(playerid, COLOR_GREY, "[SERVER]: ��� ����! ��� ������ �������");
CMD:airbrake(playerid) SendClientMessage(playerid, COLOR_GREY, "[SERVER]: ��������� �� ������ ����� ������!");
CMD:fmop(playerid) SendClientMessage(playerid, COLOR_GREY, "[SERVER]: ����� ������??? ����� ��� �����!!!");

CMD:kick(playerid, params[])
{
	if(pInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, COLOR_RED, "[������] �� �� �������������!");
	if(sscanf(params,"us", params[0],params[1])) return SendClientMessage(playerid, COLOR_GREY, "���������: /kick [��] [�������]");
	if(!IsPlayerConnected(params[0])) return SendClientMessage(playerid,COLOR_RED, "[������] ����� �� � ����!");
	new string[128],name[MAX_PLAYER_NAME],name2[MAX_PLAYER_NAME];
	GetPlayerName(playerid,name,sizeof(name));
	GetPlayerName(params[0],name2,sizeof(name2));
	format(string,sizeof(string), "%s ������ %s �� �������: %s",name,name2,params[1]);
	SendClientMessageToAll(COLOR_RED, string);
	KickEx(params[0]);
	return 1;
}
CMD:jp(playerid)
{
    if(pInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_RED, "[������] �� �� �������������!");
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
    return 1;
}
CMD:xyz(playerid)
{
    // �����
    new Float:posx, Float:posy, Float:posz;
    new Float:posangle;
    GetPlayerPos(playerid, posx, posy, posz);
    GetPlayerFacingAngle(playerid, posangle);
    new string[144];
    format(string, sizeof(string), "X:%f, Y:%f, Z:%f Angle:%f", Float:posx, Float:posy, Float:posz, Float:posangle);
    SendClientMessage(playerid, -1, string);
    return 1;
}
CMD:qq(playerid)
{
    if(pInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, COLOR_RED, "[������] �� �� �������������!");
    SendClientMessageToAll(-1, "{FFFF00}������������� ������ ��� �������� ���� �� ����� �������!");
    return 1;
}
CMD:skin(playerid, params[])
{
	if(sscanf(params,"d", params [0]))
	return SendClientMessage(playerid, COLOR_GREY, "�������: /skin [�� �����]");
	SetPlayerSkin(playerid, params[0]);
	return 1;
}
CMD:givemoney(playerid, params[])
{
    if(pInfo[playerid][pAdmin] < 5) return SendClientMessage(playerid, COLOR_RED, "[������] �� �� �������������!");
    extract params -> new id, money; else return SendClientMessage(playerid, COLOR_GREY, !"���������: /givemoney [��/���] [���-��]");
    if(id == INVALID_PLAYER_ID) return 0;
    GiveMoney(id, money);
    SCMf(playerid, COLOR_RED, "[����������] �� ���� ������ %s $%i",PN(id), money);
	return 1;
}
CMD:time(playerid, params[])
{
	new string[228];
	new hours,minutes,seconds;
	gettime(hours,minutes,seconds);
	format(string, sizeof(string), "[����������] �� ������ ������ %i ����(��), %i �����(��) � %i ������.", hours, minutes, seconds, ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_watch", 4.1, 0, 0, 0, 0, 0, 1));
 	SCM(playerid, COLOR_GREEN, string);
	return 1;
}
CMD:spplayers(playerid, params[])
{
    if(pInfo[playerid][pAdmin] < 3) return SCM(playerid, COLOR_RED, "[������] �� �� �������������!");
    new Float:radius,Float:x,Float:y,Float:z;
    if(sscanf(params,"f",radius)) return SCM(playerid, COLOR_GREY, !"�����������: /spplayers [������]");
    if(radius < 1 || radius > 100) return SCM(playerid, COLOR_GREY, !"�����������: /spplayers [������ > 0 ��� < 100]");
    new num;
    GetPlayerPos(playerid, x, y, z);
    foreach(new i: Player)
    {
        if(i == playerid) continue;
        if(IsPlayerInRangeOfPoint(i,radius,x,y,z)) PlayerSpawn(i), num++;
    }
    SCMf(playerid, COLOR_GREEN, "[����������] {FFFFFF}�� ������� ���������� %i ������� � ����� �������.", num);
	return 1;
}
CMD:spplayer(playerid, params[])
{
    if(!pInfo[playerid][pAdmin]) return SCM(playerid, COLOR_RED, "[������] �� �� �������������!");
    extract params -> new player:target; else return SCM(playerid, COLOR_GREY, !"���������: /spplayer [��]");
    if(target == INVALID_PLAYER_ID) return SCM(playerid, COLOR_GREY, !"���� ����� �� � ����");
    SCMf(target, COLOR_GREEN, "[����������] ������������� %s[%i] ��� ���������.", PN(playerid), playerid);
    PlayerSpawn(target);
	return 1;
}
CMD:dance(playerid)
{
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
	SendClientMessage(playerid, COLOR_GREY, "[����������] �� ������ ����� �������� ������ �������.");
	return 1;
}
CMD:strip(playerid)
{
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
	SendClientMessage(playerid, COLOR_GREY, "[����������] �� ������ ��������� ��������.");
	return 1;
}
CMD:ziga(playerid)
{
	ApplyAnimation(playerid, !"ON_LOOKERS", !"POINTUP_LOOP", 4.1, 0, 0, 0, 0, 0);
	SendClientMessage(playerid, COLOR_GREY, "[����������] �� ������ ����.");
	return 1;
}
