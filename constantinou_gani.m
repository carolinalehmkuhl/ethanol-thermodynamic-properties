function [Tb, Tc, Pc, omega] = constantinou_gani()

% Dados de contribuição de grupos de Constantinou-Gani

Tb_CH3 = 0.8894;
Tb_CH2 = 0.9225;
Tb_OH  = 3.2152;

Tc_CH3 = 1.6781;
Tc_CH2 = 3.4920;
Tc_OH  = 9.7292;

Pc_CH3 = 0.019904;
Pc_CH2 = 0.010558;
Pc_OH  = 0.005148;

w_CH3 = 0.29602;
w_CH2 = 0.14691;
w_OH = 1.52370;

% Somatórios

sum_Tb = Tb_CH3 + Tb_CH2 + Tb_OH;
sum_Tc = Tc_CH3 + Tc_CH2 + Tc_OH;
sum_Pc = Pc_CH3 + Pc_CH2 + Pc_OH;
sum_w = w_CH3 + w_CH2 + w_OH;

% Temperatura de Ebulição em Kelvin

Tb = 204.359*log(sum_Tb);

% Temperatura Crítica em Kelvin

Tc = 181.128*log(sum_Tc);

% Pressão Crítica em bar

Pc = 1.3705 + 1/((sum_Pc + 0.10022)^2);

% Fator Acêntrico

omega = 0.4085*(log(sum_w + 1.1507))^(1/0.505);

end

% Método de contribuição de grupos de Constantinou-Gani
%
% Fonte (Tb, Tc e Pc):
% Constantinou, L.; Gani, R.
% New group contribution method for estimating properties of pure compounds
% AIChE Journal, 40(10), 1697–1710 (1994)
% https://doi.org/10.1002/aic.690401011
%
% Fonte (omega):
% Constantinou, L.; Gani, R.; O'Connell, J. P.
% Estimation of the acentric factor and the liquid molar volume at 298 K using a new group contribution method
% Fluid Phase Equilibria, 103(1), 11–22 (1995)
% https://doi.org/10.1016/0378-3812(94)02593-P
