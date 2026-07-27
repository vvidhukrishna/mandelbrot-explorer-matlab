# Mandelbrot Set Explorer (MATLAB)

## Overview

An interactive Mandelbrot Set Explorer written in MATLAB that renders the Mandelbrot fractal using the escape-time algorithm and allows unlimited interactive zooming. The project was developed as a learning exercise in numerical methods, MATLAB programming, optimization, and parallel computing.

## Features

- Interactive rectangle-based zoom (`drawrectangle`)
- Unlimited recursive zooming
- Adaptive iteration limit based on zoom depth
- Smooth escape-time colouring
- Cyclic colour palette with colour interpolation
- Parallel rendering using `parfor`
- Interior point rejection (Main Cardioid + Period-2 Bulb)
- Zoom history (Back)
- Reset to home view
- Modular code architecture

## Project Structure

```
main.m
config.m

generateGrid.m
render.m
escapeIterations.m
isInteriorPoint.m

colourEngine.m
displayImage.m

adaptiveIterations.m
processMenu.m
getZoomWindow.m
```

## Rendering Pipeline

```
Generate Grid
      │
      ▼
Interior Tests
      │
      ▼
Escape-Time Iteration
      │
      ▼
Smooth Escape Values
      │
      ▼
Colour Engine
      │
      ▼
RGB Image
      │
      ▼
Interactive Display
```

## Optimizations

- Parallel execution using MATLAB `parfor`
- Automatic parallel pool reuse
- Cardioid and Period-2 bulb rejection tests
- Adaptive iteration limits
- Vectorized colour engine
- Smooth colouring algorithm

## Requirements

- MATLAB R2023b or newer (recommended)
- Parallel Computing Toolbox
- Image Processing Toolbox (`drawrectangle`)

## Running the Project

1. Open the project folder in MATLAB.
2. Ensure all files are on the MATLAB path.
3. Run:

```matlab
main
```

4. Select a rectangle to zoom.
5. Use the menu to:
   - Zoom Again
   - Back
   - Reset
   - Exit

## Algorithms Used

- Escape-Time Algorithm
- Smooth Escape-Time Colouring
- Adaptive Iteration Scaling
- Main Cardioid Interior Test
- Period-2 Bulb Test
- Parallel Rendering (`parfor`)

## Future Improvements

- Arbitrary-precision arithmetic for extreme zooms
- Perturbation rendering
- Distance-estimation colouring
- Julia set mode
- Animation recording
- GPU acceleration
- Export high-resolution renders

## Author

**V. Vidhu Krishna**

B.Tech Mechanical and Aerospace Engineering

Chanakya University

