function [omega] = pitzer(Pr_sat)

% Fator Acêntrico

omega = -log10(Pr_sat) - 1;

end

% Fator acêntrico de Pitzer
%
% Fonte:
% Pitzer, K. S.; Lippmann, D. Z.; Curl, R. F.; Huggins, C. M.; Petersen, D. E.
% The volumetric and thermodynamic properties of fluids. II.
% Compressibility factor, vapor pressure and entropy of vaporization.
% J. Am. Chem. Soc., 77(13), 3433–3440 (1955)
% DOI: 10.1021/ja01618a002