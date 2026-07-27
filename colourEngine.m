function RGBImage = colourEngine(escapeCounts, bandWidth, palette)
% COLOURENGINE Converts escape values into an RGB image.
%
% Interior points are rendered black.
%
% Exterior points are mapped into repeating colour bands using smooth
% interpolation between neighbouring palette entries.
%
% Inputs
% ------
% escapeCounts
% bandWidth
% palette
%
% Output
% ------
% RGBImage
    % Getting grid size
    [numRows, numCols] = size(escapeCounts);
    
    % RGB matrix initialization 
    RGBImage = zeros(numRows, numCols, 3);
    numBands = 10; % Total unique coloring bands (Red to Magenta)
    
    % Logical masks for vectorized branching
    insideMask = (escapeCounts == 0);
    outsideMask = ~insideMask;

    % --- 1. INITIALIZE RGB CHANNELS ---
    % Default channels matching your dimensions
    R = zeros(numRows, numCols);
    G = zeros(numRows, numCols);
    B = zeros(numRows, numCols);

    % --- 2. HANDLE INSIDE POINTS (BLACK) ---
    % Directly assign the first palette row across the mask
    R(insideMask) = palette(1, 1);
    G(insideMask) = palette(1, 2);
    B(insideMask) = palette(1, 3);

    % --- 3. HANDLE OUTSIDE POINTS (CYCLING BANDS) ---
    % Only perform operations on points that escaped
    if any(outsideMask(:))
        % Calculate continuous float positions and blend weights (t)
        continuousBand = escapeCounts / bandWidth;
        baseBand = mod(floor(continuousBand), numBands);
        nextBand = mod(baseBand + 1, numBands);
        t = continuousBand - floor(continuousBand);
        
        % Convert 0-indexed bands to 1-indexed palette row positions
        row1 = baseBand + 2;
        row2 = nextBand + 2;
        
        % Vectorized Palette Extraction via Linear Indexing:
        % (row1/row2 change per pixel, but the palette column remains constant)
        r1 = palette(row1, 1);
        g1 = palette(row1, 2);
        b1 = palette(row1, 3);
        
        r2 = palette(row2, 1);
        g2 = palette(row2, 2);
        b2 = palette(row2, 3);
        
        % Apply your blending formula over the outside regions element-wise (.*)
        R(outsideMask) = (1 - t(outsideMask)) .* r1(outsideMask) + t(outsideMask) .* r2(outsideMask);
        G(outsideMask) = (1 - t(outsideMask)) .* g1(outsideMask) + t(outsideMask) .* g2(outsideMask);
        B(outsideMask) = (1 - t(outsideMask)) .* b1(outsideMask) + t(outsideMask) .* b2(outsideMask);
    end
    
    % --- 4. ASSIGN TO FLOW-THROUGH RGB LAYERS ---
    RGBImage(:, :, 1) = R;
    RGBImage(:, :, 2) = G;
    RGBImage(:, :, 3) = B;
end
