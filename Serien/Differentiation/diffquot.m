function [xwerte, ableitung] = diffquot(fhandle,a,b,h)
% fhandle: Funktionshandle zur analytischen Funktion welche abgeleitet werden soll
% a,b: untere und obere Intervallgrenzen
% h: Schrittweite der Differentiation
% Funktionsaufruf:[xwerte, ableitung] = diffquot(fhandle, a, b, h)
% Beispiel:[xwerte, ableitung] = diffquot(@(x) sin(x), -10, 10, 0.1);

%Definiere das X-Intervall und die Feinheit für den Input 
%Gefordertes Intervall 'xwerte'
xwerte = a:h:b;

%Konstruktion des Differenzenquotienten mithilfe von fhandle
%Gefordertes Intervall 'ableitung'
ywerte1=fhandle(xwerte);
ywerte2=fhandle(xwerte+h);
ableitung=(ywerte2-ywerte1)/h;   

%output 
xwerte
ableitung

%plot
%plot(xwerte, ableitung);


