clear all; close; clc;
x1=-1
y1=1
x2=3
y2=3
y = f55(y1, x1, y2, x2); y(2)
y = f56(y1, x1, y2, x2); y(2)
y = f57(y1, x1, y2, x2); y(2)
function [y] = f55(y1, x1, y2, x2)
   y = @(x)( (y2-y1)/(x2-x1)*x + (x2*y1 - x1*y2)/(x2 - x1))
end
function [y] = f56(y1, x1, y2, x2)
   y = @(x)( y1 + (y2 - y1)/(x2 - x1)*(x - x1) )
end
function [y] = f57(y1, x1, y2, x2)
   y = @(x)( (x - x2)/(x1 - x2)*y1 + (x - x1)/(x2 - x1)*y2 )
end


