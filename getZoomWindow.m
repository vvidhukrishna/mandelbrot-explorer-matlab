function [xmin, xmax, ymin, ymax] = getZoomWindow()  % x_axis, y_axis

    roi = drawrectangle();

    % get values
    pos = roi.Position;
    
    % extract values
    x_start = pos(1);
    y_start = pos(2);
    width   = pos(3);
    height  = pos(4);

    if width==0 || height==0
        xmin=[];
        xmax=[];
        ymin=[];
        ymax=[];
        return
    end
    
    % convert values 
    xmin = x_start;
    xmax = x_start + width;
    ymin = y_start;
    ymax = y_start + height;

    delete(roi)
end