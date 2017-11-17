function [A, xwerte, F] = intrect(fhandle,a,b,h)
%fhandle:  Funktionshandle zur  analytischen
%Funktion welche integriert werden soll
%a: untere Intervallgrenze
%b: obere Intervallgrenze
%h: Schrittweite
%A: berechnete Fläche
%xwerte: Argumente der Stammfunktion
%F: Funktionswerte der Stammfunktion
%Funktionsaufruf A=intrect(fhandle,a,b,h);
%Beispiel: A=intrect(@(x) exp(x),0,10,0.01)

%input-interval
xwerte=(a:h:b);

%modifikation für Stützstellen, floor für exakte Stellen 
xwerte(floor((b-a)/h)+1:end)=[];

%Verschiebungsmatrix für Stützstellen in Größe der xwerte
harr=ones(1,length(xwerte))*h/2;

%Verschiebung
stuetzstellen=xwerte + harr;

%Funktion
F=h*cumsum(fhandle(stuetzstellen));

%Fläche
A=F(end)-F(1);

end
