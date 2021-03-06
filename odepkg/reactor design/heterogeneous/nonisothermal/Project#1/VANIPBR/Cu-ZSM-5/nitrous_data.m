% Universidade Federal de Santa Catarina - UFSC
%-------------------------------------------------------------------------%
%------------ NONISOTHERMAL HETEROGENEOUS PACKED-BED REACTOR -------------%
%--------- with catalyst density change in the axial direction -----------%
%-------------------------------------------------------------------------%
%----------------------------- General Data ------------------------------%
%-------------------------------------------------------------------------%
% INITIAL/FINAL CONDITIONS:
zo = 0.0;           % m
zf = 0.1;           % m
Xo = 0;             % dimensionless
Xf = 1;             % dimensionless
yo = 1;             % dimensionless
Wo = 0;             % kg
Po = 1;             % bar
To = 620+273.15;    % K
Ta = To-10;         % K
% STOICHIOMETRY:
a = 1;              % N2O
b = 0;              % -
c = 1;              % N2
d = 1/2;            % O2
% MOLECULAR WEIGHTS:
MMa = 44e-3;        % kg/mol N2O
MMb = 0;            % kg/mol -
MMc = 28e-3;        % kg/mol N2
MMd = 32e-3;        % kg/mol O2
MMI = 4.02e-3;      % kg/mol He
% FEED CONDITIONS:
Qo = 1e-6;          % m3/s
Pao = 0.010;        % bar
Pbo = 0;            % bar
Pco = 0;            % bar
Pdo = 0.000;        % bar
PIo = Po-Pao-Pdo;   % bar
% REACTION DATA:
R = 8.314;          % J/mol.K
dHr = -81500;       % J/mol
%---Co-ZSM-5
%     ko = 1.7e3;     % mol/s.bar.kg                
%     Ea = 104000;    % J/mol
%     K = 4.5;        % dimensionless
%---Cu-ZSM-5
    ko = 2.04e3;    % mol/s.bar.kg                
    Ea = 136000;    % J/mol
    K1 = 413;       % /bar
    K2 = 363;       % /bar
%---Fe-ZSM-5
%     ko = 98e3;      % mol/s.bar.kg                
%     Ea = 168000;    % J/mol
%     K = 14;         % dimensionless
% REACTOR VESSEL:
Do = 0.005;         % m
Df = 0.010;         % m
DDo = Do*1.5;       % m
DDf = Df*1.5;       % m
L = 0.002;          % m
condw = 230;        % W/m.K
% CATALYST PELLETS:
phi = 1;            % sphericity
dp = 0.000150;      % m
pc = 3220;          % kg/m3

%-------------------------------------------------------------------------%
%------------------------ Preliminary Calculations -----------------------%
%-------------------------------------------------------------------------%
% Initial Molar Fraction
yao = Pao/Po;       
ybo = Pbo/Po;
yco = Pco/Po;
ydo = Pdo/Po;
yIo = PIo/Po;
% Initial Pressure Ratio
thetaa = Pao/Pao;
thetab = Pbo/Pao;
thetac = Pco/Pao;
thetad = Pdo/Pao;
thetaI = PIo/Pao;
% Initial Concentration
Cao = 10^5*Pao/(R*To);      % mol/m3
Cbo = 10^5*Pbo/(R*To);      % mol/m3
Cco = 10^5*Pco/(R*To);      % mol/m3
Cdo = 10^5*Pdo/(R*To);      % mol/m3
CIo = 10^5*PIo/(R*To);      % mol/m3
% Initial Molar Flow rate
Fao = Cao*Qo;               % mol/s
Fbo = Cbo*Qo;               % mol/s
Fco = Cco*Qo;               % mol/s
Fdo = Cdo*Qo;               % mol/s
FIo = CIo*Qo;               % mol/s
% Initial Mass Flow rate
mao = Fao*MMa;              % kg/s
mbo = Fbo*MMb;              % kg/s
mco = Fco*MMc;              % kg/s
mdo = Fdo*MMd;              % kg/s
mIo = FIo*MMI;              % kg/s
% Initial Total Molar Flow rate
Fto = Fao + Fbo + Fco + Fdo + FIo;
% Initial Total Mass Flow rate
mto = mao + mbo + mco + mdo + mIo;
% Expansion Coefficient 
delta = (d+c-b-a)/a;
e = yao*delta;
