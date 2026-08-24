A = input('Enter the square coefficient matrix A: ');
b = input('Enter the constant vector b: ');

x = gaussian_elimination_pivoting(A, b);
disp('x = ');
disp(x);

function x = gaussian_elimination_pivoting(A, b)
    [n, m] = size(A);
    
    if n ~= m
        error('Matrix A must be a square matrix.');
    end
    if length(b) ~= n
        error('The length of vector b must match the dimensions of matrix A.');
    end

    b = b(:);

    for k = 1:n-1
        [~, max_idx] = max(abs(A(k:n, k))); 
        max_idx = max_idx + k - 1; 

        if max_idx ~= k
            A([k, max_idx], :) = A([max_idx, k], :);
            b([k, max_idx]) = b([max_idx, k]);
        end

        if A(k, k) == 0
            error('Matrix is singular.');
        end

        for i = k+1:n
            multiplier = A(i, k) / A(k, k);
            A(i, k:n) = A(i, k:n) - multiplier * A(k, k:n);
            b(i) = b(i) - multiplier * b(k);
        end
    end

    x = zeros(n, 1);
    x(n) = b(n) / A(n, n);
    
    for i = n-1:-1:1
        x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
    end
end
