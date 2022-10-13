teeth_p = 17;
teeth_g = 52;
pressure_angle = 20; % degrees

power = 4; % hp
dia_pitch = 10; % teeth/in

face_width = 1.5; % in
Q_v = 6;

diameter_p = teeth_p/dia_pitch; % in
diameter_g = teeth_g/dia_pitch; % in

velocity_p = 1800; % rpm
velocity_g = velocity_p * (teeth_p/teeth_g); % rpm

velocity_PL = (pi*diameter_p/12) * velocity_p; % ft/min

load_t = 33000*power/velocity_PL; % lbf

% Overload factor, 
K_o = 

