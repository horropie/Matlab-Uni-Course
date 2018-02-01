clear all
close all

%Definiere Parameter
N       = 200;
OMEGA   = 1.5;
T_0     = 10;
c       = 3;
alpha   = 1E-6;
omega   = 1;
T   = 0:0.25:500;

%Definiere externe Kraft auf ersten Oszillator
F_ext = @(t)sin(OMEGA.*t).*exp(-(t-3*T_0).^2./T_0^2);

%Setze Optionen für das Runge-Kutta-Verfahren
options = odeset('RelTol',1e-12);

%Startauslenkungen für Oszillatoren
Y_0 = zeros(2*N,1);

%Anwenden des ode45 auf das System gekoppelter Oszillatoren
[t_out, Y_out] = ode45(@oszillator_dgl, T, Y_0, options, alpha, omega, c, F_ext);

%Berechnung der Energie
E_kin = Y_out(:,N+1:2*N).^2 + omega^2*Y_out(:,1:N).^2;

%Plot
imagesc(T, 1:200, E_kin.');

ylabel('Anzahl der Oszillatoren')
xlabel('Zeit t')
colorbar