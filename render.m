function escapeCounts = render(complexGrid, maxIterations)
% RENDERMANDELBROT Computes the escape-count matrix using early-exit tests.
% Uses MATLAB's parfor to distribute rows across CPU workers.
%
% Inputs:
%   C_grid         - Matrix of complex coordinates.
%   maxIterations  - Maximum number of iterations (passed dynamically).
%
% Output:
%   escapeCounts   - Matrix containing the escape iteration
%                    count for every point in C_grid.
    
    % Generating necessary constants: 
    [rows, cols] = size(complexGrid);
    escapeCounts = zeros(rows, cols);

    % Nested loop to calculate the Mandelbrot set
    parfor row = 1:rows
        for col = 1:cols
            % Get complex coordinate
            current_C = complexGrid(row,col);
            
            % Check if the point belongs to a known interior region
            if isInteriorPoint(current_C)
                % Inside interior (reaches maximum iteration limit)
                escapeCounts(row,col) = 0; 
            else
                % External Function Call for the remaining points
                escapeCounts(row,col) = escapeIterations(current_C, maxIterations);
            end
        end
    end
end
