function C = matrixMultiply(A, B, n)
for i = 1:n
    for j = 1:n
        sumVal = 0;
        for k = 1:n
            sumVal = sumVal + A(i, k) * B(k, j);
        end
        C(i, j) = sumVal;
    end
end
disp("The C matrix is - ");
display(C);
end
