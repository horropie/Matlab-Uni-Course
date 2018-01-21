function x = elimination(L, U, b)
%L,U: untere und obere Dreiecksmatrizen aus LU_Zerlegung
%b: Inhomogenitätenvektor des Gleichungssystems
%x: Lösungsvektor
%Funktionsaufruf x = Elimination(L, U, b);

%% Fehlermeldungen 

[row_L, col_L] = size(L);
[row_U, col_U] = size(U);

n = length(b);

if (row_L ~= col_L || row_U ~= col_U)
    error('Eine der Matrizen ist nicht quadratisch!');
end

if (row_L ~= row_U)
    error('Die Matrizen haben nicht die selbe Dimension!');
end

if ( row_L ~= n)
    error('Die Dimension der Matrizen besitzt nicht die Länge von b!');
end


%% Elimination

y = zeros(n, 1);
x = zeros(n, 1);

%Vorwärtselimination
y(1) = b(1);

for i = [2:n]
    y(i) = b(i) - sum(L(i,1:i-1) * y(1:i-1));
end


%Rückwärtselimination
x(n) = y(n)/U(n,n);

for i=[n-1:-1:1]
    x(i) = 1/U(i,i) * (y(i) - sum(U(i,i+1:n) * x(i+1:n)));
end