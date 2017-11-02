function plot_funktion(fhandle,Xwerte)
%auch OUT=...möglich

figure(1)
plot(Xwerte, fhandle(Xwerte))

figure(2)
plot(Xwerte, feval(fhandle, Xwerte))