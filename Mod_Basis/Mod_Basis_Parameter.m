%******************************************************************
%*            Institut fï¿½r Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Datei zur Definition der Parameter fï¿½r das Basismodul

%% Hauptparameter (haben alle Module)
Parameter.Mod_Basis.Aktiv = 1;
Parameter.Mod_Basis.Dimension = 20; 
Parameter.Mod_Basis.idx = [];

%% individuelle Modulparameter
%% Massen
% Aufbaumasse
Parameter.Mod_Basis.mA = 400; % in kg
% Radmasse vorne
Parameter.Mod_Basis.mRv = 40; % in kg
% Radmasse hinten
Parameter.Mod_Basis.mRh = 40; % in kg

% Vektoren der Wertebereiche, in denen die Massen variiert werden dï¿½rfen.
Parameter.Mod_Basis.mA_Lim = [100, 1500]; % in kg
Parameter.Mod_Basis.mRv_Lim = [10, 60]; % in kg
Parameter.Mod_Basis.mRh_Lim = [10, 60]; % in kg


%% Lï¿½ngen
% Radstand (default)
Parameter.Mod_Basis.l = 2.5; % in m
% Schwerpunktrï¿½cklage (default)
Parameter.Mod_Basis.lv = 1.25; % in m 
% Schwerpunktvorlage (default)
Parameter.Mod_Basis.lh = 1.25; %in m 
% Spurweite (default)
Parameter.Mod_Basis.s = 1.4; % in m 

% Vektoren der Wertebereiche, in denen die Lï¿½ngen variiert werden dï¿½rfen.
Parameter.Mod_Basis.s_Lim = [1, 1.8]; % in m
Parameter.Mod_Basis.l_Lim = [1.5, 4]; % in m
Parameter.Mod_Basis.lv_Lim = [0.2, 3.8]; % in m


%% Radradius (vorne und hinten gleich)
Parameter.Mod_Basis.rR = 0.3; % in m 

%% Trï¿½gheitsmomente
% Aufbau
Parameter.Mod_Basis.JxA = 65;
Parameter.Mod_Basis.JyA = 208;
% pro Rad
Parameter.Mod_Basis.J_Rv = 0.5*Parameter.Mod_Basis.mRv*(Parameter.Mod_Basis.rR)^2;
Parameter.Mod_Basis.J_Rh = 0.5*Parameter.Mod_Basis.mRh*(Parameter.Mod_Basis.rR)^2;

%%  Federsteifigkeiten
% Radsteifigkeit
Parameter.Mod_Basis.cR = 20000;  % in N/m, alle 4 Rï¿½der gleich
% Steifigkeit der Aufbaufedern an der Vorderachse
Parameter.Mod_Basis.cAv = 30000; % in N/m
% Steifigkeit der Aufbaufedern an der Hinterachse
Parameter.Mod_Basis.cAh = 30000; % in N/m

% Vektoren der Wertebereiche, in denen die Federsteifigkeiten variiert werden dï¿½rfen.
Parameter.Mod_Basis.cR_Lim = [10000, 200000]; % in N/m
Parameter.Mod_Basis.cAv_Lim = [10000, 60000]; % in N/m
Parameter.Mod_Basis.cAh_Lim = [10000, 60000]; % in N/m

%% Dï¿½mpferkonstanten
% Reifen hat vernachlï¿½ssigbar kleinen Dï¿½mpfungswert
Parameter.Mod_Basis.bR = 0; 
% Dï¿½mpferkonstante an der Vorderachse
Parameter.Mod_Basis.bAv = 2500; % in Ns/m
% Dï¿½mpferkonstante an der Hinterachse
Parameter.Mod_Basis.bAh = 2500; % in Ns/m

% Vektoren der Wertebereiche, in denen die Dï¿½mpferbeiwerte variiert werden dï¿½rfen.
Parameter.Mod_Basis.bAv_Lim = [1000, 5000]; % in Ns/m
Parameter.Mod_Basis.bAh_Lim = [1000, 5000]; % in Ns/m

%%  Weitere Parameter
% Erdbeschleunigung
Parameter.Mod_Basis.g = 9.81; %  in m/s^2

