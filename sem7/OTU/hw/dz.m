clc;
clear variables;
close all;

global extra_var_history time_history
extra_var_history = [];
time_history = [];

figure(1);

grid on
% grid minor
hold on

X = [[4; 1] [2; 0] [1; -2] [1; -2] [-1; -2] [-1; 2] [-2.5; -2] [-2.5; 2]];

title('фазовый портрет');
xlabel("X1");
ylabel("X2");

opts = odeset('RelTol', 1e-3)

for i = 1:1
    % [~,y] = ode45(@vdp2,0:0.001:20,X(:,i));
    % [t,y] = ode45(@vdp1,0:0.001:20,3.5*(rand(2,1)-0.5));

    [~,y] = ode45(@vdp2,0:0.01:20,[0.5 0.5]);
    xlim([-0.2 0.8])
    ylim([-0.6 0.6])
    plot(y(:,1),y(:,2));
end

figure(2);
grid on
hold on

title('Backsteping');
% title('Управление со скользящим режимом');
xlabel("Время, c")

[t, y] = ode45(@vdp3, 0:0.01:2, [0.5 0.5]);

yyaxis left
plot(t, y(:,1))
ylabel("x_1");

yyaxis right
plot(t, y(:,2))
ylabel("x_2");

figure(3);

grid on
hold on

title('Backsteping');
% title('Управление со скользящим режимом');
xlabel("Время, c")

[time_history_sort,I] = sort(time_history);
extra_var_history_sort = extra_var_history(I);

plot(t, -1*sign(y(:, 1) + y(:, 2)));


ylabel("U");



function dydt = vdp1(~, y)

    dydt = [y(2); -2/3*y(2) - (7/3)*sin(y(1)) - (y(1)^3)/3 + u/3];

end


function dydt = vdp2(t, y)
    % global extra_var_history time_history
    u = -5*sign(y(1)+y(2));
    dydt = [y(2); -2/3*y(2) - (7/3)*sin(y(1)) - (y(1)^3)/3 + u/3];

    % extra_var_history = [extra_var_history; u];
    % time_history = [time_history; t];

end


function [dydt] = vdp3(t, y)

    global extra_var_history time_history
    k = 30;
    p = 5;
    z = y(2) + k*y(1);
    u = y(1)^3 - (3 + 3*k^2 - 2*k)*y(1) + 7*sin(y(1)) - 3*( p + k )*z + 2*p;
    dydt = [ y(2); -2/3*y(2) - (7/3)*sin(y(1)) - (y(1)^3)/3 + u/3 ];

    extra_var_history = [extra_var_history; u];
    time_history = [time_history; t];

end