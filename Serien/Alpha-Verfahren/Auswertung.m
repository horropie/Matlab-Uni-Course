% Gegeben für alle plots
w = 1;
x0 = 1;
v0 = 0;
T = 20;

%% 1 - Fehlerkonvergenz des Alpha-Verfahrens

alpha = [0 0.5 0.501 0.51 1]; %Alpha-Werte für verschiedene Verfahren
N = ceil(2.0*logspace(1,4,20)); %Abrundung der Werte nach oben, Intervall für Plot
dt = T./N;

%Vorgegebene Funktionen zur Berechnung des Fehlers
x_analyt = x0 * cos(w * T) + v0/w * sin(w * T); 
v_analyt = -x0 * w * sin(w * T) + v0 * cos(w * T);

x_max = sqrt(x0^2 + (v0/w)^2);
v_max = w*x_max;

%Ausführen der Funktion und Speichern in Array
for c_a = 1:length(alpha)
    for counter_N = 1:length(N)
         [x v t] = alpha_osci(x0,v0,w,alpha(c_a),N(counter_N),T);
         err(c_a, counter_N) = sqrt( ((x(end)-x_analyt)/x_max).^2 + ...
             ((v(end)-v_analyt)/v_max).^2);
    end;
end;


%Plot
figure(1)

%Kurven mit Orientierungshilfe
loglog(dt,err(1,:), dt,err(2,:), dt,err(3,:), dt,err(4,:), dt,err(5,:),...
    dt, 5*dt, 'k.-', dt, dt.^2, 'k--')

hold on

%Damit die Legende mit dem Loop funktioniert:
legend( strcat('\alpha= ', num2str(alpha(1)) ), strcat('\alpha= ',  num2str(alpha(2)) ),...
    strcat('\alpha= ',  num2str(alpha(3)) ), strcat('\alpha= ',  num2str(alpha(4)) ),...
    strcat('\alpha= ',  num2str(alpha(5)) ), ...
    'Lineares Wachstum 5dt', 'Quadratisches Wachstum dt^2','Location','NorthWest' )
    
xlabel('Zeitschritt dt')
ylabel('Globaler Fehler')
hold off

%% 2 - Energie über Zeit


alpha = [0 0.5 1];
N = 200; %Sonst dimension mismatch

for c_a = 1:length(alpha)
         [x v t] = alpha_osci(x0, v0, w, alpha(c_a), N, T);
         Energy(c_a, :) =  v.^2 + w^2 * x.^2;
end;

figure(2)

plot(t, Energy(1,:), t, Energy(2,:), t, Energy(3,:))
hold on
xlabel('Zeit t')
ylabel('Energie')

%Damit Legende mit Loop funktioniert:
legend( strcat('\alpha=', num2str(alpha(1)) ),...
    strcat('\alpha=',  num2str(alpha(2)) ), strcat('\alpha=',...
    num2str(alpha(3)) ), 'Location','NorthWest' )

hold off
