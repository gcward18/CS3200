% Exponentials demo- complete with two methods
% George C. Ward
delete outFile
diary outFile

xm=-2;
xM=2;
ym=-1;
yM=4;
inc=0.01;
m=1;
sx = "Approximate root-values";
sy = "The approximate function-values";
st = "Newton Raphson for (x-2)^4\nInital guess = 3, tolerance 0.000001";

x     = 3;  
af     = @(x) (x - 2) ^4;
adf    = @(x) 4*(x-2)^3;
agx    = @(x,fx,df) x - (fx/df);

guess1= 3;
guess2= 3;
errTol= 0.00001;
iterUp= 20;

fprintf('******************************************\n')
fprintf('            Solving Equations\n')
fprintf('                   by\n')
fprintf('             George C. Ward\n\n')
fprintf('          %s',disp(datestr(clock)))
fprintf('__________________________________________\n')
fprintf('\nNewtonRaphson Method for (x-2)^4\n')
fprintf('Initial Guess = %5.6f; \t\t ErrorTolerance %5.6f\nIterationsUpperBound %d',guess1,errTol,iterUp);

fprintf('\n\t_______________________________________________________________________________________________\n')
fprintf('\n\tIteration\tAppRoot\t\tf(x)\t\tdf(x)\t\tAppErr')
fprintf('\n\t------------------------------------------------------------------------------------------------\n')
  
  i = 1;
%s1 = 1; % series starts at 1
for j=1:0.1:20
  
  appRoot(i) = x;
  fx(i)      = af(appRoot(i));
  dfx(i)     = adf(appRoot(i));
  g(i)    = agx(appRoot(i),fx(i),dfx(i));
  if i == 0
    fprintf('\n\t  %d\t\t %f \t %f \t %f',i-1, appRoot(i), fx(i), dfx(i))
  else
    %[a,t,r] = fexp1(appRoot(i),g(i),i);
    fprintf('\n\t  %d\t\t %f \t %f \t %f \t%f',i-1, appRoot(i), fx(i), dfx(i))
  end
  x = g(i);
  i+=1;
end;
fprintf('\n')
% approximate value for upto nth order derive terms polynomial

figure
plot(g)
xlabel(sx)
ylabel(sy)
title(st)
set(gcf,'name','Newton Raphson Method by George C. Ward','numbertitle','off');

fprintf('\n')
toc
disp(datestr(clock))
diary off
