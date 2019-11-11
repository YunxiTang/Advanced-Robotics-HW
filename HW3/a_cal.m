function [a_norm] = a_cal(r_norm,k)
h=1;
a_norm = (h+1)*(r_norm)./(h+k*(r_norm).*(r_norm));
end

