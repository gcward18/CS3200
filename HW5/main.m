diary on
fprintf('\t\t\tLeast Squares Method for Best Fit Line\r\n')
fprintf('\t\t\t            Presented\r\n')
fprintf('\t\t\t                by\r\n')
fprintf('\t\t\t          George C. Ward\r\n')

fprintf('_______________________________________________________________________\r\n')
fprintf(datestr(now))
fprintf('\r\n')
A=[6,7,11,15,17,21,23,29,29,37,39;29,21,29,14,21,15,7,7,13,0,3];

sumx    = 0;
sumy    = 0;
sumxy   = 0;
sumxsq  = 0;
sumysq  = 0;

for i = 1: size(A,2)
  sumx      = sumx + A(1,i);
  sumy      = sumy + A(2,i);
  sumxy     = sumxy + (A(2,i)*A(1,i));
  sumxsq    = sumxsq + (A(1,i)^2);
  sumysq    = sumysq + (A(2,i)^2);
end

xbar = sumx/(size(A,2));
ybar = sumy/(size(A,2));
xybar = sumxy/(size(A,2));
xsqbar = sumxsq/(size(A,2));
ysqbar = sumysq/(size(A,2));

fprintf('Observed pairs of data values\r\n')
for i = 1: size(A,2)
  fprintf('\t[ %3.3f, %3.3f ]\r', A(1,i),A(2,i));
  if i == size(A,2)/2
    fprintf('\r\n')
  end
end
fprintf('\r\nEnd Observed pairs\n\n');


fprintf('ybar is: %3.3f\r\n',ybar)
fprintf('Degree of polynomial is: 1.00\r\n')

cv = 0;
ssm = 0;
sy  = 0;
for i =1: size(A,2)
  ssm = ssm + (A(2,i) - ybar)^2;
end
sy = sqrt(ssm/(size(A,2)-1));
cv = (sy/ybar)*100;

a1 = ((size(A,2)*sumxy) - (sumx*sumy))/((size(A,2)*sumxsq)-(sumx)^2);
a0 = (ybar - a1*xbar);
fprintf('Coefficients of approximation are: %f   %f\r\n',a1,a0);
fprintf('Sm, Standard Deviation from y=ybar is: %f\r\n',sy);

sum_reg = 0;
for i=1:size(A,2)
  sum_reg = sum_reg + (A(2,i) - a0 - a1*A(1,i))^2;
end
serr = sqrt(sum_reg/(size(A,2)-2));

fprintf('Se, Standard Error from y=y_estimate is: %f\r\n',serr);
fprintf('Coefficent of Variation cv_mean = %f\r\n',cv);
fprintf('Confidence interval [ybar-sy,ybar+sy] is [%3.3f,%3.3f]\r\n', ybar-sy,ybar+sy);
fprintf('With atleast %5.3f percent in [%3.3f,%3.3f]\r\n',100 - (sy/ybar)*100,ybar-sy,ybar+sy);


for i= 1:41
  mean(i) = a0 + a1*xbar;
  pos_mean_dev(i) = (mean(i) +sy);
  neg_mean_dev(i) = mean(i) -sy;
  regression(i) = a0 + a1*i;
  pos_reg_dev(i) = regression(i) + sy;
  neg_reg_dev(i) = regression(i) - sy;
  
end
x = [0:40];
x1 = [0:40];
hold on
plot(A(1,:),A(2,:),'--bo')
plot(x,mean,'r')

plot(x1,regression, 'g')
legend({'data','mean','regression'});
plot(x,pos_mean_dev,'--r')
plot(x,neg_mean_dev,'--r')
plot(x,pos_reg_dev,'--g')
plot(x,neg_reg_dev,'--g')
title('Observed Data vs computed Approximation Plot')
xlabel('Observed:x - values')
ylabel('Observed:y - values')

diary off
