N=1;
m=200;
Y=ones(1,m);
X=1:m;
Z=ones(2,m);
while N<=m;
[x_min f_min N] = simplex(@himmelblau,[-1 -1],N,0);
Z(:,N)=(x_min);
z1=ones(1,m)*(-3.779310);
z2=ones(1,m)*(-3.283186);
Z2=[z1;z2];
Z1=Z-Z2;
Y(N)=f_min;
N=N+1;
end



figure(1)
semilogy(X,Y)
grid on;
%title({'f_{min} in Abhängigkeit von N_{max}'})
ylabel('f_{min}')
xlabel('N_{max}')
legend('f_{min}(N)','Location','EastOutside')
set(gca,'FontName', 'Times')
%} für (x_1,x_2)_(min) = (-3.779310,-3.283186)


