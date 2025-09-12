%% Генеруємо випадкові дані для двох класів
rng(1); % для відтворюваності
% Клас 1
mul [2, 3];
% середне
sigmal [1 0.5; 0.5 1];
% коваріація
X1= mvnrnd (mul, sigmal, 50);
% Клас 2
mu2 [5, 6];
sigma2 [10.8; 0.8 1.5];
X2 = mvnrnd (mu2, sigma2, 50);
X = [X1; X2];
* об'єднуємо дані
y= [ones (50,1); 2*ones (50,1)]; % мітки класів
%% LDA
lda_model fitcdiscr(X, y, 'DiscrimType', 'linear');
* Створимо сітку для відображення меж
[x1Grid, x26rid] = meshgrid(min(X(:,1))-1:0.1:max(X(:,1))+1, min(x(:,2))-1:0.1:max(x(:,2))+1);
xGrid [x1Grid(:), x2Grid(:)];
Ida_pred predict(Ida_model, xGrid);
lda_pred reshape(lda_pred, size(x1Grid));
%% QDA
qda_model fitcdiscr(X, y, 'DiscrimType', 'quadratic');
qda_pred predict(qda_model, xGrid);
reshape(qda_pred, size(x1Grid)); qda_pred
%% Графіки
figure;
% LDA
subplot(1,2,1);
contourf(x1Grid, x2Grid, lda_pred, 'LineColor', 'none');
hold on;
scatter (X1(:,1), X1(:,2), 50, 'r', 'filled');
scatter (X2(:,1), X2(:,2), 50, 'b', 'filled');
title('LDA');
xlabel('X1'); ylabel('X2');
legend('Клас 1', 'Клас 2');
% QDA
subplot(1,2,2);
contourf(x1Grid, x2Grid, qda_pred, 'LineColor', 'none');
hold on;
scatter (X1(:,1), X1(:,2), 50, 'r', 'filled');
scatter (X2(:,1), X2(:,2), 50, 'b', 'filled');
title('QDA');
xlabel('X1'); ylabel('X2');
legend('Клас 1', 'Клас 2');
