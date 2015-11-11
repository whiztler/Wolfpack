waitUntil {sleep 3; (!(alive obj_1) && !(alive obj_2))};

obj1Done = true; publicVariable "obj1Done";

waitUntil {sleep 3; (!(alive obj_3) &&  !(alive obj_4) && !(alive obj_5))};

obj2Done = true; publicVariable "obj2Done";
