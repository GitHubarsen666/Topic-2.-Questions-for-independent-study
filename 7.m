gscatter

X = [randn(50,1)+1; randn(50,1)+5];
Y = [randn(50,1)+2; randn(50,1)+6];
group = [ones(50,1); 2*ones(50,1)];

gscatter(X, Y, group, 'rb', 'o^', 8);
xlabel('X'); ylabel('Y');
title('Розсіювання груп (gscatter)');
legend('Клас 1','Клас 2');

classify

% Дані тренування
Xtrain = [randn(50,1)+1, randn(50,1)+2; randn(50,1)+5, randn(50,1)+6];
group = [ones(50,1); 2*ones(50,1)];

% Нові точки для класифікації
Xnew = [2 3; 5 5; 3 4];

% Класифікація нових точок за допомогою LDA
class = classify(Xnew, Xtrain, group, 'linear');

disp(class);

Приклад графіка з gscatter та результатом classify

figure;
gscatter(Xtrain(:,1), Xtrain(:,2), group, 'rb', 'o^', 8);
hold on;

% Позначимо нові точки
plot(Xnew(:,1), Xnew(:,2), 'ks', 'MarkerSize',10,'MarkerFaceColor','y');
legend('Клас 1','Клас 2','Нові точки');
title('Класифікація та групове розсіювання');
xlabel('X1'); ylabel('X2');

