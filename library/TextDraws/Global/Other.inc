	GreenZone_TD = TextDrawCreate(578.000000, 2.000000, "green zone");
	TextDrawLetterSize(GreenZone_TD, 0.180000, 1.000000);
	TextDrawTextSize(GreenZone_TD, 1280.000000, 1280.000000);
	TextDrawAlignment(GreenZone_TD, 2);
	TextDrawColor(GreenZone_TD, 0x33AA33FF);
	TextDrawUseBox(GreenZone_TD, 0);
	TextDrawBoxColor(GreenZone_TD, 0x80808080);
	TextDrawSetShadow(GreenZone_TD, 2);
	TextDrawSetOutline(GreenZone_TD, 1);
	TextDrawBackgroundColor(GreenZone_TD, 0x000000FF);
	TextDrawFont(GreenZone_TD, 2);
	TextDrawSetProportional(GreenZone_TD, 1);
	TextDrawSetSelectable(GreenZone_TD, 0);

	CarName_Global[1] = TextDrawCreate(568.000000, 360.000000, "o");
	TextDrawLetterSize(CarName_Global[1], 8.000000, 0.300000);
	TextDrawTextSize(CarName_Global[1], 1280.000000, 1280.000000);
	TextDrawAlignment(CarName_Global[1], 2);
	TextDrawColor(CarName_Global[1], 0xFF0000FF);
	TextDrawUseBox(CarName_Global[1], 0);
	TextDrawBoxColor(CarName_Global[1], 0x80808080);
	TextDrawSetShadow(CarName_Global[1], 2);
	TextDrawSetOutline(CarName_Global[1], 0);
	TextDrawBackgroundColor(CarName_Global[1], 0x000000FF);
	TextDrawFont(CarName_Global[1], 1);
	TextDrawSetProportional(CarName_Global[1], 1);
	TextDrawSetSelectable(CarName_Global[1], 0);

	CarName_Global[0] = TextDrawCreate(568.000000, 383.000000, "o");
	TextDrawLetterSize(CarName_Global[0], 8.000000, 0.300000);
	TextDrawTextSize(CarName_Global[0], 1280.000000, 1280.000000);
	TextDrawAlignment(CarName_Global[0], 2);
	TextDrawColor(CarName_Global[0], 0xFF0000FF);
	TextDrawUseBox(CarName_Global[0], 0);
	TextDrawBoxColor(CarName_Global[0], 0x80808080);
	TextDrawSetShadow(CarName_Global[0], 2);
	TextDrawSetOutline(CarName_Global[0], 0);
	TextDrawBackgroundColor(CarName_Global[0], 0x000000FF);
	TextDrawFont(CarName_Global[0], 1);
	TextDrawSetProportional(CarName_Global[0], 1);
	TextDrawSetSelectable(CarName_Global[0], 0);
	
	Select_TD[4] = TextDrawCreate(318.000000, 330.000000, "~y~US of Arcadia");
	TextDrawLetterSize(Select_TD[4], 1.250000, 3.200000);
	TextDrawTextSize(Select_TD[4], 1280.000000, 1280.000000);
	TextDrawAlignment(Select_TD[4], 2);
	TextDrawColor(Select_TD[4], 0xEEEEEEFF);
	TextDrawUseBox(Select_TD[4], 0);
	TextDrawBoxColor(Select_TD[4], 0x80808080);
	TextDrawSetShadow(Select_TD[4], 0);
	TextDrawSetOutline(Select_TD[4], 1);
	TextDrawBackgroundColor(Select_TD[4], 0x000000FF);
	TextDrawFont(Select_TD[4], 0);
	TextDrawSetProportional(Select_TD[4], 1);
	TextDrawSetSelectable(Select_TD[4], 0);

	Select_TD[3] = TextDrawCreate(232.000000, 370.000000, "~n~~n~");
	TextDrawLetterSize(Select_TD[3], 0.500000, 2.200000);
	TextDrawTextSize(Select_TD[3], 404.000000, 0.000000);
	TextDrawAlignment(Select_TD[3], 1);
	TextDrawColor(Select_TD[3], 0xE1E1E1FF);
	TextDrawUseBox(Select_TD[3], 1);
	TextDrawBoxColor(Select_TD[3], 0x00000066);
	TextDrawSetShadow(Select_TD[3], 2);
	TextDrawSetOutline(Select_TD[3], 1);
	TextDrawBackgroundColor(Select_TD[3], 0x000000FF);
	TextDrawFont(Select_TD[3], 1);
	TextDrawSetProportional(Select_TD[3], 1);
	TextDrawSetSelectable(Select_TD[3], 0);

	Select_TD[2] = TextDrawCreate(235.000000, 370.000000, "<_prev");
	TextDrawLetterSize(Select_TD[2], 0.350000, 1.900000);
	TextDrawTextSize(Select_TD[2], 290.000000, 15.000000);
	TextDrawAlignment(Select_TD[2], 0);
	TextDrawColor(Select_TD[2], 0xFFC98FFF);
	TextDrawUseBox(Select_TD[2], 0);
	TextDrawBoxColor(Select_TD[2], 0x80808080);
	TextDrawSetShadow(Select_TD[2], 2);
	TextDrawSetOutline(Select_TD[2], 1);
	TextDrawBackgroundColor(Select_TD[2], 0x000000FF);
	TextDrawFont(Select_TD[2], 2);
	TextDrawSetProportional(Select_TD[2], 1);
	TextDrawSetSelectable(Select_TD[2], 1);

	Select_TD[1] = TextDrawCreate(350.000000, 370.000000, "next_>");
	TextDrawLetterSize(Select_TD[1], 0.350000, 1.900000);
	TextDrawTextSize(Select_TD[1], 405.000000, 15.000000);
	TextDrawAlignment(Select_TD[1], 0);
	TextDrawColor(Select_TD[1], 0xFFC98FFF);
	TextDrawUseBox(Select_TD[1], 0);
	TextDrawBoxColor(Select_TD[1], 0x80808080);
	TextDrawSetShadow(Select_TD[1], 2);
	TextDrawSetOutline(Select_TD[1], 1);
	TextDrawBackgroundColor(Select_TD[1], 0x000000FF);
	TextDrawFont(Select_TD[1], 2);
	TextDrawSetProportional(Select_TD[1], 1);
	TextDrawSetSelectable(Select_TD[1], 1);

	Select_TD[0] = TextDrawCreate(260.000000, 390.000000, "||___select___||");
	TextDrawLetterSize(Select_TD[0], 0.350000, 1.900000);
	TextDrawTextSize(Select_TD[0], 385.000000, 15.000000);
	TextDrawAlignment(Select_TD[0], 0);
	TextDrawColor(Select_TD[0], 0xFFFFFFFF);
	TextDrawUseBox(Select_TD[0], 0);
	TextDrawBoxColor(Select_TD[0], 0x80808080);
	TextDrawSetShadow(Select_TD[0], 2);
	TextDrawSetOutline(Select_TD[0], 1);
	TextDrawBackgroundColor(Select_TD[0], 0x000000FF);
	TextDrawFont(Select_TD[0], 2);
	TextDrawSetProportional(Select_TD[0], 1);
	TextDrawSetSelectable(Select_TD[0], 1);
	
	Black_Background[1] = TextDrawCreate(-20.000000, -20.000000, "_");
	TextDrawLetterSize(Black_Background[1], 0.000000, 15.000000);
	TextDrawTextSize(Black_Background[1], 800.000000, 0.000000);
	TextDrawAlignment(Black_Background[1], 0);
	TextDrawColor(Black_Background[1], 0xE1E1E1FF);
	TextDrawUseBox(Black_Background[1], 1);
	TextDrawBoxColor(Black_Background[1], 0x000000FF);
	TextDrawSetShadow(Black_Background[1], 2);
	TextDrawSetOutline(Black_Background[1], 0);
	TextDrawBackgroundColor(Black_Background[1], 0x000000FF);
	TextDrawFont(Black_Background[1], 1);
	TextDrawSetProportional(Black_Background[1], 1);
	TextDrawSetSelectable(Black_Background[1], 0);

	Black_Background[0] = TextDrawCreate(-20.000000, 320.000000, "-");
	TextDrawLetterSize(Black_Background[0], 0.000000, 15.000000);
	TextDrawTextSize(Black_Background[0], 800.000000, 0.000000);
	TextDrawAlignment(Black_Background[0], 0);
	TextDrawColor(Black_Background[0], 0xE1E1E1FF);
	TextDrawUseBox(Black_Background[0], 1);
	TextDrawBoxColor(Black_Background[0], 0x000000FF);
	TextDrawSetShadow(Black_Background[0], 2);
	TextDrawSetOutline(Black_Background[0], 0);
	TextDrawBackgroundColor(Black_Background[0], 0x000000FF);
	TextDrawFont(Black_Background[0], 1);
	TextDrawSetProportional(Black_Background[0], 1);
	TextDrawSetSelectable(Black_Background[0], 0);
	
	Logo = TextDrawCreate(85.000000, 428.000000, "gta-trinity.ru");
	TextDrawLetterSize(Logo, 0.300000, 1.300000);
	TextDrawTextSize(Logo, 1280.000000, 1280.000000);
	TextDrawAlignment(Logo, 2);
	TextDrawColor(Logo, 0xB22222FF);
	TextDrawUseBox(Logo, 0);
	TextDrawBoxColor(Logo, 0x80808080);
	TextDrawSetShadow(Logo, 2);
	TextDrawSetOutline(Logo, 1);
	TextDrawBackgroundColor(Logo, 0x000000FF);
	TextDrawFont(Logo, 2);
	TextDrawSetProportional(Logo, 1);
	TextDrawSetSelectable(Logo, 0);

	GOLOD[0] = TextDrawCreate(495.000000, 100.385185, "LD_SPAC:white");
	TextDrawLetterSize(GOLOD[0], 0.000000, 0.000000);
	TextDrawTextSize(GOLOD[0], 110.666625, 6.222221);
	TextDrawAlignment(GOLOD[0], 1);
	TextDrawColor(GOLOD[0], 255);
	TextDrawSetShadow(GOLOD[0], 0);
	TextDrawSetOutline(GOLOD[0], 0);
	TextDrawFont(GOLOD[0], 4);

	GOLOD[1] = TextDrawCreate(495.000030, 109.681526, "LD_SPAC:white");
	TextDrawLetterSize(GOLOD[1], 0.000000, 0.000000);
	TextDrawTextSize(GOLOD[1], 110.666625, 6.222221);
	TextDrawAlignment(GOLOD[1], 2);
	TextDrawColor(GOLOD[1], 255);
	TextDrawSetShadow(GOLOD[1], 0);
	TextDrawSetOutline(GOLOD[1], 0);
	TextDrawFont(GOLOD[1], 4);

	GOLOD[2] = TextDrawCreate(494.999969, 119.392662, "LD_SPAC:white");
	TextDrawLetterSize(GOLOD[2], 0.000000, 0.000000);
	TextDrawTextSize(GOLOD[2], 110.666625, 6.222221);
	TextDrawAlignment(GOLOD[2], 2);
	TextDrawColor(GOLOD[2], 255);
	TextDrawSetShadow(GOLOD[2], 0);
	TextDrawSetOutline(GOLOD[2], 0);
	TextDrawFont(GOLOD[2], 4);

	GOLOD[3] = TextDrawCreate(496.666595, 120.392631, "LD_SPAC:white");
	TextDrawLetterSize(GOLOD[3], 0.000000, 0.000000);
	TextDrawTextSize(GOLOD[3], 106.666610, 3.318516);
	TextDrawAlignment(GOLOD[3], 2);
	TextDrawColor(GOLOD[3], 1149955242);
	TextDrawSetShadow(GOLOD[3], 0);
	TextDrawSetOutline(GOLOD[3], 0);
	TextDrawFont(GOLOD[3], 4);

	GOLOD[4] = TextDrawCreate(496.666595, 111.022254, "LD_SPAC:white");
	TextDrawLetterSize(GOLOD[4], 0.000000, 0.000000);
	TextDrawTextSize(GOLOD[4], 106.666610, 3.318516);
	TextDrawAlignment(GOLOD[4], 2);
	TextDrawColor(GOLOD[4], -65281);
	TextDrawSetShadow(GOLOD[4], 0);
	TextDrawSetOutline(GOLOD[4], 0);
	TextDrawFont(GOLOD[4], 4);

	GOLOD[5] = TextDrawCreate(496.666625, 101.237045, "LD_SPAC:white");
	TextDrawLetterSize(GOLOD[5], 0.000000, 0.000000);
	TextDrawTextSize(GOLOD[5], 106.666610, 3.318516);
	TextDrawAlignment(GOLOD[5], 2);
	TextDrawColor(GOLOD[5], 1707159466);
	TextDrawSetShadow(GOLOD[5], 0);
	TextDrawSetOutline(GOLOD[5], 0);
	TextDrawFont(GOLOD[5], 4);