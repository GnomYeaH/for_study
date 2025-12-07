clc; clear figure; clear variables;
%%%%%%%%%%%%%%%%FROG%%%%%%%%%%%%%%%%%%%
%  ⠀🐸🐸🐸🐸🐸__🐸🐸🐸🐸
% __🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
% 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
% 🐸🐸⚪️⚫️⚫️⚪️🐸🐸🐸⚪️⚫️⚫️⚪️
% 🐸⚪️⚫️⚫️⚪️⚫️⚪️🐸⚪️⚫️⚫️⚪️⚫️⚪️
% 🐸⚪️⚫️⚪️⚫️⚫️⚪️🐸⚪️⚫️⚪️⚫️⚫️⚪️
% 🐸🐸⚪️⚫️⚪️⚪️🐸🐸🐸⚪️⚫️⚪️⚪️
% 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
% 🔴🔴🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
% 🐸🔴🔴🐸🐸🐸🐸🐸🐸🐸🐸🐸
% 🐸🐸🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴
% 🐸🐸🐸🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴
% 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
% 🐸🐸🐸🐸🐸🐸🐸🐸🐸🐸
% 🐸🐸🐸🐸🐸🐸🐸🐸🐸
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2 Расчет 4х полюсника
w = 1000;           % Частота, Гц
r1 = 25;            % Сопротивление R1, Ом
r2 = 50;            % Сопротивление R2, Ом
r3 = 75;            % Сопротивление R3, Ом
C = 240 * 10^-6;    % Емкость С, Ф
z_c = complex(0, -1/(1000 * C)); % Комлексное сопротивление С
u_vh = complex(-3.6425, -3.3623);           % Входное напряжение, В

z_vh = ( r1*(r2+r3) / (r1+r2+r3) ) + z_c;
i_vh = u_vh/z_vh;
i1 = (u_vh - i_vh*z_c)/r1;
i2 = i_vh - i1;
% Напряжение на элементах
U_c  = i_vh * z_c;
U_r1 = r1 * i1;
U_r2 = r2 * i2;
U_r3 = r3 * i2;



% % % Построение векторных диаграмм токов 
%     figure(1)
%     vi = [0+0i; i1; i2+i1;];
%     vi_vh = [0+0i; i_vh];
%     hold on
%     plot(real(vi), imag(vi), "*")
%     plot(real(vi_vh), imag(vi_vh))
%     hold off
%     axis equal
%     grid on
%     xlabel("Re(z)")
%     ylabel("Im(z)")

% % % Построение векторных диаграмм напряжений
%     figure(2)
%     vu_vh = [0+0i; u_vh];
%     vu    = [0+0i; U_c; U_r2 + U_c; U_r3 + U_r2 + U_c];
%     vu_r1 = [0+0i; U_c; U_r1 + U_c];
%     hold on
%     plot(real(vu), imag(vu))
%     plot(real(vu), imag(vu), "*")
%     plot(real(vu_r1), imag(vu_r1))
%     plot(real(vu_r1), imag(vu_r1), "*")
%     plot(real(vu_vh), imag(vu_vh))
%     hold off
%     axis equal
%     grid on
%     xlabel("Re(z)")
%     ylabel("Im(z)")

% Мгновенные значения 
    tau = -200;
    u_vh;
    u_vih = U_r3;
    i_vh;

% [ur, utheta] = cart2pol(real(u_vh), imag(u_vh))
% [ir, itheta] = cart2pol(real(i_vh), imag(i_vh))

A_fi_i  =   [   sqrt(real(i_vh)^2 + imag(i_vh)^2);
                atan(imag(i_vh)/real(i_vh))        ];

A_fi_u1 =   [   sqrt(real(u_vh)^2 + imag(u_vh)^2);
                atan(imag(u_vh)/real(u_vh))        ];

A_fi_u2 =   [   sqrt(real(u_vih)^2 + imag(u_vih)^2);
                atan(imag(u_vih)/real(u_vih))      ];

% Отношение и разность
fi = A_fi_u2(2);                 %   = 11.3099 degrees
otn = A_fi_u1(1)/A_fi_u2(1);     %   = 1.6997

%  2.3

r_123 = ( (r2+r3)*r1 ) / (r1+r2+r3); % 20.83 Ом 


