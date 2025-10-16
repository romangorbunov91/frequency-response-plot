% Plots.
set(0, "defaultaxesfontsize", 24); % axes labels fontsize.

% Power stage frequency response.
X_LIM = [10, 50e3];
%USER_LEGEND = fileList;
USER_LEGEND = {'Digital Points', 'Func.', 'Simulation'};
USER_TITLE = 'Control-to-voltage frequency response at 24 Vin, 19.2 Ohm';
%USER_TITLE = [];

[~, numPlotDatasets] = size(plotData);

subplot(2,1,1);
for idx = 1 : numFiles
    semilogx(dataset{idx}(:,index.frequency_Hz), ...
             dataset{idx}(:,index.magnitude_dB));
    hold on;
end

for idx = 1 : numPlotDatasets
    semilogx(plotData{idx}(:,index.frequency_Hz), ...
        plotData{idx}(:,index.magnitude_dB));
    hold on;
end
legend(USER_LEGEND);
hold off;
xlim(X_LIM);
grid on;
xlabel('Frequency, Hz');
ylabel('Magnitude, dB');
title(USER_TITLE);

subplot(2,1,2);
for idx = 1 : numFiles
    semilogx(dataset{idx}(:,index.frequency_Hz), ...
             rad2deg(unwrap(deg2rad(dataset{idx}(:,index.angle_deg)))));
    hold on;
end
for idx = 1 : numPlotDatasets
    semilogx(plotData{idx}(:,index.frequency_Hz), ...
        plotData{idx}(:,index.angle_deg));
    hold on;
end
legend(USER_LEGEND);
hold off;
xlim(X_LIM);
grid on;
xlabel('Frequency, Hz');
ylabel('Phase, deg');