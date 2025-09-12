% Вхідні дані: кожен рядок -спостереження, кожен стовпчик змінна
data = [20 100 30;
25 150 20;
30 200 10;
35 250 5];
% Обчислення коваріаційної матриці
covMatrix = cov(data);
% Візуалізація як теплової карти
imagesc (covMatrix); % Створення кольорового графіка
colorbar; % Додає шкалу кольорів
title('Коваріаційна матриця");
% Назва графіка
% Підписи осей
xticks (1:3);
yticks(1:3);
xticklabels({'Темп', 'Морозиво', 'Чай'});
yticklabels({'Темп', 'Морозиво', 'Чай'});
% Виведення чисел поверх кольорових клітинок
for i 1:size (covMatrix, 1)
for j = 1:size(covMatrix, 2)
text(j, i, num2str(covMatrix(i,j), '%.2f'), ...
'HorizontalAlignment', 'center',
'Color', 'white',
'FontWeight', 'bold');
end
end
