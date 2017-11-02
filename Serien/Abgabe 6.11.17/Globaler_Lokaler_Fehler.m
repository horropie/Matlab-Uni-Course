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

%% Lokaler Fehlerplot
%Lokaler Fehler für h=[0,3] in x=[-50,50]

figure(2)

for h = 0:1:3
[xwerte, ableitung] = diffquot(fhandle, -50, 50, h);

ablsin = @(x)cos(x);

fehlerlok = ablsin(xwerte) - ableitung;
%für selben canvas
hold on
plot(xwerte, fehlerlok);

k = k + 1;
end