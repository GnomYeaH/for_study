clc; close all; clear variables;


x_p23 = [[10;-8] [6;-8] [3.5;-8] [-0.2;-8] [-1.6;-8] [-8; 7.1] [-8; 8.9] [-4.5; 10] [-3.5; 10] [0.5; 10]];

x_p31 = [[4; 4] [-4; 4] [0.1; 0.1] [-4; -4] [4; -4]];

x_p41 = [[-0.4; 0.2] [-0.4; 1] [-0.4; 1.25] [-0.4; 1.58] [1.6; 0.8] [0.8; -0.4] [0.78; -0.4] [0.7; -0.4] [1.6; -0.3]];


figure(1) % 2.3

grid on
hold on

title('Pendulum')
xlabel('x_1')
ylabel('x_2')

xlim([-10 10])
ylim([-10 10])

for i = 1:10
    [~, x] = ode45(@lab_ode_pendulum, 0:0.01:100, x_p23(:, i));
    plot(x(:, 1), x(:, 2));
end


figure(2)  % 2.4

[t_pd, x_pd] = ode45(@lab_ode_pendulum, 0:0.01:15, x_p23(:, 1));

grid on
hold on

title('Pendulum')
xlabel('t')

yyaxis left
plot(t_pd, x_pd(:, 1))
ylabel("x_1");
ylim([-8 10]);

yyaxis right
plot(t_pd, x_pd(:, 2))
ylabel("x_2");
ylim([-8 10]);


figure(3) % 3.1

grid on
hold on

title('Van der Pole')
xlabel('x_1')
ylabel('x_2')

xlim([-5 5])
ylim([-5 5])

for i = 1:5
    [~, x] = ode45(@lab_ode_vanderpole, 0:0.01:100, x_p31(:, i));
    plot(x(:, 1), x(:, 2));
end


figure(4) % 3._

[t_vdp, x_vdp] = ode45(@lab_ode_vanderpole, 0:0.01:15, x_p31(:, 1));

grid on
hold on

title('Van der Pole')
xlabel('t')

yyaxis left
plot(t_vdp, x_vdp(:, 1))
ylabel("x_1");

yyaxis right
plot(t_vdp, x_vdp(:, 2))
ylabel("x_2");


figure(5)

grid on
hold on

title('Diods')
xlabel('x_1')
ylabel('x_2')

for i = 1:9
    [~, x] = ode45(@lab_ode_diods, 0:0.1:100, x_p41(:, i));
    plot(x(:, 1), x(:, 2));
end
 

figure(6)

[t_dd, x_dd] = ode45(@lab_ode_diods, 0:0.01:15, x_p41(:, 1));

grid on
hold on

title('Diods')
xlabel('t')

yyaxis left
plot(t_dd, x_dd(:, 1))
ylabel("x_1");

yyaxis right
plot(t_dd, x_dd(:, 2))
ylabel("x_2");