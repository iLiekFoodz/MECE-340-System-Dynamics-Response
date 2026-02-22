clc; clear; close all;
% ***************************************
% MECE:340 - Systems & Dynamics Response
%Nouh Shaikh - 4816563
% ***************************************
% Define the system parameters
m = 100; % mass
b = 220; % damping coefficient
k = 900; % spring constant
F0 = 100; % amplitude of the forcing function
w = 5; % frequency of the forcing function

% State-space ODE
f = @(t,x) [ ...
    x(2);
    -(k/m)*x(1) - (b/m)*x(2) + (F0/m)*sin(w*t)
    ];

% Time span
tspan = [0 25];

% Initial conditions
x0 = [0; 0];

% Solve
[t,x] = ode45(f,tspan,x0);

% Plot
figure;
plot(t,x(:,1),'LineWidth',2);
xlabel('Time (s)');
ylabel('Displacement (m)');
title('Forced Response of the System');
grid on;