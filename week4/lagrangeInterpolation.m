clear; 
clc;

if ~isfile('height_data.txt')
    error('File height_data.txt not found. Please create it in the current directory.');
end

data = load('height_data.txt');
roll_numbers = data(:, 1);  
heights = data(:, 2);   

disp('Known Data:');
fprintf('Roll No: \t Height(cm):\n');
for k = 1:length(roll_numbers)
    fprintf('%d \t\t %.2f\n', roll_numbers(k), heights(k));
end
fprintf('\n');

target_roll = 2.5;
estimated_height = lagrange_interp(roll_numbers, heights, target_roll);

fprintf('Using Lagrange Interpolation:\n');
fprintf('The estimated height for Roll Number %.2f is %.2f cm.\n', target_roll, estimated_height);

function y_val = lagrange_interp(x_data, y_data, x_val)
    n = length(x_data);
    y_val = 0;
    
    for i = 1:n
        L = 1;
        for j = 1:n
            if j ~= i
                L = L * (x_val - x_data(j)) / (x_data(i) - x_data(j));
            end
        end
        y_val = y_val + y_data(i) * L;
    end
end
