% Exponentials demo- complete with two methods
% George C. Ward
delete outFile
diary outFile


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

i=1;

% starting plot of the graph
figure
hold on

# print the columns required for the assignment
printCols
printGraph

fprintf('\n')
% approximate value for upto nth order derive terms polynomial
hold off
%}

fprintf('\n')
toc
disp(datestr(clock))
diary off
