function [spektrum] = my_fft(N,signal)
% Funktion zur Berechnung der FFT eines Eingangssignals
% N: Länge des Eingangssignals
% signal: Vektor mit Eingangssignal
% spektrum: berechnetes Frequenzspektrum des Eingangssignals
% Funktionsaufruf: spektrum = my_fft(N,signal)
% Beispiel: spektrum = my_fft(1024,sin(linspace(0,10*pi,1024)));


if N == 1
    spektrum = signal; 
else
    g = my_fft(N/2,(signal(1:2:N-1)));
    u = my_fft(N/2,(signal(2:2:N)));    
    
for k = 1:(N/2)  
    spektrum(k)     = g(k) + u(k) * exp(-2*pi*i*k/N);
    spektrum(k+N/2) = g(k) - u(k) * exp(-2*pi*i*k/N);
end

end
