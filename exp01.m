section = 0;
in_str = "Contact-Sensor-Data/*" + string(section) + ".csv";
d = dir(in_str);

% objj = sigProc("Contact-Sensor-Data/" + d(2).name,800);
% objj.plotdft('z')

filename = "07111344__3200_0.csv";
obj1 = sigProc("Contact-Sensor-Data/" + filename, 3200);
obj1.plotdft('z')
hold on

filename = "07111344__3200_1.csv";
obj1 = sigProc("Contact-Sensor-Data/" + filename, 3200);
obj1.plotdft('z')
hold on
% res2 = freq_prom(in_str, [1,400]);

