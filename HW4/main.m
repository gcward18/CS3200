% Name: George C. Ward
% Instructor: Charman Sabharwal
diary output
diary on
tic

clear
clc

A=[4,2,4;2,10,8;4,8,12];



fprintf('\t\t\tCholesky Method For Symmetric Matrices\r\n')
fprintf('\t\t\t            Presented\r\n')
fprintf('\t\t\t                by\r\n')
fprintf('\t\t\t          George C. Ward\r\n')

fprintf('_______________________________________________________________________\r\n')
fprintf(datestr(now))
fprintf('\r\n')


% printing iteration 1 over the rows of A
a=A;

% finding the lower matrix
for k = 1: 3
  for i =1: k -1
    sum = 0;
    for j= 1: i -1
      sum = sum + (a(i,j) * a(k,j));
    end
    a(k,i) = (a(k,i) - sum)/a(i,i);
  end
  
  sum = 0;
  for j =1: k-1
    sum = sum + a(k,j).^2;
  end
    a(k,k) = sqrt(a(k,k)-sum);
end


% clear out the the remaining elements
for i = 1: 3
  for j = i+1:3
    a(i,j) = 0;
  end
end

U = a;
L = a;

% creating the upper matrix which is the transpose of the lower matrix
for i = 1: 3
  for j = 1: i
    temp = U(i,j);
    U(i,j) = U(j,i);
    U(j,i) = temp;
  end
end
U;
A = a;

fprintf('______________________________________________________________________\r\n')
fprintf('                        Input and Final Output\r\n\n')
fprintf('______________________________________________________________________\r\n')
fprintf('\r\t     A                L                   U                 \r\n\n')
for i = 1: 3
  fprintf('\r\t%d    %d    %d  \t|  %d  %d  %d \t|     %d   %d   %d\r\n\n',A(i,1),A(i,2),A(i,3),L(i,1),L(i,2),L(i,3),U(i,1),U(i,2),U(i,3))
end


fprintf(datestr(now))
fprintf('\r\n')
%}

toc
diary off