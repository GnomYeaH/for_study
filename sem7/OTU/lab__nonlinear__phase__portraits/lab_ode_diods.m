%   script 4.1 Diods

function dxdt = lab_ode_diods(~, x)
    dxdt = [0.5*(-h(x(1)) + x(2)); 0.2*(-x(1) - 1.5*x(2) + 1.2)];
end

function h_x1 = h(x1)
    h_x1 = 17.76*x1 - 103.79*x1^2 + 229.62*x1^3 - 26.31*x1^4 + 83.72*x1^5;
end