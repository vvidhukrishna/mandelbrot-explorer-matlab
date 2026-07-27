function [complexGrid, xAxis, yAxis] = generateGrid(XMIN, XMAX, YMIN, YMAX, ROWS, COLS)
% GENERATEGRID Creates the complex coordinate grid for Mandelbrot rendering.
%
% Inputs:
%   xmin, xmax - Horizontal limits of the viewing window.
%   ymin, ymax - Vertical limits of the viewing window.
%   rows, cols - Resolution of the output image.
%
% Outputs:
%   complexGrid - Matrix containing the complex coordinate of every pixel.
%   xAxis - Horizontal axis coordinates.
%   yAxis - Vertical axis coordinates.

    % grid creation
    xAxis = linspace(XMIN, XMAX, COLS);
    yAxis = linspace(YMIN, YMAX, ROWS);
    [X, Y] = meshgrid(xAxis, yAxis);
    
    % Result initialization
    complexGrid = X + 1i * Y;
end
