function FCM_Clusterer_Wrapper()
% Generate demo data
seed = 1724;
rng(seed);
X1 = randn(100,2)*0.3 + [1,-1];
X2 = randn(120,2)*0.4 + [-1,2];
X3 = randn( 80,2)*0.5 + [2, 1];
X4 = randn( 20,2)*0.5 + [3, 4];
X  = [X1; X2; X3; X4];

%% Create clusterer with automatic c‐selection
oFCM = cFCM( ...
    'autoSelect',       true, ...
    'clusterRange',     1:6, ...
    'validityIndex',    'XB', ...
    'outlierMethod',    'iqr', ...
    'outlierIQRFactor', 1.5);

% profile on

%% Fit
oFCM.Fit(X);

%% Prune
oFCM.Prune_outliers(X);

%% Plot
oFCM.Plot_results(X);

% profile viewer

end
