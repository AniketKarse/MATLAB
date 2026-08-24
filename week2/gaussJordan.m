A = input('Enter a square matrix: ');

n = size(A, 1);

I = eye(n);

Aug = [A, I];

for k = 1:n
    if Aug(k, k) == 0
        for p = (k + 1):n
            if Aug(p, k) ~= 0
                temp = Aug(k, :);
                Aug(k, :) = Aug(p, :);
                Aug(p, :) = temp;
                break; 
            end
        end
    end
    
    pivot = Aug(k, k);
    Aug(k, :) = Aug(k, :) / pivot;
    
    for i = 1:n
        if i ~= k 
            factor = Aug(i, k);
            Aug(i, :) = Aug(i, :) - (factor * Aug(k, :));
        end
    end
end

A_inv = Aug(:, n+1:2*n);

disp('The original matrix A is:');
disp(A);

disp('The inverse of matrix A by Gauss-Jordan method is:');
disp(A_inv);
