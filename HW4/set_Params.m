function [P] = set_Params()
%SET_PARAMS of the system
%   Detailed explanation goes here
P.l1 = 1;

P.m1 = 1;
P.m2 = 2;
P.g = 0;
P.I1 = 1/12*P.m1*P.l1*P.l1;
end

