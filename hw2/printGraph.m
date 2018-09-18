
sx = "Approximate root-values";
sy = "The approximate function-values";
st = "Newton Raphson for (x-2)^4\nInital guess = 3, tolerance 0.000001";

x       = 3;  
af     = @(x) (x - 2) ^4;
adf    = @(x) 4*(x-2)^3;
agx    = @(x,fx,df) x - (fx/df);


guess1= 3;
guess2= 3;
errTol= 0.00001;
iterUp= 20;
appRoot = [];

% setting labels of the graph
xlabel(sx)
ylabel(sy)

% set the title of the graph
title(st)

% set the iteration for x
x = 1:0.1:5;

% create our slope for the graph
for i = 1: numel(x)
  % add elements to y
  y(i) = (x(i)-2)^4;
end

% plot the graph
p = plot(x,y);

% set graph limits
xlim([1 3])
ylim([0 1])

fx = [];
dfx = [];
g = [];
% reset guess because we are going to use it again
guess1 = 3;
%20 iterations for finding approximate zero
for i=1:20     
  appRoot(i) = guess1;
  % functions for finding the root (x-2)^4
  fx(i)   = af(appRoot(i));     %  fx = (x-2)^4
  dfx(i)  = adf(appRoot(i));    %  dfx = 4(x-2)^3
  g(i)    = agx(appRoot(i),fx(i),dfx(i));  % gx = x - (x-2)^4 / 4(x-2)^3 

  text1 = num2str(i);
  text(appRoot(i),fx(i), text1, 'Color', 'Blue')
  text(appRoot(i), 0   , text1, 'Color', 'red')
  guess1 = g(i);
end

plot(0,0,'','Color','Blue')
plot(0,0,'','Color','Red')
legend('(x-2)^4','data1','data2')
set(gcf,'name','Newton Raphson Method by George C. Ward','numbertitle','off');
