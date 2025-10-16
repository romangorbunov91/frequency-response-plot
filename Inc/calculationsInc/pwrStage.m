% Power stage.
fsw = 100e3;
Tsw = 1 / fsw;

L = 136e-6;
rL = 25e-3;

N_CAP = 4;
C = N_CAP*100e-6;
rC = 55e-3/N_CAP;

Rds_on = 0.15 * 1.2;

% Nominal values.
U_out_nom = 48;
U_in_nom = 24;
P_out_nom = 120;
R_nom = U_out_nom^2 / P_out_nom;

U_in = U_in_nom;
U_out = U_out_nom;
P_out = P_out_nom;
R = R_nom;
%Duty = 1 - U_in / U_out;
Duty = 0.555;
%Duty = 0.535;
%Duty = 0.285;
%Duty = 0.275;

% We want at least 100 (in this case 250) points on the scale of one 
% period
Nsw = 250;