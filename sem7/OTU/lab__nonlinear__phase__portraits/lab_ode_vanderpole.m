%   script 3.1 Van der Pole

function dxdt = lab_ode_vanderpole(~, x)
    dxdt = [x(2); -x(1) + 0.5*(1 - x(1)^2)*x(2)];
end