% Radlast vorne und hinten (default)
Parameter.Mod_Basis.Fz_v1 = 0.5*(Parameter.Mod_Basis.lh/Parameter.Mod_Basis.l)*Parameter.Mod_Basis.g*(2*Parameter.Mod_Basis.mRh+2*Parameter.Mod_Basis.mRv+Parameter.Mod_Basis.mA);
Parameter.Mod_Basis.Fz_v2 = 0.5*(Parameter.Mod_Basis.lh/Parameter.Mod_Basis.l)*Parameter.Mod_Basis.g*(2*Parameter.Mod_Basis.mRh+2*Parameter.Mod_Basis.mRv+Parameter.Mod_Basis.mA);
Parameter.Mod_Basis.Fz_h1 = 0.5*(Parameter.Mod_Basis.lv/Parameter.Mod_Basis.l)*Parameter.Mod_Basis.g*(2*Parameter.Mod_Basis.mRh+2*Parameter.Mod_Basis.mRv+Parameter.Mod_Basis.mA);
Parameter.Mod_Basis.Fz_h2 = 0.5*(Parameter.Mod_Basis.lv/Parameter.Mod_Basis.l)*Parameter.Mod_Basis.g*(2*Parameter.Mod_Basis.mRh+2*Parameter.Mod_Basis.mRv+Parameter.Mod_Basis.mA);

%% Integrationsintervall
% Startwert fï¿½r Integrationsintervall (default)
Parameter.Mod_Basis.tspan_min = 0; 
% Endwert fï¿½r Integrationsintervall (default)
Parameter.Mod_Basis.tspan_max = 20; 
% Schrittweite  fï¿½r Integration (default)
Parameter.Mod_Basis.tspan_Schritt = 0.01; 

%Vektoren der Wertebereiche, in denen das Intervall variiert werden duerfen
Parameter.Mod_Basis.tspan_min_Lim = [0, Parameter.Mod_Basis.tspan_max];
Parameter.Mod_Basis.tspan_max_Lim = [Parameter.Mod_Basis.tspan_min,40];
Parameter.Mod_Basis.tspan_Schritt_Lim = [0,1]; 

%% Solvereinstellungen festlegen 
% Solver (default)
Parameter.Mod_Basis.Solver = 'ode45'; 
% relative Toleranz (default)
Parameter.Mod_Basis.RelTol = 1e-3; 
% absolute Toleranz (default)
Parameter.Mod_Basis.AbsTol = 1e-6; 

%Vektoren der Wertebereiche, in denen die Toleranz variiert werden duerfen
Parameter.Mod_Basis.RelTol_Lim = [0, 1];
Parameter.Mod_Basis.AbsTol_Lim = [0, 1];

%% Standardgeschwindigkeit des Fahrzeugs
Parameter.Mod_Basis.v = 3;

% Vektor des Wertebereichs, in dem die Geschwindigkeit variiert werden dï¿½rfen.
Parameter.Mod_Basis.v_Lim = [0, 140]; % in m/s

%% Fahrstrecke
% Hï¿½he der Bordsteinkante (default)
Parameter.Mod_Basis.h = 0.05; % in m 

% des Winkels der Borsteinkante (default)
Parameter.Mod_Basis.alpha =45; % ?Winkel der Bodenwelle zum Fahrzeug 

% Vektoren der Wertebereiche, in denen die Hï¿½he der Bordsteinkante und
% der Winkel dazu variiert werden dï¿½rfen.
Parameter.Mod_Basis.h_Lim = [0, 0.5]; % in m
Parameter.Mod_Basis.alpha_Lim = [-90, 90]; % in m

% Variable zur Unterscheidung zwischen Landstrasse und Bordstein (default)
Parameter.Mod_Basis.Strecke = 'Bordsteinkante'; 

% St¨¹ckweises Polynom von Landstrassstreck berechnen
Parameter.Mod_Basis.ppLink = [];
Parameter.Mod_Basis.ppRecht = [];

%% Plot
% automatische Achsengrenzen ï¿½ï¿½
Parameter.Mod_Basis.Achsengrenzen = 1;

% Grenzen der X-Achse
Parameter.Mod_Basis.Xmin = 0;
Parameter.Mod_Basis.Xmax = 1;

%Grenze der Y-Achse
Parameter.Mod_Basis.Ymin = 0;
Parameter.Mod_Basis.Ymax = 1;

%die Grenzen dazu variiert werden duerfen
Parameter.Mod_Basis.Xmin_Lim = [-1000, 20];
Parameter.Mod_Basis.Xmax_Lim = [Parameter.Mod_Basis.Xmin, 1000];
Parameter.Mod_Basis.Ymin_Lim = [-1000, 20];
Parameter.Mod_Basis.Ymax_Lim = [Parameter.Mod_Basis.Ymin, 1000];

%Liste des Achsesauswahlï¿½ï¿½
Parameter.Mod_Basis.XAchse = {'Zeit','Auslenkung Aufbau','Nickwinkel',...
    'Wankwinkel'};
Parameter.Mod_Basis.YAchse = {'Vertikalauslenkung Aufbau','Vertikalgeschwindigkeit Aufbau',...
'Nickwinkel','Nickgeschwindigkeit','Wankwinkel','Wankgeschwindigkeit',...
'Auslenkung Motor','Vertikalgeschwindigkeit Motor','Auslenkung Fahrer','Vertikalgeschwindigkeit Fahrer'};