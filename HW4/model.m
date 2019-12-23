function [model] = model()
%MODEL Summary of this function goes here
%   Detailed explanation goes here
m1 = 1;
m2 = 2;
l1 = 1;
g = 0;
I1 = 1/12*m1*l1*l1;

model.m1 = m1;
model.m2 = m2;
model.l1 = l1;
model.I1 = I1;
model.g = g;
end

