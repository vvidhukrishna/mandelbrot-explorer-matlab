function escapeValue = escapeIterations(C, maxIterations)
% ESCAPEITERATIONS Computes the Mandelbrot escape iteration count.
%
% Inputs:
%   C              - Complex coordinate being tested.
%   maxIterations  - Maximum number of iterations.
%
% Output:
%   count - Iteration at which the point escaped.
%           Returns 0 if the point does not escape within
%           maxIterations.
    % constants
    Z = 0;
    escapeValue = 0; 
    
    for iter = 1:maxIterations
        Z = (Z^2) + C;
        
        if abs(Z) > 2
            escapeValue = iter + 1 - (log(log(abs(Z)))/  log(2)); 
            break
        end
    end
end