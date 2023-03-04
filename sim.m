clear all; close all; clc;

[sensors,vels]=neatoSim(); % create the simulator
pause(5); % give the simulator a few seconds to load

[new_angle, new_loc] = move_point(0, [0,0], [0,4], sensors, vels);
[new_angle, new_loc] = move_point(new_angle, new_loc, [4,4], sensors, vels);
[new_angle, new_loc] = move_point(new_angle, new_loc, [4,0], sensors, vels);
