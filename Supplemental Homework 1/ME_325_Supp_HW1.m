D = 2;
d = 1.75;
c = 1.75/2;
r = 0.25;
Sut = 90;
Sy = 75;
%Marin factors
%Surface factor:  
    %Machined a = 2, b = -.217 Table 6.2
k_a = 2*Sut^(-.217);
%Size factor:  k_b -- 0.3in < d < 2in
k_b = 0.879*d^(-.107);
%Loading factor, kc = 1 (combined loading)
k_c = 1;
%Temperature factor, kd
T =  600; %F 
RT = 72; %F;
k_d = 0.98+3.5*10^(-4)*T-6.3*10^(-7)*T^2;
%ST is Sut at operating temperature, SRT is Sut at room temperature
% 99 percent reliablity, table 6.4
k_e = .814;
% no miscellaneous effects therefore kf = 1
k_f = 1;
K = k_a*k_b*k_c*k_d*k_e*k_f ;

Sf_1_million = K*1/2*Sut ;  %Fatigue strength 10^6 stress cycles

%Fatigue Strength at 10^3 cycles, based on 70 < Sut < 200 kpsi
f = 1.06-2.8*.001*Sut+6.9*10^(-6)*Sut^2;
Sf_1000 = f*Sut ;

% calculating basquin parameters A and B
    % from in class derivation
b_basq = 1/3*log10(Sf_1_million*1000/(Sf_1000*1000)) ;
log_A = log10(Sf_1000*1000)-3*b_basq ;
A_basq = 10^log_A/1000 ;  %A is in kpsi

%Loading Values
Fx1 = 1000 ;
Mz1 = 840 ;
T1 = 400 ;

Fx2 = -500 ;
Mz2 = 700  ; % should be negative
T2 = 400 ;

% Geometry
A = pi*d^2/4    ;
I = pi*d^4/64   ;
J = 2*I         ;
Q = d^3/12      ;
Kt_axial = 1.94;    % from eFatigue
Kt_bending = 1.7;    % from eFatigue
Kt_torsion = 1.35;   % from eFatigue
%Neuber's constant for torsion
sqrt_a_torsion = 0.190-2.51*.001*Sut + 1.35*10^(-5)*Sut^2-2.67*10^(-8)*Sut^3;
%Neuber's Constant for bending and axial loads
sqrt_a_axial = 0.246-3.08*.001*Sut + 1.51*10^(-5)*Sut^2-2.67*10^(-8)*Sut^3;
sqrt_a_bending = 0.246-3.08*.001*Sut + 1.51*10^(-5)*Sut^2-2.67*10^(-8)*Sut^3;

%Torsion
q_tor = 1/(1+sqrt_a_torsion/sqrt(r));
Kf_torsion = q_tor*(Kt_torsion-1)+1;

%Bending
q_bend = 1/(1+sqrt_a_bending/sqrt(r));
Kf_bend = q_bend*(Kt_bending-1)+1;

%Axial
q_axial = 1/(1+sqrt_a_axial/sqrt(r));
Kf_axial = q_axial*(Kt_axial-1)+1;

% Stress values at State 1
sx_1 = Kf_axial*Fx1/A;
sx_2 = Kf_bend*Mz1*c/I;
sx_total_1 = sx_1+sx_2;
tau_xz_1 = Kf_torsion*(T1*d/2)/J;

% Stress Values at State 2
sx_3 = Kf_axial*Fx2/A;
sx_4 = Kf_bend*Mz2*c/I;
sx_total_2 = sx_3+sx_4;
tau_xz_2 = Kf_torsion*(T2*d/2)/J;

%Sf at n= 50,000
Sf_50000 = A_basq*50000^b_basq;

%mean and alternating stresses
Sx_min = min([sx_total_1 sx_total_2])   ;
Sx_max = max([sx_total_1 sx_total_2])   ;
Sx_mean = (Sx_max + Sx_min)/2           ;  
Sx_alt = (Sx_max - Sx_min)/2            ;   

tau_xz_mean = (tau_xz_1 + tau_xz_2)/2   ;
tau_xz_alt = (tau_xz_1 - tau_xz_2)/2    ;

%Calculating Principal mean stresses
Sz_mean = 0 ; 
S_m_a = ((Sx_mean+Sz_mean)/2) + sqrt((((Sx_mean-Sz_mean)/2)^2) + (tau_xz_mean)^2)
S_m_b = ((Sx_mean+Sz_mean)/2) - sqrt((((Sx_mean-Sz_mean)/2)^2) + (tau_xz_mean)^2)

S_m1 = max([S_m_a S_m_b 0])
S_m3 = min([S_m_a S_m_b 0])

%Calculating Principal alternating stresses
Sz_alt = 0 ;
S_a_a = ((Sx_alt+Sz_alt)/2) + sqrt((((Sx_mean-Sz_alt)/2)^2) + (tau_xz_alt)^2)
S_a_b = ((Sx_mean+Sz_alt)/2) - sqrt((((Sx_mean-Sz_alt)/2)^2) + (tau_xz_alt)^2)

S_a1 = max([S_a_a S_a_b 0]) 
S_a3 = min([S_a_a S_a_b 0])

%Calculate Mean and alternating von mises stress
S_m_von = sqrt((S_m1^2)+(S_m3^2)-(S_m1*S_m3))
S_a_von = sqrt((S_a1^2)+(S_a3^2)-(S_a1*S_a3))

% Needed
% failure envelopes (graphs) and factors of safety




