function [xwerte, Ableitung] = diffquot(fhandle,a,h,b)
% fhandle: Funktionshandle zur analytischen Funktion welche abgeleitet werden soll
% a,b: untere und obere Intervallgrenzen
% h: Schrittweite der Differentiation
% Funktionsaufruf:[xwerte, ableitung] = diffquot(fhandle, a, b, h)
% Beispiel:[xwerte, ableitung] = diffquot(@(x) sin(x), -10, 10, 0.1);

xwerte = a:h:b

ywerte1=fhandle(xwerte);
ywerte2=fhandle(xwerte+h);
Ableitung=(ywerte2-ywerte1)/h;   


%ywerte1
Ableitung
plot(xwerte, Ableitung);

