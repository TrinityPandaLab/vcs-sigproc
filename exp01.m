clear, clc, clf
section = 3;
in_str = "Contact-Sensor-Data/*" + string(section) + ".csv";
d = dir(in_str);

obj0 = sigProc("Contact-Sensor-Data/" + d(2).name,3200);
obj0.plotdft('z')

hold on

section = 1;
in_str = "Contact-Sensor-Data/*" + string(section) + ".csv";
d = dir(in_str);
hold on

obj1 = sigProc("Contact-Sensor-Data/" + d(2).name,3200);
obj1.plotdft('z')

section = 2;
in_str = "Contact-Sensor-Data/*" + string(section) + ".csv";
d = dir(in_str);

obj2 = sigProc("Contact-Sensor-Data/" + d(2).name,3200);
obj2.plotdft('z')

legend('3','1','2')