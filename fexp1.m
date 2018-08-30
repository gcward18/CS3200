function [approx,trueRelErr,appRelErr] = method1(actual,x,n)
% name of file is fexp1, name of function is method1. Invocation is by file name
% Direct method
%'Method1 1+x+...'
% approximate value, true relative error, approximate relative error
% approximate relative error is undefined for zero order iteration.

sNew=1; % exp(0) current value
sOld=0; % previouse value;  not used for n=0, kept it to avoid run time error.
px=1;% powers of x
m=1; %factorials
% compute approximate value
for k=1:n
	sOld= sNew;
	px=px*x;
	m=m*k ;
	sNew = sOld + px/m;
end;
approx = sNew;

trueRelErr = abs(actual- approx)/actual*100;
appRelErr = abs(sNew-sOld)/abs(sNew)*100 ;

