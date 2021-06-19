function T_or_F = ismagic(A)

%ISMAGIC   Determines if a square matrix is magic.
%          ISMAGIC(A) calculates the sum of each column, row and the two
%          main diagonals of the matrix A and outputs 1 if they are all 
%          equal to each other and 0 if there is one that is not equal to 
%          the others


n = size(A,1);  

% loop sums first column and compares to the sums of the other columns
for i = 1:n
    if i==1
        columns = sum(A(:,1));
    elseif sum(A(:,i)) ~= columns
        T_or_F = 0;
        return;    
    end
end

for j = 1:n      % similar loop for the rows
    if j==1
        rows = sum(A(1,:));
    elseif sum(A(j,:)) ~= rows
        T_or_F = 0;
        return;    
    end
end

diagl = sum(diag(A));        % diagonal from the top left
diagr = sum(flip(diag(A)));  % diagonal from the top right

if rows == columns && rows == diagl && rows == diagr
    T_or_F = 1;
else
    T_or_F = 0;
end
 
end