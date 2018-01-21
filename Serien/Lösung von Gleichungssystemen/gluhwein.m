%% Aufgabe 1: LU-Zerlegung mit Crout's Algorithmus

%Gleichungssystem der Stoffe
M = [1 1 0; 4 0 2; 0 2 1]; 

%Inhomogenit�tenvektor b f�r Zutaten

Fructose       = [6; 12; 6];
Ethanol        = [2;  6; 1];
Weinsaeure     = [4;  6; 6];
Zitronensaeure = [6;  8; 7]; 

%L�sen des Gleichungssystems
[L, U] = myLU(M); 

Lsg_Fructose       = elimination(L,U,Fructose)
Lsg_Ethanol        = elimination(L,U,Ethanol)
Lsg_Weinsaeure     = elimination(L,U,Weinsaeure)
Lsg_Zitronensaeure = elimination(L,U,Zitronensaeure)


%% Aufgabe 2: Zeitverhalten der Implementierung

%Werte f�r Gr��e der zu zerlegenden Matrix n

x = 10:10:750; %10,20,30...500
time = zeros(size(x));

%Zerlegung

for n = [1:length(x)]
    tic;
    myLU(rand(x(n)));
    toc;
    time(n) = toc;
end
sum(time)
%Plot
figure(1)
grid on 
loglog(x,time,'o')
hold on     
loglog(x,(x.^3)/(8E7),'r')
hold off
xlabel('Gr��e der Matrix')
ylabel('Zeit f�r LU-Zerlegung [s]')
set(gca,'FontName', 'Times')
legend('LU-Zerlegung','N^3','Location','EastOutside')
