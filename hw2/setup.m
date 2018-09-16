function [] = setup(xm,xM,ym,yM,sx,sy,st,sl)
%setup figure parameters
%
% input:
%   xm,xM = x-dimensions
%   ym,yM = y-dimensions
%   sx,sy,st,sl = sxlabel, ylabel, title, legend
%
% output:
%   nil
dProps = {'color','linewidth'};% drawing properties
dVals  = {    'b',          2};
% set the title of the figure- identify your self
set(gcf,'name','Newton Raphson Method by George C. Ward','numbertitle','off');
% set the deminsions of graphics window
axis([xm xM ym yM]);
% draw x-axis
hl=line ([xm xM],[0 0]); % x-axis
set(hl,dProps,dVals)
% draw y-axis
hl=line ([0 0],[ym yM]); % y-axis
set(hl,dProps,dVals)
%Text Properties
tprops = {'FontName','Fontsize','Fontweight','HorizontalAlignment','Color'};
tvals  = {   'Times',        20,      'bold',              'center',   'b'};
% place the documentation lable along x-axis
hx=xlabel(sx);
set(hx,tprops,tvals);
% place the documentation lable along y-axis
hy=ylabel(sy);
set(hy,tprops,tvals);
% place the title on top of the window
ht=title(st);
set(ht,tprops,tvals);
% if you want to be more userfriendly, you can use text(..., 'X') to write
% X at the right end of x-axis and y=use text(..., 'Y') along top of y-
axis
ht=text(xM,0,'X');
set(ht,tprops,tvals);
ht=text(0,yM,'Y');
set(ht,tprops,tvals);
%%{
lprops = {'FontName','Fontsize','Fontweight'};
lvals  = {   'Times',        20,      'bold'};
set(sl,lprops,lvals);
%}