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
Parameter.Mod_Motor.Aktiv = 0;
Parameter.Mod_Motor.Dimension = 2; % entspricht 1 Gleichung 2. Ordnung
Parameter.Mod_Motor.idx = [];


%% individuelle Modulparameter
%Federsteifigkeit zwischen Aufbau und Motormasse
Parameter.Mod_Motor.cm = 30000 % in N/m
Parameter.Mod_Motor.cm_Lim = [500, 130000]; % in N/m
%Daempferkonstanten
Parameter.Mod_Motor.bm = 1500 % in Ns/m
Parameter.Mod_Motor.bm_Lim = [50, 2500]; % in Ns/m
%Motormasse
Parameter.Mod_Motor.Mm = 280 % in kg 100-360
Parameter.Mod_Motor.Mm_Lim = [100, 360]; % in kg
%% Anbindungspunkte 
% Läng
Parameter.Mod_Motor.l1xl = 1.3; %in m
Parameter.Mod_Motor.l1xl_Lim = [0.8,1.8]; %in m
Parameter.Mod_Motor.l2xl = 0.3;
Parameter.Mod_Motor.l2xl_Lim = [0,1];
Parameter.Mod_Motor.l2yl = 0.3;
Parameter.Mod_Motor.l2yl_Lim = [0,0.6];
Parameter.Mod_Motor.l3yl = 0.3
Parameter.Mod_Motor.l3yl_Lim = [0,0.6];
% Quer
Parameter.Mod_Motor.l1xq = 0.4;
Parameter.Mod_Motor.l1xq_Lim = [0,0.8];
Parameter.Mod_Motor.l1yq = 0.7;
Parameter.Mod_Motor.l1yq_Lim = [0,1.8];

Parameter.Mod_Motor.l2xq = 0.7;
Parameter.Mod_Motor.l2xq_Lim = [0,1.8];

Parameter.Mod_Motor.l2yq = 0.3;
Parameter.Mod_Motor.l2yq_Lim = [0,1.8];

Parameter.Mod_Motor.l3xq = 0.1;
Parameter.Mod_Motor.l3yq_Lim = [0,1];
%  Motordrehzahl
Parameter.Mod_Motor.U = 3000;
Parameter.Mod_Motor.U_Lim = [0,6000];

Parameter.Mod_Motor.Auslegung = 'Längsauslegung';




