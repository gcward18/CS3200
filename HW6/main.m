diary on
tic
fprintf('\t\tNEWTONS DIVIDED DIFFERNCE INTERPOLATING POLYNOMIALS\r\n')
fprintf('\t\t\t            Presented\r\n')
fprintf('\t\t\t                by\r\n')
fprintf('\t\t\t          George C. Ward\r\n')

fprintf('_______________________________________________________________________\r\n')
fprintf(datestr(now))
fprintf('\r\n')

A=[1.6,2,2.5,3.2,4,4.5;2,8,14,15,8,2];
x = A(1,:);
y = A(2,:);
fdd = [];
b=[];
n = size(A,2);

yint = [];
ea   = [];
fprintf('NUMBER OF POINTS? %d\r\n',n)
for i = 1:n
  fprintf('X(%d), Y(%d) = ? %d,%1.5f\r\n',i,i,x(i),y(i))
end
fprintf('\r\nINTERPOLATION AT X = 4.5\r\n\n')
[xterm, yint, ea, fx] = NewInt(x,y,n, 4.5, yint,ea);
for i = 1:5
  error = 1;
  fprintf('Polynomial of Degree %d:\r\n', i)
  fprintf('%d',yint(1))
  for j =1:i
    fprintf('+(%d)', fx(1,j))
    for k = 1:j
      fprintf('(x - %d)',x(k))
    end
  end
  fprintf('\r\nError |true-approx| = %d\r\n\n',ea(i))
end

toc
diary off