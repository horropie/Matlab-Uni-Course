function [x v t] = alpha_osci(x0, v0, w, alpha,N, T)
% Berechnung der Bewegung eines harmonischen Oszillators mit dem alpha-Verfahren
% x0: Startort
% v0: Anfangsgeschwindigkeit
% w: Eigenfrequenz
% alpha: Parameter des alpha-Verfahrens
% N: Anzahl der Zeitschritte
% T: Maximalzeit
% x: Ergebnisvektor des Ortes
% v: Ergebnisvektor Geschwindigkeit
% t: Vektor mit den Stützstellen der Zeit
% Funktionsaufruf: [x v t] = alpha_osci(x0, v0, w, alpha, N, T);
% Beispiel: [x v t] = alpha_osci(1, 0, 1, 0.5, 1000, 20);

delt = T / N ;

A = inv([1 , -(1-alpha) * w * (delt) ; (1-alpha) * w * (delt) , 1]);
B = [1 , alpha * w * (delt) ; -alpha * w * (delt) , 1];

C = [x0;v0];

for counter = 1:N
    C(:,counter+1) = A*B*C(:,counter);
end

x = C(1,:);
v = C(2,:);
t = [0:N] * delt;


%figure(1)

%plot(transpose(C))

%figure(2)
%plot(t,x)

%figure(3)
%plot(x,v)
