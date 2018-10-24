function [xterm, yint, ea, fx] = NewInt(x, y, n, xi, yint, ea)
  fx = [];
  for i = 1: n
    fx(i,1) = y(i);
  end
  for j= 2:n
    for i = 1: n-j+1
      if i+j <= n+1      
        fx(i,j) = (fx(i+1,j-1) - fx(i, j-1))/(x(i+j-1) - x(i));
      end
    end
  end
  xterm = 1;
  yint(1) = fx(1,1);

  for order = 2: n
    xterm = xterm * (xi - x(order-1));
    yint2 = yint(order-1) + fx(1, order)*xterm;
    ea(order-1) = yint2 - yint(order-1);
    yint(order) = yint2;
  end
  e(n) = NaN;
  
