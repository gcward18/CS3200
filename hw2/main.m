% Exponentials demo- complete with two methods
% George C. Ward
delete outFile
diary outFile
guess1 = 3;
iter = 20;
err = 0.00001;
tic
fprintf('******************************************\n')
fprintf('            Solving Equations\n')
fprintf('                   by\n')
fprintf('             George C. Ward\n\n')
fprintf('          ')
disp(datestr(clock))
fprintf('__________________________________________\n')
fprintf("\nNewtonRaphson Method for (x-2)^4\n")
fprintf("Initial Guess = 3;     ErrorTolerance 0.00001 \n")
fprintf("IterationsUpperBound 20");

fprintf('\n\t_______________________________________________________________________________________________\n')
fprintf('\n\tIteration\tAppRoot\t\tf(x)\t\tdf(x)\t\tAppErr')
fprintf('\n\t------------------------------------------------------------------------------------------------\n')

% starting plot of the graph
figure
hold on

% print the columns required for the assignment
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
