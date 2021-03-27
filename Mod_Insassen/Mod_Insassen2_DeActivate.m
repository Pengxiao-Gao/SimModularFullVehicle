%******************************************************************
%*            Institut f�r Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Diese Funktion aktiviert und deaktiviert das Modul Vorlage. Dabei wird 
% die Gesamtdimension um die Dimension des Moduls erweitert/ verringert. 
% Der Aufruf der Funktion erfolgt in der Hauptdatei �ber die Checkbox, �ber
% welche das Modul de- und aktiviert werden soll.
%
function Mod_Insassen2_DeActivate(~, ~)
% Parameterstruktur auslesen
Parameter = getappdata(gcf, 'Parameter');
% Den Parameter, der anzeigt ob das Modul aktiv ist ver�ndern. 
Parameter.Mod_Insassen2.Aktiv = ~Parameter.Mod_Insassen2.Aktiv;

% Abfrage ob Modul aktiv ist
if Parameter.Mod_Insassen2.Aktiv
    
    % Zur Kontrolle werden die Indexwerte angezeigt
    disp('2.Insassen');
else
    % Kontrollanzeige der Indexwerte
    disp('kein 2.Insassen');
    
    %% Zus�zlich Korrektur der Indizes der anderen Module erforderlich!

end
% Kontrollanzeige der Gesamtdimension und ob das Modul aktiv ist.
disp(Parameter.Mod_Insassen2.Aktiv)
%disp(Parameter.Gesamtdimension)
% Anh�ngen der ver�nderten Parameterstruktur an Figure
setappdata(gcf, 'Parameter', Parameter);

end