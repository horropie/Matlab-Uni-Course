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

%cosmetics
xlabel('h');
ylabel('Fehler');
%xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi]);
%xticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'});
%ax.XTick=0:pi/4:pi
%set(gca, 'XTick', [0 0.5 pi/4 1 1.5 pi/2 2 3/4*pi 2.5 3 pi], 'XTickLabel',{0,'0.5','\pi/4','1','1.5','\pi/2','2','3/4\pi','2.5','3'});



%% Lokaler Fehlerplot
%Lokaler Fehler f�r h=[0,3] in x=[-50,50]

figure(2)
legendInfo=[];
for h = 1:1:3
   
[xwerte, ableitung] = diffquot(fhandle, -50, 50, h);

ablsin = @(x)cos(x);

fehlerlok = ablsin(xwerte) - ableitung;

%Array f�r Legende
legendInfo{h}=['h = ' num2str(h)]


%f�r selben canvas
hold on

plot(xwerte, fehlerlok);

%cosmetics
xlabel('x');
ylabel('Fehler');

k = k + 1;

end

legend(legendInfo)

%Testoutput Legendarray
legendInfo