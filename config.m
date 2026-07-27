function cfg = config()
% CONFIG Returns a structure containing all constants for the Mandelbrot Explorer.

    % Max iterations for escape time
    cfg.maxIterations = 200;

    % Initial graph boundaries (Home window)
    cfg.xmin = -2;
    cfg.xmax = 0.5;
    cfg.ymin = -1.25;
    cfg.ymax = 1.25;
    cfg.homeWindow = [cfg.xmin, cfg.xmax, cfg.ymin, cfg.ymax];

    % Resolution
    cfg.rows = 2160;
    cfg.cols = 3840;

    % Default zoom factor (for future custom zoom implementations)
    cfg.defaultZoomFactor = 2.0;

    % Colour palette and corresponding band-width
    cfg.bandWidth = 10;
    cfg.colourPalette = [
        0,   0,   0;     % 0 - Black
        255, 0,   0;     % 1 - Red
        255, 127, 0;     % 2 - Orange
        255, 255, 0;     % 3 - Yellow
        127, 255, 0;     % 4 - Lime-Green
        0,   255, 0;     % 5 - Green
        0,   255, 255;   % 6 - Cyan
        0,   0,   255;   % 7 - Blue
        75,  0,   130;   % 8 - Indigo
        143, 0,   255;   % 9 - Violet
        255, 0,   255    % 10 - Magenta 
    ];

    cfg.colourPalette = cfg.colourPalette/255;
end