%  2.4 АФЧХ    

    x = sqrt(10^6/5^2);
    y_predel = ( 3*x ) / sqrt( 1000^2 + 5^2 * x ); % = 0.5985

    % figure(3) % АЧХ

    % frequency = 0:10:2000;
    % A_y = zeros(1, length(frequency));

    % for i = 1:length(frequency)
    %     A_y(i) = ( 3*frequency(i) ) / sqrt( 10^6 + 5^2 * frequency(i)^2 ); 
    % end

    % plot(frequency, A_y)

    % grid on
    % ylim([0 (y_predel+y_predel*0.01)])
    % xlim([0 2000])
    % xlabel("ω, Гц")
    % ylabel("A(ω)")

    % figure(4) % ФЧХ

    % frequency = 0:50:5000;
    % fi_y = zeros(1, length(frequency));

    % for i = 1:length(frequency)
    %     fi_y(i) = rad2deg( pi/2 - atan(5*frequency(i)/1000) ); 
    % end

    % plot(frequency, fi_y)

    % grid on
    % ylim([0 fi_y(1)])
    % xlim([0 5000])
    % xlabel("ω, Гц")
    % ylabel("φ(ω)")


W_jw = complex( 0, 3*1000 ) / complex( 1000, 5*1000 );
u_vih_2_4 = complex(-3.6425, -3.3623) * W_jw;

%2.5
Q = 4.17/r_123; % 20%

clear u_vh u_vih i_vh

% 3 Расчет установившихся значений напряжений и токов в 
% электрических  цепях при несинусоидальном воздействии.

z_vhk = zeros(1, 3);

for k = 1:3
    z_vhk(k) = complex(0, -1/(w*(2*k-1)*C)) + r_123;
end

W_jw = complex( 0, 3*1000 ) / complex( 1000, 5*1000 );

% Первая гармоника (k=1)
    k = 1;
    u_vh1  = 40/(k*pi*sqrt(2));
    z_vh1 = complex( 0, -1/(w*k*C) ) + r_123;
    i_vh1  = u_vh1 / z_vh1;
    u_vih1 = W_jw * u_vh1;

    A_fi_i_vh1  =   [    sqrt(real(i_vh1)^2 + imag(i_vh1)^2);
                        atan(imag(i_vh1)/real(i_vh1))          ];
    % i_vh1_t = 0.42*sqrt(2)sin(1000t + 11.31)

    A_fi_u_vih1 =   [    sqrt(real(u_vih1)^2 + imag(u_vih1)^2);
                        atan(imag(u_vih1)/real(u_vih1))          ];
    % u_vih1_t = 5.30*sqrt(2)sin(1000t + 11.31)

% Гармоник (k=3)
    u_vh3  = 40/(3*pi*sqrt(2));     % = 3.0011
    z_vh3  = z_vhk(2);              % = 20.8333 - 1.3889i
    i_vh3  = u_vh3/z_vh3;           % = 0.1434 + 0.0096i
    u_vih3 = W_jw * u_vh3;          % = 1.7314 + 0.3463i
    
    A_fi_i_vh3  =   [    sqrt(real(i_vh3)^2 + imag(i_vh3)^2);
                        atan(imag(i_vh3)/real(i_vh3))          ];
    % i_vh3_t = 0.14*sqrt(2)sin(1000t + 3.81)

    A_fi_u_vih3 =   [    sqrt(real(u_vih3)^2 + imag(u_vih3)^2);
                        atan(imag(u_vih3)/real(u_vih3))          ];
    % u_vih3_t = 1.77*sqrt(2)sin(1000t + 11.31)

% Гармоник (k=5)
    u_vh5  = 40/(5*pi*sqrt(2));     % = 1.8006
    z_vh5  = z_vhk(3);              % = 20.8333 - 0.8333i
    i_vh5  = u_vh5/z_vh5;           % = 0.0863 + 0.0035i
    u_vih5 = W_jw * u_vh5;          % = 1.0388 + 0.2078i

    A_fi_i_vh5  =   [    sqrt(real(i_vh5)^2 + imag(i_vh5)^2);
                        atan(imag(i_vh5)/real(i_vh5))          ];
    % i_vh5_t = 0.09*sqrt(2)*sin(1000t + 2.29)

    A_fi_u_vih5 =   [    sqrt(real(u_vih5)^2 + imag(u_vih5)^2);
                        atan(imag(u_vih5)/real(u_vih5))          ];
    % u_vih5_t = 1.06*sqrt(2)sin(1000t + 11.31)

