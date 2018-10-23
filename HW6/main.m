diary on
fprintf('\t\t\tLeast Squares Method for Best Fit Line\r\n')
fprintf('\t\t\t            Presented\r\n')
fprintf('\t\t\t                by\r\n')
fprintf('\t\t\t          George C. Ward\r\n')

fprintf('_______________________________________________________________________\r\n')
fprintf(datestr(now))
fprintf('\r\n')
A=[1,4,6,5; 0, 1.386294, 1.791759,1.60938];
x = A(1,:);
y = A(2,:);
%x = [1.6,2,2.5];
%y = [2,8,14];
fdd = [];
b=[];
n = size(A,2);

for i = 1: n
  fdd(i,1) = y(i);
end

for j = 2:n
  for i = 1: n - j 
    fdd(i,j) = (fdd(i+1, j-1) - fdd(i,j-1))/(x(i+j) - x(i));
  end
end

fprintf('NUMBER OF POINTS? %d\r\n',n)
for i = 1:n
  fprintf('X(%d), Y(%d) = ? %d,%1.5f\r\n',i,i,x(i),y(i))
end
fx = []
x
y

fx(1,1) = y(1);
for j = 2: 4
  fx(1,j) = (y(j)-y(j-1))/(x(j)-x(j-1)); 
end

fx(2,1) = (fx(1,3) - fx(1,2))/(x(3)-x(1));
fx(2,2) = (fx(1,4) - fx(1,3))/(x(4)-x(2));
fx(2,3) = 0;
fx(2,4) = 0;

fx(3,1) = (fx(2,2)-fx(2,1))/(x(4)-x(1));
fx(3,2) = 0;
fx(3,3) = 0;
fx(3,4) = 0;
fx
xterm = 2;

new_term = fx(1,1) + fx(2,1)*(xterm-x(1))+ fx(3,1)*(xterm-x(1))*(xterm-x(2))
fx(3,1)*(xterm-x(1))*(xterm-x(2))
error = fx(3,1)*(xterm-x(1))*(xterm-x(2)*(xterm-x(3)))

hold on
plot(x,y,'--bo')
title('Observed Data vs computed Approximation Plot')
xlabel('Observed:x - values')
ylabel('Observed:y - values')

diary off