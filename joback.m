function [Tb, Tc, Pc] = joback()

% Dados de contribuição de grupos de Joback

Tb_CH3 = 23.58;
Tb_CH2 = 22.88;
Tb_OH  = 92.88;

Tc_CH3 = 0.0141;
Tc_CH2 = 0.0189;
Tc_OH  = 0.0741;

Pc_CH3 = -0.0012;
Pc_CH2 = 0;
Pc_OH  = 0.0112;

n = 9; % número de átomos

% Somatórios

sum_Tb = Tb_CH3 + Tb_CH2 + Tb_OH;
sum_Tc = Tc_CH3 + Tc_CH2 + Tc_OH;
sum_Pc = Pc_CH3 + Pc_CH2 + Pc_OH;

% Temperatura de Ebulição em Kelvin

Tb = 198.2 + sum_Tb;

% Temperatura Crítica em Kelvin

sum_Tc = Tc_CH3 + Tc_CH2 + Tc_OH;

Tc = Tb / (0.584 + 0.965*sum_Tc - (sum_Tc)^2);

% Pressão Crítica em bar

sum_Pc = Pc_CH3 + Pc_CH2 + Pc_OH;

Pc = (0.113 + 0.0032*n - sum_Pc)^(-2);

end

% Método de contribuição de grupos de Joback
%
% Fonte:
% Joback, K. G.; Reid, R. C.
% Estimation of Pure-Component Properties from Group-Contributions
% Chemical Engineering Communications, 57(1–6), 233–243 (1987)
% DOI: 10.1080/00986448708960487
