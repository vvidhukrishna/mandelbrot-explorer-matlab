clear; clc;

% MAIN
%
% Driver script for the Mandelbrot Set Explorer with Adaptive Iterations.

% Optimise parallel pool creation
pool = gcp('nocreate');
if isempty(pool)
    parpool;
end

% Load all immutable constants from config
cfg = config();

% Initialize runtime coordinates from config home window
xmin = cfg.xmin;
xmax = cfg.xmax;
ymin = cfg.ymin;
ymax = cfg.ymax;

% Track zoom state history
WindowHistory = [];
historyIndex = 1;

fig = figure;

while true

    if not(isvalid(fig))
        break; 
    end
    
    % Saving the current coordinate state to history
    WindowHistory(historyIndex, :) = [xmin, xmax, ymin, ymax];

    % Dynamically calculate adaptive maximum iterations for this zoom level
    currentMaxIterations = adaptiveIterations(cfg, xmin, xmax);

    % Generate coordinate grid
    [complexGrid, xAxis, yAxis] = generateGrid(xmin, xmax, ymin, ymax, cfg.rows, cfg.cols);

    % Compute Mandelbrot set matrix using the adaptive iteration value
    escapeCounts = render(complexGrid, currentMaxIterations);
    
    % Process coordinates into display pixels
    RGBImage = colourEngine(escapeCounts, cfg.bandWidth, cfg.colourPalette);

    % Display final updated plot
    displayImage(xAxis, yAxis, RGBImage);

    % Process menu interactions via external controller
    [xmin, xmax, ymin, ymax, historyIndex, shouldContinue, shouldBreak] = ...
        processMenu(xmin, xmax, ymin, ymax, historyIndex, WindowHistory, cfg, fig);
        
    % Handle loop navigation flags returned from menu controller
    if shouldContinue
        continue;
    end
    if shouldBreak
        break;
    end
end
