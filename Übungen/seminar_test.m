%if-Bedingungen
a = 9;
b = 8;
c = 10;

if a>b || c == 10 %|| ist logisches oder
    ausgabe = a;
elseif a<b
    ausgabe = b;
else
    ausgabe = 'equal';
end


ausgabe
% && wird nur ausgeführt, wenn das vorherige schon wahr war
% & logischer und operator

%% for-Schleifen
N=10;
fakultaet = 1;
for lauf = 2:N
    fakultaet = fakultaet * lauf;
end

fakultaet


%% while-Schleifen
N=12;
fakultaet=1;
lauf=2;
while lauf <= N
    fakultaet=fakultaet * lauf;
    lauf = lauf+1;
    if lauf == 12
        break
    end
end
fakultaet
%zum canceln: str+c

%% switch-Umgebung
wochentag = 'Montag';
switch wochentag
    case 'Montag'
        day_numeric = 1;
    case 'Dienstag'
        day_numeric = 2;
    case 'Mittwoch'
        day_numeric = "Es ist Mittwoch meine Kerle";
    otherwise
        day_numeric = 0;
end

day_numeric