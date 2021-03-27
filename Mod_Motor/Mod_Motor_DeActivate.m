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
function Mod_Motor_DeActivate(~, ~)
% Parameterstruktur auslesen
Parameter = getappdata(gcf, 'Parameter');
% Den Parameter, der anzeigt ob das Modul aktiv ist verändern. 
Parameter.Mod_Motor.Aktiv = ~Parameter.Mod_Motor.Aktiv;
% Laden der Liste von Plot-Achse¸Ä
XAchse = findobj(gcf,'Tag','Main<Liste.AuswahlXAchse');
YAchse = findobj(gcf,'Tag','Main<Liste.AuswahlYAchse');
% Abfrage ob Modul aktiv ist
if (Parameter.Mod_Motor.Aktiv == 1)&&(Parameter.Mod_Insassen.Aktiv == 0)
    % Korrektur Gesamtdimension
    Parameter.Gesamtdimension = Parameter.Gesamtdimension+Parameter.Mod_Motor.Dimension;
    % Schreiben Wert für Indizes
    Parameter.Mod_Motor.idx = Parameter.Gesamtdimension-Parameter.Mod_Motor.Dimension+1:Parameter.Gesamtdimension;
    % Zur Kontrolle werden die Indexwerte angezeigt
    disp(Parameter.Mod_Insassen.idx);
    disp(Parameter.Mod_Motor.idx);
    % Aenderung der Liste von der Plot-Achse¸Ä
    XAchse.String = {'Zeit','Auslenkung Aufbau','Nickwinkel',...
    'Wankwinkel','Auslenkung Motor'};
    YAchse.String = {'Vertikalauslenkung Aufbau','Vertikalgeschwindigkeit Aufbau',...
'Nickwinkel','Nickgeschwindigkeit','Wankwinkel','Wankgeschwindigkeit',...
'Auslenkung Motor','Vertikalgeschwindigkeit Motor'};

elseif (Parameter.Mod_Motor.Aktiv == 1)&&(Parameter.Mod_Insassen.Aktiv == 1)
    % Korrektur Gesamtdimension¸Ä
    Parameter.Gesamtdimension = Parameter.Gesamtdimension+Parameter.Mod_Motor.Dimension;
    % Schreiben Wert für Indizes
    Parameter.Mod_Motor.idx = Parameter.Gesamtdimension-Parameter.Mod_Motor.Dimension+1:Parameter.Gesamtdimension;
    % Zur Kontrolle werden die Indexwerte angezeigt
    disp(Parameter.Mod_Insassen.idx);
    disp(Parameter.Mod_Motor.idx);
    % Aenderung der Liste von der Plot-Achse
    XAchse.String = {'Zeit','Auslenkung Aufbau','Nickwinkel',...
    'Wankwinkel','Auslenkung Motor','Auslenkung Fahrer','Auslenkung 2.Insassen',...
    'Auslenkung 3.Insassen','Auslenkung 4.Insassen'};
    YAchse.String = {'Vertikalauslenkung Aufbau','Vertikalgeschwindigkeit Aufbau',...
'Nickwinkel','Nickgeschwindigkeit','Wankwinkel','Wankgeschwindigkeit',...
'Auslenkung Motor','Vertikalgeschwindigkeit Motor','Auslenkung Fahrer','Vertikalgeschwindigkeit Fahrer',...
'Auslenkung 2.Insassen','Vertikalgeschwindigkeit 2.Insassen','Auslenkung 3.Insassen',...
'Vertikalgeschwindigkeit 3.Insassen','Auslenkung 4.Insassen','Vertikalgeschwindigkeit 4.Insassen'};

elseif (Parameter.Mod_Motor.Aktiv == 0)&&(Parameter.Mod_Insassen.Aktiv == 1)
    % Reduktion der Gesamtdimension um Moduldimension
    Parameter.Gesamtdimension = Parameter.Gesamtdimension-Parameter.Mod_Motor.Dimension;
    % Index des Moduls wird gelöscht
    Parameter.Mod_Motor.idx = [];
    % Kontrollanzeige der Indexwerte
    disp(Parameter.Mod_Insassen.idx);
    disp(Parameter.Mod_Motor.idx);
    % Aenderung der Liste von der Plot-Achse
    XAchse.String = {'Zeit','Auslenkung Aufbau','Nickwinkel',...
    'Wankwinkel','Auslenkung Fahrer','Auslenkung 2.Insassen',...
    'Auslenkung 3.Insassen','Auslenkung 4.Insassen'};
    YAchse.String = {'Vertikalauslenkung Aufbau','Vertikalgeschwindigkeit Aufbau',...
'Nickwinkel','Nickgeschwindigkeit','Wankwinkel','Wankgeschwindigkeit',...
'Auslenkung Fahrer','Vertikalgeschwindigkeit Fahrer',...
'Auslenkung 2.Insassen','Vertikalgeschwindigkeit 2.Insassen','Auslenkung 3.Insassen',...
'Vertikalgeschwindigkeit 3.Insassen','Auslenkung 4.Insassen','Vertikalgeschwindigkeit 4.Insassen'};

else
    % Reduktion der Gesamtdimension um Moduldimension
    Parameter.Gesamtdimension = Parameter.Gesamtdimension-Parameter.Mod_Motor.Dimension;
    % Index des Moduls wird gelöscht
    Parameter.Mod_Motor.idx = [];
    % Kontrollanzeige der Indexwerte
    disp(Parameter.Mod_Insassen.idx);
    disp(Parameter.Mod_Motor.idx);
    % Aenderung der Liste von der Plot-Achse
    XAchse.String = {'Zeit','Auslenkung Aufbau','Nickwinkel',...
    'Wankwinkel'};
    YAchse.String = {'Vertikalauslenkung Aufbau','Vertikalgeschwindigkeit Aufbau',...
'Nickwinkel','Nickgeschwindigkeit','Wankwinkel','Wankgeschwindigkeit'};
    
    %% Zusäzlich Korrektur der Indizes der anderen Module erforderlich!

end
% Kontrollanzeige der Gesamtdimension und ob das Modul aktiv ist.
disp(Parameter.Mod_Motor.Aktiv)
disp(Parameter.Gesamtdimension)
% Anhängen der veränderten Parameterstruktur an Figure
setappdata(gcf, 'Parameter', Parameter);

end