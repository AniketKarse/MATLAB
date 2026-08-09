clear all;
close all;
clc;
a=input('Enter a: ');
b=input('Enter b: ');
c=input('Enter c: ');

d= b^2 - 4*a*c;

root1 = (-b - sqrt(d)) / (2*a);
root2 = (-b + sqrt(d)) / (2*a);

disp('The roots are: ');
disp(root1);
disp(root2);
