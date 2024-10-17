  function L = Cholesky_Decomposition(A)
    % This function performs the Cholesky decomposition on a positive definite matrix A
    % It returns the lower triangular matrix L such that L * L' = A
    
    n = size(A, 1);  % Get the dimension of A
    L = zeros(n, n);  % Initialize L as a zero matrix of size n x n
    
    for i = 1:n
        for j = 1:i
            sum = 0;
            if j == i  % Diagonal elements
                for k = 1:j-1
                    sum = sum + L(j, k)^2;
                end
                L(j, j) = sqrt(A(j, j) - sum);
            else  % Off-diagonal elements
                for k = 1:j-1
                    sum = sum + L(i, k) * L(j, k);
                end
                L(i, j) = (A(i, j) - sum) / L(j, j);
            end
        end
    end
    
    % Return the lower triangular matrix L
    return;
end
