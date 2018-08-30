% HW1 Assignment
% Author: George C. Ward
% Created:August 28 2019
%
% Create a window to plot the direct method results of exp(0.5)

n = 1:20;

s1 = 1; % series starts at 1
for i=1:numel(n) % from 1 to size of the array 
  if i == 1
    approx1 = 1;
    approx2 = 1;
    trueRelErr1 = ((exp(0.5) - 1)/exp(0.5)) * 100;
    trueRelErr2 = ((exp(0.5) - 1)/exp(0.5)) * 100;
    appRelErr1 = 0;
    appRelErr2 = 0;
  else  
    [approx1,trueRelErr1,appRelErr1] = fexp1(exp(0.5),0.5,i-1);
  end
end;
