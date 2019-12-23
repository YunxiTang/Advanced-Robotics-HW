clear all;
clc;
w = 300;
[X,Y,Z] = sphere(w);
k = 1;
m = 1;
for i = 1:w
    n = 1;
    for j=1:w
        x(k) = X(m,n);
        y(k) = Y(m,n);
        z(k) = Z(m,n)+5;
        
        k = k + 1;
        n = n + 1;
    end
    m = m+1;
end
plot3(x,y,z);