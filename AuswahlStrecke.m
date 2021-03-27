%******************************************************************
%*            Institut für Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Callbackfunktion zur Liste, in der die Fahrstrecke ausgewählt wird.
% Hier erfolgt die Auswahl der Strecke, mit der die Simulation durchgeführt
% werden soll. Die Bordsteinkante ist gegeben, die Landstraße muss implementiert werden.

function AuswahlStrecke(hObject, ~) 
% Laden der Struktur
Parameter = getappdata(gcf,'Parameter');
% Auslesen des Wertes (Value) des aufrufenden Objektes
Val = get(hObject,'Value');

% Laden eines Panels zur Strukturierung von Tab1. Bei Auswahl der
% Landstraße können Einstellungsfelder für Bordstein unsichtbar werden.
Panel_Bordstein = findobj(gcf,'Tag','Main<Panel.Bordstein');

%% Unterscheidug ob Bordsteinkante oder Landstraße
if Val == 1
    % Zustandparameter von Strecke setzen
    Parameter.Mod_Basis.Strecke = 'Bordsteinkante';
    
    % Erweiterung der GUI für Einstellungen zum Bordstein 
    Panel_Bordstein.Visible = 'on';
    
    % Rückmeldung im Command Window
    disp('Auswahl der Bordsteinkante');
else
     % Zustandparameter von Strecke setzen
    Parameter.Mod_Basis.Strecke = 'Landstraße';
    % Erweiterung der GUI für Einstellungen zum Bordstein 
    Panel_Bordstein.Visible = 'off';
    % Rückmeldung im Command Window
    disp('Auswahl der Landstraße');
    load Landstrasse.mat;
    Parameter.Mod_Basis.ppLink = interp1(x,z_linkeSpur,'spline','pp');
    Parameter.Mod_Basis.ppRecht = interp1(x,z_rechteSpur,'spline','pp');

end
% Struktur nach Änderungen an Figure anhängen
setappdata(gcf,'Parameter',Parameter);
end