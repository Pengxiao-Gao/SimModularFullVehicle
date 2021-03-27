%******************************************************************
%*            Institut f�r Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Callbackfunktion zur Liste, in der die Fahrstrecke ausgew�hlt wird.
% Hier erfolgt die Auswahl der Strecke, mit der die Simulation durchgef�hrt
% werden soll. Die Bordsteinkante ist gegeben, die Landstra�e muss implementiert werden.

function AuswahlStrecke(hObject, ~) 
% Laden der Struktur
Parameter = getappdata(gcf,'Parameter');
% Auslesen des Wertes (Value) des aufrufenden Objektes
Val = get(hObject,'Value');

% Laden eines Panels zur Strukturierung von Tab1. Bei Auswahl der
% Landstra�e k�nnen Einstellungsfelder f�r Bordstein unsichtbar werden.
Panel_Bordstein = findobj(gcf,'Tag','Main<Panel.Bordstein');

%% Unterscheidug ob Bordsteinkante oder Landstra�e
if Val == 1
    % Zustandparameter von Strecke setzen
    Parameter.Mod_Basis.Strecke = 'Bordsteinkante';
    
    % Erweiterung der GUI f�r Einstellungen zum Bordstein 
    Panel_Bordstein.Visible = 'on';
    
    % R�ckmeldung im Command Window
    disp('Auswahl der Bordsteinkante');
else
     % Zustandparameter von Strecke setzen
    Parameter.Mod_Basis.Strecke = 'Landstra�e';
    % Erweiterung der GUI f�r Einstellungen zum Bordstein 
    Panel_Bordstein.Visible = 'off';
    % R�ckmeldung im Command Window
    disp('Auswahl der Landstra�e');
    load Landstrasse.mat;
    Parameter.Mod_Basis.ppLink = interp1(x,z_linkeSpur,'spline','pp');
    Parameter.Mod_Basis.ppRecht = interp1(x,z_rechteSpur,'spline','pp');

end
% Struktur nach �nderungen an Figure anh�ngen
setappdata(gcf,'Parameter',Parameter);
end