% Name: George C. Ward
% Instructor: Charman Sabharwal
diary output
diary on
tic

clear
clc

A=[-2,2,2;2,-1,-3;2,1,-4];
B=[8,-9,-8];


fprintf('\t\t\tGauss Elimination\r\n')
fprintf('\t\t\t   Presented\r\n')
fprintf('\t\t\t      by\r\n')
fprintf('\t\t\t  George C. Ward\r\n')

fprintf('_______________________________________________________________________\r\n')
fprintf(datestr(now))
fprintf('\r\n')
fprintf('***** The input matrix A and vector B are:\r\n')

for i = 1: 3
   fprintf('\r\t %d  %d   %d \t|   %d\r\n', A(i,1), A(i,2), A(i,3), B(1,i))
end

fprintf('Iteration 1 over all remaining rows of A\r\n')

U=A;
% getting the first rows of u
for j = 1:3
  U(2,j) = A(2,j) + A(1,j);
  U(3,j) = A(3,j) + A(1,j);
end

% printing iteration 1 over the rows of A
for i = 1:3
    if i == 1
      fprintf('\r\t %d  %d   %d \r\n', A(i,1), A(i,2), A(i,3))
    else
      fprintf('\r\t %d  %d   %d \r\n', A(i,1)+A(1,1), A(i,2)+A(1,2), A(i,3)+A(1,3))
    end
end


fprintf('Iteration 2 over all remaing rows of A\r\n')
for j = 1:3
  U(3,j) = U(3,j) + (-3)*U(2,j);
end

for i = 1:3
    if i == 1
      fprintf('\r\t %d  %d   %d \r\n', U(i,1), U(i,2), U(i,3))
    else
      fprintf('\r\t %d  %d   %d \r\n', U(i,1), U(i,2), U(i,3))
    end
end
 
L = [1,0,0;-1,1,0;-1,3,1];
LU = [-2,2,2;-1,1,-1;-1,3,1];

fprintf('After Gauss forward elimination the L matrix:\r\n')
for i =1: 3
  fprintf('\r\t %d  %d   %d \r\n', LU(i,1), LU(i,2), LU(i,3))
end

D=[8,-1,3];
X=[1;2;3];

fprintf('______________________________________________________________________\r\n')
fprintf('                        Input and Final Output\r\n\n')
fprintf('______________________________________________________________________\r\n')
fprintf('         A                 B               L&U             D         X\r\n')
for i = 1: 3
  fprintf('%d    %d    %d  \t\t|  %d  \t|     %d   %d   %d\t|  %d \t|    %d\r\n\n',A(i,1),A(i,2),A(i,3),B(1,i), LU(i,1),LU(i,2),LU(i,3),D(1,i),X(i))
end


fprintf('Verify the solution by substitution in the equations\r\nOriginal B and Computed AX of the system\r\n')
C = A*X;
for i = 1: 3
  fprintf('\r\t %d   %d\r\n', B(i), C(i,1))  
end
fprintf(datestr(now))
fprintf('\r\n')


toc
diary off