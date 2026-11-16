disp("Gráfico da Pressão de Saturação");

% Escolha do método

fprintf('Métodos disponíveis:\n');
fprintf('1 - Joback + Antoine + Pitzer\n');
fprintf('2 - Constantinou-Gani\n');
fprintf('3 - Dados Experimentais\n');

metodo = input('Escolha o método: ');

if metodo == 1

    [Tb, Tc, Pc] = joback();
    Pr_sat = antoine(Tc, Pc);
    omega = pitzer(Pr_sat);

elseif metodo == 2

    [Tb, Tc, Pc, omega] = constantinou_gani();

elseif metodo == 3

    [Tb, Tc, Pc, omega] = dados_experimentais();

else

    error("Método inválido.");

end

% Intervalo de temperaturas

Tgraf = 298:5:floor(Tc);

Psat = NaN(size(Tgraf));

% Chute inicial

Pchute = 1;

for i = 1:length(Tgraf)

    [Psat(i),~,~] = peng_robinson(Tgraf(i), Pchute, Tc, Pc, omega);

    Pchute = Psat(i);

end

figure

plot(Tgraf, Psat, 'b-', 'LineWidth', 2)

grid on
box on

xlabel('Temperatura (K)', 'Color', 'w')
ylabel('Pressão de Saturação (bar)', 'Color', 'w')
title('Curva de Pressão de Saturação', 'Color', 'w')

set(gca, 'Color', 'k')
set(gcf, 'Color', 'k')
set(gca, 'XColor', 'w', 'YColor', 'w')

xlim([298 515])