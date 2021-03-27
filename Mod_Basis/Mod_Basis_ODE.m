%******************************************************************
%*            Institut fï¿½r Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Diese Datei baut das GesamtDGL-System auf und beginnt mit den 
% Differentialgleichungen des Basismoduls. 

% Aufbau dieser Datei:
% 1. Anregung generieren (Erweiterung fï¿½r Landstraï¿½e!):
%   1.1 Abstand zwischen Rï¿½der und Bordsteinkante zum Startzeitpunkt
%   1.2 Vertikale Anregung der Rï¿½der auf Strecke bestimmen
% 2. Wirkende Krï¿½fte bestimmen
% 3. Differentialgleichungen 
% 4. Laden der Gleichungen aus den Zusatzmodulen

function [xi_p] = Mod_Basis_ODE (t,xi,Parameter)
%% 1. Anregung generieren 
if strcmp(Parameter.Mod_Basis.Strecke,'Bordsteinkante')
    % 1.1 Berechnung Abstand der einzelnen Rï¿½der zur Bordsteinkante zum 
    % Startzeitpunkt
    
    % Abstand Mittelachse des Fahrzeugs zur Bordsteinkante
    x_0 = 10; 

    % Abstand Bordsteinkante Rad vorne links
    x_vl = x_0+0.5*Parameter.Mod_Basis.s*cot(Parameter.Mod_Basis.alpha/180*pi); 
    % Abstand Bordsteinkante Rad vorne rechts 
    x_vr = x_0-0.5*Parameter.Mod_Basis.s*cot(Parameter.Mod_Basis.alpha/180*pi); 

    % Abstand Bordsteinkante Rad hinten links
    x_hl = x_vl+Parameter.Mod_Basis.l;
    % Abstand Bordsteinkante Rad hinten rechts
    x_hr = x_vr+Parameter.Mod_Basis.l; 

    % 1.2 Berechnung der vertikalen Anregung der Rï¿½der auf der Strecke
    % Berechnung aktueller Ort des Fahrzeugmittelpunktes auf Fahrstrecke
    x = Parameter.Mod_Basis.v*t; 
    % Anregungsauslenkung von Rad vorne links
    z_VL = Parameter.Mod_Basis.h*(nsign(x-x_vl)+1)/2;
    % Anregungsauslenkung von Rad vorne rechts
    z_VR = Parameter.Mod_Basis.h*(nsign(x-x_vr)+1)/2;
    % Anregungsauslenkung von Rad hinten links
    z_HL = Parameter.Mod_Basis.h*(nsign(x-x_hl)+1)/2; 
    % Anregungsauslenkung von Rad hinten rechts
    z_HR = Parameter.Mod_Basis.h*(nsign(x-x_hr)+1)/2; 

elseif strcmp(Parameter.Mod_Basis.Strecke,'Landstraße')
    % Hier Implementierung der Anregung der Landstraï¿½e
    % Berechnung aktueller Ort der Fahrzeughinterachse auf Fahrstrecke
    x_f = Parameter.Mod_Basis.v*t; 
    % aktuelle Ort des Rad vorne
    x_v = x_f+Parameter.Mod_Basis.l;
    % aktuelle Ort des Rad hinten
    x_h = x_f;
    
    
    % Interpolieren der Anregungsauslenkung von Rad vorne links
    z_VL = ppval(Parameter.Mod_Basis.ppLink,x_v);
     % Anregungsauslenkung von Rad vorne rechts
    z_VR = ppval(Parameter.Mod_Basis.ppRecht,x_v);
    % Anregungsauslenkung von Rad hinten links
    z_HL = ppval(Parameter.Mod_Basis.ppLink,x_h);
    % Anregungsauslenkung von Rad hinten rechts
    z_HR = ppval(Parameter.Mod_Basis.ppRecht,x_h); 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2. Wirkende Krï¿½fte bestimmen
% Kraefte zwischen Aufbau und Raeder berechnen
F2VL = Parameter.Mod_Basis.cAv*(-xi(7)+xi(3)+0.5*Parameter.Mod_Basis.s*sin(xi(4))-Parameter.Mod_Basis.lv*sin(xi(5)))...
    +Parameter.Mod_Basis.bAv*(-xi(17)+xi(13)+0.5*Parameter.Mod_Basis.s*xi(14)*cos(xi(4))-Parameter.Mod_Basis.lv*xi(15)*cos(xi(5)));

F2VR = Parameter.Mod_Basis.cAv*(-xi(8)+xi(3)-0.5*Parameter.Mod_Basis.s*sin(xi(4))-Parameter.Mod_Basis.lv*sin(xi(5)))...
    +Parameter.Mod_Basis.bAv*(-xi(18)+xi(13)-0.5*Parameter.Mod_Basis.s*xi(14)*cos(xi(4))-Parameter.Mod_Basis.lv*xi(15)*cos(xi(5)));

