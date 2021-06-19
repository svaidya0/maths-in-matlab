function root = n_r(f,df,x_0)

%N_R    Implements the Newton-Raphson Method.
%       N_R(F, DF, X_0) implements the N-R method on a function handle F,
%       where DF - the derivative of F - is also a function handle and X_0
%       is the starting point.
        
tol = 1e-12;

%Initialises x_n and x_n1 for the while loop
x_n1 = x_0;        
x_n = x_0 + 1;

while abs(x_n1 - x_n) >= tol
    x_n = x_n1;
    x_n1 = x_n - ( f(x_n) / df(x_n) );   %No semi-colon so each iteration is printed
end

root = x_n1;

end