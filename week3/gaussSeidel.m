clc;
all clear;
A = [3 1 -2 1;
     1 4 1 -1;
     2 -1 5 2;
     1 -1 1 3];
     
b = [6; 2; 12; 4];

n = length(b);
X = zeros(n, 1);
tol = 0.001;
iters = 4;

for k = 1:iters
    X_old = X;
    
    for i = 1:n
        temp_sum = 0;
        for j = 1:n
            if j ~= i
                temp_sum = temp_sum + A(i,j) * X(j);
            end
        end
        X(i) = (b(i) - temp_sum) / A(i,i);
    end
    
    fprintf('Iteration %d: x = %.4f, y = %.4f, z = %.4f, w = %.4f\n', k, X(1), X(2), X(3), X(4));
    
    err = max(abs(X - X_old));
    if err < tol
        break;
    end
end

if err >= tol
    fprintf('\nTolerance not reached after %d iterations. Current error: %.4f\n', iters, err);
end
