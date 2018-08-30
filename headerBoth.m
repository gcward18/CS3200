% Exponentials demo- complete with two methods
% George C. Ward
delete outFile
diary outFile

disp(datestr(clock))

tic
format short E
xm=0;xM=40;ym=0;yM=60;

n=10;
%x=-2;
%x=2;
fprintf('******************************************\n')
fprintf('Taylor Series Method for Exponentials Demo\n')
fprintf('                   by\n')
fprintf('             George C. Ward\n\n')
fprintf('__________________________________________\n')
x= 0.5;fprintf('\nThe x value = %5.2f\n',x);
trueValue= exp(x);
fprintf('For x=%f\t  Actual e^(%4f)\t=  %f\n\n',x,x,trueValue)
fprintf('\nExponential: Method1-->Direct method (1+x+x^2/2+...)   Method2-->InDirect method 1/(1-x+x^2/2-...):\n')

fprintf('\n\t_______________________________________________________________________________________________\n')
fprintf('\n\t\tApproximate Values\t\tTrue Relative Error\t\tApproximate Relative Error\n')
fprintf('\n\tOrder\tMethod1\t\tMethod2\t\tMethod1\t\tMethod2\t\tMethod1\t\tMethod2\n')
fprintf('\n\t------------------------------------------------------------------------------------------------\n')
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
    [approx2,trueRelErr2,appRelErr2] = fexp2(exp(0.5),0.5,i-1);
  end
  fprintf('\n\t  %d\t  %5.3f\t\t%5.3f\t\t%5.3f\t\t%5.3f\t\t%5.3f\t\t%5.3f',i, approx1, approx2,  trueRelErr1, trueRelErr2, appRelErr1,appRelErr2)
end;
fprintf('\n')
% approximate value for upto nth order derive terms polynomial

........

diary off
