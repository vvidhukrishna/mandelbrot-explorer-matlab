function isInterior = isInteriorPoint(c)
% ISINTERIORPOINT Checks if a complex number lies in known stable Mandelbrot regions.
%
% Input:
%   c          - A single complex number (x + iy).
%
% Output:
%   isInterior - Boolean (true if inside a tested region, false otherwise).

    % Extract x (real) and y (imaginary)
    x = real(c);
    y = imag(c);
    
    % Default to false
    isInterior = false;

    % Main Cardioid Test
    q = (x - 0.25)^2 + y^2;
    if (q * (q + (x - 0.25))) <= (0.25 * y^2)
        isInterior = true;
        return;
    end

    % Period-2 Bulb Test
    if ((x + 1.0)^2 + y^2) <= 0.0625
        isInterior = true;
        return;
    end
end
