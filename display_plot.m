function display_plot(X, Y, escapeCounts)
%DISPLAYPLOT Displays the rendered Mandelbrot escape-count image.
%
% Inputs:
%   X             - Vector of x-axis (real) coordinates.
%   Y             - Vector of y-axis (imaginary) coordinates.
%   escapeCounts  - Matrix containing the escape iteration count for each
%                   point in the complex plane.
%
% Description:
%   Displays the escape-count matrix using MATLAB's imagesc function with
%   the specified coordinate axes and applies a colour map for
%   visualization.

    % Render
    clf;
    imagesc(X, Y, escapeCounts);
    axis xy; 
    axis equal; 
    drawnow;
end
  