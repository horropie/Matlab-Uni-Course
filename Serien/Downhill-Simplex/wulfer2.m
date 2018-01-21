P=[-1 -1];
N=1;
m=200;
Y=ones(1,m);
X=1:m;
Z=ones(2,m);
while N<=m;
[x_min f_min N] = simplex(@himmelblau,P,1000,0);
Z(:,N)=(x_min);
z1=ones(1,m)*(-3.779310);
z2=ones(1,m)*(-3.283186);
Z2=[z1;z2];
Z1=Z-Z2;
Y(N)=f_min;
N=N+1;
end
Y1=exp(-0.56*(X-24));


figure(1)
semilogy(X,Y1,'k',X,Y,'m')
grid on;
title({'f_{min} in Abhäningkeit von N_{max}'})
ylabel('f_{min}')
xlabel('N_{max}')
legend({'Vergleich: f(N)=e^{0.56 \cdot (N-24)}','f_{min}(N)'},'Location','EastOutside')




