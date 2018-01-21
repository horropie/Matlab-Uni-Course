function [L, U] = myLU(matrix)
%matrix: Koeffizientenmatrix des Gleichungssystems
%L,U: untere und obere Dreiecksmatrizen aus LU_Zerlegung
%Funktionsaufruf [L, U] = myLU(matrix);

%% Fehlermeldung

[n, m] = size(matrix);
if (n ~= m)
    error('Matrix ist nicht quadratisch!');
end

%% LU-Zerlegung

L = eye(n); %nxn Identitätsmatrix
U = matrix;

for k = (1:n)
    for i = (k + 1:n)
        L(i,k) = U(i,k) / U(k,k);
        U(i,k) = 0; 
        for j = (k + 1:n)
            U(i,j) = U(i,j) - L(i,k) * U(k,j);
        end
    end
end