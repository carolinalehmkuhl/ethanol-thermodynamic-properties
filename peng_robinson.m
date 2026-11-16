function [P,tolE,iter,monofasica] = peng_robinson(T, P, Tc, Pc, omega,printar=false)

status = "Convergiu corretamente";
monofasica = false;

% Constante Universal dos Gases em (bar.L)/(mol.K)

R = 0.08314;

% Parâmetros de Peng-Robinson

Tr = T/Tc;

kappa = 0.37464 + 1.54226*omega - 0.26992*omega^2;

alpha = (1 + kappa*(1 - sqrt(Tr)))^2;

a = 0.45724*(R^2)*(Tc^2)/Pc*alpha;

b = 0.07780*R*Tc/Pc;

% Iteração

erro = 1;
iter = 0;
tolE = 1e-4;
tolZ = 1e-6;

while erro > tolE

    iter = iter + 1;

    % Calcular A e B

    A = a*P/(R^2*T^2);
    B = b*P/(R*T);

   % Resolver a Equação Cúbica
   
coef = [1 ...
       -(1-B) ...
        (A - 3*B^2 - 2*B) ...
       -(A*B - B^2 - B^3)];

Zall = roots(coef);

    % Manipulação dos dados de Z
    
Zreal = real(Zall(abs(imag(Zall)) < 1e-6));

nZ = length(Zreal);

    % Detecção da região

if nZ == 0
    error("Nenhuma raiz real encontrada para Z");

elseif nZ == 1
    Z = Zreal(1);
    ZL = Z;
    ZV = Z;
    monofasica = true;
    status = "Região monofásica ou supercrítica";
    break

elseif nZ == 2
    ZL = min(Zreal);
    ZV = max(Zreal);
    break

elseif nZ == 3
    ZL = min(Zreal);
    ZV = max(Zreal);

    if abs(ZV - ZL) < tolZ
        break
    end
end

    % Fugacidade do vapor

    ln_fV_P = (ZV - 1) ...
             - log(ZV - B) ...
             - (A/(2*sqrt(2)*B))* ...
               log((ZV + (1+sqrt(2))*B) / ...
                   (ZV + (1-sqrt(2))*B));

    fV = P*exp(ln_fV_P);

    % Fugacidade do liquido

    ln_fL_P = (ZL - 1) ...
             - log(ZL - B) ...
             - (A/(2*sqrt(2)*B))* ...
               log((ZL + (1+sqrt(2))*B) / ...
                   (ZL + (1-sqrt(2))*B));

    fL = P*exp(ln_fL_P);

    % Calcular erro

    erro = abs(fL/fV - 1);

if printar==true
    
    % Mostrar resultados da iteração

    fprintf('Iteração %d\n',iter);
    fprintf('P = %.6f bar\n',P);
    fprintf('ZL = %.6f\n',ZL);
    fprintf('ZV = %.6f\n',ZV);
    fprintf('fL = %.6f\n',fL);
    fprintf('fV = %.6f\n',fV);
    fprintf('Erro = %.8f\n\n',erro);

end

    % Atualizar pressão

    P = P*(fL/fV);

    % Parada de segurança

    if iter > 100
        status = "Falha de convergência (número máximo de iterações atingido)";
        break
    end

end

if printar==true

fprintf("\nStatus final\n");
disp(status);

end

% Equação cúbica de Peng-Robinson em função de Z
%
% Fonte:
% Peng, D. Y.; Robinson, D. B.
% A new two-constant equation of state
% Ind. Eng. Chem. Fundam., 15(1), 59–64 (1976)
% DOI: 10.1021/i160057a011