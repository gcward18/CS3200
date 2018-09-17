% guess 1 will equal 3 for our inital guess as per instructor
guess1 = 3;
for i=1:6
  
  % conditional if i = 1 then there's no need to print the relative error
  if i == 1
    fprintf('\n\t  %d\t\t %f \t %f \t %f',i-1, appRoot(i), fx(i), dfx(i))
  else
  % else we are printing the error
    err = abs(appRoot(i-1) - guess1)/abs(appRoot(i));  
    fprintf('\n\t  %d\t\t %f \t %f \t %f \t%f',i-1, appRoot(i), fx(i), dfx(i), err)
  end
  
      
  appRoot(i) = guess1;
  % functions for finding the root (x-2)^4
  fx(i)   = af(appRoot(i));     %  fx = (x-2)^4
  dfx(i)  = adf(appRoot(i));    %  dfx = 4(x-2)^3
  g(i)    = agx(appRoot(i),fx(i),dfx(i));  % gx = x - (x-2)^4 / 4(x-2)^3 
  % g is our root formula, guess1 will now be used to calculate our approx error
  guess1 = g(i);
end;
fprintf('\n\n\tFinal root is (NewtonRaphson Method) = %d', g(5))
