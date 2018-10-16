diary on
A=[0,2,4,6,9,11,12,15,17,19;5,6,7,6,9,8,7,10,12,12];

sumx    = 0;
sumy    = 0;
sumxy   = 0;
sumxsq  = 0;
sumysq  = 0;

for i = 1: size(A,2)
  sumx += A(1,i);
  sumy += A(2,i);
  sumxy += (A(2,i)*A(1,i));
  sumxsq += (A(1,i)^2);
  sumysq += (A(2,i)^2);
end

xbar = sumx/(size(A,2));
ybar = sumy/(size(A,2));
xybar = sumxy/(size(A,2));
xsqbar = sumxsq/(size(A,2));
ysqbar = sumysq/(size(A,2));

printf('Observed pairs of data values\r\n')
for i = 1: size(A,2)
  printf('[ %d, %d ]\t', A(1,i),A(2,i));
  if i == size(A,2)/2
    printf('\r\n')
  end
end
printf('\r\nEnd Observed pairs\n\n');


printf('ybar is: %f\r\n',ybar)
printf('Degree of polynomial is: 1.00\r\n')

cv = 0;
ssm = 0;
sy  = 0;
for i =1: size(A,2)
  ssm += (A(2,i) - ybar)^2;
end
sy = sqrt(ssm/(size(A,2)-1));
cv = (sy/ybar)*100;

a1 = ((size(A,2)*sumxy) - (sumx*sumy))/((size(A,2)*sumxsq)-(sumx)^2);
a0 = (ybar - a1*xbar);
printf('Coefficients of approximation are: %f   %f\r\n',a1,a0);
printf('Sm, Standard Deviation from y=ybar is: %f\r\n',sy);

sum_reg = 0;
for i=1:size(A,2)
  sum_reg += (A(2,i) - a0 - a1*A(1,i))^2;
end
serr = sqrt(sum_reg/(size(A,2)-2));

printf('Se, Standard Error from y=y_estimate is: %f\r\n',serr);
printf('Coefficent of Variation cv_mean = %f\r\n',cv);
printf('Confidence interval [ybar-sy,ybar+sy] is [%f,%f]\r\n', ybar-sy,ybar+sy);
printf('With atleast %5.3f percent in [%d,%d]\r\n',100 - (sy/ybar)*100,ybar-sy,ybar+sy);


for i= 1:21
  mean(i) = a0 + a1*xbar;
  pos_mean_dev(i) = mean(i) +sy;
  neg_mean_dev(i) = mean(i) -sy;
  regression(i) = a0 + a1*i;
  pos_reg_dev(i) = regression(i) + sy;
  neg_reg_dev(i) = regression(i) - sy;
  
end
x = [0:20];
x1 = [0:20];
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
