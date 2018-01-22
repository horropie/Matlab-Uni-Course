%% Plot

a_v = [0 0.5 1];

figure(1)

for counter = 1:3
    
C = alpha_osci(1 , 0 , 1 , a_v(counter) ,1000, 20);

plot(transpose(C));
hold on

end

%{ 
Experimental
C = alpha_osci(1 , 0 , 1 , 0.5 ,1000, 20);
x = C(1,:);
v = C(2,:);
t = [0:N] * delt;

figure(2)
plot(t,x);
 
figure(3)
plot(x,v);

%}

%% Fehler

%{
x_analyt = x0 * cos(w * t) + (v0 / w)*sin(w * t);
v_analyt = -x0*w*sin(w * t) + v0*cos(w * t);

x_max = sqrt(x0^2 + (v0/w)^2);
v_max = w * x_max;

err_global = sqrt((x(end) - x_analyt(end) / x_max)^2+(v(end) - v_analyt(end) / v_max)^2);
%}