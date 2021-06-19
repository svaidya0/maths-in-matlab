function root = bisect(f,a,b)

%BISECT   Implements the bisection method to find root of F.
%         BISECT(F, A, B) takes a function handle F, and the numbers A,B
%         which the root lies between, and keeps bisecting the interval
%         where the root lies unitl it is within the tolerance.

tol = 1e-12;

%Initialises x_1 for the while loop
x_1 = (a+b)/2;

while abs( x_1 - a) >= tol || abs( x_1 - b) >= tol
  
  if sign(f(x_1)) == sign(f(b))
      b = x_1;
  else
      a = x_1;
  end
  
  x_1 = (a + b) / 2;    %No semi-colon so each iteration is printed
    
end

 root = x_1;
 
end