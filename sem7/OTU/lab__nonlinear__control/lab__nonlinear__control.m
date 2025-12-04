clc; clear variables; close all;

x1 = [pi/2 0.1 pi/2 0.1];
x2 = [-pi/2 0 0 0];

xk = [5/6*pi 0 pi/3 0]; 

[t1, y1] = ode15s(@lab_ode, (0:0.01:20), x1);
[t2, y2] = ode15s(@lab_ode_2, (0:0.01:3), x2);



figure(1);

subplot(2, 1, 1)
grid on
hold on

title('Математический сферический маятник');
xlabel("Время, c");

yyaxis left
plot(t1, y1(1:end, 1)*57.3);
ylabel("Угол Theta, град");

yyaxis right
plot(t1, y1(1:end, 2)*57.3);
ylabel("Угловая скорость Theta, град/с");


subplot(2, 1, 2)

grid on
hold on
xlabel("Время, c");

yyaxis left
plot(t1, y1(1:end,3)*57.3);
ylabel("Угол Phi, град");

yyaxis right
plot(t1, y1(1:end,4)*57.3);
ylabel("Угловая скорость Phi, град/с");



figure(2);

subplot(2, 1, 1)

grid on
hold on
title('Математический сферический маятник с регулятором');
xlabel("Время, с");

yyaxis left
plot(t2, y2(1:end, 1)*57.3);
ylabel("Угол Theta, град");

yyaxis right
plot(t2, y2(1:end, 2)*57.3);
ylabel("Угловая скорость Theta, град/с");


subplot(2, 1, 2)

grid on
hold on
xlabel("Время, с");

yyaxis left
plot(t2, y2(1:end,3)*57.3);
ylabel("Угол Phi, град");

yyaxis right
plot(t2, y2(1:end, 4)*57.3);
ylabel("Угловая скорость Phi, град/с");