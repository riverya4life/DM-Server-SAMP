//IN GAME DYNAMIC MAPS by ^_^ (SmileySmile)
/*The MIT License (MIT)

Copyright (c) 2014 Nicholas_West ^_^(SmileySmile), skype: nick_nr01

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.*/
#if !defined STREAMER_TYPE_OBJECT
	#error DynamicMaps requires Streamer.
#endif
#if !defined MAX_MAPS
	#define MAX_MAPS    (100)
#endif
#if !defined MAX_POINTS
    #define MAX_POINTS  (MAX_MAPS*30)
#endif
#define INVALID_MAP_ID  (DynamicMap:-1)
#define INVALID_POINT_ID  (Point:-1)
enum
{
    POINT_WHITE = 19177,
    POINT_GREEN,
    POINT_RED,
    POINT_ORANGE,
    POINT_YELLOW
}
enum
{
    TINY_POINT=0,
    SMALL_POINT=0.005,
    MEDIUM_POINT=0.01,
    BIG_POINT=0.015,
    HUGE_POINT=0.02
}
enum map_Data
{
    bool:_m_created,
    _m_objects_id,
    Float:_m_center_x,
    Float:_m_center_y,
    Float:_m_center_z,
    Float:_m_rotation_z,
    _m_vw,
    _m_i
}
enum point_Data
{
    _p_id,
    _p_mapid,
    Float:_p_size,
    Float:_p_current_mx,
    Float:_p_current_my,
    Float:_p_current_mz,
    Float:_p_current_ms,
    _p_vw,
    _p_i
}
static map_data[MAX_MAPS][map_Data];
static point_data[MAX_POINTS][point_Data];
stock DynamicMap:CreateDynamicMap(Float:_center_x, Float:_center_y, Float:_center_z, Float:_rotation_z, _vw = -1, _i = -1)
{
    new _tm_id;
    for _tm_id = 0; _tm_id < sizeof map_data; _tm_id++ do
        if !map_data[_tm_id][_m_created] *then break;
    if map_data[_tm_id][_m_created] || _tm_id == _:INVALID_MAP_ID *then return INVALID_MAP_ID;
    new Float:_tm_distancex = 1.5 * floatcos(_rotation_z/2, degrees) * floatsin(_rotation_z/2, degrees), Float:_tm_distancey = 1.5 * floatpower(floatsin(_rotation_z/2, degrees), 2);
    map_data[_tm_id][_m_objects_id] = CreateDynamicObject(19171, _center_x - _tm_distancex, _center_y+0.75000-_tm_distancey, _center_z-0.75000, 90.00000, 90.00000, _rotation_z);
    CreateDynamicObject(19169, _center_x - _tm_distancex, _center_y+0.75000-_tm_distancey, _center_z+0.75000, 90.00000, 90.00000, _rotation_z);
    CreateDynamicObject(19170, _center_x + _tm_distancex, _center_y-0.75000+_tm_distancey, _center_z-0.75000, 90.00000, 90.00000, _rotation_z);
    CreateDynamicObject(19168, _center_x + _tm_distancex, _center_y-0.75000+_tm_distancey, _center_z+0.75000, 90.00000, 90.00000, _rotation_z);
    map_data[_tm_id][_m_created] = true;
    map_data[_tm_id][_m_center_x] = _center_x;
    map_data[_tm_id][_m_center_y] = _center_y;
    map_data[_tm_id][_m_center_z] = _center_z;
    map_data[_tm_id][_m_rotation_z] = _rotation_z;
    map_data[_tm_id][_m_vw] = _vw;
    map_data[_tm_id][_m_i] = _i;
    return DynamicMap:_tm_id;
}
stock DynamicMap:CreateDynamicMapObject(object, Float:_pos_x, Float:_pos_y, Float:_pos_z, Float:_rotation_z, _vw = -1, _i = -1)
{
    new _tm_id;
    new Float:_tm_distancex = 1.5 * floatcos(_rotation_z/2, degrees) * floatsin(_rotation_z/2, degrees), Float:_tm_distancey = 1.5 * floatpower(floatsin(_rotation_z/2, degrees), 2);
    for _tm_id = 0; _tm_id < sizeof map_data; _tm_id++ do
        if !map_data[_tm_id][_m_created] *then break;
    if map_data[_tm_id][_m_created] || _tm_id == _:INVALID_MAP_ID *then return INVALID_MAP_ID;
	
	map_data[_tm_id][_m_objects_id] = CreateDynamicObject(object, _pos_x, _pos_y, _pos_z, 90.00000, 90.00000, _rotation_z);
	
    map_data[_tm_id][_m_created] = true;
	
	if(object == 19171)
	{
		map_data[_tm_id][_m_center_x] = _pos_x + _tm_distancex;
		map_data[_tm_id][_m_center_y] = _pos_y - 0.75000 + _tm_distancey;
		map_data[_tm_id][_m_center_z] = _pos_z + 0.75000;
	}
	else if(object == 19169)
	{
		map_data[_tm_id][_m_center_x] = _pos_x + _tm_distancex;
		map_data[_tm_id][_m_center_y] = _pos_y - 0.75000 + _tm_distancey;
		map_data[_tm_id][_m_center_z] = _pos_z - 0.75000;
	}
	else if(object == 19170)
	{
		map_data[_tm_id][_m_center_x] = _pos_x - _tm_distancex;
		map_data[_tm_id][_m_center_y] = _pos_y + 0.75000 - _tm_distancey;
		map_data[_tm_id][_m_center_z] = _pos_z + 0.75000;
	}
	else if(object == 19168)
	{
		map_data[_tm_id][_m_center_x] = _pos_x - _tm_distancex;
		map_data[_tm_id][_m_center_y] = _pos_y + 0.75000 - _tm_distancey;
		map_data[_tm_id][_m_center_z] = _pos_z - 0.75000;
	}
	
    map_data[_tm_id][_m_rotation_z] = _rotation_z;
    map_data[_tm_id][_m_vw] = _vw;
    map_data[_tm_id][_m_i] = _i;
    return DynamicMap:_tm_id;
}
stock DestroyDynamicMap(DynamicMap:mapid)
{
    if !map_data[_:mapid][_m_created] || mapid == INVALID_MAP_ID *then return 0;
    DestroyDynamicObject(map_data[_:mapid][_m_objects_id]);
    DestroyDynamicObject(map_data[_:mapid][_m_objects_id]+1);
    DestroyDynamicObject(map_data[_:mapid][_m_objects_id]+2);
    DestroyDynamicObject(map_data[_:mapid][_m_objects_id]+3);
    map_data[_:mapid][_m_objects_id] = 0;
    for new _pt_sid; _pt_sid < sizeof point_data; _pt_sid++ do
        if point_data[_pt_sid][_p_mapid] == _:mapid && point_data[_pt_sid][_p_id] *then{
            DestroyDynamicObject(point_data[_pt_sid][_p_id]);
            point_data[_pt_sid][_p_id] = 0;
            point_data[_pt_sid][_p_mapid] = 0;
            point_data[_pt_sid][_p_size] = 0.0;
            point_data[_pt_sid][_p_current_mx] = 0.0;
            point_data[_pt_sid][_p_current_my] = 0.0;
            point_data[_pt_sid][_p_current_mz] = 0.0;
            point_data[_pt_sid][_p_current_ms] = 0.0;
            point_data[_pt_sid][_p_vw] = 0;
            point_data[_pt_sid][_p_i] = 0;
        }
    map_data[_:mapid][_m_created] = false;
    map_data[_:mapid][_m_center_x] = 0.0;
    map_data[_:mapid][_m_center_y] = 0.0;
    map_data[_:mapid][_m_center_z] = 0.0;
    map_data[_:mapid][_m_rotation_z] = 0.0;
    map_data[_:mapid][_m_vw] = 0;
    map_data[_:mapid][_m_i] = 0;
    return 1;
}
stock Point:CreatePointForDynamicMap(DynamicMap:mapid, point_object, Float:_point_size=0.0, Float:p_realC_x = 0.0, Float:p_realC_y = 0.0, _vw = -1, _i = -1)
{
    if mapid == INVALID_MAP_ID || !map_data[_:mapid][_m_created] *then return INVALID_POINT_ID;
    new _pt_sid;
    for _pt_sid = 0; _pt_sid < sizeof point_data; _pt_sid++ do
        if !point_data[_pt_sid][_p_id] *then break;
    if point_data[_pt_sid][_p_id] || _pt_sid == _:INVALID_POINT_ID *then return INVALID_POINT_ID;
    new Float:_pt_x, Float:_pt_y, Float:_pt_z;
    GetDynamicMapCoords(p_realC_x, p_realC_y, mapid, _pt_x, _pt_y, _pt_z, _point_size);
    if map_data[_:mapid][_m_vw] != -1 && map_data[_:mapid][_m_vw] != _vw *then _vw = map_data[_:mapid][_m_vw];
    if map_data[_:mapid][_m_i] != -1 && map_data[_:mapid][_m_i] != _i *then _i = map_data[_:mapid][_m_i];
    new _pt_id = CreateDynamicObject(point_object, _pt_x, _pt_y, _pt_z, 90.00000, 90.00000, map_data[_:mapid][_m_rotation_z], _vw, _i);
    point_data[_pt_sid][_p_id] = _pt_id;
    point_data[_pt_sid][_p_mapid] = _:mapid;
    point_data[_pt_sid][_p_size] = _point_size;
    point_data[_pt_sid][_p_vw] = _vw;
    point_data[_pt_sid][_p_i] = _i;
    return Point:_pt_sid;
}
stock DestroyPoint(Point:_pointid)
{
    if _pointid == INVALID_POINT_ID || !point_data[_:_pointid][_p_id] *then return 0;
    DestroyDynamicObject(point_data[_:_pointid][_p_id]);
    point_data[_:_pointid][_p_id] = 0;
    point_data[_:_pointid][_p_mapid] = 0;
    point_data[_:_pointid][_p_size] = 0.0;
    point_data[_:_pointid][_p_current_mx] = 0.0;
    point_data[_:_pointid][_p_current_my] = 0.0;
    point_data[_:_pointid][_p_current_mz] = 0.0;
    point_data[_:_pointid][_p_current_ms] = 0.0;
    point_data[_:_pointid][_p_vw] = 0;
    point_data[_:_pointid][_p_i] = 0;
    return 1;
}
stock SetPointSize(Point:_pointid, Float:_pt_size)
{
    if _pointid == INVALID_POINT_ID || !point_data[_:_pointid][_p_id] *then return 0;
    if _pt_size == point_data[_:_pointid][_p_size] *then return -1;
    new Float:_tp_curx, Float:_tp_cury, Float:_tp_curz;
    GetDynamicObjectPos(point_data[_:_pointid][_p_id], _tp_curx, _tp_cury, _tp_curz);
    new Float:_m_rotation = map_data[point_data[_:_pointid][_p_mapid]][_m_rotation_z] - 180.0;
    SetDynamicObjectPos(point_data[_:_pointid][_p_id], _tp_curx + floatcos(_m_rotation, degrees)*(point_data[_:_pointid][_p_size] - _pt_size),
    _tp_cury + floatsin(_m_rotation, degrees)*(point_data[_:_pointid][_p_size] - _pt_size), _tp_curz);
    point_data[_:_pointid][_p_size] = _pt_size;
    if IsDynamicObjectMoving(point_data[_:_pointid][_p_id]) *then{
        MoveDynamicObject(point_data[_:_pointid][_p_id], point_data[_:_pointid][_p_current_mx], point_data[_:_pointid][_p_current_my], point_data[_:_pointid][_p_current_mz],
        point_data[_:_pointid][_p_current_ms]);
        return 2;
    }
    return 1;
}
stock SetPointObject(Point:_pointid, pointobject)
{
    if _pointid == INVALID_POINT_ID || !point_data[_:_pointid][_p_id] *then return 0;
    new Float:_tp_curx, Float:_tp_cury, Float:_tp_curz;
    GetDynamicObjectPos(point_data[_:_pointid][_p_id], _tp_curx, _tp_cury, _tp_curz);
	
    DestroyDynamicObject(point_data[_:_pointid][_p_id]);
    point_data[_:_pointid][_p_id] = CreateDynamicObject(pointobject, _tp_curx, _tp_cury, _tp_curz, 90.00000, 90.00000, map_data[point_data[_:_pointid][_p_mapid]][_m_rotation_z], point_data[_:_pointid][_p_vw], point_data[_:_pointid][_p_i]);
    return 1;
}
stock AssignPointToPos(Point:_pointid, Float:real_x, Float:real_y)
{
    if _pointid == INVALID_POINT_ID || !point_data[_:_pointid][_p_id] *then return 0;
    new Float:_pt_x, Float:_pt_y, Float:_pt_z;
    GetDynamicMapCoords(real_x, real_y, DynamicMap:point_data[_:_pointid][_p_mapid], _pt_x, _pt_y, _pt_z, point_data[_:_pointid][_p_size]);
    SetDynamicObjectPos(point_data[_:_pointid][_p_id], _pt_x, _pt_y, _pt_z);
    point_data[_:_pointid][_p_current_mx] = 0.0;
    point_data[_:_pointid][_p_current_my] = 0.0;
    point_data[_:_pointid][_p_current_mz] = 0.0;
    return 1;
}
stock MovePointForPos(Point:_pointid, Float:real_mx, Float:real_my, Float:movespeed = 0.1)
{
    if _pointid == INVALID_POINT_ID || !point_data[_:_pointid][_p_id] *then return 0;
    new Float:_t_mx, Float:_t_my, Float:_t_mz;
    GetDynamicMapCoords(real_mx, real_my, DynamicMap:point_data[_:_pointid][_p_mapid], _t_mx, _t_my, _t_mz, point_data[_:_pointid][_p_size]);
    MoveDynamicObject(point_data[_:_pointid][_p_id], _t_mx, _t_my, _t_mz, movespeed);
    point_data[_:_pointid][_p_current_mx] = _t_mx;
    point_data[_:_pointid][_p_current_my] = _t_my;
    point_data[_:_pointid][_p_current_mz] = _t_mz;
    return 1;
}
stock GetDynamicMapCoords(Float:x,Float:y, DynamicMap:mapid, &Float:on_map_x,&Float:on_map_y,&Float:on_map_z, Float:_point_size)
{
    on_map_x = x/2000 + map_data[_:mapid][_m_center_x];
    on_map_z = y/2000 + map_data[_:mapid][_m_center_z];
    on_map_y = map_data[_:mapid][_m_center_y];
    _point_size += 0.015;
    new Float:pointdistance = map_data[_:mapid][_m_center_x] - on_map_x, Float:map_rotation = 270 - map_data[_:mapid][_m_rotation_z];
    on_map_y += 2*floatcos(map_rotation/2, degrees) * floatsin(map_rotation/2, degrees) * pointdistance - _point_size*floatsin(90-map_rotation, degrees);
    on_map_x += 2*floatpower(floatsin(map_rotation/2, degrees), 2) * pointdistance - _point_size*floatcos(90-map_rotation, degrees);
}
stock GetDynamicMapPointRealCoords(DynamicMap:_mapid, Float:on_map_x, Float:on_map_y, Float:on_map_z, &Float:real_x, &Float:real_y)
{
    real_x = ((map_data[_:_mapid][_m_center_x] - on_map_x) > 0 ? -1 : 1) * (floatsin(map_data[_:_mapid][_m_rotation_z] - 180.0) >= 0 ? -1 : 1) * floatsqroot(floatpower(map_data[_:_mapid][_m_center_x] - on_map_x, 2) + floatpower(map_data[_:_mapid][_m_center_y] - on_map_y, 2)) * 2000;
    real_y = (on_map_z - map_data[_:_mapid][_m_center_z]) * 2000;
}