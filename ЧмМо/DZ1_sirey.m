
clc; clear variables;

%%
%Метод Эйлера

% x_nach = [];
% y_nach = [];
% step = [0 1 2 3 4 5 6 7 8 9 10]';

% y_nach(1) = 0.0000;
% x_nach(1) = 1.0000;

% for i = 1:10

%     y_nach(i+1) = round( y_nach(i) + 0.1 * Func(x_nach(i), y_nach(i)), 4 );
%     x_nach(i+1) = round( x_nach(i) + 0.1, 4);

% end

% x = x_nach';
% y = y_nach';

% T = table(step, x, y)

% function f = Func(a, b)
%     f = a - 2*sqrt(b);
% end


%%
% %Метод Рунге-Кутты

% x1=[]; y1=[]; step = [0 1 2 3 4 5 6 7 8 9 10]'
% x1(1)=1; y1(1)=0;
% h=0.1;

% for i = 1:10

%     d1(i) = h*func(x1(i), y1(i));
%     d2(i) = h*func(x1(i)+h/2, y1(i)+d1(i)/2);
%     d3(i) = h*func(x1(i)+h/2, y1(i)+d2(i)/2);
%     d4(i) = h*func(x1(i)+h, y1(i)+d3(i));

%     k(i) = (d1(i) + 2*d2(i) + 2*d3(i) + d4(i))/6;
%     x1(i+1) = round(x1(1) + i*h, 4);
%     y1(i+1) = round(y1(i) + k(i), 4);
    
% end

% x = x1';
% y = y1';

% T = table(step, x, y)

% function f = func(a, b)
%     f = a - 2*sqrt(b);
% end


%%
% Метод Адамса


x1=[]; y1=[]; step = [0 1 2 3 4 5 6 7 8 9 10]';

x1(1) = 1.0; 
y1(1) = 0;

x1(2) = 1.1; 
y1(2) = 0.0697;

x1(3) = 1.2; 
y1(3) = 0.1227;

x1(4) = 1.3; 
y1(4) = 0.2179;

h = 0.1;

for i = 4:10

    x1(i+1) = x1(i) + h;

    d1(i) = func(x1(i), y1(i)) - func(x1(i-1), y1(i-1));
    d2(i) = func(x1(i), y1(i)) - 2*func(x1(i-1), y1(i-1)) + func(x1(i-2), y1(i-2));
    d3(i) = func(x1(i), y1(i)) - 3*func(x1(i-1), y1(i-1)) + 3*func(x1(i-2), y1(i-2)) - func(x1(i-3), (i-3));

    y1(i+1) = round(y1(i) + h*func(x1(i), y1(i))+(h^2) * d1(i)/2 + 5*(h^3)/12 * d2(i) + 3/8*(h^4)*d3(i), 4);

end

x = x1';
y = y1';

T = table(step, x, y)
    
function f = func(a, b)
    f = a - 2*sqrt(b);
end
