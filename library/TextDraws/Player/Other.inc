//	CreatePlayerTextDraw(playerid, 0.0, 0.0, "-");
	
	Time_TD[playerid][1] = CreatePlayerTextDraw(playerid, 578.000000, 12.000000, "-");
	PlayerTextDrawLetterSize(playerid, Time_TD[playerid][1], 0.500000, 2.600000);
	PlayerTextDrawTextSize(playerid, Time_TD[playerid][1], 1280.000000, 1280.000000);
	PlayerTextDrawAlignment(playerid, Time_TD[playerid][1], 2);
	PlayerTextDrawColor(playerid, Time_TD[playerid][1], 0xF5DEB3FF);
	PlayerTextDrawUseBox(playerid, Time_TD[playerid][1], 0);
	PlayerTextDrawBoxColor(playerid, Time_TD[playerid][1], 0x80808080);
	PlayerTextDrawSetShadow(playerid, Time_TD[playerid][1], 2);
	PlayerTextDrawSetOutline(playerid, Time_TD[playerid][1], 1);
	PlayerTextDrawBackgroundColor(playerid, Time_TD[playerid][1], 0x000000FF);
	PlayerTextDrawFont(playerid, Time_TD[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, Time_TD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, Time_TD[playerid][1], 0);

	Time_TD[playerid][0] = CreatePlayerTextDraw(playerid, 578.000000, 34.000000, "-");
	PlayerTextDrawLetterSize(playerid, Time_TD[playerid][0], 0.200000, 1.000000);
	PlayerTextDrawTextSize(playerid, Time_TD[playerid][0], 1280.000000, 1280.000000);
	PlayerTextDrawAlignment(playerid, Time_TD[playerid][0], 2);
	PlayerTextDrawColor(playerid, Time_TD[playerid][0], 0xF5DEB3FF);
	PlayerTextDrawUseBox(playerid, Time_TD[playerid][0], 0);
	PlayerTextDrawBoxColor(playerid, Time_TD[playerid][0], 0x80808080);
	PlayerTextDrawSetShadow(playerid, Time_TD[playerid][0], 2);
	PlayerTextDrawSetOutline(playerid, Time_TD[playerid][0], 1);
	PlayerTextDrawBackgroundColor(playerid, Time_TD[playerid][0], 0x000000FF);
	PlayerTextDrawFont(playerid, Time_TD[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, Time_TD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, Time_TD[playerid][0], 0);