function maxIterations = adaptiveIterations(cfg, xmin, xmax)
% ADAPTIVEITERATIONS Computes an adaptive iteration depth based on zoom level.
%
% Inputs:
%   cfg           - Structure containing global configurations.
%   xmin, xmax    - Current horizontal complex boundaries.
%
% Output:
%   maxIterations - Clamped, integer iteration cap for the current frame.

    % Calculate the initial width of the viewport from home settings
    homeWidth = cfg.homeWindow(2) - cfg.homeWindow(1);

    % Calculate current viewport width
    currentWidth = xmax - xmin;

    % Compute zoom factor relative to the starting window
    zoom = homeWidth / currentWidth;

    % Prevent log10(0) or imaginary roots if zoom is somehow less than 1
    if zoom < 1
        zoom = 1;
    end

    % Apply mathematical scaling formula scaled by baseline iterations
%    adaptiveScale = sqrt(log10(zoom));
    maxIterations = cfg.maxIterations * zoom;

    % Apply structural bounds constraints
    maxIterations = max(100, maxIterations);
    maxIterations = min(10000, maxIterations);

    % Round to the nearest whole integer so it works perfectly in loop ranges
    maxIterations = round(maxIterations);
end
