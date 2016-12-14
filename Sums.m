%% Plotting Non-linear field of [x^,xy]

[t,v] = meshgrid(3:10,3:10);

syms x y x_0 y_0;

divF = divergence([x_0^2,x_0*y_0],[x_0,y_0]);

a = x-x_0;
b = y-y_0;

U = log(a^2+b^2)/2;
gradU = gradient(U, [x_0, y_0])

divF*gradU;

sum1 = symsum(divF*gradU, x_0, [0 2]);
sum2 = symsum(sum1, y_0, [0 2]);

for i = 3:10
    for j = 3:10
        A(i-2,j-2) = subs(subs(sum2(1),x,vpa(i)),y,j);
        B(i-2,j-2) = subs(subs(sum2(2),x,vpa(i)),y,j);
    end
end

figure;
hold on;
quiver(t,v,A,B,'r');    %curl free
hold on;


[t,v] = meshgrid(3:10,3:10);

syms x y x_0 y_0;

F = [x_0^2,x_0*y_0];
curlF = diff(F(2),x_0)-diff(F(1),y_0);
%magCurl = sqrt(curlF(1)^2 + curlF(2)^2);
% curlF = curl(t,v,x_0^2,x_0*y_0);

a = x-x_0;
b = y-y_0;



W = [-b/(a^2+b^2), a/(a^2+b^2)];


sum1 = symsum(curlF*W, x_0, [0 2]);
sum2 = symsum(sum1, y_0, [0 2]);


for i = 3:10
    for j = 3:10
        C(i-2,j-2) = subs(subs(sum2(1),x,vpa(i)),y,j);
        
        D(i-2,j-2) = subs(subs(sum2(2),x,vpa(i)),y,j);
    end
end

quiver(t,v,C, D, 'g');%div free
hold on;


for i = 3:10
    for j = 3:10
        E(i-2,j-2) = subs(subs(F(1),x_0,vpa(i)),y_0,j);
        
        G(i-2,j-2) = subs(subs(F(2),x_0,vpa(i)),y_0,j);
    end
end


quiver(t,v,E,G, 'm');


figure(2);
quiver(t,v,A+C, B+D); %curl free + div free
hold on;
quiver(t,v,E,G, 'm'); %original F

%% Comparing Non-linear field with decomposition

[t,v] = meshgrid(3:10,3:10);

syms x y x_0 y_0;

divF = divergence([x_0^2,x_0*y_0],[x_0,y_0]);

a = x-x_0;
b = y-y_0;

U = log(a^2+b^2);
gradU = gradient(U, [x_0, y_0]);

divF*gradU;
%curl free
divsum1 = symsum(divF*gradU, x_0, [0 2]);
divsum2 = symsum(divsum1, y_0, [0 2]);

syms x y x_0 y_0;

F = [x_0^2,x_0*y_0];
curlF = [diff(F(2),x_0),diff(F(1),y_0)];
magCurl = sqrt(curlF(1)^2 + curlF(2)^2);

a = x-x_0;
b = y-y_0;

W = [-b/(a^2+b^2), a/(a^2+b^2)];

magCurl*W;
%div free
curlsum1 = symsum(magCurl*W, x_0, [2 3]);
curlsum2 = symsum(curlsum1, y_0, [2 3]);

L = divergence(F,[x,y]);
M = divergence(transpose(divsum2),[x,y]);

divergence(W,[x,y]);


N = [diff(curlsum2(2),x),diff(curlsum2(1),y)];
O = [diff(F(2),x), diff(F(1),y)];

P = divergence([F(1)-transpose(divsum2(1))-transpose(curlsum2(1)), F(2)-transpose(divsum2(2))-transpose(curlsum2(2))], [x,y]);
Q = [diff(F(1)-transpose(divsum2(1))-transpose(curlsum2(1)),x) , diff(F(2)-transpose(divsum2(2))-transpose(curlsum2(2)),y)];

% taking the divergence of F - divergece of curl free = 0
subs(subs(L-M,x,5),y,5)
%taking the divergece of (F - curl free - div)
%free = 0
subs(subs(P,x,5),y,5)

%taking the (curl of F) - (curl of div-free) is not 0 HALP
subs(subs(O-N,x,5),y,5)

%taking the (curl of F) - (curl of div free) - (curl of curl-free) is not 0 HALP
subs(subs(Q,x,5),y,5)


%% Trying the same method with a linear field

[t,v] = meshgrid(3:10,3:10);

syms x y x_0 y_0;
F = [ 2*x_0+y_0 , -x_0-3*y_0];

divF = divergence(F,[x_0,y_0]);

a = x-x_0;
b = y-y_0;

U = log(a^2+b^2)/2;x
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

figure;
quiver(t,v,A,B,'r');    %curl free
hold on;

syms x y x_0 y_0;

curlF = diff(F(2),x_0)-diff(F(1),y_0);

a = x-x_0;
b = y-y_0;

W = [-b/(a^2+b^2), a/(a^2+b^2)];


sum1 = symsum(curlF*W, x_0, [0 2]);
sum2 = symsum(sum1, y_0, [0 2]);


for i = 3:10
    for j = 3:10
        C(i-2,j-2) = subs(subs(sum2(1),x,vpa(i)),y,j);
        D(i-2,j-2) = subs(subs(sum2(2),x,vpa(i)),y,j);
    end
end

quiver(t,v,C, D, 'g');%div free
hold on;


for i = 3:10
    for j = 3:10
        E(i-2,j-2) = subs(subs(F(1),x_0,vpa(i)),y_0,j);
        
        G(i-2,j-2) = subs(subs(F(2),x_0,vpa(i)),y_0,j);
    end
end


quiver(t,v,E,G, 'm');


figure(2);
quiver(t,v,A+C, B+D); %curl free + div free
hold on;
quiver(t,v,E,G, 'm'); %original F

%%

A = [2 1; -1 -3]
A_sym = (A + transpose(A))/2
A_alt = (A - transpose(A))/2






