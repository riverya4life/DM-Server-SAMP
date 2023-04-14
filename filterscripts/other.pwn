#include <streamer>

#define MAX_ACTORS						(1000)
new actor[MAX_ACTORS];
#define COLOR_VALIK 					0x73B461FF
#define COLOR_ORANGE 					0xFAAC58FF
#define COLOR_GREEN 					0x42B02CFF
#define COLOR_GOLD          			0xFFD700FF
#define COLOR_RED 						0xBE2D2DFF
#define COLOR_BLUENEW 					0xB8CEF6FF
#define COLOR_LIME 						0x10F441FF
#define COLOR_GREY 						0xAFAFAFFF
public OnFilterScriptInit()
{
	//АКТЕРЫ / ACTERS
	actor[0] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[0], 106);
	actor[1] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[1], 107);
	actor[2] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[2], 108);
	actor[3] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[3], 109);
	actor[4] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[4], 110);
	actor[5] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[5], 111);
	actor[6] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[6], 143);
	actor[7] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[7], 144);
	actor[8] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[8], 145);
	actor[9] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[9], 146);
	actor[10] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[10], 147);
	actor[11] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[11], 148);
	actor[12] = CreateActor(179, 295.2432,-40.5504,1001.5156,1.7996);
	SetActorVirtualWorld(actor[12], 100);
	actor[13] = CreateActor(179, 295.2432,-40.5504,1001.5156,1.7996);
	SetActorVirtualWorld(actor[13], 101);
	actor[14] = CreateActor(179, 295.2432,-40.5504,1001.5156,1.7996);
	SetActorVirtualWorld(actor[14], 102);
    actor[15] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[15], 149);
	actor[16] = CreateActor(155, 69.7852,-4.4927,1001.8589,180.8942);
	SetActorVirtualWorld(actor[16], 137);
	actor[17] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[17], 138);
	actor[18] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[18], 134);
	actor[19] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[19], 150);
	actor[20] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[20], 136);
	actor[21] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[21], 135);
	actor[22] = CreateActor(12, 497.6714,-77.4644,998.7651,356.6964);
	SetActorVirtualWorld(actor[22], 105);
	actor[23] = CreateActor(12, -2655.5076,1406.6876,906.2734,268.9621);
	SetActorVirtualWorld(actor[23], 103);
	actor[24] = CreateActor(12, 497.6714,-77.4644,998.7651,356.6964);
	SetActorVirtualWorld(actor[24], 151);
    actor[25] = CreateActor(12, 501.7258,-19.8993,1000.6797,93.3506);
	SetActorVirtualWorld(actor[25], 104);
	actor[26] = CreateActor(233, 1390.4113,-1690.0563,18.7249,268.5292);
	SetActorVirtualWorld(actor[26], 0);
    actor[27] = CreateActor(164, -2067.4932,2659.2976,1498.7765,316.9863);
	SetActorVirtualWorld(actor[27], 2);
	actor[28] = CreateActor(57, 1235.5612,-1263.2316,2054.1240,182.3360);
	SetActorVirtualWorld(actor[28], 1);
	actor[29] = CreateActor(141, 1232.0344,-1263.2639,2054.1250,181.7093);
	SetActorVirtualWorld(actor[29], 1);
	actor[30] = CreateActor(148, -2157.4912,-925.6529,1701.0859,91.2393);
	SetActorVirtualWorld(actor[30], 1);
	actor[31] = CreateActor(150, -2157.4922,-920.6929,1701.0859,88.7326);
	SetActorVirtualWorld(actor[31], 1);
	actor[32] = CreateActor(20, 496.6649,1305.1852,774.4839,93.0393);
	SetActorVirtualWorld(actor[32], 2);
	actor[33] = CreateActor(57, 496.6649,1306.9811,774.4839,104.0060);
	SetActorVirtualWorld(actor[33], 2);
	actor[34] = CreateActor(141, 496.6650,1308.7821,774.4839,96.7993);
	SetActorVirtualWorld(actor[34], 2);
	actor[36] = CreateActor(148, 496.6652,1310.6189,774.4839,91.7859);
	SetActorVirtualWorld(actor[35], 2);
	actor[37] = CreateActor(150, 496.6651,1312.3998,774.4839,88.0259);
	SetActorVirtualWorld(actor[37], 2);
	actor[38] = CreateActor(14, 496.4996,1318.7137,774.4839,125.3129);
	SetActorVirtualWorld(actor[38], 2);
	actor[39] = CreateActor(306, 252.0909,68.4061,1003.6406,96.1218);
	SetActorVirtualWorld(actor[39], 12);
	actor[40] = CreateActor(307, 252.0909,68.4061,1003.6406,96.1218);
	SetActorVirtualWorld(actor[40], 11);
	actor[41] = CreateActor(227, -2063.57349, 2665.31738, 1498.70740,181.5760);
	SetActorVirtualWorld(actor[41], 2);
	actor[42] = CreateActor(209, 1501.9723,-1277.5680,14.5625,180.6366);
	actor[43] = CreateActor(209, 196.7574,-117.5487,1.5503,35.9374);
	actor[44] = CreateActor(209, 1433.8011,-1740.7983,13.5469,3.2460);
	actor[45] = CreateActor(209, 1182.1571,-1314.9563,13.5716,268.2516);
	actor[46] = CreateActor(209, 2327.6658,2422.2625,10.8203,178.0226);
	actor[47] = CreateActor(209, 2351.6204,2404.5659,10.8203,356.9377);
	actor[48] = CreateActor(209, -2022.6364,458.2961,35.1723,357.3295);
	actor[49] = CreateActor(209, 1772.6434,-1903.8330,13.5525,36.4124);
	actor[50] = CreateActor(209, 2219.7568,-1151.6548,25.7504,313.2577);
	actor[51] = CreateActor(209, 2404.4722,-1934.8497,13.5538,316.9001);
	actor[52] = CreateActor(209, -89.4332,101.0922,3.1172,253.9693);
	actor[53] = CreateActor(209, 159.6426,-1812.3201,3.7413,87.9031);
	actor[54] = CreateActor(209, 1104.3633,1381.8967,10.8203,189.9294);
	actor[55] = CreateActor(209, 2999.9612,530.3032,-3.3559,155.2348);
	actor[56] = CreateActor(209, 1576.5154,1843.9366,10.8203,75.3274);
	actor[57] = CreateActor(209, 2598.4092,1060.1460,10.8125,269.1349);
	actor[58] = CreateActor(209, 2538.8323,2137.2725,10.8203,93.7216);
	actor[59] = CreateActor(209, 2029.4380,985.6383,10.8203,330.9406);
	actor[60] = CreateActor(209, 2243.4553,572.4129,7.7802,227.5396);
	actor[61] = CreateActor(209, -105.8033,-310.1197,1.4297,271.2830);
	actor[62] = CreateActor(12, 501.7258,-19.8993,1000.6797,93.3506);
    actor[245] = CreateActor(79, 2169.2637,-1053.1842,71.9548,132.8570); //Бомж NPC с Анимкой
	ApplyActorAnimation(actor[245], !"CRACK", !"BBALBAT_IDLE_02", 4.1, 1, 1, 1, 1, 1);
	SetActorVirtualWorld(actor[245], 1228);
	actor[246] = CreateActor(221, 2164.0886,-1046.4413,71.9966,192.7009); //Бомж NPC с Анимкой
	ApplyActorAnimation(actor[246], !"PED", !"PHONE_TALK", 4.1, 1, 1, 1, 1, 1);
	SetActorVirtualWorld(actor[246], 1228);
	actor[247] = CreateActor(77, 2168.1323,-1051.1493,71.9546,44.1829); //Бомж NPC с Анимкой
	ApplyActorAnimation(actor[247], !"CRACK", !"CRCKIDLE1", 4.1, 1, 1, 1, 1, 1);
	SetActorVirtualWorld(actor[247], 1228);
	actor[248] = CreateActor(91, 2161.3301,-1050.7638,71.9536,140.8112);
	ApplyActorAnimation(actor[248], !"BAR", !"BARSERVE_LOOP", 4.1, 0, 1, 1, 1, 1); //Бомж NPC с Анимкой
	SetActorVirtualWorld(actor[248], 1228);
	actor[249] = CreateActor(76, 2271.8701,1444.4349,1008.8320,91.6250);
	SetActorVirtualWorld(actor[249], 2);
	actor[251] = CreateActor(6, 1529.4338,-2156.2249,16.7242,224.4394);//Безруков
	SetActorVirtualWorld(actor[62], 191);
	actor[63] = CreateActor(12, 501.7258,-19.8993,1000.6797,93.3506);
	SetActorVirtualWorld(actor[63], 192);
	actor[64] = CreateActor(12, 501.7258,-19.8993,1000.6797,93.3506);
	SetActorVirtualWorld(actor[64], 193);
	actor[65] = CreateActor(12, 501.7258,-19.8993,1000.6797,93.3506);
	SetActorVirtualWorld(actor[65], 194);
	actor[66] = CreateActor(12, 497.6714,-77.4644,998.7651,356.6964);
	SetActorVirtualWorld(actor[66], 186);
	actor[67] = CreateActor(12, 497.6714,-77.4644,998.7651,356.6964);
	SetActorVirtualWorld(actor[67], 187);
	actor[68] = CreateActor(12, 497.6714,-77.4644,998.7651,356.6964);
	SetActorVirtualWorld(actor[68], 188);
	actor[69] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[69],178 );
	actor[70] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[70],179 );
	actor[71] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[71],180 );
	actor[72] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[72],181 );
	actor[73] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[73],182 );
	actor[74] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[74],183 );
	actor[75] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[75],184 );
	actor[76] = CreateActor(155, 1081.6743,991.1944,1600.9989,357.7499);
	SetActorVirtualWorld(actor[76],185 );
	actor[77] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[77], 169);
	actor[78] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[78], 170);
	actor[79] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[79], 171);
	actor[80] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[80], 172);
	actor[81] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[81], 173);
	actor[82] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[82], 174);
	actor[83] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[83], 175);
	actor[84] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[84], 176);
	actor[85] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[85], 177);
	actor[86] = CreateActor(179, 295.2432,-40.5504,1001.5156,1.7996);
	SetActorVirtualWorld(actor[86], 165);
	actor[87] = CreateActor(179, 295.2432,-40.5504,1001.5156,1.7996);
	SetActorVirtualWorld(actor[87], 166);
	actor[88] = CreateActor(179, 295.2432,-40.5504,1001.5156,1.7996);
	SetActorVirtualWorld(actor[88], 167);
	actor[89] = CreateActor(179, 295.2432,-40.5504,1001.5156,1.7996);
	SetActorVirtualWorld(actor[89], 168);
	actor[90] = CreateActor(37, 199.9442,-131.6396,1003.5078,27.3593);
	SetActorVirtualWorld(actor[90], 112);
	actor[91] = CreateActor(37, 199.9442,-131.6396,1003.5078,27.3593);
	SetActorVirtualWorld(actor[91],113);
	actor[92] = CreateActor(37, 199.9442,-131.6396,1003.5078,27.3593);
	SetActorVirtualWorld(actor[92], 114);
	actor[93] = CreateActor(37, 199.9442,-131.6396,1003.5078,27.3593);
	SetActorVirtualWorld(actor[93], 189);
	actor[94] = CreateActor(37, 199.9442,-131.6396,1003.5078,27.3593);
	SetActorVirtualWorld(actor[94], 190);
	actor[95] = CreateActor(11, 2217.3264,-1145.0546,1025.9768,182.6772);
	SetActorVirtualWorld(actor[95], 1);
	ApplyActorAnimation(actor[98],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[96] = CreateActor(11, 2217.3264,-1145.0546,1025.9768,182.6772);
	SetActorVirtualWorld(actor[96], 2);
	ApplyActorAnimation(actor[99],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[97] = CreateActor(11, 2217.3264,-1145.0546,1025.9768,182.6772);
	SetActorVirtualWorld(actor[97], 3);
	ApplyActorAnimation(actor[97],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[98] = CreateActor(11, 2217.3264,-1145.0546,1025.9768,182.6772);
	SetActorVirtualWorld(actor[98], 5);
	ApplyActorAnimation(actor[101],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[99] = CreateActor(11, 201.7949,196.0949,1001.0859,75.2512);
	SetActorVirtualWorld(actor[99], 6);
	actor[100] = CreateActor(11, 2217.3264,-1145.0546,1025.9768,182.6772);
	SetActorVirtualWorld(actor[100], 7);
	ApplyActorAnimation(actor[100],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[101] = CreateActor(11, 2217.3264,-1145.0546,1025.9768,182.6772);
	SetActorVirtualWorld(actor[101], 8);
	ApplyActorAnimation(actor[101],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[102] = CreateActor(11, 2217.3264,-1145.0546,1025.9768,182.6772);
	SetActorVirtualWorld(actor[102], 9);
	ApplyActorAnimation(actor[102],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[103] = CreateActor(11, 2217.3264,-1145.0546,1025.9768,182.6772);
	SetActorVirtualWorld(actor[103], 10);
	ApplyActorAnimation(actor[103],"PED","SEAT_down",4.1,0,0,0,1,1);
    actor[104] = CreateActor(11, 1121.2966,-2598.1846,1221.5060,6.5566);
	SetActorVirtualWorld(actor[104], 11);
	ApplyActorAnimation(actor[104],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[105] = CreateActor(11, 1121.2966,-2598.1846,1221.5060,6.5566);
	SetActorVirtualWorld(actor[105], 12);
	ApplyActorAnimation(actor[105],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[106] = CreateActor(11, 1121.2966,-2598.1846,1221.5060,6.5566);
	SetActorVirtualWorld(actor[106], 13);
	ApplyActorAnimation(actor[106],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[107] = CreateActor(11, 1121.2966,-2598.1846,1221.5060,6.5566);
	SetActorVirtualWorld(actor[107], 14);
	ApplyActorAnimation(actor[107],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[108] = CreateActor(11, 1121.2966,-2598.1846,1221.5060,6.5566);
	SetActorVirtualWorld(actor[108], 15);
	ApplyActorAnimation(actor[108],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[109] = CreateActor(11, 1121.2966,-2598.1846,1221.5060,6.5566);
	SetActorVirtualWorld(actor[109], 16);
	ApplyActorAnimation(actor[109],"PED","SEAT_down",4.1,0,0,0,1,1);
	actor[110] = CreateActor(93 , 485.2755,-11.3690,1000.6797,219.6015);
	SetActorVirtualWorld(actor[110], 191);
	ApplyActorAnimation(actor[110], "DANCING", "dnce_M_a", 4.0, 1, 0, 0, 0,0);
	actor[111] = CreateActor(140, 485.9483,-16.4064,1000.6797,289.1622);
	SetActorVirtualWorld(actor[111], 191);
  	ApplyActorAnimation(actor[111], "DANCING", "dnce_M_b", 4.0, 1, 0, 0, 0,0);
	actor[112] = CreateActor(93, 485.2755,-11.3690,1000.6797,219.6015);
	SetActorVirtualWorld(actor[112], 192);
    ApplyActorAnimation(actor[112], "DANCING", "dnce_M_a", 4.0, 1, 0, 0, 0,0);
	actor[113] = CreateActor(140, 485.9483,-16.4064,1000.6797,289.1622);
	SetActorVirtualWorld(actor[113], 192);
 	ApplyActorAnimation(actor[113], "DANCING", "dnce_M_b", 4.0, 1, 0, 0, 0,0);
	actor[114] = CreateActor(93, 485.2755,-11.3690,1000.6797,219.6015);
	SetActorVirtualWorld(actor[114], 193);
    ApplyActorAnimation(actor[114], "DANCING", "dnce_M_a", 4.0, 1, 0, 0, 0,0);
	actor[115] = CreateActor(140, 485.9483,-16.4064,1000.6797,289.1622);
	SetActorVirtualWorld(actor[115], 193);
    ApplyActorAnimation(actor[115], "DANCING", "dnce_M_b", 4.0, 1, 0, 0, 0,0);
	actor[116] = CreateActor(93, 485.2755,-11.3690,1000.6797,219.6015);
	SetActorVirtualWorld(actor[116], 194);
	ApplyActorAnimation(actor[116], "DANCING", "dnce_M_a", 4.0, 1, 0, 0, 0,0);
	actor[117] = CreateActor(140, 485.9483,-16.4064,1000.6797,289.1622);
	SetActorVirtualWorld(actor[117], 194);
    ApplyActorAnimation(actor[117], "DANCING", "dnce_M_b", 4.0, 1, 0, 0, 0,0);
	actor[118] = CreateActor(140, 485.9483,-16.4064,1000.6797,289.1622);
	SetActorVirtualWorld(actor[118], 104);
    ApplyActorAnimation(actor[118], "DANCING", "dnce_M_b", 4.0, 1, 0, 0, 0,0);
    actor[119] = CreateActor(93, 485.2755,-11.3690,1000.6797,219.6015);
	SetActorVirtualWorld(actor[119], 104);
	ApplyActorAnimation(actor[119], "DANCING", "dnce_M_a", 4.0, 1, 0, 0, 0,0);
	actor[120] = CreateActor(140 , -2666.5313,1401.4785,906.2734,285.0108);
	SetActorVirtualWorld(actor[120], 103);
	ApplyActorAnimation(actor[120], "DANCING", "dnce_M_a", 4.0, 1, 0, 0, 0,0);
	actor[121] = CreateActor(83  , -2671.7742,1411.0079,907.5703,262.7639);
	SetActorVirtualWorld(actor[121], 103);
	ApplyActorAnimation(actor[121], "DANCING", "dnce_M_b", 4.0, 1, 0, 0, 0,0);
	actor[122] = CreateActor(63, -2656.9053,1419.5349,906.2734,231.7436);
	SetActorVirtualWorld(actor[122], 103);
	ApplyActorAnimation(actor[122], "DANCING", "dnce_M_d", 4.0, 1, 0, 0, 0,0);
	actor[123] = CreateActor(5, 1773.6903,-1891.7493,13.5504,139.4896);
	actor[124] = CreateActor(48, 2211.0706,-1142.9728,25.8084,265.1614);
	actor[125] = CreateActor(6, 1420.4176,-1685.8624,13.5469,245.4521);
    actor[126] = CreateActor(169, -1418.8385,2084.1316,1502.0374,1.0850);
	actor[127] = CreateActor(209, 1380.0839,-1804.9448,13.5469,274.1391);
	actor[128] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[128], 118);
	actor[129] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[129], 119);
	actor[130] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[130], 120);
	actor[131] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[131], 121);
	actor[132] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[132], 122);
	actor[133] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[133], 123);
	actor[134] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[134], 124);
	actor[135] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[135], 125);
	actor[136] =CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[136], 126);
	actor[137] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[137], 127);
	actor[138] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[138], 128);
	actor[139] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[139], 129);
	actor[140] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[140], 130);
	actor[141] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[141], 131);
	actor[142] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[142], 158);
	actor[143] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[143], 159);
	actor[144] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[144], 160);
	actor[145] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[145], 161);
	actor[146] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[146], 162);
	actor[147] = CreateActor(24, 666.1187,-566.1037,1700.7394,177.4561);
	SetActorVirtualWorld(actor[147], 163);
	actor[148] = CreateActor(20, 828.1813,860.8412,1005.0040,271.9525);
	SetActorVirtualWorld(actor[148], 1);
	actor[149] = CreateActor(76, -2061.84082, 2670.67676, 1500.96741, 90.00000);
	SetActorVirtualWorld(actor[149], 2);
	actor[150] = CreateActor(76, -1025.1711,1823.1455,1101.0859,352.5338);
	actor[151] = CreateActor(261, -2066.51343, 2665.37744, 1498.70740,180.0000);
	SetActorVirtualWorld(actor[151], 2);
	actor[152] = CreateActor(20,-1025.5941,1818.6888,1101.0859,280.7565);
	actor[153] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[153], 117);
	actor[154] = CreateActor(36, 2580.3503,1426.5663,1800.9688,179.0684);
	SetActorVirtualWorld(actor[154], 116);
	actor[155] = CreateActor(242, 782.6096, 2514.4624, 1501.9790,270.0);
	SetActorVirtualWorld(actor[155], 1);
	actor[156] = CreateActor(91, -398.2892,2232.0200,1801.0859,175.2628);
	SetActorVirtualWorld(actor[156], 195);
	actor[157] = CreateActor(91, -398.2892,2232.0200,1801.0859,175.2628);
	SetActorVirtualWorld(actor[157], 196);
	actor[158] = CreateActor(91, -398.2892,2232.0200,1801.0859,175.2628);
	SetActorVirtualWorld(actor[158], 197);
	actor[159] = CreateActor(91, -398.2892,2232.0200,1801.0859,175.2628);
	SetActorVirtualWorld(actor[159], 198);
	actor[160] = CreateActor(91, -398.2892,2232.0200,1801.0859,175.2628);
	SetActorVirtualWorld(actor[160], 199);
	actor[161] = CreateActor(91, -398.2892,2232.0200,1801.0859,175.2628);
	SetActorVirtualWorld(actor[161], 200);
	actor[162] = CreateActor(209, -1982.4241,127.5627,27.6875,87.1428);
	actor[163] = CreateActor(209, -1980.6304,174.8663,27.6875,105.3163);
	actor[164] = CreateActor(209, -1547.7957,673.8372,7.1875,87.4328);
	actor[165] = CreateActor(209, -2682.0137,582.9930,14.4531,339.0652);
	actor[166] = CreateActor(209, -2400.9304,337.9206,35.1719,240.9909);
	actor[167] = CreateActor(209, -1827.1926,-566.0032,16.4918,227.8308);
	actor[168] = CreateActor(24, -82.4707,1241.2787,1070.7109,91.2161);
	SetActorVirtualWorld(actor[168], 123);
	actor[170] = CreateActor(36, 1162.9773,-618.3384,1105.0439,264.6517);
	SetActorVirtualWorld(actor[170], 202-1);
	actor[171] = CreateActor(36, 1162.9773,-618.3384,1105.0439,264.6517);
	SetActorVirtualWorld(actor[171], 203-1);
	actor[172] = CreateActor(36, 1162.9773,-618.3384,1105.0439,264.6517);
	SetActorVirtualWorld(actor[172], 204-1);
	actor[173] = CreateActor(36, 1162.9773,-618.3384,1105.0439,264.6517);
	SetActorVirtualWorld(actor[173], 205-1);
	actor[174] = CreateActor(36, 1162.9773,-618.3384,1105.0439,264.6517);
	SetActorVirtualWorld(actor[174], 206-1);
	actor[175] = CreateActor(24, 295.3193,-40.2163,1001.5156,4.5358);
	SetActorVirtualWorld(actor[175], 216-1);
	actor[176] = CreateActor(24, 295.3193,-40.2163,1001.5156,4.5358);
	SetActorVirtualWorld(actor[176], 217-1);
	actor[177] = CreateActor(24, 295.3193,-40.2163,1001.5156,4.5358);
	SetActorVirtualWorld(actor[177], 218-1);
	actor[178] = CreateActor(24, 295.3193,-40.2163,1001.5156,4.5358);
	SetActorVirtualWorld(actor[178], 219-1);
	actor[179] = CreateActor(155, 369.7600,-4.4928,1001.8589,182.9411);
	SetActorVirtualWorld(actor[179], 207-1);
	actor[180] = CreateActor(155, 369.7600,-4.4928,1001.8589,182.9411);
	SetActorVirtualWorld(actor[180], 208-1);
	actor[181] = CreateActor(155, 369.7600,-4.4928,1001.8589,182.9411);
	SetActorVirtualWorld(actor[181], 209-1);
	actor[182] = CreateActor(155, 369.7600,-4.4928,1001.8589,182.9411);
	SetActorVirtualWorld(actor[182], 210-1);
	actor[183] = CreateActor(155, 369.7600,-4.4928,1001.8589,182.9411);
	SetActorVirtualWorld(actor[183], 211-1);
	actor[184] = CreateActor(155, 369.7600,-4.4928,1001.8589,182.9411);
	SetActorVirtualWorld(actor[184], 212-1);
	actor[185] = CreateActor(155, 369.7600,-4.4928,1001.8589,182.9411);
	SetActorVirtualWorld(actor[185], 213-1);
	actor[186] = CreateActor(155, 369.7600,-4.4928,1001.8589,182.9411);
	SetActorVirtualWorld(actor[186], 214-1);
	actor[187] = CreateActor(155, 369.7600,-4.4928,1001.8589,182.9411);
	SetActorVirtualWorld(actor[187], 215-1);
	actor[188] = CreateActor(36, 200.2618,-131.5370,1003.5078,55.9463);
	SetActorVirtualWorld(actor[188], 220-1);
	actor[189] = CreateActor(36, 200.2618,-131.5370,1003.5078,55.9463);
	SetActorVirtualWorld(actor[189], 221-1);
	actor[190] = CreateActor(36, 200.2618,-131.5370,1003.5078,55.9463);
	SetActorVirtualWorld(actor[190], 222-1);
	actor[191] = CreateActor(155, -1772.6572,-2007.1797,1500.7853,358.7656);
	SetActorVirtualWorld(actor[191], 1);
	actor[192] = CreateActor(155, -1772.6572,-2007.1797,1500.7853,358.7656);
	SetActorVirtualWorld(actor[192], 2);
	actor[193] = CreateActor(155, -1772.6572,-2007.1797,1500.7853,358.7656);
	SetActorVirtualWorld(actor[193], 3);
	actor[194] = CreateActor(155, 369.8214,-4.4905,1001.8589,172.9549);
	SetActorVirtualWorld(actor[194], 133);
	actor[195] = CreateActor(155, 592.0477,1420.4325,1900.7980,88.0147);
	SetActorVirtualWorld(actor[195], 1);
	actor[196] = CreateActor(19, 332.5625,1119.6376,1083.8903,57.0707);
	SetActorVirtualWorld(actor[196], 1);
	actor[197] = CreateActor(19, 332.5625,1119.6376,1083.8903,57.0707);
	SetActorVirtualWorld(actor[197], 2);
	actor[198] = CreateActor(19, 332.5625,1119.6376,1083.8903,57.0707);
	SetActorVirtualWorld(actor[198], 3);
	actor[199] = CreateActor(19, 332.5625,1119.6376,1083.8903,57.0707);
	SetActorVirtualWorld(actor[199], 4);
	actor[200] = CreateActor(19, 332.5625,1119.6376,1083.8903,57.0707);
	SetActorVirtualWorld(actor[200], 5);
	actor[202] = CreateActor(59, -2034.6788,-118.0272,1035.1719,266.0949);
	SetActorVirtualWorld(actor[202], 1);
	actor[203] = CreateActor(265, 253.7958,117.4302,1003.4188,90.9143);
	actor[204] = CreateActor(266, 238.9685,112.8455,1003.4188,267.0093);
	actor[205] = CreateActor(261,1716.9583,-1671.1514,20.2242,58.3387);
	SetActorVirtualWorld(actor[205], 1);
	actor[206] = CreateActor(261,1716.9583,-1671.1514,20.2242,58.3387);
	SetActorVirtualWorld(actor[206], 2);
	actor[207] = CreateActor(261,1716.9583,-1671.1514,20.2242,58.3387);
	SetActorVirtualWorld(actor[207], 3);
	actor[208] = CreateActor(3,1324.0098,287.2829,20.0452,269.6259);
	actor[209] = CreateActor(8,1972.5740,-1981.1592,13.5469,339.4531);
	actor[210] = CreateActor(6,644.0786,-1365.4963,13.6142,338.0643);
	actor[211] = CreateActor(164, 26.1174,2256.5720,1500.7679,297.1455);
	SetActorVirtualWorld(actor[211], 2);
	actor[214] = CreateActor(71, 1150.4933,-1304.3649,1019.4139,270.0823);
	SetActorVirtualWorld(actor[214], 1);
	actor[215] = CreateActor(71, 1150.4933,-1304.3649,1019.4139,270.0823);
	actor[216] = CreateActor(71, 1150.4933,-1304.3649,1019.4139,270.0823);
	SetActorVirtualWorld(actor[215], 3);
	SetActorVirtualWorld(actor[216], 2);
	actor[217] = CreateActor(185, 1800.4841, 409.9243, 20.2294, 177.3050);
	actor[218] = CreateActor(132, -256.7696, -1362.8536, 9.4421, 215.7267);
    actor[219] = CreateActor(35, 523.8312, 848.2282, -42.9189, 5.9560);
    actor[220] = CreateActor(164, -2572.0220,-1374.5316,1500.7570,122.2902);
    SetActorVirtualWorld(actor[220], 5);
	actor[221] = CreateActor(153, -2670.0698,808.9360,1500.9688,189.1366);
 	SetActorVirtualWorld(actor[221], 1);
	actor[222] = CreateActor(187, -2665.1348,806.7042,1500.9688,93.2557);
	SetActorVirtualWorld(actor[222], 1);
	actor[223] = CreateActor(227, -2665.1348,800.0263,1500.9688,98.8957);
	SetActorVirtualWorld(actor[223], 1);
	actor[224] = CreateActor(228, -2665.1335,793.3651,1500.9688,93.8823);
	SetActorVirtualWorld(actor[224], 1);
	actor[225] = CreateActor(148, -2684.8027,808.9371,1500.9688,181.3030);
	SetActorVirtualWorld(actor[225], 1);
	actor[226] = CreateActor(150, -2677.3047,808.9442,1500.9688,180.6763);
	SetActorVirtualWorld(actor[226], 1);
	actor[227] = CreateActor(164, -2693.3257,792.3634,1500.9688,329.4222);
	SetActorVirtualWorld(actor[227], 1);
	actor[228] = CreateActor(267, -952.9456,-2356.5405,1701.0859,180.2763);
	SetActorVirtualWorld(actor[228], 2);
	actor[229] = CreateActor(307, 2359.9019,91.5077,1501.9902,265.4025);
	SetActorVirtualWorld(actor[229], 11);
	actor[230] = CreateActor(307, 2359.9019,91.5077,1501.9902,265.4025);
	SetActorVirtualWorld(actor[230], 10);
	actor[231] = CreateActor(307, 2359.9019,91.5077,1501.9902,265.4025);
	SetActorVirtualWorld(actor[231], 12);
	actor[232] = CreateActor(155, 1122.8033,-1465.7811,15.7834,213.1764);
	actor[233] = CreateActor(155, 1142.4574,-1474.5808,15.7969,317.5174);
	actor[234] = CreateActor(155, 1138.0466,-1456.4396,15.7969,90.3720);
	actor[235] = CreateActor(73, -2201.2429,-2340.7310,30.6250,121.5413);
	actor[236] = CreateActor(142, -2263.4514,177.9965,35.3056,109.1910);
	actor[237] = CreateActor(11, 2250.6604,1464.8469,1008.8050,350.3705);
	SetActorVirtualWorld(actor[237], 2);
	actor[238] = CreateActor(12, 2240.2773,1443.1298,1008.7850,89.0118);
	SetActorVirtualWorld(actor[238], 2);
	actor[239] = CreateActor(150, -2680.2732,795.8896,1501.0259,270.3133);
	SetActorVirtualWorld(actor[239], 1);
	actor[240] = CreateActor(148, -2680.9580,797.1705,1501.0259,88.5783);
	SetActorVirtualWorld(actor[240], 1);
	actor[241] = CreateActor(8, 949.9467,2451.9934,1601.9871,266.0435);
	SetActorVirtualWorld(actor[241], 2);
	actor[242] = CreateActor(141, 950.3532,2460.3127,1601.9800,219.3799);
	SetActorVirtualWorld(actor[242], 2);
	actor[243] = CreateActor(57, 952.9460,2464.3809,1601.9790,251.0268);
	SetActorVirtualWorld(actor[243], 2);
	actor[244] = CreateActor(227, 946.3777,2458.5283,1601.9790,184.3746);
	SetActorVirtualWorld(actor[244], 2);
	actor[245] = CreateActor(79, 2169.2637,-1053.1842,71.9548,132.8570);
	ApplyActorAnimation(actor[245], !"CRACK", !"BBALBAT_IDLE_02", 4.1, 1, 1, 1, 1, 1);
	SetActorVirtualWorld(actor[245], 1228);
	actor[246] = CreateActor(221, 2164.0886,-1046.4413,71.9966,192.7009);
	ApplyActorAnimation(actor[246], !"PED", !"PHONE_TALK", 4.1, 1, 1, 1, 1, 1);
	SetActorVirtualWorld(actor[246], 1228);
	actor[247] = CreateActor(77, 2168.1323,-1051.1493,71.9546,44.1829);
	ApplyActorAnimation(actor[247], !"CRACK", !"CRCKIDLE1", 4.1, 1, 1, 1, 1, 1);
	SetActorVirtualWorld(actor[247], 1228);
	actor[248] = CreateActor(91, 2161.3301,-1050.7638,71.9536,140.8112);
	ApplyActorAnimation(actor[248], !"BAR", !"BARSERVE_LOOP", 4.1, 0, 1, 1, 1, 1);
	SetActorVirtualWorld(actor[248], 1228);
	actor[249] = CreateActor(76, 2271.8701,1444.4349,1008.8320,91.6250);
	SetActorVirtualWorld(actor[249], 2);
	actor[250] = CreateActor(164, 1540.3162, 1045.9471, 1033.8420, 29.6701);
	SetActorVirtualWorld(actor[250], 2);
	actor[251] = CreateActor(227, 1531.2263, 1114.0533, 1033.8420, 180.2372);
	SetActorVirtualWorld(actor[251], 2);
	actor[252] = CreateActor(76, 1541.9655, 1114.0535, 1033.8420, 180.7386);
	SetActorVirtualWorld(actor[252], 2);
	actor[253] = CreateActor(261, 1536.7688, 1114.0552, 1033.8420, 182.1799);
	SetActorVirtualWorld(actor[253], 2);
	actor[254] = CreateActor(155, 1501.9224, -1249.6239, 113.8103, 355.7931);
	SetActorVirtualWorld(actor[254], 3);
	actor[255] = CreateActor(211, 1479.5359, -1274.1305, 113.8103, 357.3598);
	SetActorVirtualWorld(actor[255], 3);
	actor[256] = CreateActor(36, 1477.5751, -1266.2606, 113.8103, 269.9860);
	SetActorVirtualWorld(actor[256], 3);
	actor[257] = CreateActor(235, 1470.5643, -1268.5040, 113.8103, 271.2864);
	SetActorVirtualWorld(actor[257], 3);
	actor[258] = CreateActor(160, 1129.1080, -1433.9572, 15.7969, 357.8926);
	SetActorVirtualWorld(actor[258], 0);
	actor[259] = CreateActor(115, 1110.7767, -1423.8966, 15.7969, 245.5061);
	SetActorVirtualWorld(actor[259], 0);
	actor[260] = CreateActor(73, 2108.4656,790.0839,1027.1191,91.5079);
	SetActorVirtualWorld(actor[260], 3);
	actor[262] = CreateActor(5, 1756.8431, -315.1225, 1654.5055, 1.6041);
	SetActorVirtualWorld(actor[263], 330);
	actor[265] = CreateActor(102, 1773.810302,-1899.466918,13.550183);//Вилли Сампо , колесо ебанное
    CreateDynamic3DTextLabel("Wheely_Sampo\n{FFFFFF}Создатель сервера\n\n{94B0C1}Любит дрочить на Боровичка",COLOR_VALIK,1773.797363, -1899.465942, 13.548067,15.0);
	//
	SetActorPos(actor[245], 2169.2637, -1053.1842, 71.9548);
	SetActorPos(actor[246], 2164.0886, -1046.4413, 71.9966);
	SetActorPos(actor[247], 2168.1323, -1051.1493, 71.9546);
	SetActorPos(actor[248], 2161.3301, -1050.7638, 71.9536);
	//
	CreateDynamic3DTextLabel("Эдвард (Торговец подарками)\n{FFFFFF}Чтобы поговорить нажми ALT",COLOR_VALIK,1420.4176,-1685.8624,13.5469,15.0);
    CreateDynamic3DTextLabel("Микрофон\n{FFFFFF}[Включен]",COLOR_VALIK,-575.7592,2568.7976,1702.5029,5.0);
	CreateDynamic3DTextLabel("Роберт\n{FFFFFF}Чтобы поговорить нажми ALT\n\n{94B0C1}Крутой Разработчик",COLOR_VALIK,1324.0098,287.2829,20.0452,10.0);
	//
	CreateDynamic3DTextLabel("Нейтон\n{73B461}Нажмите: {FFFFFF}ALT\nСемейный гид", -1, 1800.4841, 409.9243, 20.2294, 5.0);
	CreateDynamic3DTextLabel("Эмилио\n{73B461}Поговорить: {FFFFFF}ALT", -1, -256.7696, -1362.8536, 9.4421, 5.0);
    CreateDynamic3DTextLabel("Лари\n{73B461}Поговорить: {FFFFFF}ALT", -1, 523.8312, 848.2282, -42.9189, 5.0);
	CreateDynamic3DTextLabel("Игорь ( помощник )\n{FFFFFF}Чтобы поговорить нажми ALT",COLOR_VALIK,-2572.6401,-1374.8634,1500.7570,10.0);
	CreateDynamic3DTextLabel("Дарвин\nКоллекционер черепов\n{FFFFFF}Поговорить: ALT\nМагазин мото-товаров: Посигнальте!", COLOR_VALIK, -2201.2429,-2340.7310,30.6250,5.0);
	CreateDynamic3DTextLabel("Мартин Белл\n( Мероприятие: Собиратели )\nНажмите: {ffffff}ALT",COLOR_VALIK,-2263.4514,177.9965,35.3056,10.0);
	CreateDynamic3DTextLabel("Клава Кока({f7d83f}1001{FFFFFF})\n\n\n\nОбожает играть в кости:\n{f7d83f}/dice 1001 ставка",-1,2240.2773,1443.1298,1008.7850,10.0);
	CreateDynamic3DTextLabel("{FFFFFF}Встаньте на пикап чтобы войти/выйти", COLOR_GREY, -809.5127, 2799.1362, 1501.9896, 3.0);
	CreateDynamicPickup(1318, 23,649.3248,-1353.8834,13.5470,-1);
    CreateDynamic3DTextLabel("Выход: ALT", -1, -575.709, 2594.2, 1705.09, 15.0);
	CreateDynamicMapIcon(649.3248,-1353.8834,13.5470, 12, 0, -1, -1, -1, 300.0);
	CreateDynamic3DTextLabel("Банковская статистика", -1, -2682.5256,797.1954,1501.0259, 5.0);
	CreateDynamic3DTextLabel("Отчисления олигархам\n\n{ffffff}Игроки владеющие минимум 4-я домами\nмогут получать 1 раз в сутки \"Ларец Олигарха\"\n{cccccc}[ Нажмите ALT ]", 0xFFFF00FF, -2682.6458, 795.6718, 1501.0259, 10.0000);
	CreatePickup(1239, 23, -2682.6458, 795.6718, 1501.0259, -1);
    CreateDynamic3DTextLabel("Шлагбаум.\nСтоимость проезда: {9ACD32}100$\n{FFFFFF}Открыть: {9ACD32}H",-1,32.245960,-1520.504883,4.311174,5.0);
	CreateDynamic3DTextLabel("Шлагбаум.\nСтоимость проезда: {9ACD32}100$\n{FFFFFF}Открыть: {9ACD32}H",-1,73.652016,-1535.751587,4.651182,5.0);
    CreateDynamic3DTextLabel("Шлагбаум.\nСтоимость проезда: {9ACD32}100$\n{FFFFFF}Открыть: {9ACD32}H",-1,1792.4559,811.2030,10.9180,5.0);
    CreateDynamic3DTextLabel("Шлагбаум.\nСтоимость проезда: {9ACD32}100$\n{FFFFFF}Открыть: {9ACD32}H",-1,1806.9559,822.4933,9.8055,5.0);
    CreateDynamic3DTextLabel("Центральный рынок Los Santos\n/trade - Продать/обменять.",-1,1129.0319, -1469.6064, 15.7481, 20.00000);
    CreateDynamicPickup(1318, 23,-575.709, 2594.2, 1705.09,-1);
	CreateDynamic3DTextLabel("Мастерская по установке номеров\nСтоимость установки номера: {26A6D0}5000$ .\nЕсли вы получили разрешение на установку, тогда:\n{26A6D0}Посигнальте для продолжения.", -1, 217.2211, -228.2586, 1.7786, 3.0);
	CreateDynamic3DTextLabel("Чтобы разгрузить ящики:\n{FFFFFF}Посигнальте", COLOR_GREEN, 1830.3701, 416.7932, 20.1436, 5.0);
	CreateDynamic3DTextLabel("Чтобы загрузить ящики с провизией:\n{FFFFFF}Посигнальте", COLOR_GREEN, -1733.3938, 187.7363, 3.5547, 5.0);
	CreateDynamic3DTextLabel("Больница LS\n\n{FFFFFF}Встаньте на пикап чтобы войти/выйти", COLOR_ORANGE, 1172.6415, -1323.3395, 15.4030, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0);
	CreateDynamic3DTextLabel("Больница SF\n\n{FFFFFF}Встаньте на пикап чтобы войти/выйти", COLOR_ORANGE, 1607.4197, 1815.2408, 10.8203, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0);
	CreateDynamic3DTextLabel("Больница LV\n\n{FFFFFF}Встаньте на пикап чтобы войти/выйти", COLOR_ORANGE, -2668.8684, 640.1640, 14.4531, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 0, 0);
	CreateDynamic3DTextLabel("Чтобы открыть {9ACD32}шлагбаум\n{FFFFFF}Посигнальте!",-1,1812.2621,-1886.2706,13.4141, 5.0);
	CreatePickup(1559, 1,-2052.71, -106.53, 35.06, -1); //Автошкола
    CreateDynamic3DTextLabel("Улица\n{9EFA93}Посигнальте чтобы открыть ворота",-1,-2052.71, -106.53, 36.00,4.0);
    CreatePickup(1559, 1,-2052.90, -98.77, 34.90, -1); //Автошкола
    CreateDynamic3DTextLabel("Двор автошколы\n{9EFA93}Посигнальте чтобы открыть ворота",-1,-2052.90, -98.77, 36.00,4.0);
	CreatePickup(19132, 1, 286.17, -30.55, 1001.52, -1); //tir
	CreatePickup(19132, 1, 286.08, -29.09, 1001.52, -1); //tir
	CreatePickup(19422, 1, 286.1845, -24.4473, 1001.5156, -1); //tir
	CreateDynamic3DTextLabel("Наушники, необходимо надеть перед стрельбой!\n{4DB33D}Нажмите: {FFFFFF}ALT", COLOR_GREY, 286.1845, -24.4473, 1001.5156, 3.0);
	CreateDynamic3DTextLabel("Выход из Тира\n{D0C857}Нажмите: ALT", -1, 286.08, -29.09, 1001.52, 3.0);
	CreateDynamic3DTextLabel("ТИР\nСтоимость входа без пропуска в тир: {4DB33D}500${FFFFFF}\n[{D0C857}Оружие можно купить внутри!{FFFFFF}]\n{4DB33D}Нажмите: {FFFFFF}ALT", -1, 286.17, -30.55, 1001.52, 3.0);
	CreatePickup(1581, 1, -462.1329,2213.2871,1601.0859, -1);
	CreateDynamic3DTextLabel("Получение номеров\nНажмите: ALT.\nСтоимость: {DA5D40}от 10 000$.", -1, -462.1329,2213.2871,1601.0859, 3.0);
	CreateDynamic3DTextLabel("Отдел коммерции\n{FFFFFF}ALT",COLOR_GREEN,363.6908,153.9987,1025.7964,3.0);
	CreateDynamic3DTextLabel("Отдел недвижимости\n{FFFFFF}ALT",COLOR_GREEN,354.0459,170.0928,1025.7964,3.0);
    CreatePickup(1248, 23, -569.7514,2567.4849,1702.5029,-1);
    CreateDynamic3DTextLabel("Управление мероприятием\n{FFFFFF}ALT",COLOR_GREEN,-569.7514,2567.4849,1702.5029,3.0);
	CreatePickup(1274, 23, -398.3770,2229.9397,1801.0859,-1);
	CreateDynamic3DTextLabel("Магазин аксессуаров\n{FFFFFF}ALT",COLOR_GREEN,-398.3770,2229.9397,1801.0859,3.0);
	CreateDynamic3DTextLabel("Автомат с бесплатной едой\n{FFFFFF}ALT",COLOR_GREEN,-1349.3528,493.8062,11.1953,3.0);
	CreatePickup(1279, 1,-1691.2605,867.8833,1005.0170,-1);
    CreateDynamic3DTextLabel("Железнодорожная платформа\n{FFFFFF}Чтобы сесть в поезд нажмите 'G'",COLOR_RED,1764.0288,-1949.8785,14.1096,20.0);
    CreateDynamic3DTextLabel("Железнодорожная платформа\n{FFFFFF}Чтобы сесть в поезд нажмите 'G'",COLOR_RED,1735.7333,-1949.3246,14.1172,20.0);
    CreateDynamic3DTextLabel("Железнодорожная платформа\n{FFFFFF}Чтобы сесть в поезд нажмите 'G'",COLOR_RED,1706.7789,-1949.6328,14.1172,20.0);
    CreateDynamic3DTextLabel("Железнодорожная платформа\n{FFFFFF}Чтобы сесть в поезд нажмите 'G'",COLOR_RED,2860.3655,1319.2699,11.4040,20.0);
    CreateDynamic3DTextLabel("Железнодорожная платформа\n{FFFFFF}Чтобы сесть в поезд нажмите 'G'",COLOR_RED,2860.4666,1287.9838,11.4040,20.0);
    CreateDynamic3DTextLabel("Железнодорожная платформа\n{FFFFFF}Чтобы сесть в поезд нажмите 'G'",COLOR_RED,2860.2236,1256.3748,11.4040,20.0);
    CreateDynamic3DTextLabel("Железнодорожная платформа\n{FFFFFF}Чтобы сесть в поезд нажмите 'G'",COLOR_RED,-1951.4111,107.9894,26.2813,20.0);
    CreateDynamic3DTextLabel("Железнодорожная платформа\n{FFFFFF}Чтобы сесть в поезд нажмите 'G'",COLOR_RED,-1950.6516,134.5126,26.2813,20.0);
    CreateDynamic3DTextLabel("Железнодорожная платформа\n{FFFFFF}Чтобы сесть в поезд нажмите 'G'",COLOR_RED,-1949.6737,165.9387,26.2813,20.0);
	CreateDynamic3DTextLabel("{D64444}Автомастерская{BC7272}\n\nЕсли транспорт не тюнингуется, отправляйтесь в другой салон.\nИспользуйте GPS чтобы найти его.",COLOR_RED,1041.3918,-1028.2256,32.1016,8.0);
	CreateDynamic3DTextLabel("{D64444}Автомастерская{BC7272}\n\nЕсли транспорт не тюнингуется, отправляйтесь в другой салон.\nИспользуйте GPS чтобы найти его.",COLOR_RED,2645.0007,-2037.3738,13.5540,8.0);
	CreateDynamic3DTextLabel("{D64444}Автомастерская{BC7272}\n\nЕсли транспорт не тюнингуется, отправляйтесь в другой салон.\nИспользуйте GPS чтобы найти его.",COLOR_RED,-1935.7690,235.5206,34.3125,8.0);
	CreateDynamic3DTextLabel("{D64444}Автомастерская{BC7272}\n\nЕсли транспорт не тюнингуется, отправляйтесь в другой салон.\nИспользуйте GPS чтобы найти его.",COLOR_RED,-2714.4827,217.3856,4.2921,8.0);
	CreateDynamic3DTextLabel("ДЕМОРГАН - это тюрьма для читеров и нарушителей рп процесса.\nДля того, чтобы с нее выйти, дождитесь окончания времени.\nВыйти можно досрочно, заплатив за каждую минуту по 60.000$\nПри следующих нарушениях, вас могут забанить.\n{E66E6E}В вашем паспорте добавлено новое примечание.", COLOR_GREY, -803.2662, 2833.1062, 1501.9896, 25.0);
    CreateDynamic3DTextLabel("Borovichok\n{FFFFFF}Чтобы поговорить нажми ALT\n\n{94B0C1}Жирный уебан (Разработчик)",COLOR_VALIK,1773.6903,-1891.7493,13.5504,15.0);
	CreateDynamic3DTextLabel("Федерико\n{FFFFFF}Чтобы поговорить нажми ALT\n\n{94B0C1}Квестовый персонаж",COLOR_VALIK,2211.0706,-1142.9728,25.8084,15.0);
	CreatePickup(2358,23,154.3891,1903.3417,18.7570, -1);
    CreatePickup(2358,23,141.1707,1875.4081,17.8434, -1);
    CreatePickup(2358,23,115.3891,1875.2244,17.8359, -1);
    CreatePickup(2358,23,117.9125,1871.2745,17.8359, -1);
    CreatePickup(2358,23,141.1704,1875.4607,17.8434, -1);
    CreatePickup(2358,23,137.3782,1879.5315,17.8359, -1);
    CreatePickup(2358,23,202.5459,1861.9189,13.1406, -1);
    CreatePickup(2358,23,193.3672,1931.5112,17.6406, -1);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,154.3891,1903.3417,18.7570,3.0);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,141.1707,1875.4081,17.8434,3.0);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,115.3891,1875.2244,17.8359,3.0);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,117.9125,1871.2745,17.8359,3.0);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,137.3782,1879.5315,17.8359,3.0);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,202.5459,1861.9189,13.1406,3.0);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,193.3672,1931.5112,17.6406,3.0);
    CreateDynamic3DTextLabel("Бесплатная лицензия",COLOR_GREY,-2034.2344,-114.1020,1035.1719,4.0);
 	CreatePickup(2358,23,2798.11, -2393.91, 13.96, -1);
    CreatePickup(2358,23,2743.82, -2453.84, 13.86, -1);
    CreatePickup(2358,23,2782.68, -2372.74, 13.63, -1);
    CreatePickup(2358,23,-1325.6866,476.3579,7.8498, -1);
    CreatePickup(2358,23,-1294.9114,491.5177,11.1953, -1);
    CreatePickup(2358,23,-1291.1442,501.8154,11.1953, -1);
    CreatePickup(2358,23,-1397.9807,502.8033,11.3047, -1);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,-1325.6866,476.3579,7.8498,3.0);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,-1294.9114,491.5177,11.1953,3.0);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,-1291.1442,501.8154,11.1953,3.0);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,-1397.9807,502.8033,11.3047,3.0);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,2798.11, -2393.91, 13.96,3.0);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,2743.82, -2453.84, 13.86,3.0);
    CreateDynamic3DTextLabel("Склад ингредиентов\n[ALT]",COLOR_GREY,2782.68, -2372.74, 13.63,3.0);
	//старое радио
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-166.9772,1347.3783,1500.9888,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-208.6039,1323.4382,1500.9888,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-208.6047,1327.2102,1500.9888,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-210.7849,1329.7562,1500.9888,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-212.6879,1334.1384,1500.9888,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-208.9196,1334.1351,1500.9888,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-187.4157,1305.7438,1507.6416,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-194.7263,1305.7531,1507.6416,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-180.6385,1299.5883,1507.6770,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-183.1053,1299.8328,1507.6770,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-186.0829,1297.2595,1507.6692,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-190.7337,1296.8057,1507.6692,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-193.2607,1298.5358,1507.6692,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-194.5027,1296.8018,1507.6692,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,-197.0397,1298.5365,1507.6692,2.0);
	//новое радио (комната meeting room)
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1507.7000,1945.3987,1026.8556,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1507.7260,1943.7615,1026.8556,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1507.6963,1942.3462,1026.8575,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1507.6117,1940.5598,1026.8575,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1507.8374,1939.3507,1026.8556,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1507.7316,1937.5437,1026.8556,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1504.6948,1937.6763,1026.8536,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1504.6595,1939.3489,1026.8536,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1504.6415,1940.7299,1026.8556,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1504.7008,1942.4213,1026.8556,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1504.6887,1943.8715,1026.8536,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1504.6407,1945.4452,1026.8536,2.0);
	//комната office and print
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1505.3691,1950.9601,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1505.3684,1952.9619,1026.0831,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1504.3639,1955.9996,1026.0831,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1502.3593,1956.0002,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1503.9288,1958.8890,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1501.9531,1958.9706,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1507.5183,1960.2972,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1507.5187,1962.3011,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1504.0875,1963.3849,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1502.2059,1963.3804,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1501.8024,1966.3558,1026.0831,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1503.7097,1966.3551,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1498.5907,1962.6946,1026.0851,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1498.5880,1960.7404,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1495.9589,1966.2267,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1495.9587,1968.1987,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1495.6178,1962.2740,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1495.6179,1960.3308,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1492.9847,1965.8354,1026.0851,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1492.9885,1967.7880,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1510.4913,1960.8110,1026.5870,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1510.4886,1962.7360,1026.0831,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1510.1414,1967.6250,1026.0831,2.0);
	CreateDynamic3DTextLabel("Компьютер для редакции объявлений\n{73B461}[ALT]",-1,1501.3176,1967.6235,1026.0831,2.0);
	CreateDynamic3DTextLabel("INFO",-1,-38.9923,173.5192,2.4297,7.0);
	CreateDynamic3DTextLabel("INFO",-1,-83.2843,-302.1633,2.7646,7.0);
	CreateDynamic3DTextLabel("INFO",-1,1969.3076,-1981.4128,13.5469,7.0);
	CreateDynamic3DTextLabel("INFO",-1,1460.8505,-1743.3596,13.5469,7.0);
	CreatePickup(1277,1,494.7682,1318.9098,774.4839,-1);
	CreateDynamic3DTextLabel("Получение банковской карты\n{B03131}Необходимо иметь 1 000$",-1,494.7682,1318.9098,774.4839,4.0);
	CreatePickup(1277,1,951.6823,2451.9871,1601.9871,-1);
	CreateDynamic3DTextLabel("Получение банковской карты\n{B03131}Необходимо иметь 1 500$",-1,951.6823,2451.9871,1601.9871,4.0);
	CreateDynamic3DTextLabel("Стол для игры в кости\n{B03131}/dice",-1,2238.0413,1443.3271,1008.8525,3.0);
	CreatePickup(1239, 23,2095.9922,797.1262,1027.1211, -1);
    CreatePickup(1239, 1,-2657.75, 808.67, 1500.97, -1);
    CreateDynamic3DTextLabel("Должники",-1,-2657.75, 808.67, 1500.97,7.0);
	CreateDynamic3DTextLabel("Начать сдачу на права\n{F9AD43}ALT",-1,-2575.90, -1364.63, 1500.76,4.0);
	CreateDynamic3DTextLabel("Начать сдачу на права\n{F9AD43}ALT",-1,-2573.83, -1361.87, 1500.76,4.0);
	CreateDynamic3DTextLabel("Начать сдачу на права\n{F9AD43}ALT",-1,-2575.87, -1358.94, 1500.76,4.0);
	CreateDynamic3DTextLabel("Начать сдачу на права\n{F9AD43}ALT",-1,-2579.94, -1358.94, 1500.76,4.0);
    CreateDynamic3DTextLabel("Благотворительный фонд\n{FFFFFF}[ALT]",COLOR_GREY,2095.9922,797.1262,1027.1211,4.0);
	CreateDynamic3DTextLabel("Пройти собеседование\n[ALT]",COLOR_GOLD,-2033.4341,-117.5292,1035.1719,4.0);
	CreateDynamic3DTextLabel("Сломанный телевизор.\nЕсли бы он работал вы могли б прочитать основную теорию для пилота.",COLOR_GREY,-2026.7957,-114.3428,1035.1719,4.0);
	CreatePickup(1314, 23,-2033.4341,-117.5292,1035.1719, -1);
 	CreateDynamic3DTextLabel("{FF0000}Сломанная дверь",COLOR_BLUENEW,610.8489,-1220.5266,1001.3849,5.0);
	//////////610.8489
	
 	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H", -1, 657.975525, -1247.840454, 1024.391846, 5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H", -1, 658.823914, -1262.348389, 1024.391846, 5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H", -1, 675.5417,-1262.4751,1024.3898, 5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H", -1, 595.748230, -1184.252930, 1001.384888, 3.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H\nВне машины",COLOR_BLUENEW,2719.6982,-2405.0554,13.4609,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H\nВне машины",COLOR_BLUENEW,2719.8486,-2504.0205,13.4937,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H\nВне машины",COLOR_BLUENEW,286.3304,1821.4232,17.6406,10.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H\nВне машины",COLOR_BLUENEW,135.0717,1941.9005,19.3203,10.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H\nВне машины",COLOR_BLUENEW,-1631.3796,687.7377,7.1875,15.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,454.9670,872.7173,1500.9648,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,465.7021,871.5269,1500.9648,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,465.6787,857.2242,1500.9648,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,474.4485,859.8665,1500.9648,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-2582.5913,-1384.5138,1500.7570,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-1786.3673,-1998.2512,1500.7853,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-1772.5034,-1995.5537,1500.7853,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-1758.3375,-1998.2037,1500.7853,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-2067.2576,2693.9587,1501.0243,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-2062.6360,2693.8945,1500.9766,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-2067.2607,2705.4763,1500.9766,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-2062.6340,2705.4880,1500.9766,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-2690.0815,807.0168,1500.9688,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,2325.9783,78.6801,1501.9962,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,2325.9753,81.0722,1501.9962,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,2364.5027,96.0364,1502.0103,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,1588.5164,-1637.7506,13.4311,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,2330.9561,67.0544,1501.9962,5.0);
	CreateDynamic3DTextLabel("Открыть\n\n{FFFFFF}H", COLOR_ORANGE, -1354.1853, -0.5061, 1601.0859, 5.0);
	CreateDynamic3DTextLabel("Открыть\n\n{FFFFFF}H", COLOR_ORANGE, -1354.1929, 24.6202, 1601.0859, 5.0);
	CreateDynamic3DTextLabel("Открыть\n\n{FFFFFF}H", COLOR_ORANGE, -1320.5623, 22.9350, 1601.0859, 5.0);
	CreateDynamic3DTextLabel("Открыть\n\n{FFFFFF}H", COLOR_ORANGE, -1320.5485, 1.3281, 1601.0859, 5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H", -1, 1490.3296,-1281.2520,113.8064, 5.0, -1, -1, 0, 3);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H", -1, 1996.4331,1138.1451,1038.6882, 5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H", -1, 1996.3802,1109.2860,1038.6882, 5.0);
	//FBI
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-759.9789,2345.5117,1401.0869,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-752.3966,2343.8923,1401.0859,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-750.7892,2345.8018,1401.0859,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-750.8912,2358.6047,1401.0859,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-743.0435,2358.5906,1401.0859,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-743.0309,2345.7905,1401.0859,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-750.9784,2345.7463,1404.5170,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-750.8091,2358.6155,1404.5170,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-743.0408,2345.7729,1404.5170,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-743.1991,2358.5151,1404.5170,5.0);
	// армия сф
	CreateDynamic3DTextLabel("{F78E4A}Открыть\n\n{FFFFFF}H",COLOR_BLUENEW,-244.2207,790.7653,1500.9608,5.0);
	// армия лв
	CreateDynamic3DTextLabel("{F78E4A}Открыть\n\n{FFFFFF}H",COLOR_BLUENEW,1441.5416,2219.1206,1501.1494,5.0);
	CreateDynamic3DTextLabel("{F78E4A}Открыть\n\n{FFFFFF}H",COLOR_BLUENEW,1418.8348,2219.0439,1501.1494,5.0);
	// полиция двери
 	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H\n\n{FFFF00}Доступно адвокатам",COLOR_BLUENEW,-459.6262,2206.0317,1601.0859,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-465.5919,2195.0361,1601.0859,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-472.0311,2201.4885,1601.0879,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-476.8023,2204.1382,1601.0928,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-480.6641,2202.7195,1601.0928,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-472.0273,2191.9602,1601.0879,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-470.5664,2189.8884,1601.0898,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H",COLOR_BLUENEW,-470.5032,2186.6431,1601.0898,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H\n\n{FFFF00}Доступно адвокатам",COLOR_BLUENEW,-461.1063,2187.6240,1601.0840,5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H\n\n{FFFF00}Доступно адвокатам",COLOR_BLUENEW,-461.0601,2178.2202,1601.0879,5.0);

	
	Create3DTextLabel("Лифт {A2EB53}мерии{FFFFFF}\nНажмите: {A2EB53}ALT", 0xFFFFFFFFFFFFFFFF, 1489.7209,-1259.7783,113.8044, 7.0, 3, 0);
    Create3DTextLabel("Лифт {A2EB53}мерии{FFFFFF}\nНажмите: {A2EB53}ALT", 0xFFFFFFFFFFFFFFFF, 1509.3090,1088.1893,1033.8420, 7.0, 2, 2);
    Create3DTextLabel("Лифт {A2EB53}мерии{FFFFFF}\nНажмите: {A2EB53}ALT", 0xFFFFFFFFFFFFFFFF, 1999.9298,1121.5593,1038.6824, 7.0, 2, 2);
    CreateDynamic3DTextLabel("1 этаж {99CC00}Больницы{FFFFFF}\nНажмите: {99CC00}ALT", -1, 638.197021, -1239.710449, 1024.391846, 8.0);
    CreateDynamic3DTextLabel("Черный выход\n{FFFFFF}ALT", -1, 644.591125, -1234.206421, 1024.391846, 5.0);
    CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H", -1, 657.975525, -1247.840454, 1024.391846, 5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H", -1, 658.823914, -1262.348389, 1024.391846, 5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H", -1, 675.5417,-1262.4751,1024.3898, 5.0);
	CreateDynamic3DTextLabel("{A19D9D}Открыть\n{FFFFFF}H", -1, 595.748230, -1184.252930, 1001.384888, 3.0);
	CreateDynamic3DTextLabel("2 этаж {99CC00}Больницы{FFFFFF}\nНажмите: {99CC00}ALT", -1, 1155.955688, -1296.993530, 1019.413879, 8.0);
	CreateDynamic3DTextLabel("Столовая {99CC00}Больницы{FFFFFF}\nНажмите: {99CC00}ALT", -1, 1120.565186, -1311.100952, 1019.411926, 8.0);
	CreateDynamic3DTextLabel("{C5FF46}Лучшие сотрудники:{FFFFFF}\n- -\n -\n -\n -\n -\n -\n -\n -\n -\n -\n\n{C5FF46}Лучшие сотрудники сегодня:{FFFFFF}\n- -\n -\n -\n -\n -\n -\n -\n -\n -\n -\n", 0xFFFFFFFF, 1167.946777, -1301.989624, 1021.270508, 9.0);
	CreateDynamic3DTextLabel("Буфет", -1, 1147.487793, -1544.051270, 1010.305725, 5.0);
	CreateDynamic3DTextLabel("Выход в {99CC00}Больницу{FFFFFF}\nНажмите: {99CC00}ALT", -1, 1123.963501, -1533.590820, 1010.296326, 8.0);

	CreatePickup(1314, 1, -741.5166,2360.1128,1404.5170,-1);
	CreateDynamic3DTextLabel("Press Alt",COLOR_BLUENEW,-741.5166,2360.1128,1404.5170,2.0);

	CreatePickup(1240,1,2363.9543,-1958.5900,1601.0859,-1);
    CreateDynamic3DTextLabel("Церковь\nДля того чтобы пожениться вам нужен сотрудник мэрии\nНеобходимо приобрести кольца /gps - Важные места - Покупка колец\nДля развода введите [/unwedding (4 000$!)]",COLOR_GOLD,2363.9543,-1958.5900,1601.0859,10.0);
    CreatePickup(1274,23,1979.9426,-1971.1410,13.5825, -1);
    CreateDynamic3DTextLabel("Генеральный офис\nНалоговой службы",COLOR_BLUENEW,1530.7826,-1074.1027,25.0625,10.0);
    CreatePickup(1275,23,195.1261,-228.0334,1.7749, -1);
    CreateDynamic3DTextLabel("Раздевалка\nALT",COLOR_BLUENEW,195.1261,-228.0334,1.7749,8.0);
    CreatePickup(1275,23,2126.2717,896.7686,10.9149, -1);
    CreateDynamic3DTextLabel("Раздевалка\nALT",COLOR_BLUENEW,2126.2717,896.7686,10.9149,8.0);
	CreatePickup(1275,23,2271.7771,1438.6256,1008.8250,-1);
    CreateDynamic3DTextLabel("Раздевалка\n{FFFFFF}ALT",COLOR_ORANGE,2270.4414,1448.5941,1008.7613,8.0);
    CreatePickup(1550,23,2270.4414,1448.5941,1008.7613,-1);
    CreateDynamic3DTextLabel("Зарплата\n{FFFFFF}ALT",COLOR_ORANGE,2270.4424,1446.9896,1008.7613,8.0);
	CreatePickup(1274,23,2270.4424,1446.9896,1008.7613,-1);
    CreateDynamic3DTextLabel("Обменник.\nПокупка игровых фишек.\n\nНажмите: {FFFFFF}ALT",COLOR_VALIK,2250.7593,1466.8921,1008.8050,8.0);
    CreatePickup(1274,23,2250.7593,1466.8921,1008.8050,-1);
    CreateDynamic3DTextLabel("Выбор работы",COLOR_BLUENEW,208.4846,-225.6056,1.7749,8.0);
    CreatePickup(1239,23,208.4846,-225.6056,1.7749,-1);
    CreateDynamic3DTextLabel("Выбор работы",COLOR_BLUENEW,2111.5618,894.6057,10.9149,8.0);
    CreatePickup(1239,23,2111.5618,894.6057,10.9149,-1);
	CreatePickup(1275,23,770.8220,-77.3209,1000.6563,-1);
	CreatePickup(1275,23,681.4680,-1652.4188,871.2896,-1);
	CreateDynamic3DTextLabel("Раздевалка\nALT",COLOR_BLUENEW,770.8220,-77.3209,1000.6563,8.0);
	CreateDynamic3DTextLabel("Раздевалка\nALT",COLOR_BLUENEW,681.4680,-1652.4188,871.2896,8.0);
	CreateDynamic3DTextLabel("Нажмите N",COLOR_BLUENEW,2042.6489,-1958.4153,14.3989,2.0);
	CreateDynamic3DTextLabel("Нажмите N",COLOR_BLUENEW,2033.5723,-1958.2524,14.3989,2.0);
	CreatePickup(1239,23,-2576.86, -1356.78, 1500.76,-1);
    CreateDynamic3DTextLabel("ПДД\n{73B461}Нажмите ALT чтобы прочитать.",-1,-2576.86, -1356.78, 1500.76,5.0);
    CreateDynamic3DTextLabel("Покупка обручальных\nКолец",COLOR_GOLD,2520.0012,918.5114,11.0234,5.0);
    CreateDynamic3DTextLabel("Подать объявление\n{73B461}Используйте: /ad", -1, -190.1970,1338.4086,1500.9823, 3.0);
	CreateDynamic3DTextLabel("Начать {99CC00}бесплатное{FFFFFF} лечение.\nНажмите: ALT!", -1, 1152.203979, -1303.613525, 1019.990723, 4.0);
	CreateDynamic3DTextLabel("Пройти курс {99CC00}быстрой{FFFFFF} реабилитации\nНажмите: ALT!", -1, 1148.6261, -1308.8389, 1019.4266, 4.0);
	CreateDynamic3DTextLabel("Трудоустройство\nна работу\n{FF6347}Фермера!", -1, -77.9217,90.3327,3.1172+0.5, 3.0);
	CreateDynamic3DTextLabel("Охранник\nНажмите: {FFFFFF}ALT",COLOR_VALIK,644.0786,-1365.4963,13.6142,10.0);
	CreateDynamicMapIcon(2497.0403,-1670.8518,12.9654, 62, 0, -1, -1, -1, 300.0);//Grove street
	CreateDynamicMapIcon(2786.0085,-1616.5608,10.5467, 60, 0, -1, -1, -1, 300.0);//Los Santos Vagos
	CreateDynamicMapIcon(2181.1194,-1799.4424,12.9900, 58, 0, -1, -1, -1, 300.0);//Varrios Los Aztecas
	CreateDynamicMapIcon(2520.6709,-2010.6217,13.1715, 61, 0, -1, -1, -1, 300.0);//Rifa
	CreateDynamicMapIcon(2352.7537, -2333.7805, 14.6157, 51, 0, -1, -1, -1, 300.0);//Truck
	CreateDynamicMapIcon(1533.7008,-1014.1130,24.0538, 55, 0, -1, -1, -1, 300.0);//Аренда транспорта
	CreateDynamicMapIcon(1199.32, -918.586, 43.1194, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(810.979, -1616.12, 13.5466, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1567.9766,-1897.5547,13.5608, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1367.5504,248.2412,19.5669, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(928.2542,-1352.9023,13.3438, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(611.0340,-585.7634,17.2266, 30, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2103.7222,-1804.7616,13.5547, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1038.2175,-1340.7327,13.7420, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2045.0459,-1908.0321,13.5469, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2456.1079,503.9311,30.0781, 30, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1592.1372,715.8721,-5.2422, 30, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2447.9407,-1962.9333,13.5469, 37, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1177.9343,-1323.6394,14.0952, 22, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1530.7826,-1074.1027,25.0625, 25, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(875.805541, -1565.014892, 13.533462, 6, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(875.805541, -1565.014892, 13.533462, 6, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1495.4197,-1282.6329,14.5525, 19, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2309.7900,-1643.6821,14.8270, 49, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(385.8913,-1817.8950,7.8410, 49, 0, -1, -1, -1, 300.0);//
    CreateDynamicMapIcon(1119.98, -1492.96, 15.80, 56, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2240.7681,577.8632,35.1719, 37, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1879.1533,-860.3239,32.0234, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2143.0383,-930.0509,32.0234, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1545.2085,451.3773,7.0315, 46, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1814.4722,-1995.8588,13.5544, 23, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2286.6912,-2012.8440,13.5447, 23, 0, -1, -1, -1, 300.0);//
 	CreateDynamicMapIcon(2333.4478,-1922.6251,12.2991, 23, 0, -1, -1, -1, 300.0);//
 	CreateDynamicMapIcon(2175.9934,-1503.9364,23.9520, 23, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1967.2424,296.3922,35.2325, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2579.4302,310.0845,5.1797, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2455.7710,799.5222,35.1797, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1757.8055,964.1265,24.8906, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2487.1482,369.5434,35.1219, 16, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1941.4008,459.7771,35.1719, 12, 0, -1, -1, -1, 300.0);//
    CreateDynamicMapIcon(2473.1699,-1422.2638,28.8397, 39, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2335.8118,-166.6666,35.5547, 10, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1816.6819,617.5771,35.1719, 10, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1721.5256,1359.8145,7.1853, 10, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2356.4548,1008.1873,50.8984, 10, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2443.8538,755.4180,35.1719, 10, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2767.5112,788.7203,52.7813, 10, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2672.2603,258.4307,4.6328, 10, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1808.6821,945.9444,24.8906, 10, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2155.2847,-2460.1235,30.8516, 10, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1694.5833,951.9144,24.8906, 45, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2718.4712,50.4521,4.3359, 45, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2241.7515,123.0408,35.3203, 45, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1309.8182,-1371.0112,13.5826, 18, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(667.8604, -1571.3179, 15.2623, 29, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1746.7703, 2227.1057, 11.2029, 29, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-88.7419,1378.2703,10.4698, 49, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(693.6755,1967.5216,5.5391, 49, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-36.0986,2349.6462,24.3026, 49, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2186.9092,1113.3481,12.6538, 48, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1951.4368,1342.9297,15.3746, 48, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2506.9543,2120.2803,10.8398, 48, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1966.1985,1623.1367,12.8626, 48, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2102.4863,2257.4006,11.0234, 45, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2802.8872,2430.6565,11.0625, 45, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(172.3484,1177.6282,14.7578, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2884.5476,2454.0398,11.0690, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2638.3013,1671.8616,11.0234, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2101.8923,2228.8093,11.0234, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1879.1917,2339.5007,10.9799, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1872.2565,2071.7385,11.0625, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-858.0142,1535.3987,22.5870, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1213.7981,1830.3331,41.9297, 14, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2200.9714,1393.5470,10.8203, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2049.5845,2486.0862,11.0781, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1731.8141,1888.1255,10.8203, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2240.7698,2047.4966,11.0625, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-35.9494,1172.1107,19.4280, 55	, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-69.1524,92.9972,3.1172, 11, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2478.1455,-1476.8624,23.7989, 51, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(906.2801,-1221.0192,16.9766, 51, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1614.1479,2320.8289,10.8203, 51, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1976.6429,-2029.5635,13.5469, 51, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1054.8196,2134.8713,10.8203, 51, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1708.7831,1606.9760,9.8767, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(150.9107,-1812.6412,3.7416, 9, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(387.7626, 2539.7524, 16.9433, 36, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2427.6968,1662.9028,10.8203, 36, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2485.4040527344,2506.73046875,10.8203125, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2375.5674,2306.3022,8.1406, 52, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(253.2157,1838.9449,17.6568, 46, 0, -1, -1, -1, 600.0);//
	CreateDynamicMapIcon(2637.8018,1185.2871,10.8203, 12, 0, -1, -1, -1, 600.0);//
	CreateDynamicMapIcon(2287.0254,2432.3618,10.8203, 30, 0, -1, -1, -1, 600.0);//
	CreateDynamicMapIcon(2735.6653,-2448.3457,13.6432, 46, 0, -1, -1, -1, 600.0);//
	CreateDynamicMapIcon(2092.6499,2493.1968,14.8390, 54, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1168.6149,1364.8787,10.8125, 19, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1839.62, 138.98, 15.20, 19, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1607.4197,1815.2408,10.8203, 22, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2111.5618,894.6057,10.9149, 27, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(178.4099,1101.4073,16.4498, 11, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(276.6597,1396.0018,10.4786, 51, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2823.4900,914.6848,10.6434, 51, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2258.0461,2765.0706,10.7141, 16, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2201.7358,-2226.7476,13.4103, 16, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2861.2329,1279.8409,11.4040, 38, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1762.3525,-1898.5516,13.4879, 38, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2229.3896,-1159.9827,25.8025, 38, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1971.0687,140.6956,27.6873, 38, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(180.7734, -108.8047, 0.6484, 38, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(206.5538,-231.0065,1.7749, 27, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2225.6599,-1724.1580,13.5621, 54, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(321.3462,-29.1380,1.5781, 19, 0, -1, -1, -1, 300.0);//
  	CreateDynamicMapIcon(2180.7395,-1990.5044,13.5469, 11, 0, -1, -1, -1, 300.0);//
    CreateDynamicMapIcon(-1864.7662,-1668.6857,21.7500, 11, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1481.1355,-1769.7352,18.7958, 52, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1542.5132,-1675.6295,13.5546, 30, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(876.8422,-1567.4388,13.5391, 18, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2169.4517,-1675.1003,15.0859, 23, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2245.0801,-1662.6428,15.4690, 45, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2040.3796,-114.5223,35.2579, 36, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2668.8684,640.1640,14.4531, 22, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2756.1284,375.9151,4.3338, 19, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-220.9060,-234.7779,1.4219, 51, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2136.0205,-77.7463,35.3203, 40, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1289.0641,-1271.5160,13.5400, 19, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1988.3429,-1984.5186,13.6663, 11, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1830.3513,-1678.9181,13.2740, 48, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(457.6003,-1501.4500,31.0383, 45, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(694.5242,-498.0038,16.3359, 45, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1654.3445,-1657.2205,22.5156, 12, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1041.3918,-1028.2256,32.1016, 27, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2645.0007,-2037.3738,13.5540, 27, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1935.7690,235.5206,34.3125, 27, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2714.4827,217.3856,4.2921, 27, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1802.6573, 407.1559, 20.2294, 12, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-256.7696, -1362.8536, 9.4421, 56, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(523.8312, 848.2282, -42.9189, 56, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2192.7070, 993.6327, 80.0000, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2154.3425,644.6054,52.3672, 37, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1449.6135, -2284.7063, 13.5469, 5, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1409.4084, -298.2005, 14.1484, 5, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1673.0103, 1447.5935, 10.7867, 5, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(1866.0593, -1394.1477, 13.4955, 55, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2154.7354, 1493.4109, 10.8203, 33, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2956.5833, -1971.8005, 3.5868, 9, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-91.2817, 1188.43, 19.7422, 49, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-71.1408, 1223.8297, 19.6863, 38, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2463.4805, 131.7678, 35.1719, 43, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(2491.4995,918.3869,11.0234, 21, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-2071.5891,-2445.5686,30.7183, 51, 0, -1, -1, -1, 300.0);//
	CreateDynamicMapIcon(-1703.9647,785.6906,25.7360, 52, 0, -1, -1, -1, 300.0);//
	CreatePickup(1581, 1,-77.9217,90.3327,3.1172,-1);
	CreateDynamic3DTextLabel("Спресованый транспорт\nПосигнальте для загрузки метaла!", -1, 1124.2776,1962.4742,10.8203, 20.0);
	CreateDynamic3DTextLabel(" Раздевалка \n[ALT] ",-1,1907.0087,153.0604,17.5156,10.0);
	CreatePickup(1275, 23, 1907.0087,153.0604,17.5156,-1);
	CreateDynamic3DTextLabel(" Раздевалка \n[ALT] ",-1,1980.1283,-1968.4868,13.5825,4.0);
	CreatePickup(1275, 23, 1980.1283,-1968.4868,13.5825,-1);
    CreateDynamic3DTextLabel(" Трудоустройство \n Работа: Грузчик\n[ALT] ",-1,1979.9426,-1971.1410,13.5825,4.0);
    CreateDynamic3DTextLabel("Начать раздачу для {99CC00}Малоимущих{F0F0F0}\nНажмите: {99CC00}ALT", -1, 2108.4661, 789.3922, 1027.1191, 3.0);
    CreateDynamic3DTextLabel(!"Сдача с повинной",-1,-463.8000,2217.0959,1601.0859,5.0);
    
	CreateDynamic3DTextLabel("Свалка Las-Venturas", COLOR_GREY,111.0156,1073.1621,13.6094, 20.0);
	CreateDynamic3DTextLabel("Свалка Лос-Сантос", COLOR_GREY,2180.7395,-1990.5044,13.5469, 20.0);
	CreateDynamic3DTextLabel("Свалка San Fierro", COLOR_GREY,-1867.2306,-1669.6919,21.7500, 20.0);
	CreateDynamic3DTextLabel("Встаньте на пикап чтобы выйти из банка", -1, -2168.3958,-928.2313,1701.0859, 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, 1);
	CreateDynamic3DTextLabel(" Пункт выдачи пиццы ",0xD05050FF,670.8947,-1575.9595,14.2514,4.0);
	CreateDynamic3DTextLabel(" Пункт выдачи пиццы ",0xD05050FF,1752.4005,2214.5081,10.8203,4.0);
	CreateDynamic3DTextLabel(" Трудоустройство \n Работа: Развозчик Пиццы\n[ALT] ",-1,1746.6765,2246.2012,10.8203,4.0);
	CreateDynamic3DTextLabel(" Трудоустройство \n Работа: Развозчик Пиццы\n[ALT] ",-1,665.9875,-1576.6426,14.4777,4.0);
	CreateDynamic3DTextLabel(" Раздевалка \n Работа: Развозчик Пиццы\n[ALT] ",-1,1749.0339,2246.2012,10.8203,4.0);
	CreateDynamic3DTextLabel(" Раздевалка \n Работа: Развозчик Пиццы\n[ALT] ",-1,668.0192,-1576.7659,14.4074,4.0);
	CreatePickup(1274,23,665.9875,-1576.6426,14.4777,-1);
	CreatePickup(1274,23,1746.6765,2246.2012,10.8203,-1);
	CreatePickup(1275, 23, 668.0192,-1576.7659,14.4074, -1);
	CreatePickup(1275, 23, 1749.0339,2246.2012,10.8203, -1);
	CreateDynamic3DTextLabel(" Раздевалка \n\n{FFFFFF}Встаньте на пикап чтобы переодеться", COLOR_LIME, 2568.0,-1281.5,1044.12, 7.0);
	CreatePickup(2663, 1, 589.6020,1420.4148,1900.7980,-1);
	CreateDynamic3DTextLabel("Столовая\nALT",-1,589.6020,1420.4148,1900.7980,4.0);
	CreatePickup(2663, 1, 485.50, 867.03, 1500.96,-1);
	CreatePickup(2663, 1, -1349.3669,493.8840,11.1953,-1);
	CreateDynamic3DTextLabel(" Раздевалка \n\n{FFFFFF}Работа инкассатора",COLOR_LIME,-2667.1042,787.9213,1500.9688,7.0);
	CreateDynamic3DTextLabel(" Раздевалка \n\n{FFFFFF}Работа инкассатора",COLOR_LIME,498.1447,1318.5439,774.4839,3.0);
	CreateDynamic3DTextLabel(" Раздевалка \n\n{FFFFFF}Работа инкассатора",COLOR_LIME,948.5161,2447.8325,1601.9871,3.0);
	CreatePickup(1581, 23, 1537.1251, 1112.4895, 1033.8420,-1);
	CreateDynamic3DTextLabel("Зэки",-1,1550.7634,-1681.3251,13.5540,5.0);
	CreateDynamic3DTextLabel("Банк Los Santos {33AA33}[Открыт]\n{FFFFFF}Встаньте на пикап чтобы войти в банк",-1,1481.055,-1772.040,18.796, 5.0);
	CreateDynamic3DTextLabel(" Бар",-1,2247.9563,1466.7717,1008.7613,7.0);
	CreateDynamic3DTextLabel("{F5DEB3}[{FFFFFF} Орёл и Решка {F5DEB3}]{FFFFFF}\n{AFAFAF}/orel [ид] [сумма]\n\t{FFFFFF}или\n{AFAFAF}/reshka [ид] [сумма]",-1,506.2321,-69.8461,999.6721,6.0);
	CreateDynamic3DTextLabel("{F5DEB3}[{FFFFFF} Орёл и Решка {F5DEB3}]{FFFFFF}\n{AFAFAF}/orel [ид] [сумма]\n\t{FFFFFF}или\n{AFAFAF}/reshka [ид] [сумма]",-1,-2654.4612,1427.0135,907.3604,6.0);
	CreateDynamic3DTextLabel("{F5DEB3}[{FFFFFF} Орёл и Решка {F5DEB3}]{FFFFFF}\n{AFAFAF}/orel [ид] [сумма]\n\t{FFFFFF}или\n{AFAFAF}/reshka [ид] [сумма]",-1,496.5649,-16.8896,1001.1519,6.0);
	CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,-2683.9232, 807.4161, 1500.9094,5);
	CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,-2676.5600, 807.4161, 1500.9094,5);
	CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,-2669.0400, 807.4161, 1500.9094,5);
    CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,-2666.4729, 805.8691, 1500.9094,5);
	CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,-2666.4665, 799.2879, 1500.9094,5);
	CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,495.2409,1305.6490,774.4839,5);
	CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,495.2459,1307.4744,774.4839,5);
	CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,495.2454,1309.2797,774.4839,5);
	CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,495.2461,1311.0074,774.4839,5);
	CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,495.2460,1312.8225,774.4839,5);
	CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,951.8005,2458.6746,1601.9771,5);
	CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,954.9710,2463.5288,1601.9771,5);
	CreateDynamic3DTextLabel("{73B461}Касса\n{FFFFFF}N",COLOR_GREY,946.6893,2456.3723,1601.9771,5);
	CreateDynamic3DTextLabel(" Закусочная \n\n{9ACD32}Встаньте на чекпоинт чтобы перекусить", -1, 1082.0736, 992.7753, 1600.9989, 20.0);
	CreateDynamic3DTextLabel("Буфет", -1, -1772.6299, -2005.3392, 1500.9670, 20.0);
	CreateDynamic3DTextLabel("Буфет", -1, -2039.4053,2673.7039,1500.9670,20.0);
	CreateDynamic3DTextLabel("Автомат с едой", -1, -2581.7578, -1370.5360, 1501, 20.0);
	CreateDynamic3DTextLabel("Автомат с едой", -1, 1170.7358,-1317.6544,1019.4160, 20.0);
	CreateDynamic3DTextLabel("Автомат с едой",-1,1484.8135,-1771.4929,18.7929,20.0);
	CreateDynamic3DTextLabel("Автомат с едой",-1,1484.8135,-1771.4929,18.7929,20.0);
	CreateDynamic3DTextLabel("Автомат с едой",-1,-171.1462,1334.3427,1500.9788,20.0);
	Create3DTextLabel("Буфет", -1, 1501.7886, -1247.8163, 113.8103, 20.0, 3, 0);

	CreateDynamic3DTextLabel("Амуниция\nИспользуйте: ALT", -1, 295.20001220703, -38.299999237061, 1001.5, 10.0);
	CreateDynamic3DTextLabel("Покупка {99CC00}цветов\n{FFFFFF}Стоимость: {99CC00}1200$", -1, 2350.7820,-1961.5228,1601.0859, 10.0);
	CreateDynamic3DTextLabel("Прыжки с парашютом\n{FFFFFF}ALT", COLOR_GREY, -1409.4084, -298.2005, 14.1484, 5.0);
	CreateDynamic3DTextLabel("Студия: 'Arizona TikTok'\n{FFFFFF}ALT", COLOR_GREY, 2154.7354, 1493.4109, 10.8203, 5.0);
	CreateDynamic3DTextLabel("Прыжки с парашютом\n{FFFFFF}ALT", COLOR_GREY, 1673.0103, 1447.5935, 10.7867, 5.0);
	CreateDynamic3DTextLabel("Информация для {99CC00}посетителей {FFFFFF}больницы.\nНажмите: ALT", -1, 1152.191406, -1305.585938, 1019.990723, 3.0);
	CreateDynamic3DTextLabel("Прыжки с парашютом\n{FFFFFF}ALT", COLOR_GREY, 1451.6128, -2285.0105, 13.5469, 5.0);
	CreateDynamic3DTextLabel("Курс обучения\n{FFFFFF}ALT",COLOR_GREEN,1773.2142, -1888.9938, 13.5513,3.0);
	CreateDynamic3DTextLabel("Курс обучения\n{FFFFFF}ALT",COLOR_GREEN,2210.1968,-1149.0828,25.7458, 3.0);
	CreateDynamic3DTextLabel("Спуститься на 1 этаж\n{73B461}Используйте: {FFFFFF}ALT", -1, -1312.6182, 20.8936, 1597.6073 + 1.0, 3.0);
	CreateDynamic3DTextLabel("Лестница на {99CC00}1 {FFFFFF}этаж.", -1, -1317.3761, 12.1050, 1601.0859 + 2.2, 3.0);
	CreateDynamic3DTextLabel("Касса\n{FFFFFF}ALT", COLOR_VALIK, 665.9590, -567.7969, 1700.7394, 10.0);
	CreateDynamic3DTextLabel("Войти в дом\n{FFFFFF}ALT", COLOR_GREY, 1079.0709, 937.4053, 1604.8663, 5.0);
	CreateDynamic3DTextLabel("Управление экономикой.\n{FFFFFF}ALT", COLOR_GREEN, -2053.2688,2697.6201,1500.9766, 5.0);
	CreateDynamic3DTextLabel("Черный выход\n{FFFFFF}ALT", COLOR_GREY, -2064.8579,2709.9797,1500.9766+1.0, 5.0);
	CreateDynamic3DTextLabel("Центральный рынок\n{9CCF00}Парковать {FFFFFF}авто на улице, запрещено!\nВо избежания нежелательных штрафов, используйте\nПодземный паркинг!", -1, 1113.5651, -1412.7012, 13.5743 + 1.2, 10.0);
    CreatePickup(1239, 1, 1113.5651, -1412.7012, 13.5743, -1);
    CreateDynamic3DTextLabel("Черный вход\n{FFFFFF}ALT", COLOR_GREY, 1473.2888,-1262.4442,14.5625+1.0, 5.0);
	CreateDynamic3DTextLabel("Бар",-1,497.4280,-75.7883,998.7578,20.0);
	CreateDynamic3DTextLabel("Бар",-1,499.7772,-20.6834,1000.6797,20.0);
	CreateDynamic3DTextLabel("Бар",-1,-2653.8188,1407.3539,906.2734,20.0);
	CreateDynamic3DTextLabel(" Бар",-1,784.6830, 2514.6926, 1501.9751,7.0);
	CreateDynamic3DTextLabel(" Бар",-1,461.3756,209.5736,3194.6460,7.0);
	Create3DTextLabel("Malooy_Sampo ( Торговец AZ Coins (Китаец) )\n{FFFFFF}Чтобы поговорить нажми ALT", 0x73B461FF, 1110.7767, -1423.8966, 15.7969, 15.0000, 0, 0);
	Create3DTextLabel("Сергей Мавроди\n{FFFFFF}Чтобы поговорить нажми ALT\n\n{c7c7c7}Создатель компании АО МММ!", 0x73B461FF, 1129.1080, -1433.9572, 15.7969, 4.0000, 0, 0);
	CreateDynamic3DTextLabel("{958989}Магазин 24/7\n{FFFFFF}Нажми: N для покупок",-1,2580.1340,1424.8770,1800.9688, 10.0);
	CreatePickup(1274, 1, 2580.1340,1424.8770,1800.9688,-1);
	CreatePickup(1239, 1, 1471.7279, -1271.7294, 113.8103, 3);
	Create3DTextLabel("Дополнительная информация\n{FFFFFF}ALT", 0xAFAFAFFF, 1531.3999, 1112.4895, 1033.8420, 5.0000, 2, 0);
    CreateDynamic3DTextLabel("Казино: {73B461}Проеб Бабок\n{FFFFFF}Для входа необходимо 500$\nНажмите {73B461}ALT",-1,2019.32,1007.7,10.8203,9.0);
    CreateDynamicPickup(19132,1,2019.32,1007.7,10.8203,-1);
    CreateDynamicPickup(19132,1,2190.8975,1465.6576,1008.7850,-1);
    CreateDynamic3DTextLabel("Выход\nНажмите:{FFFFFF} ALT",COLOR_VALIK,2190.8975,1465.6576,1008.7850,9.0);
    CreateDynamicMapIcon(2019.32,1007.7,10.8203, 44, 0, -1, -1, -1, 300.0);
	CreatePickup(1314, 23, 1474.5449, -1266.0454, 113.8103, 3);//выборы
	CreatePickup(1314, 23, 1478.9395, -1266.2124, 113.8103, 3);//планировка дома
	Create3DTextLabel("Строительная {99CC00}информация{FFFFFF}\nНажмите: {99CC00}ALT", 0xFFFFFFFF, 1471.9293, -1268.2134, 114.8103, 6.0000, 3, 0);
	Create3DTextLabel("Голосовать\n\n[ALT]", 0xAFAFAFFF, 1474.5449, -1266.0454, 114.8103, 3.0000, 3, 0);
	Create3DTextLabel("Перепланировка дома\n\n[ALT]", 0xAFAFAFFF, 1478.9395, -1266.2124, 114.8103, 3.0000, 3, 0);
	Create3DTextLabel("[ {ffffff}Консультант по вопросам фермы{31B404}]\n{cccccc}Нажмите ALT", 0x31B404FF, 1471.7279, -1271.7294, 113.8103, 4.0000, 3, 0);
	Create3DTextLabel("Подать жалобу\n{FFFFFF}ALT", 0xAFAFAFFF, 1479.8489, -1272.7487, 114.8064, 5.0000, 3, 0);
	Create3DTextLabel("Кнопка для вызова полиции\nНажмите:{FFFFFF} ALT", 0xFF6347FF, 1485.9387, -1281.4032, 113.8064, 1.5000, 3, 0);
	Create3DTextLabel("Чтобы внести изменения\n{FFFFFF}Нажмите ALT", 0xFFFF00FF, 1488.5703, -1271.0889, 113.8064, 2.0000, 3, 0);
//	Create3DTextLabel("Дядя Витя\n{FFFFFF}Семейный помощник\n\n{94B0C1}ALT", COLOR_VALIK, 1811.6368,409.2954,20.2294,170.0282, 0,0); // Витя
//	actor[265] = CreateActor(189, 1811.6368,409.2954,20.2294,170.0282); //Витя семейный помощник
//	CreateActor(271,2463.9580,-1689.3148,13.5154,317.0592);
    //Create3DTextLabel("Алина\n{FFFFFF}\nОбменник Хеллоуинских аксессуаров",  COLOR_VALIK, 1421.3593,-1717.2145,13.5469,273.0925, 0,0);
	//actor[266] = CreateActor(55, 1421.3593,-1717.2145,13.5469,273.0925);//Алина
	return 1;
}
