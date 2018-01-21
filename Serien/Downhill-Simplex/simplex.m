function [x_min f_min N] = simplex(fhandle,x_start,N_max,p) 
% fhandle Funktionshandle zur zu minimierenden Funktion,
% diese muss einen 2-elementigen Zeilenvektor
% akzeptieren und den Funktionswert als Skalar
% zurückgeben
% x_start Startpunkt als 2-elementiger Zeilenvektor
% N_max maximale Anzahl von Iterationen
% p gewünschte Genauigkeit in x1, x2 und f
% x_min Punkt des Funktionsminimums, 2-elementiger
% Zeilenvektor
% f_min Funktionsminimum
% N Anzahl der benötigten Iterationsschritte
%
% Funktionsaufruf
% [x_min f_min N] = simplex(fhandle,x_start,N_max,p);
%
% Beispiel
% [x_min f_min N] = simplex(@himmelblau,[0 0],1E2,1E-5);
alpha = 1.0; % empfohlener Faktor für die Spiegelung
beta = 0.5; % empfohlener Faktor für die Kontraktion
gamma = 2.0; % empfohlener Faktor für die Expansion
lambda = 0.1; % empfohlene Größe des Startsimplex

% Matrix zur Speicherung der Punkte
% Konstruieren des Startsimplex'
A = zeros(3:3);
A(1,1) = x_start(1);
A(1,2) = x_start(2);
A(2,1) = x_start(1) + lambda;
A(2,2) = x_start(2);
A(3,1) = x_start(1);
A(3,2) = x_start(2) + lambda;

% Berechnung y-Werte
for k = 1:3
    A(k,3) = fhandle(A(k,:));
end

% Initiiere Schleife
N = 0;
p_l = false;

while (N < N_max) && not(p_l)
    
    %Sortieren für Spiegelung
    A = sortrows(A,3);                   
    
    % x_min(1) | x_min(2) | f_min
    % x_v(1)   | x_v(2)   | f_v
    % x_max(1) | x_max(2) | f_max
    
    %Berechnung des Spiegelpunktes, ign. schlechtesten P.
    x_s = mean( A([1,2],[1,2]) );
    
    %Spiegelung
    x_r = x_s - alpha * (A(3, [1 2]) - x_s);
    y_r = fhandle(x_r);
    
    %Expansion?
    if y_r < A(1,3)
        x_e = x_s + gamma * (x_r - x_s);
        y_e = fhandle(x_e);
        
        if y_e < y_r
            A(3,:) = [x_e y_e]; %Übernehme neuen Punkt
        else
            A(3,:) = [x_r y_r]; %Behalte alten Punkt
        end
        
    else
        if (y_r < A(2,3)) || (y_r < A(3,3)) %Wie schlecht ist y_r?
            A(3,:) = [x_r y_r];
        end
        
        %Kontraktion
        x_c = A(3,[1 2]) - beta * (A(3,[1 2]) - x_s);
        y_c = fhandle(x_c);
        
        if y_c < A(3,3)
            A(3,:) = [x_c,y_c];
           
        else
            %Kompression (Schiebe Punkte auf x_min zu)
           %A(3,:) = 0.5 * (A(1,[1 2]) + A(3,[1 2]));
           %A(2,:) = 0,5 * (A(1,[1 2]) + A(2,[1 2]));
            A(3,1:2)=0.5 * (A(1,1:2)+A(3,1:2));
            A(2,1:2)=0.5 * (A(1,1:2)+A(2,1:2));
           
        end
    end

%Für Abbruchbedingungen (Standardabweichung, Schrittzahl)
p_l = (std(A(:,3)) < p);
N = N+1; 

%Output
format long
x_min = A(1,1:2);
f_min = A(1,3);

end


    