F2HL = Parameter.Mod_Basis.cAh*(-xi(9)+xi(3)+0.5*Parameter.Mod_Basis.s*sin(xi(4))+Parameter.Mod_Basis.lh*sin(xi(5)))...
    +Parameter.Mod_Basis.bAh*(-xi(19)+xi(13)+0.5*Parameter.Mod_Basis.s*xi(14)*cos(xi(4))+Parameter.Mod_Basis.lh*xi(15)*cos(xi(5)));

F2HR = Parameter.Mod_Basis.cAh*(-xi(10)+xi(3)-0.5*Parameter.Mod_Basis.s*sin(xi(4))+Parameter.Mod_Basis.lh*sin(xi(5)))...
    +Parameter.Mod_Basis.bAh*(-xi(20)+xi(13)-0.5*Parameter.Mod_Basis.s*xi(14)*cos(xi(4))+Parameter.Mod_Basis.lh*xi(15)*cos(xi(5)));

% Kraefte zwischen Raeder und Boden berechnen
F1VL = Parameter.Mod_Basis.cR*(xi(7)-z_VL);   
F1VR = Parameter.Mod_Basis.cR*(xi(8)-z_VR);  
F1HL = Parameter.Mod_Basis.cR*(xi(9)-z_HL);   
F1HR = Parameter.Mod_Basis.cR*(xi(10)-z_HR);  
% Kraefte zwischen Sitz und Aufbau berechnen

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3. Differentialgleichungen
% Gesamtdimension ODE System aus Struktur
xi_p = zeros(Parameter.Gesamtdimension,1);

% Aufstellen der Bewegungsgleichungen fï¿½r das Basismodul
% Aufbaugeschwindigkeit in x-Richtung
xi_p(1) = xi(11);  
% Aufbaugeschwindigkeit in y-Richtung
xi_p(2) = xi(12);  
% Aufbaugeschwindigkeit in z-Richtung
xi_p(3) = xi(13);  
% Wankwinkelgeschwindigkeit
xi_p(4) = xi(14);  
% Nickwinkelgeschwindigkeit
xi_p(5) = xi(15);  
% Gierwinkelgeschwindigkeit
xi_p(6) = xi(16);  
% Radgeschwindigkeit in z-Richtung vorne links
xi_p(7) = xi(17);  
% Radgeschwindigkeit in z-Richtung vorne rechts
xi_p(8) = xi(18);  
% Radgeschwindigkeit in z-Richtung hinten links
xi_p(9) = xi(19);  
% Radgeschwindigkeit in z-Richtung hinten rechts
xi_p(10) = xi(20); 

% Aufbaubeschleunigung in x-Richtung
xi_p(11) = 0;  
% Aufbaubeschleunigung in y-Richtung
xi_p(12) = 0;      
% Aufbaubeschleunigung in z-Richtung
xi_p(13) = (-F2VL-F2VR-F2HL-F2HR)/Parameter.Mod_Basis.mA;   
% Wankwinkelbeschleunigung                   
xi_p(14) = (-F2VL+F2VR-F2HL+F2HR)*0.5*Parameter.Mod_Basis.s/Parameter.Mod_Basis.JxA; 
% Nickwinkelbeschleunigung
xi_p(15) = -((-F2VL-F2VR)*Parameter.Mod_Basis.lv+(F2HL+F2HR)*Parameter.Mod_Basis.lh)/Parameter.Mod_Basis.JyA; 
% Gierwinkelbeschleunigung              
xi_p(16) = 0;                                   
% Radbeschleunigung in z-Richtung vorne links
xi_p(17) = (F2VL-F1VL)/Parameter.Mod_Basis.mRv;  
% Radbeschleunigung in z-Richtung vorne rechts        
xi_p(18) = (F2VR-F1VR)/Parameter.Mod_Basis.mRv;  
% Radbeschleunigung in z-Richtung hinten links        
xi_p(19) = (F2HL-F1HL)/Parameter.Mod_Basis.mRh;  
% Radbeschleunigung in z-Richtung hinten rechts        
xi_p(20) = (F2HR-F1HR)/Parameter.Mod_Basis.mRh;  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
%% 4. Laden der Gleichungen aus Zusatzmodulen
% Auslesen der vorhandenen Module
Module = getappdata(gcf, 'Module');
% Schleife ï¿½ber alle vorhandenen Module
for idx_Mod = 1:length(Module)
    % Auslesen Modulname
    Name = Module(idx_Mod).name;
    % Verhindern erneuter Aufruf ODE-Funktion Basismodul
    if strcmp(Name,'Mod_Basis'), continue; end
    % Aufruf Ode_Funktionen fï¿½r aktivierte Module
    if Parameter.(Name).Aktiv
        FunktionName = str2func([Name,'_ODE']);
        [xi_p] = FunktionName(xi_p,t,xi,Parameter);
    end
end
end