% Stage 1: Scale and Bias.
% KW_Power.
R5 = 120e3;
R6 = 47;
R7 = 120e3;
R8 = 22e3;
R10 = 47;

% KW_Control.
R58 = 0;
R60 = 9.31e3;
R63 = 0;
R64 = inf;
R66 = 1e3;
R69 = 1e3;
R70 = 1e3;
R72 = 5.1e3;
R74 = 64.9e3;

% Stage 2: 2nd order LPF.
% KW_Control.
R76 = 1e3;
R79 = 47;
R80 = 47;
R82 = 1e3;
R84 = 2.4e3;
R86 = inf;
R88 = 0;
R90 = 220;

C34 = 1000e-12;
C36 = 1000e-12;
C38 = 220e-12;

% General circuit parameters.
R1 = R76 + R82 + R79*R80/(R79+R80);
R2 = R84;
R3 = R86;
R4 = R88;
C1 = C34;
C2 = C36;