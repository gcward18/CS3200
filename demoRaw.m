format short
n=20;
orderOfApp=n
x= - 0.5;
x=0.5;
xValue=x
actual = exp(x)
sNew=1;

% calculate values
m=1;
for k=1:n
  sOld= sNew;
  m=m*k ;
  sNew = sOld +(-1)^k* x^k/m;
end;
sOld=1/sOld;
sNew=1/sNew;
% display values
approx = sNew
trueErr = abs(actual- sNew)
appErr = abs(sOld- sNew)
trueErrRel = abs(actual- sNew)/actual*100
appErrRel = abs(sOld- sNew)/sOld*100
% experiment format long, format short '%4.2f'

