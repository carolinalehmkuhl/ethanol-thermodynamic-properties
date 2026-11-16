# Ethanol Thermodynamic Properties and Vapor Pressure

A thermodynamic project developed in GNU Octave as part of the *Thermodynamics for Chemical Engineering I* course (2026/1) at the Federal University of Santa Catarina (UFSC), Brazil.

The project addresses two objectives of an academic assignment:

1. Estimate the critical temperature, critical pressure, and acentric factor of ethanol using **at least** two methods.
2. Develop a program to calculate ethanol vapor pressure using the Peng–Robinson equation of state.

The project also calculates the normal boiling temperature and compares estimated properties with experimental data.

## Methods

### 1. Joback + Antoine + Pitzer

This approach combines three methods:

- **Joback method:** estimates the normal boiling temperature, critical temperature, and critical pressure using group contributions.
- **Antoine equation:** estimates the reduced saturation pressure at (T = 0.7T_c), using temperature-dependent coefficients.
- **Pitzer correlation:** calculates the acentric factor from the reduced saturation pressure.

The Antoine coefficients used in the implementation are obtained from the NIST Chemistry WebBook.

### 2. Constantinou–Gani

The Constantinou–Gani group contribution method is used to estimate:

- Normal boiling temperature.
- Critical temperature.
- Critical pressure.
- Acentric factor.

### 3. Experimental Data

Experimental properties of ethanol are included as a reference for comparison with the estimated values.

### 4. Peng–Robinson Equation of State

The Peng–Robinson equation of state is implemented to calculate ethanol saturation pressure at a specified temperature.

The calculation uses an iterative procedure based on the equality of liquid and vapor fugacities.

## Project Structure

The project consists of three main scripts and supporting functions.

| File | Description |
|---|---|
| `calculo_da_Psat.m` | Calculates ethanol saturation pressure at a user-defined temperature. |
| `grafico.m` | Generates the saturation pressure versus temperature plot. |
| `comparacao_metodos.m` | Compares the estimated properties with experimental data and calculates percentage errors. |
| `joback.m` | Calculates properties using the Joback method. |
| `antoine.m` | Calculates reduced saturation pressure using the Antoine equation. |
| `pitzer.m` | Calculates the acentric factor using the Pitzer correlation. |
| `constantinou_gani.m` | Calculates properties using the Constantinou–Gani method. |
| `dados_experimentais.m` | Provides experimental properties of ethanol. |
| `peng_robinson.m` | Implements the Peng–Robinson equation of state and the iterative saturation pressure calculation. |
| `props_jap.m` | Organizes the properties obtained from Joback, Antoine, and Pitzer into a structure. |
| `props_constantinou_gani.m` | Organizes the properties obtained from Constantinou–Gani into a structure. |
| `props_dados_experimentais.m` | Organizes the experimental properties into a structure. |

## Requirements

- GNU Octave.

No additional packages or external libraries are required.

## How to Run

1. Download or clone this repository.
2. Open GNU Octave.
3. Set the working directory to the project folder.
4. Run one of the main scripts.

**Calculate saturation pressure:**

```octave
calculo_da_Psat
```

The program requests:
- Temperature in Kelvin.
- Initial pressure estimate in bar.
- The method to be used.

**Generate the saturation pressure plot:**

```octave
grafico
```

Select one of the three available property datasets to generate the curve.

**Compare the methods:**

```octave
comparacao_metodos
```

Displays a comparison of the estimated properties and their percentage errors relative to experimental data.

## References

- Joback, K. G.; Reid, R. C. (1987). Estimation of Pure-Component Properties from Group-Contributions. *Chemical Engineering Communications*, 57(1–6), 233–243. https://doi.org/10.1080/00986448708960487

- Constantinou, L.; Gani, R. (1994). New group contribution method for estimating properties of pure compounds. *AIChE Journal*, 40(10), 1697–1710. https://doi.org/10.1002/aic.690401011

- Constantinou, L.; Gani, R.; O'Connell, J. P. (1995). Estimation of the acentric factor and the liquid molar volume at 298 K using a new group contribution method. *Fluid Phase Equilibria*, 103(1), 11–22. https://doi.org/10.1016/0378-3812(94)02593-P

- Peng, D. Y.; Robinson, D. B. (1976). A new two-constant equation of state. *Industrial & Engineering Chemistry Fundamentals*, 15(1), 59–64. https://doi.org/10.1021/i160057a011

- National Institute of Standards and Technology (NIST). *NIST Chemistry WebBook – Ethanol*. https://webbook.nist.gov

- Pitzer, K. S. et al. (1955). The volumetric and thermodynamic properties of fluids. II. Compressibility factor, vapor pressure and entropy of vaporization. *Journal of the American Chemical Society*, 77(13), 3433–3440. https://doi.org/10.1021/ja01618a002
