%% Aufgabe 1

S = @ (w,t)(sin(5 * t) + sin(w * t));
N = 256;
%t_sw = ((0:30*pi/(N-1):30*pi));
t_sw = 30*pi*(0:N-1)/N;
M = zeros(N,15);

for i = 1:15
     M(:,i) = my_fft(256,S(i,t_sw));
     M(:,i) = [M(N/2 +1:end,i); M(1:N/2,i)];
end

frequenz = 2.*pi/(30*pi).*(-N/2+1:N/2);

imagesc(frequenz,1:15,log10(abs(transpose(M))) )
xlabel('Kreisfrequenz des berechneten Spektrums')
ylabel('Kreisfrequenz des Eingangssignals')
colorbar


%% Aufgabe 2

N = 16;
t = linspace(0,2*pi,N);
length(t)

signal = exp(-(t - pi).^2./0.5)

for counter = 1:6
    signal(end+1 : N) = 0
    spektrum = my_fft(N,signal);
    length(spektrum)
    spektrum = [spektrum(N/2 + 1 : end) spektrum(1 : N/2)]; %Spektralkomponenten sortieren, sind sonst in der falschen reihenfolge
    frequenz = 2 .* pi/(max(t) * N/16).*(-N/2 + 1 : N/2); % Berechnung der Frequenzen für jede FFT,+1 für richtige Länge, muss mit length(spektrum),length(t) übereinstimmen
    figure(2)
    plot(frequenz,abs(spektrum));
    hold on;
    
    N = N*2; %Zum Befüllen mit Nullen muss Array wachsen
end

xlabel('Kreisfrequenz')
ylabel('Spektrale Amplitude')
legend('16','32','64','128','256','512')
hold off;








