
%% Differenz numerische Integration, analytische Integration

%logarithmische Skalierung, Definitionen für loop
h0=logspace(-4,-1,1000);
a=0;
b=10;
i=1;
n=length(h0);
f1=(1:n);
f2=f1;
f3=f1;
i=1;


while i <= n
    
	h=h0(i);
	func=@(x) (x);
    [A, xwerte, F] = intrect (func, a, b, h);
	f1(i)=abs(50+xwerte(1).^2/2-A);
    
	func=@(x) (x).^2;
	[A, xwerte, F] = intrect (func, a, b, h);
	f2(i)=abs(1000/3+xwerte(1).^3/3-A);
    
	func=@(x) exp(x);
	[A, xwerte, F] = intrect (func, a, b, h);
	f3(i)=abs(exp(10)+exp(xwerte(1))-A);
    
i= i + 1;
end

%Kosmetik Figure 1
figure(1); 
loglog(h0,f1,h0,f2,h0,f3)
grid on;
ylabel('$A_N-A_A$', 'interpreter','latex')
xlabel('$h$', 'interpreter','latex')
legend({'$f_1(x)=x$','$f_2(x)=x^2$','$f_3(x)=\exp(x)$'},'Location','SouthEast', 'interpreter','latex')


%% Beispiele für die Abhängigkeit der berechneten Stammfunktion von f(x) = x^2 vom Startpunkt a Ihrer Funktion. 

func=@(x) (x).^2;
h=10E-3;
a0=[0,4,5,6,7];

%Definiere Stammfunktionen
[A, x1, F1] = intrect (func, a0(1), b, h);
[A, x2, F2] = intrect (func, a0(2), b, h);
[A, x3, F3] = intrect (func, a0(3), b, h);
[A, x4, F4] = intrect (func, a0(4), b, h);
[A, x5, F5] = intrect (func, a0(5), b, h);

%Definitionen für Differenzen 

y2=F1;
k=length(x1)-length(x2);
y2(1:k)=[];
y2=y2-F2;

y3=F1;
k=length(x1)-length(x3);
y3(1:k)=[];
y3=y3-F3;

y4=F1;
k=length(x1)-length(x4);
y4(1:k)=[];
y4=y4-F4;

y5=F1;
k=length(x1)-length(x5);
y5(1:k)=[];
y5=y5-F5;

%Kosmetik Figur 2

figure(2);
plot(x1,F1,'k',x2,F2,'r',x3,F3,'g',x4,F4,'m',x5,F5,'b',x2,y2,'r--',x3,y3,'g--',x4,y4,'m--',x5,y5,'b--')
grid on;
ylabel('y', 'interpreter','latex')
xlabel('x', 'interpreter','latex')
legend({'$F_0(x)$','$F_4(x)$','$F_5(x)$','$F_6(x)$','$F_7(x)$','$F_0(x)-F_4(x)$','$F_0(x)-F_5(x)$','$F_0(x)-F_6(x)$','$F_0(x)-F_7(x)$'},'Location','West', 'interpreter','latex')




