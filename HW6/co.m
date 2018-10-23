function fdd = co(x,y,n)
  for i = 1:n
    fdd(i,1) = y(i);
  end
  for j = 2:n 
    for i = 1: n-j
      fprintf('i=%d,j=%d\r\n',i,j)
      fdd(i,j) = (fdd(i+1,j-1)-fdd(i,j-1))/(x(i+1)-x(i));
    end
  end
  
  xterm = 1
  yint(1) = fdd(1,1)
      
end