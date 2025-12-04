clc;
clear variables;
close all;

x01 = [pi/2 0.1 pi/2 0.1];

global e_int1
global e_int2
global e_int3
global e_int4
global xk
e_int1 = 0;
e_int2 = 0;
e_int3 = 0;
e_int4 = 0;
x02 = [-pi/2 0 0 0];
xk = [5/6*pi 0 pi/3 0];

[t1,y1] = ode15s(@lab_ode,(0:0.01:20),x01);
[t2,y2] = ode15s(@lab_ode2,(0:0.01:3),x02);

figure(1);

subplot(2,1,1)
grid on
hold on

title('Математический сферический маятник');
xlabel("Время");

yyaxis left
plot(t1,y1(1:end,1)*57.3);
ylabel("Угол \Theta");

yyaxis right
plot(t1,y1(1:end,2)*57.3);
ylabel("Угловая скорость \Theta");

subplot(2,1,2)
grid on
hold on

xlabel("Время");

yyaxis left
plot(t1,y1(1:end,3)*57.3);
ylabel("Угол \Phi");

yyaxis right
plot(t1,y1(1:end,4)*57.3);
ylabel("Угловая скорость \Phi");

figure(2);

subplot(2,1,1)
grid on
hold on

title('Математический сферический маятник с регулятором');
xlabel("Время");

yyaxis left
plot(t2,y2(1:end,1)*57.3);
ylabel("Угол \Theta");

yyaxis right
plot(t2,y2(1:end,2)*57.3);
ylabel("Угловая скорость \Theta");

subplot(2,1,2)
grid on
hold on

xlabel("Время");

yyaxis left
plot(t2,y2(1:end,3)*57.3);
ylabel("Угол \Phi");

yyaxis right
plot(t2,y2(1:end,4)*57.3);
ylabel("Угловая скорость \Phi");



function dxdt = lab_ode(t, x)
  l = 1;
  m = 1;
  u = 0.5;
  g = 9.8;
  dxdt = zeros(4,1);
  dxdt(1) = x(2);
  dxdt(2) = (1/(m*l^2))*0 + x(4)^2*cos(x(1))*sin(x(1)) + (m*g/l)*sin(x(1)) - (u/(m*l^2))*x(2);
  dxdt(3) = x(4);
  dxdt(4) = 1/(m*l^2*sin(x(1))^2)*1 - 2*x(4)*x(2)*cos(x(1))/sin(x(1)) - (u*x(4))/(m*l^2*sin(x(1))^2);
end

function dxdt = lab_ode2(t,x)
  l = 1;
  m = 1;
  u = 0.5;
  g = 9.8;

  global e_int1
  global e_int2
  global e_int3
  global e_int4
  global xk

  K_p_th = 60;
  K_p_ph = 60;

  K_i_th = 0.05;
  K_i_ph = 0.05;

  K_p_difth = 20;
  K_p_difph = 20;

  K_i_difth = 0.01;
  K_i_difph = 0.01;

  e_th = xk(1) - x(1) ; 
  e_difth = xk(2) - x(2);
  e_ph = xk(3) - x(3);
  e_difph = xk(4) - x(4);

  e_int1 = e_int1 + e_th *  t;
  e_int2 = e_int2 + e_difth * t;
  e_int3 = e_int3 + e_ph * t;
  e_int4 = e_int4 + e_difph * t;

  u_th = e_th * K_p_th + K_i_th * e_int1;
  u_difth = e_difth * K_p_difth + K_i_difth * e_int2;
  u_ph = e_ph * K_p_ph + K_i_ph * e_int3;
  u_difph = e_difph * K_p_difph + K_i_difph * e_int4;

  v_th = u_th + u_difth;
  v_ph = u_ph + u_difph;

  dxdt = zeros(4,1);
  dxdt(1) = x(2);
  dxdt(2) = -(u*x(2))/(m*l^2) + v_th;
  dxdt(3) = x(4);
  dxdt(4) = -(u*x(4))/(m*l^2) + v_ph;
end