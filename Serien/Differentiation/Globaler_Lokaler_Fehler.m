fhandle = @(x)sin(x);

%% Globaler Fehlerplot

%Gesamtfehler h x=[-50,50]

k = 1;

for h = 0:0.01:3
    
[xwerte, ableitung] = diffquot(fhandle, -50, 50, h);

ablsin = @(x)cos(x);

fehlerh(k) = sum(h * abs(ablsin(xwerte) - ableitung));

k = k + 1;

end

figure(1)
plot(0:0.01:3, fehlerh);

%cosmetics with latexfont
xlabel('Schrittweite $h$', 'interpreter','latex');
ylabel('Gesamtfehler $\Delta(h)$','interpreter','latex');


%% Lokaler Fehlerplot
%Lokaler Fehler f�r h=[0,3] in x=[-50,50]

figure(2)

legendInfo=[];

for h = 1:1:3
   
[xwerte, ableitung] = diffquot(fhandle, -50, 50, h);

ablsin = @(x)cos(x);

fehlerlok = ablsin(xwerte) - ableitung;

%Array f�r Legende
legendInfo{h}=['$h$ = ' num2str(h)];


%f�r selben canvas
hold on

plot(xwerte, fehlerlok);

%cosmetics
xlabel('x', 'interpreter','latex');
ylabel('lokaler Fehler $E_h$', 'interpreter','latex');

k = k + 1;

end

%Auswerten Legendenarray
legend(legendInfo,'interpreter','latex');
