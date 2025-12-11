clc;
clear variables;
close all;


figure(1);

grid on
% grid minor
hold on

X = [[4; 1] [2; 0] [1; -2] [1; -2] [-1; -2] [-1; 2] [-2.5; -2] [-2.5; 2]];

title('фазовый портрет');
xlabel("X1");
ylabel("X2");



for i = 1:1
    % [t,y] = ode45(@vdp1,0:0.001:20,X(:,i));
    % [t,y] = ode45(@vdp1,0:0.001:20,3.5*(rand(2,1)-0.5));

    [t,y] = ode45(@vdp2,0:0.005:10,[-0 -2 0]);
    % xlim([-3 0])
    % ylim([-3 3])
    plot(y(:,1),y(:,2));
end

figure(2);
grid on
hold on

title('Управления со скользящим режимом');
xlabel("Время")

[t,y] = ode45(@vdp2,0:0.005:10,[-0 -2 0]);

yyaxis left
plot(t,y(:,1))
ylabel("X1");

yyaxis right
plot(t,y(:,2))
ylabel("X2");

figure(3);

grid on
hold on

title('Управления со скользящим режимом');
xlabel("Время")
plot(t,-10*sign(0*y(:,1)+y(:,2)))
ylabel("U");



function dydt = vdp1(t,y)
    dydt = [y(2); -2/3*y(2)-tan(y(1))/3+(y(1)^2)/3];
end

function dydt = vdp2(t,y)
    u = -10*sign(0*y(1)+y(2));
    dydt = [y(2); -2/3*y(2)-tan(y(1))/3+(y(1)^2)/3 + u/3; u];
end