[t,v] = meshgrid(3:10,3:10);

syms x y x_0 y_0;

divF = divergence([x_0^2,x_0*y_0],[x_0,y_0]);

a = x-x_0;
b = y-y_0;

U = log(a^2+b^2);
gradU = gradient(U, [x_0, y_0]);

divF*gradU;

sum1 = symsum(divF*gradU, x_0, [0 2]);
sum2 = symsum(sum1, y_0, [0 2]);

for i = 3:10
    for j = 3:10
        A(i-2,j-2) = subs(subs(sum2(1),x,vpa(i)),y,j);
        B(i-2,j-2) = subs(subs(sum2(2),x,vpa(i)),y,j);
    end
end


quiver(t,v,A,B);







