
clc; clear variables;


%%
%Метод Эйлера

% x1 = [];
% y1 = [];
% step = [0 1 2 3 4 5 6 7 8 9 10]';

% y1(1) = exp(1);
% x1(1) = 0;

% for ii = 1:10

%     y1(ii+1) = y1(ii) + 0.1 * Func(x1(ii), y1(ii));
%     x1(ii+1) = x1(ii) + 0.1;

% end

% x = x1';
% y = y1';

% T = table(step, x, y)

% function f = Func(a,b)
%     f = -log( b - a );
% end



%%
% Метод Рунге-Кутты

% x1=[]; 
% y1=[];
% step = [0 1 2 3 4 5 6 7 8 9 10]';

% x1(1) = 0; 
% y1(1) = exp(1);
% h=0.1;

% for i = 1:10

%     d1(i) = h*Func(x1(i), y1(i));
%     d2(i) = h*Func(x1(i)+h/2, y1(i)+d1(i)/2);
%     d3(i) = h*Func(x1(i)+h/2, y1(i)+d2(i)/2);
%     d4(i) = h*Func(x1(i)+h, y1(i)+d3(i));

%     K(i) = (d1(i) + 2*d2(i) + 2*d3(i) + d4(i))/6;
%     x1(i+1) = x1(1) + i*h;
%     y1(i+1) = y1(i) + K(i);
    
% end

% x = x1';
% y = y1';

% T = table(step, x, y)

% function f = Func(a, b)
%     f = -log( b - a );
% end


%%
% Метод Адамса


x1=[]; 
y1=[];
step = [0 1 2 3 4 5 6 7 8 9 10]';

x1(1) = 0; 
y1(1) = exp(1);

x1(2) = 0.1; 
y1(2) = 2.7183;

x1(3) = 0.2; 
y1(3) = 2.622;

x1(4) = 0.3; 
y1(4) = 2.5334;

h=0.1;

for i = 4:10

    x1(i+1) = x1(i) + h;

    d1(i) = Func(x1(i), y1(i)) - Func(x1(i-1), y1(i-1));
    d2(i) = Func(x1(i), y1(i)) - 2*Func(x1(i-1), y1(i-1)) + Func(x1(i-2), y1(i-2));
    d3(i) = Func(x1(i), y1(i)) - 3*Func(x1(i-1), y1(i-1)) + 3*Func(x1(i-2), y1(i-2)) - Func(x1(i-3), (i-3));

    y1(i+1) = y1(i) + h*Func(x1(i), y1(i))+(h^2) * d1(i)/2 + 5*(h^3)/12 * d2(i) + 3/8*(h^4)*d3(i);

end

x = x1';
y = y1';

T = table(step, x, y)
    
function f = Func(a, b)
    f = -log( b - a );
end
