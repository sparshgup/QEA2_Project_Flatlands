clear all; close all; clc;

[sensors,vels]= neatoSim(-2, 0, 0, 1); % create the simulator
pause(5); % give the simulator a few seconds to load


R = backtracking_descent(); 
move_many(R, sensors, vels);