% Просуммируем значения i_vh_t и u_vih_t

% u_vih_t   =   5.2970*sqrt(2)*sin(w*t + ~11.3099)  +
%           +   1.7657*sqrt(2)*sin(w*t + 11.3099)  +
%           +   1.0594*sqrt(2)*sin(w*t + 11.3099)

% i_vh_t    =   0.1437*sqrt(2)*sin(w*t + 3.8141)   +
%           +   0.0480*sqrt(2)*sin(w*t + 1.2730)   +
%           +   0.0288*sqrt(2)*sin(w*t + 0.7639)

% 3.2 Графики напряжений и токов

t = 0:0.00001:0.02; % Шкала времени

u_vh = 40/(pi)*sin(w*t) + 40/(5*pi)*sin(5*w*t) + 40/(3*pi)*sin(3*w*t); 

i_vh = 0.4238*sqrt(2)*sin(w*t + 0.1974) + 0.1437*sqrt(2)*sin(3*w*t + 0.0666) + 0.0864*sqrt(2)*sin(5*w*t + 0.0400); 

u_vih = 5.2970*sqrt(2)*sin(w*t + 0.1974) + 1.7657*sqrt(2)*sin(3*w*t + 0.1974) + 1.0594*sqrt(2)*sin(5*w*t + 0.1974); 


    % figure(5) % u_vh_t

    % subplot(3, 1 , 1)
    % plot(t, u_vh)
    % grid on
    % grid minor
    % ylim([-13 13])
    % xlim([0 0.02])
    % xlabel("t, c")
    % ylabel("Uвх, В")

    % subplot(3, 1 , 2) % u_vih_t
    % plot(t, u_vih)
    % grid on
    % grid minor
    % ylim([-9 9])
    % xlim([0 0.02])
    % xlabel("t, c")
    % ylabel("Uвых, В")

    % subplot(3, 1 , 3) % i_vh_t
    % plot(t, i_vh)
    % grid on
    % grid minor
    % ylim([-0.7 0.7])
    % xlim([0 0.02])
    % xlabel("t, c")
    % ylabel("Iвх, А")

% 3.3

u_vh_d  = sqrt(u_vh1^2 + u_vh3^2 + u_vh5^2);                                % = 9.6595 В
i_vh_d  = sqrt(A_fi_i_vh1(1)^2 + A_fi_i_vh3(1)^2 + A_fi_i_vh5(1)^2);        % = 0.4557 А
u_vih_d = sqrt(A_fi_u_vih1(1)^2 + A_fi_u_vih5(1)^2 + A_fi_u_vih5(1)^2) ;    % = 5.5048 В

P_4xPolis = u_vh1*A_fi_i_vh1(1)*cos(A_fi_i_vh1(2)) + ...
            u_vh3*A_fi_i_vh3(1)*cos(A_fi_i_vh3(2)) + ...
            u_vh5*A_fi_i_vh5(1)*cos(A_fi_i_vh5(2));
            % = 4.3269 Вт

% коэф искажений U I
k_I = A_fi_i_vh1(1)/i_vh_d; % = 0.9298
k_U = u_vh1/u_vih_d;        % = 1.6355 



% 4 Графики переходной и импульсной характеристик входного тока и выходного напряжения

t = [-0.05 0:0.0001:0.05];

h_ivh = zeros(1, length(t));
k_ivh = zeros(1, length(t));
h_uvh = zeros(1, length(t));
k_uvh = zeros(1, length(t));

h_ivh(1) = 0;
k_ivh(1) = 0;
h_uvh(1) = 0;
k_uvh(1) = 0;

h_ivh(2) = 0;
k_ivh(2) = 0;
h_uvh(2) = 0;
k_uvh(2) = 0;


for i = 3:length(t)
    h_ivh(i) = 0.048*exp(-200*t(i));
    k_ivh(i) = 0.048 - 9.6*exp(-200*t(i));
    h_uvh(i) = 0.6*exp(-200*t(i));
    k_uvh(i) = 0.6 - 120*exp(-200*t(i));
