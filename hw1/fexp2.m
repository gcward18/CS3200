function [approx,trueRelErr,appRelErr] = method2(actual,x,n)
% name of file is fexp2, name of function is method1. Invocation is by file name
% Indirect Method2
%'Method2 1/(1-x+...)'
% approximate value, true relative error, approximate relative error
% approximate relative error is undefined for zero order iteration.

sOld=1; % previous value, not used for n=0, kept it to avoid run time error.

sNew=1; % current values

m=1; % factorials
px=1; % powers of x
sgn=1; % for changing alternate signs
% loop used only when order k>o
for k=1:n
  sOld= sNew;
  sgn=sgn*(-1);
  px=px*x;
  m=m*k ;
  sNew = sOld +sgn * px/m;
end;

sNew = 1/sNew;
sOld = 1/sOld;
approx = sNew;

trueRelErr = abs(actual- approx)/actual*100;
appRelErr  = abs(sNew-sOld)/abs(sNew)*100 ;

