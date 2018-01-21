function f=himmelblau(X)
%X: zweielementiger Zeilenvektor
%f: Funktionswert an der durch X definierten Stelle

f = (X(:,1).^2 + X(:,2) - 11).^2 + (X(:,1) + X(:,2).^2 - 7).^2;