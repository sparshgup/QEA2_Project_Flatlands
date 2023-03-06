clear all; close all; clc;

[sensors,vels]= neato('192.168.16.58'); % create the simulator
pause(10); % give the simulator a few seconds to load

R = backtracking_descent(); 
move_many(R, sensors, vels);
