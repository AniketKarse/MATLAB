clc;
all clear;
A = [ 4, -2,  4; 
    -2,  5, -2; 
    4, -2,  8];

b = [6; 0; 16];
n = length(b);

L = zeros(n, n);

for i = 1:n
    for j = 1:i
        sum_val = 0;
        for k = 1:j-1
            sum_val = sum_val + L(i,k) * L(j,k);
        end

        if i == j
            L(i,j) = sqrt(A(i,i) - sum_val);
        else
            L(i,j) = (A(i,j) - sum_val) / L(j,j);
        end
    end
end

disp('Lower Triangular Matrix:');
disp(L);

L_T = zeros(n, n);
for i = 1:n
    for j = 1:n
        L_T(i,j) = L(j,i);
    end
end

y = zeros(n, 1);
for i = 1:n
    sum_val = 0;
    for j = 1:i-1
        sum_val = sum_val + L(i,j) * y(j);
    end
    y(i) = (b(i) - sum_val) / L(i,i);
end

disp('Intermediate vector:');
disp(y);

x = zeros(n, 1);
for i = n:-1:1
    sum_val = 0;
    for j = i+1:n
        sum_val = sum_val + L_T(i,j) * x(j);
    end
    x(i) = (y(i) - sum_val) / L_T(i,i);
end

disp('Final Solution vector:');
disp(x);
