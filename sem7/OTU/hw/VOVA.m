clc;  
clear all;
close all;


x = -10:0.1:10;

y1 = zeros(1, length(x));
y2 = zeros(1, length(x));

for i = 1:1:length(x)

    y1(i) = 7*sin(x(i));
    y2(i) = -x(i)^3;

end

% figure(1)

% hold on
% grid on

% title('7sin(x) = -x^3');
% xlabel("x");
% ylabel("y");

% xlim([-5 5])
% ylim([-10 10])

% plot(x, y1);
% plot(x, y2);

% figure(2);

% grid on
% hold on

% X = [ [1; 1]  [-0.5; -0.5] [0.5; -1] [0; 0] [1; -0.5] [2; 1]  [-1; -2] [1; -2] [2; -1] ];

% title('Фазовый портрет');
% xlabel("x_1");
% ylabel("x_2");

% xlim([-2.4 .4])
% ylim([-2.4 2.4])

% for i = 1:length(X)
%     [~, y] = ode45(@vdp2, 0:0.01:30, X(:, i));
%     plot(y(:,1),y(:,2));    
% end


% function dydt = vdp1(~,y)
%     dydt = [y(2); -2/3*y(2)-tan(y(1))/3+(y(1)^2)/3];
% end

figure(3);
title('Управления со скользящим режимом');

[t, y] = ode45(@vdp3, 0:0.1:10, [-2 -0.4]);

grid on
hold on

xlabel("Время, c")

yyaxis left
plot(t, y(:,1))
ylabel("x_1");

yyaxis right
plot(t, y(:,2))
ylabel("x_2");

% xlim([-2.4 .4])
% ylim([-2.4 2.4])


figure(4);
title('Управления со скользящим режимом');


grid on
hold on

xlabel("Время, c")
plot(t,-10*sign(0*y(:,1)+y(:,2)))
ylabel("U");

function dydt = vdp2(~, y)

    u = 0;
    dydt = [y(2); -2/3*y(2) - (7/3)*sin(y(1)) - (y(1)^3)/3 + u/3];

end

function dydt = vdp3(t, y)

    u = -10*sign(1*y(1)+y(2));
    dydt = [y(2); u/3 - (2/3)*y(2) - (4/3)*y(1) - (1/3)*exp(y(1)) + (1/3)*cos(y(1))];

end