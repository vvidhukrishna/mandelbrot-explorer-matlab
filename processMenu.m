function [xmin, xmax, ymin, ymax, idx, shouldContinue, shouldBreak] = ...
    processMenu(xmin, xmax, ymin, ymax, idx, History, cfg, fig)
% PROCESSMENU Handles the user menu selection and updates state variables.

    % Initialize execution control flags
    shouldContinue = false;
    shouldBreak = false;

    % Open UI menu interface
    menuChoice = menu('Mandelbrot Controls', 'Zoom Again', 'Back', 'Reset', 'Exit');
    
    switch menuChoice
        case 1
            % Get new window size
            [xmin, xmax, ymin, ymax] = getZoomWindow();
            idx = idx + 1;
            
        case 2
            % Go back to previous zoom level
            if idx > 1
                idx = idx - 1; 
                
                % Extract past boundary states
                xmin = History(idx, 1);
                xmax = History(idx, 2);
                ymin = History(idx, 3);
                ymax = History(idx, 4);
                
                shouldContinue = true;
            else  
                msgbox('You are already at the original view!', 'Cannot Go Back');
                shouldContinue = true;
            end
            
        case 3
            % Code for Reset using config home window
            xmin = cfg.homeWindow(1);
            xmax = cfg.homeWindow(2);
            ymin = cfg.homeWindow(3);
            ymax = cfg.homeWindow(4);
            
        case 4
            % Code for Exit
            disp('Exiting program safely...');
            close(fig);
            shouldBreak = true; 
            
        otherwise
            disp('Menu closed. Exiting program...');
            close(fig);
            shouldBreak = true;
    end
end
