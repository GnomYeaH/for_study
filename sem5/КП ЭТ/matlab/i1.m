%%%%%%%%%%%%%%%%FROG%%%%%%%%%%%%%%%%%%%
clc; clear all; clear variebls;
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

e2 = 100i;      % Ė_2
e4 = 200i;      % Ė_4  
e5 = 50i;       % Ė_5
j3 = 1 - 2i;    % İ_3

r3 = 100;       % R_3,   сопротивление R_3
r4 = 100;       % R_4,   сопротивление R_4
Zl1 = 20i;      % Z_L_1, комплексное сопротивление L_1 
Zl2 = 100i;     % Z_L_2, комплексное сопротивление L_2
Zc1 = 0;        % Z_C_4, комплексное сопротивление C_1 
Zc4 = -25i;     % Z_C_4, комплексное сопротивление C_4 
Zc6 = -50i;     % Z_C_6, комплексное сопротивление C_6 

a = Zc4 + r4 + Zl2 + Zc6;
b = Zl2 + Zc6;
c = e2 + e4 - e5;

i11 = j3;
i22 = ( (e2 + e4 - e5) - i11 * (Zl2 + Zc6) ) / (Zc4 + r4 + Zl2 + Zc6);

i6 = i22 + j3;
uxx = e5 + Zc6*i6;
zvh = (Zl2+r4+Zc4) * Zc6 / (Zl2+r3+Zc4+Zc6)
ixx = uxx / (zvh+Zl1)
i_L1 = ixx
u_L1 = i_L1 * Zl1;

A_fi_il  =   [   sqrt(real(i_L1)^2 + imag(i_L1)^2);
                atan(imag(i_L1)/real(i_L1))        ];

A_fi_ul  =   [   sqrt(real(u_L1)^2 + imag(u_L1)^2);
                atan(imag(u_L1)/real(u_L1))        ];         

t = -0.01:0.0001:0.01; 
ul_t = A_fi_ul(1) * sqrt(2) * sin( 1000*t -  A_fi_ul(2));
il_t = A_fi_il(1) * sqrt(2) * sin( 1000*t -  A_fi_il(2));

figure(1)
plot(t, il_t)
grid on
grid minor
ylim([-max(il_t)*1.1 max(il_t)*1.1])
% xlim([0 0.02])
xlabel("t, c")
ylabel("I_L_1, А")

figure(2)
plot(t, ul_t)
grid on
grid minor
% ylim([-0.7 0.7])
% xlim([0 0.02])
xlabel("t, c")
ylabel("U_L_1, В")

u11 = complex(0, 8.77)  * i_L1
u22 = complex(0, -17.54) * i_L1

A_fi_u11  =   [   sqrt(real(u11)^2 + imag(u11)^2);
                atand(imag(u11)/real(u11))        ]

A_fi_u22  =   [   sqrt(real(u22)^2 + imag(u22)^2);
                atand(imag(u22)/real(u22))-180        ]