end

% figure(12) 

%     subplot(1, 2 , 1)
%     plot(t, h_uvh)
%     grid on
%     grid minor

%     xlim([-0.02 inf])
%     xlabel("t, c")
%     ylabel("h_U_в_х")

%     subplot(1, 2 , 2)
%     plot(t, k_uvh)
%     grid on
%     grid minor
%     xlim([-0.02 inf])
%     xlabel("t, c")
%     ylabel("K_U_в_х")


% 4.2




t0 = (2*pi+2.3961)/10^3;
T = 0.0063;

% t(0+; T/2-)
u_vh_0plus   = 10;
u_vh_0minus  = 0;
i_vh_0minus  = A_fi_i(1)*sqrt(2)*sin(w*T + A_fi_i(2));
u_vih_0minus = A_fi_u2(1)*sqrt(2)*sin(w*T + A_fi_u2(2));

i2_0minus = u_vih_0minus/r3;
uc_0minus = u_vh_0minus - u_vih_0minus - i2_0minus*r2;

uc_0plus = uc_0minus; % Закон коммутации
i1_0plus  = (u_vh_0plus - uc_0plus)/r1;

A1_i1    = i1_0plus;
A1_uc    = -u_vh_0plus + uc_0plus;
A1_ivh   = C*tau*A1_uc;
A1_i2    = A1_ivh - A1_i1;
A1_u_vih = A1_i2*r3;


% t(+T/2; -T)
u_vh_T_2plus   = -10;    % B
u_vh_T_2minus  = 10;     % B
u_vih_T_2minus = A1_u_vih*exp(-200*T/2); % B
i_vh_T_2minus  = A1_ivh*exp(-200*T/2);   % A

i2_T_2minus = u_vih_T_2minus/r3;
uc_T_2minus = u_vh_T_2minus - u_vih_T_2minus - i2_T_2minus*r2;

uc_T_2plus = uc_T_2minus; % Закон коммутации
i1_T_2plus = (u_vh_T_2plus - uc_T_2plus)/r1;

A2_i1 = i1_T_2plus;
A2_uc = -u_vh_T_2plus + uc_T_2plus;
A2_ivh = C*tau*A2_uc;
A2_i2 = A2_ivh - A2_i1;
A2_u_vih = A2_i2*r3;


% t (T+; 3T/2-)

u_vh_Tplus   = 10;    % B
u_vh_Tminus  = -10;     % B
u_vih_Tminus = A2_u_vih*exp(-200*T/2); % B
i_vh_Tminus  = A2_ivh*exp(-200*T/2);  % A

i2_Tminus = u_vih_Tminus/r3;
uc_Tminus = u_vh_Tminus - u_vih_Tminus - i2_Tminus*r2;

uc_Tplus = uc_Tminus; % Закон коммутации
i1_Tplus  = (u_vh_Tplus - uc_Tplus)/r1;

A3_i1 = i1_Tplus;
A3_uc = -u_vh_Tplus + uc_Tplus;
A3_ivh = C*tau*A3_uc;
A3_i2 = A3_ivh - A3_i1;
A3_u_vih = A3_i2*r3;

% t (3T/2+; 2T-)
u_vh_3T2_plus   = -10;    % B
u_vh_3T2_minus  = 10;     % B
u_vih_3T2_minus = A3_u_vih*exp(-200*T/2); % B
i_vh_3T2_minus  = A3_ivh*exp(-200*T/2);   % A

i2_3T2_minus = u_vih_3T2_minus/r3;
uc_3T2_minus = u_vh_3T2_minus - u_vih_3T2_minus - i2_3T2_minus*r2;

uc_3T2_plus = uc_3T2_minus; % Закон коммутации
i1_3T2_plus  = (u_vh_3T2_plus - uc_3T2_plus)/r1;

A4_i1 = i1_3T2_plus;
A4_uc = -u_vh_3T2_plus + uc_3T2_plus;
A4_ivh = C*tau*A4_uc;
A4_i2 = A4_ivh - A4_i1;
A4_u_vih = A4_i2*r3;

