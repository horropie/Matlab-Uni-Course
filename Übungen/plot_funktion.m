function plot_funktion(fhandle,Xwerte)
%auch OUT=...m�glich

figure(1)
plot(Xwerte, fhandle(Xwerte))

figure(2)
plot(Xwerte, feval(fhandle, Xwerte))