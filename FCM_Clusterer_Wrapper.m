function FCM_Clusterer_Wrapper()
% Generate demo data
seed = 1724;
rng(seed);
X1 = randn(5,2)*0.3 + [1,-1];
X2 = randn(4,2)*0.4 + [-1,2];
X3 = randn( 3,2)*0.5 + [2, 1];
X4 = randn( 2,2)*0.5 + [3, 4];
X5 = randn( 1,2)*0.5 + [9, 3];
X  = [X1; X2; X3; X4; X5];

%% Create clusterer with automatic c‐selection
oFCM = cFCM( ...
    'autoSelect',       true, ...
    'clusterRange',     1:6, ...
    'minClusterSize',   3, ...
    'validityIndex',    'XB', ...
    'outlierMethod',    'iqr', ...
    'outlierIQRFactor', 1.2);

% profile on

%% Fit
oFCM.Fit(X);

%% Plot
oFCM.Plot_results(X);

% profile viewer

end
