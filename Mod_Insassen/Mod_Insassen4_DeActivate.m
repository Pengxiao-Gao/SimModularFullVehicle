%******************************************************************
%*            Institut für Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Diese Funktion aktiviert und deaktiviert das Modul Vorlage. Dabei wird 
% die Gesamtdimension um die Dimension des Moduls erweitert/ verringert. 
% Der Aufruf der Funktion erfolgt in der Hauptdatei über die Checkbox, über
% welche das Modul de- und aktiviert werden soll.
%
function Mod_Insassen4_DeActivate(~, ~)
% Parameterstruktur auslesen
Parameter = getappdata(gcf, 'Parameter');
% Den Parameter, der anzeigt ob das Modul aktiv ist verändern. 
Parameter.Mod_Insassen4.Aktiv = ~Parameter.Mod_Insassen4.Aktiv;
% Abfrage ob Modul aktiv ist
if Parameter.Mod_Insassen4.Aktiv
    % Korrektur Gesamtdimension
     % Zur Kontrolle werden die Indexwerte angezeigt
    disp('4.Insassen');
else

    disp('kein 4.Insassen');
    
    %% Zusäzlich Korrektur der Indizes der anderen Module erforderlich!

end
% Kontrollanzeige der Gesamtdimension und ob das Modul aktiv ist.
disp(Parameter.Mod_Insassen4.Aktiv)
%disp(Parameter.Gesamtdimension)
% Anhängen der veränderten Parameterstruktur an Figure
setappdata(gcf, 'Parameter', Parameter);

end