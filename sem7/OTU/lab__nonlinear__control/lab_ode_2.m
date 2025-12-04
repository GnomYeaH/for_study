% function 3.3

function dxdt = lab_ode_2(t, x)

    l = 1;
    m = 1;
    nu = 0.5;
    g = 9.8;

    e_int1 = 0;
    e_int2 = 0;
    e_int3 = 0;
    e_int4 = 0;
    xk = [5/6*pi 0 pi/3 0];

    K_p_th = 60;
    K_p_ph = 60;

    K_i_th = 0.05;
    K_i_ph = 0.05;

    K_p_difth = 20;
    K_p_difph = 20;

    K_i_difth = 0.01;
    K_i_difph = 0.01;

    e_th = xk(1) - x(1) ; 
    e_difth = xk(2) - x(2);
    e_ph = xk(3) - x(3);
    e_difph = xk(4) - x(4);

    e_int1 = e_int1 + e_th *  t;
    e_int2 = e_int2 + e_difth * t;
    e_int3 = e_int3 + e_ph * t;
    e_int4 = e_int4 + e_difph * t;

    u_th = e_th * K_p_th + K_i_th * e_int1;
    u_difth = e_difth * K_p_difth + K_i_difth * e_int2;
    u_ph = e_ph * K_p_ph + K_i_ph * e_int3;
    u_difph = e_difph * K_p_difph + K_i_difph * e_int4;

    v_th = u_th + u_difth;
    v_ph = u_ph + u_difph;

    dxdt = zeros(4,1);
    dxdt(1) = x(2);
    dxdt(2) = -(nu*x(2))/(m*l^2) + v_th;
    dxdt(3) = x(4);
    dxdt(4) = -(nu*x(4))/(m*l^2) + v_ph;

end

