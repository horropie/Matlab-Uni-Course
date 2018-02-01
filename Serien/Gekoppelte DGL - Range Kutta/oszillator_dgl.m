function [dY] = oszillator_dgl(t, Y, alpha, omega, c, F_ext)
%Transformation der Bewegungsgleichungen zweiter Ordnung von 
%gekoppelten Oszillatoren in eine Differentialgleichung
%zweiter Ordnung in Matrixschreibweise
% t     = Zeit
% Y     = Vektor bestehend aus Ort und Geschwindigkeit [x;v]
% alpha = Dämpfung
% omega = Kreisfrequenz
% c     = Kopplunsgrad
% F_ext = Externe Kraft, greift nur an einer Stelle an


%Definition N aus y(x,v), 1/2 wegen folgender Aufteilung
N = length(Y)/2;

%Aufteilung y in Ort und Geschwindigkeit
x = Y(1:N);
v = Y(N+1:2*N);

%Defniere Platzhalter Matrizen
dX = zeros(N,1);
dV = zeros(N,1);

%Ortableitungen bilden durch Transformation entstehende DGL
dX(1:N) = v(1:N);

%Definition der transformierten DGL 
dV(1)       = -omega^2*x(1) - alpha*v(1) + c*(-x(1) + x(2)) + F_ext(t);

dV(2:N-1)   = -(omega^2)*x(2:N-1) - alpha*v(2:N-1)...
            + c*(x(1:N-2)-2*x(2:N-1) + x(3:N));

dV(N)       = -omega^2*x(N) - alpha*v(N) + c*(x(N-1) - x(N));

%Zusammensetzen des entstandenen Vektors zur effizienteren Berechnung
dY = [dX; dV];