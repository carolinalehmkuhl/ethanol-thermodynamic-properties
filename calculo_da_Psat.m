clc;
clear;

% Cálculo da Pressão de Saturação

% Entrada de dados

T = input("Digite a temperatura em Kelvin: ");
Pchute = input("Digite a pressão em bar: ");

% Escolha do método

fprintf('Métodos disponíveis:\n');
fprintf('1 - Joback + Antoine + Pitzer\n');
fprintf('2 - Constantinou-Gani\n');
fprintf('3 - Dados Experimentais\n');


metodo = input('Escolha o método: ');

if metodo == 1

    % Propriedades críticas - Joback
    
    [Tb, Tc, Pc] = joback();

    % Pressão reduzida de saturação - Antoine
    
    Pr_sat = antoine(Tc,Pc);

    % Fator acêntrico - Pitzer
    
    omega = pitzer(Pr_sat);

elseif metodo == 2

    % Propriedades críticas e fator acêntrico - Constantinou-Gani
    
    [Tb, Tc, Pc, omega] = constantinou_gani();
    
elseif metodo == 3

    % Propriedades críticas e fator acêntrico - Dados Experimentais

    [Tb,Tc,Pc,omega] = dados_experimentais();    
    
else

    error('Método inválido.');    

end

    % Checagem de região
    
if T >= Tc
    fprintf('\n');
    disp("Região supercrítica detectada.");
    disp("Não há pressão de saturação definida.");
elseif
    
    % Pressão de saturação - Peng-Robinson
    
    [Pfinal, tolE, iter, monofasica] = peng_robinson(T, Pchute, Tc, Pc, omega, true);
end

% Impressão dos resultados

fprintf('\n');
fprintf('Propriedades Críticas do Etanol\n');
fprintf('Temperatura Crítica = %.2f K\n',Tc);
fprintf('Pressão Crítica = %.2f bar\n',Pc);
fprintf('Fator Acêntrico = %.4f \n',omega);
fprintf('\n');

if T < Tc && ~monofasica
    fprintf('Temperatura de entrada = %.2f K\n', T);
    fprintf('Pressão de vapor = %.2f bar\n', Pfinal);
    fprintf('\n');
    fprintf('Tolerância = %.2f %%\n', tolE*100);
    fprintf('Iterações = %d\n', iter);
    fprintf('\n');
end