function [L, U] = recursive_lu(A)

%RECURSIVE_LU    Implements a recursive LU matrix factorisation algorithm.

%       RECURSIVE_LU(A) implements a recursive LU factorisation algorithm
%       on a matrix of size 2^k and outputs two matrices L and U which are  
%       lower triangular and upper triangular.

n = size(A, 1);         %Size of matrix

A12 = A( 1:(n/2), 1+(n/2):n);
A21 = A( 1+(n/2):n, 1:(n/2));
A22 = A( 1+(n/2):n, 1+(n/2):n);

L11 = zeros(n/2);
U11 = zeros(n/2);

for i = 1:(n/2)
    for j = 1:(n/2)
        
        if (i == j)
            L11(i,j) = 1;
            U11(i,j) = A(i,j) - ( dot(L11(i, 1: j-1),  U11(1:j-1 , j) ) / L11(i,i));
                       
        elseif (j < i)
            L11(i,j) = A(i,j) - ( dot(L11(i, 1: j-1),  U11(1:j-1 , j) ) / U11(j,j));
             
        else
            U11(i,j) = A(i,j) - ( dot(L11(i, 1: j-1),  U11(1:j-1 , j) ) / L11(i,i));
            
        end
        
    end
end

U12 = L11\A12;
L21 = A21/U11;

LU22 = A22 - (L21*U12);

if (size(LU22, 1) > 1)
    [L22, U22] = recursive_lu(LU22);
else
    L22 = 1;
    U22 = LU22;
end

L = zeros(n);
U = zeros(n);

L( 1:(n/2), 1:(n/2) ) = L11;
L( 1+(n/2):n, 1:(n/2) ) = L21;
L( 1+(n/2):n, 1+(n/2):n ) = L22;

U( 1:(n/2), 1:(n/2) ) = U11;
U( 1:(n/2), 1+(n/2):n ) = U12;
U( 1+(n/2):n, 1+(n/2):n ) = U22;

end
        
            
            












