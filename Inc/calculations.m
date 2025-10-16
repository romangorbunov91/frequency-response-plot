% Title: Generates math-model based frequency response datasets.
% Type: APPLICATION SPECIFIC
% Released: 28-Aug-2023
% Author: Roman Gorbunov
% Script and data info:
    % Calculates complex gains
    % at the frequencies specified by the 'linspace' as the 1D-array,
    % where 'FR_NUM_OF_POINTS' - number of frequencies.
    % OUTPUTS:
        % frDatasets{1..NUM_OF_DATASETS}(FR_NUM_OF_POINTS, 2)
            % 1D-cell-array (row-vector) as the global variable.
            % Each cell contains an independent dataset
                % as 2D-array with 2 columns:
                    % (:, 1) - frequency, Hz;
                    % (:, 2) - complex gain.

% Read the parameters.
run('calculationsInc/pwrStage.m');

%==========================================================================
% Frequency interval for the frequency response.
%==========================================================================
FR_NUM_OF_POINTS = 10e3;
FR_FREQ_HZ_MIN = 10;
FR_FREQ_HZ_MAX = 50e3;
frequencyHz = logspace(log10(FR_FREQ_HZ_MIN), log10(FR_FREQ_HZ_MAX), FR_NUM_OF_POINTS);

%==========================================================================
% Index.
%==========================================================================
clearvars varIndex
varIndex.frequency   = uint8(1);
varIndex.complex_mag = uint8(2);
%==========================================================================
% Calculations.
NUM_OF_DATASETS = 2;

s = 1i * 2 * pi * frequencyHz;

Le = L / (1-Duty)^2;
Q = R*sqrt(C/Le);
w0 = 1 / sqrt(Le*C);
wesr = 1 / (C*rC);
wc = 1 / (R*C);
wrhp = R / Le;

%W_u_d = U_out / (1-Duty) * (1 - s/wrhp) .* (1 + s/wesr) ./ (1 + s / (w0 * Q) + s.^2 / w0^2);
%W_u_i = (1-Duty) * (R/2) * (1 - s/wrhp) .* (1 + s/wesr) ./ (1 + s / (2*wc));
%W = Nsw/2 * W_u_d .* W_delay .* W_PWM .* LPF(f, R1, R2, R3, R4, C1, C2);
%W = W_u_i .* LPF(f, R1, R2, R3, R4, C1, C2);
load('simulation\W_i_d_24V_Full_load.mat')

frDatasets = cell(1,NUM_OF_DATASETS);
for idx = 1 : NUM_OF_DATASETS
    switch idx
        case 1
            frDatasets{idx} = zeros(FR_NUM_OF_POINTS, length(fieldnames(varIndex)));
            W_i_d = U_out / (1-Duty)^2 / (R/2) * (1 + s / (2*wc)) ./ (1 + s / (w0 * Q) + s.^2 / w0^2);
            W_PWM = 1/(Nsw/2) * exp(-s*Tsw/2);
            W_delay = 1*exp(-s*(Tsw/2));
            
            frDatasets{idx}(:,varIndex.complex_mag) = Nsw/2 * W_i_d .* W_delay .* W_PWM;
            frDatasets{idx}(:,varIndex.frequency  ) = frequencyHz;
        case 2
            frDatasets{idx} = W_i_d_24V_Full_load;
    end
end