% t (2T+; 5T/2-)
u_vh_5T2_plus   = 10;    % B
u_vh_5T2_minus  = -10;     % B
u_vih_5T2_minus = A4_u_vih*exp(-200*T/2); % B
i_vh_5T2_minus  = A4_ivh*exp(-200*T/2);   % A

i2_5T2_minus = u_vih_5T2_minus/r3;
uc_5T2_minus = u_vh_5T2_minus - u_vih_5T2_minus - i2_5T2_minus*r2;

uc_5T2_plus = uc_5T2_minus; % Закон коммутации
i1_5T2_plus  = (u_vh_5T2_plus - uc_5T2_plus)/r1;

A5_i1 = i1_5T2_plus;
A5_uc = -u_vh_5T2_plus + uc_5T2_plus;
A5_ivh = C*tau*A5_uc
A5_i2 = A5_ivh - A5_i1;
A5_u_vih = A5_i2*r3

% График Ivh Uvih

tt = -2*t0:t0/200:0;
i_vh_t = zeros(1, length(tt));
u_vih_t = zeros(1, length(tt));

for i = 1:length(tt)
    i_vh_t(i)  = A_fi_i(1)*sqrt(2)*sin(w*tt(i) + A_fi_i(2));
    u_vih_t(i) = A_fi_u2(1)*sqrt(2)*sin(w*tt(i) + A_fi_u2(2));
end

t1 = (0    ):T/200:(T/2);
t2 = (T/2  ):T/200:(T);
t3 = (T    ):T/200:(3*T/2);
t4 = (3*T/2):T/200:(2*T);
t5 = (2*T ):T/200:(5*T/2);

ivh_1  = zeros(1, length(t1)); 
ivh_2  = zeros(1, length(t2));
ivh_3  = zeros(1, length(t3));
ivh_4  = zeros(1, length(t4));
ivh_5  = zeros(1, length(t5));

uvih_1 = zeros(1, length(t1)); 
uvih_2 = zeros(1, length(t2));
uvih_3 = zeros(1, length(t3));
uvih_4 = zeros(1, length(t4));
uvih_5 = zeros(1, length(t5));


for i = 1:length(t1)

    ivh_1(i) = A1_ivh*exp(tau*t1(i));
    ivh_2(i) = A2_ivh*exp(tau*t1(i));
    ivh_3(i) = A3_ivh*exp(tau*t1(i));
    ivh_4(i) = A4_ivh*exp(tau*t1(i));
    ivh_5(i) = A5_ivh*exp(tau*t1(i));

    uvih_1(i) = A1_u_vih*exp(tau*t1(i));
    uvih_2(i) = A2_u_vih*exp(tau*t1(i));
    uvih_3(i) = A3_u_vih*exp(tau*t1(i));
    uvih_4(i) = A4_u_vih*exp(tau*t1(i));
    uvih_5(i) = A5_u_vih*exp(tau*t1(i));

end

t111    = [t1 t2 t3 t4 t5];
u_vih = 5.2970*sqrt(2)*sin(w*t111 + 0.1974) + 1.7657*sqrt(2)*sin(3*w*t111 + 0.1974) ...
                            + 1.0594*sqrt(2)*sin(5*w*t111 + 0.1974); 
i_vh  = 0.4238*sqrt(2)*sin(w*t111 + 0.1974) + 0.1437*sqrt(2)*sin(3*w*t111 + 0.0666) ...
                            + 0.0864*sqrt(2)*sin(5*w*t111 + 0.0400); 

t    = [tt t1 t2 t3 t4 t5];
uvih = [u_vih_t uvih_1 uvih_2 uvih_3 uvih_4 uvih_5];
ivh  = [i_vh_t ivh_1 ivh_2 ivh_3 ivh_4 ivh_5];


figure(6)

subplot(2, 1, 2)
hold on
plot(t, uvih)
plot(t111, u_vih, '--')
legend(['п. 4.2';'п. 3.2'], "Location", "southeast")
hold off
grid on
grid minor
xlim([-0.01 inf])
xlabel("t, c")
ylabel("Uвых, В")

subplot(2, 1, 1)
hold on
plot(t, ivh)
plot(t111, i_vh, '--')
legend(['п. 4.2';'п. 3.2'], "Location", "southeast")
hold off
xlim([-0.01 inf])
grid on
grid minor
xlabel("t, c")
ylabel("Iвх, А")

