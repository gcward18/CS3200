% guess 1 will equal 3 for our inital guess as per instructor
guess1 = 3;
appRoot = [];

x       = 3;  
af     = @(x) (x - 2) ^4;
adf    = @(x) 4*(x-2)^3;
agx    = @(x,fx,df) x - (fx/df);

for i=1:20
      
  appRoot(i) = guess1;
  fx(i)   = af(appRoot(i));     %  fx = (x-2)^4
  dfx(i)  = adf(appRoot(i));    %  dfx = 4(x-2)^3
  g(i)    = agx(appRoot(i),fx(i),dfx(i));
  % conditional if i = 1 then there's no need to print the relative error
  if i == 1
    fprintf('\n\t  %d\t\t %5.5f \t %5.5f \t %5.5f',i, appRoot(i), af(appRoot(i)), adf(appRoot(i)))
  else
  % else we are printing the error
    err = abs(appRoot(i-1) - guess1)/abs(appRoot(i));  
    % check to see if it's less than the tolerance
    if err < 0.0001
        break
    end
   
    fprintf('\n\t  %d\t\t %5.5f \t %5.5f \t %5.5f \t%5.5f',i, appRoot(i), af(appRoot(i)), adf(appRoot(i)), err)
  end
  % g is our root formula, guess1 will now be used to calculate our approx error
  guess1 = g(i);
end

fprintf('\n\n\tFinal root is (NewtonRaphson Method) = %5.5f', g(5))
