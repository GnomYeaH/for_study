%   function 2.2

function dxdt = lab_ode(~, x)
    
    %  u = [0, 1];
    l = 1;
    m = 1;
    nu = 0.5;
    g = 9.8;
    
    dxdt = zeros(4, 1);

    dxdt(1) = x(2);
    dxdt(2) = (1/(m*l^2))*0 + x(4)^2*cos(x(1))*sin(x(1)) + (m*g/l)*sin(x(1)) - (nu/(m*l^2))*x(2);
    dxdt(3) = x(4);
    dxdt(4) = 1/(m*l^2*sin(x(1))^2)*1 - 2*x(4)*x(2)*cos(x(1))/sin(x(1)) - (nu*x(4))/(m*l^2*sin(x(1))^2);

end

