clc; clear; close all;
% ***************************************
% MECE:340 - Systems & Dynamics Response
% ***************************************

% ***************************************
%% Problems 8, 9, and 10 HW 1
% ***************************************

% ***************************************
%% Problem 8
% y(t) = -4.9 t^2 + 20 t + 0.50
% ***************************************

t = linspace(0,5,1000);

y = -4.9*t.^2 + 20*t + 0.5;     % position
v = gradient(y,t);             % velocity
a = gradient(v,t);             % acceleration

figure;
subplot(3,1,1)
plot(t,y,'LineWidth',1.5)
grid on
ylabel('y (m)')
title('Problem 8: Ball Motion')

subplot(3,1,2)
plot(t,v,'LineWidth',1.5)
grid on
ylabel('v (m/s)')

subplot(3,1,3)
plot(t,a,'LineWidth',1.5)
grid on
ylabel('a (m/s^2)')
xlabel('Time (s)')

% Time when ball hits the ground
y_fun = @(t) -4.9*t.^2 + 20*t + 0.5;
t_ground = fzero(y_fun,4);

fprintf('Problem 8: Ball hits the ground at t = %.3f s\n', t_ground);


% ***************************************
%% Problem 9
% x(t) = 2e^(-t) + 2t - 0.5t^2
% ***************************************

t = linspace(0,6,1000);
x = 2*exp(-t) + 2*t - 0.5*t.^2;

figure;
subplot(2,1,1)
plot(t,x,'LineWidth',1.5)
grid on
ylabel('x(t)')
title('Problem 9: Position Function')

% Find zero crossing
x_fun = @(t) 2*exp(-t) + 2*t - 0.5*t.^2;
t_star = fzero(x_fun,4);

subplot(2,1,2)
plot(t,x,'LineWidth',1.5)
hold on
plot(t_star,0,'ro','MarkerSize',8,'LineWidth',1.5)
grid on
xlabel('Time (s)')
ylabel('x(t)')
title('Root of x(t)')

fprintf('Problem 9: x(t) = 0 at t* = %.3f s\n', t_star);


% ***************************************
%% Problem 10
% m xdot2 + b xdot + k x = F0 sin(wt)
% ***************************************

m = 12;        % kg
b = 90;        % N*s/m
k = 450;       % N/m
F0 = 20;       % N
omega = 2*pi; % rad/s

% Acceleration function
xddot = @(x,xdot,t) (F0*sin(omega*t) - b*xdot - k*x)/m;

% Sample values for visualization
t = linspace(0,2,1000);
x_sample = 0.05*sin(2*t);
xdot_sample = gradient(x_sample,t);
xddot_sample = xddot(x_sample, xdot_sample, t);

figure;
subplot(3,1,1)
plot(t,x_sample,'LineWidth',1.5)
grid on
ylabel('x (m)')
title('Problem 10: Mass-Spring-Damper')

subplot(3,1,2)
plot(t,xdot_sample,'LineWidth',1.5)
grid on
ylabel('ẋ (m/s)')

subplot(3,1,3)
plot(t,xddot_sample,'LineWidth',1.5)
grid on
ylabel('ẍ (m/s^2)')
xlabel('Time (s)')
% ***************************************