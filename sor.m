function r = sor(A, b, n, w)

%SOR      Implements the successive-over-relaxation method to solve AX = B.
%         SOR(A, B, N, W) takes a relaxation parameter W, matrix A and
%         vector B and computes the iterates X for the SOR method to the
%         to the N-th iteration and returns a vector containing the ∞-norm
%         of the residual at each iteration.

    D = diag(diag(A));
    L = tril(A)-D;
    U = triu(A)-D;
    x = zeros(size(b));
    r = zeros(n,1);
    
for k = 1:n
    x = (L+(w*D))\(b - ( U + (1-w)*D )*x );
    r(k) = norm(b - A*x, Inf);
end
    
end