%******************************************************************
%*            Institut für Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
% 
% In dieser Datei werden alle Modulparameter definiert. Sie werden direkt
% in eine Struktur geschrieben (siehe Hinweis zu der Datenstruktur und
% Gliederung in der Hauptdatei). Der Aufruf der Parameterdatei und damit 
% das Laden der Parameter erfolgt in der Hauptdatei am Ende von Abschnitt 2
% über folgenden Programmcode:
% 
% for idx = 1:length(Module)
%     Load_Par = str2func([Module(idx).name,'_Parameter']);
%     Load_Par();
% end
%
% Die Verwendung einer Schleife automatisiert das Laden mehrerer
% Modulparameterdateien. Hierfür muss nur der Modulordner mit der
% Parameterdateien vorhanden sein.
% 
%% Hauptparameter (haben alle Module)
Parameter.Mod_Insassen.Aktiv = 0;
Parameter.Mod_Insassen.Dimension = 8; % entspricht 1 Gleichung 2. Ordnung
Parameter.Mod_Insassen.idx = [];


%% individuelle Modulparameter
% Fahrer
%Fahrermasse
Parameter.Mod_Insassen.mf = 75 % in kN
Parameter.Mod_Insassen.mf_Lim = [40, 100]; % in kN/m
%Fahrerabstand X-Richtung
Parameter.Mod_Insassen.af = 0.7 % in m
Parameter.Mod_Insassen.af_Lim = [0.5, 0.9]; % in m
%Fahrerabstand Y-Richtung
Parameter.Mod_Insassen.bf = 0.7 % in m 0.2-0.45
Parameter.Mod_Insassen.bf_Lim = [0.6,2]; % in m

%2. Insasse
%Insassemasse
Parameter.Mod_Insassen.m2 = 75 % in kg 100-360
Parameter.Mod_Insassen.m2_Lim = [10,100]; % in kg
%Insassen2abstand X-Richtung
Parameter.Mod_Insassen.a2 = 0.7 % in Ns/m
Parameter.Mod_Insassen.a2_Lim = [0.5, 0.9]; % in m
%Insassen2abstand Y-Richtung
Parameter.Mod_Insassen.b2 = 0.7 % in m 0.2-0.45
Parameter.Mod_Insassen.b2_Lim = [0.6,2]; % in m

%3. Insasse
%Insassemasse
Parameter.Mod_Insassen.m3 = 75 % in kg 100-360
Parameter.Mod_Insassen.m3_Lim = [10,100]; % in kg
%Insassen3abstand X-Richtung
Parameter.Mod_Insassen.a3 = 0.7 % in Ns/m
Parameter.Mod_Insassen.a3_Lim = [0.5, 0.9]; % in Ns/m
%Insassen3abstand Y-Richtung
Parameter.Mod_Insassen.b3 = 0.7 % in m 0.2-0.45
Parameter.Mod_Insassen.b3_Lim = [0.6,2]; % in m

%4. Insasse
%Insassemasse
Parameter.Mod_Insassen.m4 = 75 % in kg 100-360
Parameter.Mod_Insassen.m4_Lim = [10,100]; % in kg
%Insassen4abstand X-Richtung
Parameter.Mod_Insassen.a4 = 0.7 % in Ns/m
Parameter.Mod_Insassen.a4_Lim = [0.5, 0.9]; % in Ns/m
%Insassen4abstand Y-Richtung
Parameter.Mod_Insassen.b4 = 0.7 % in m 0.2-0.45
Parameter.Mod_Insassen.b4_Lim = [0.6,2]; % in m

% Federstiefigkeit und Dämpferkonstante der Sitz
% Steifigkeit
Parameter.Mod_Insassen.ci = 10000% in N/m
Parameter.Mod_Insassen.ci_Lim = [5000,20000]; % in N/m
% Dämpferkonstante
Parameter.Mod_Insassen.bi = 2500; % in Ns/m
Parameter.Mod_Insassen.bi_Lim = [1000, 50000]; % in Ns/m

Parameter.Mod_Insassen2.Aktiv  = 0 ;
Parameter.Mod_Insassen3.Aktiv  = 0 ;
Parameter.Mod_Insassen4.Aktiv  = 0 ;








