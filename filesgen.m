clear, clc
for section = 1:6
    files{section} = dir("Contact-Sensor-Data\*"+string(section-1)+".csv");
end
save files

clear, clc
for section = 1:6
    files{section} = dir("Contact-Sensor-Data-wav\*"+string(section-1)+".wav");
end
save fileswav
