function [Pr_sat] = antoine(Tc, Pc)

% Antoine é avaliada em Tr = 0.7
T_Antoine = 0.7 * Tc;

% Coeficientes de Antoine (NIST)

if T_Antoine <= 351.70

    A = 5.37229;
    B = 1670.409;
    C = -40.191;

elseif T_Antoine <= 366.63

    A = 5.24677;
    B = 1598.673;
    C = -46.424;

elseif T_Antoine <= 513.91

    A = 4.92531;
    B = 1432.526;
    C = -61.819;

else

    error('Temperatura fora da faixa da correlação de Antoine.');

end

log10_Psat = A - B/(T_Antoine + C);
Psat_bar = 10^(log10_Psat);
Pr_sat = Psat_bar/Pc;

end

% Coeficientes de Antoine para o Etanol
%
% Fonte:
% NIST Chemistry WebBook (SRD 69)
% National Institute of Standards and Technology
% https://webbook.nist.gov
%
% Dados compilados de:
% Ambrose et al., 1975
% Ambrose & Sprake, 1970
% Kretschmer & Wiebe, 1949
%
% Coeficientes calculados pelo NIST a partir dos dados dos autores.
% O NIST fornece diferentes coeficientes para diferentes faixas de temperatura. A correlação utilizada é selecionada baseada na temperatura de entrada.