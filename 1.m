%% Створення часових рядів
days = 1:365;
temperature = 10 + 10*sin(2*pi*days/365) + randn(1,365); % сезонність + шум
hours = 1:24;
purchases = poissrnd(20 + 10*sin(2*pi*hours/24), 1, 24); % сезонність по годинах

%% Візуалізація
subplot(2,1,1);
plot(days, temperature);
title('Температура протягом року');
xlabel('День'); ylabel('Температура (°C)');

subplot(2,1,2);
bar(hours, purchases);
title('Кількість покупок протягом доби');
xlabel('Година'); ylabel('Кількість покупок');
