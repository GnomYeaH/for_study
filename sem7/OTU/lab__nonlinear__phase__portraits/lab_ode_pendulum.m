%   script 2.2 Pendulum

function dxdt = lab_ode_pendulum(~, x)
    dxdt = [x(2); -10*sin(x(1)) - x(2)];
end

