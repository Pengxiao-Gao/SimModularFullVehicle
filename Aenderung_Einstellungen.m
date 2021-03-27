%******************************************************************
%*            Institut für Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Funktion zur Änderung der Parameter und Einstellungen des Basismoduls.
%
% Aufbau dieser Datei
% 1. Laden der erforderlichen Daten 
% 2. Abfrage welches Element die Funktion aufgerufen hat und laden der
%    jeweilige Begrenzung des Parameters der geändert werden soll.
% 3. Abfrage ob Eingabe innerhalb der Grenzen des jeweiligen Parameters
%    liegt und ggf. Änderung des Parameters


function Aenderung_Einstellungen (hObject,~)
%% 1. Laden der Struktur und des Wertes in dem Editfeld
Parameter = getappdata(gcf,'Parameter');
Param = str2double(get(hObject,'String'));

%% 2. Abfrage welches Element die Funktion aufgerufen hat 
% Abfrage nach dem Tag-Property des Editfeldes, um auf die Richtige
% Variable zuzugreifen. 
% Siehe Hinweis zum Zugriff auf angelegte GUI-Elemente in Hauptdatei
% Es wird hier der vierte Teil des Tags verwendet.Die Abfrage sucht
% nach dem Trennzeichen - und verwendet den String, der danach folgt.
TagStr = hObject.Tag(strfind(hObject.Tag,'-')+1:end);

% Abfrage nach der Modulzugehörigkeit, um auf die richtige Variable
% zuzugreifen
ModStr = hObject.Tag(1:(strfind(hObject.Tag,'<')-1));

% Jeder Parameter ist in einem gewissen Intervall limitiert (Siehe 
% Parameterdatei) . Es folgt die Abfrage, ob der eingegebene Wert in dem
% für diesen Parameter festgelegten Intervall liegt.
% Hierfür wird zuerst der Vektor mit dem Intervall geladen.
% Es wird hier wieder ein Teil des Tags verwendet um den vollständigen
% Variablennamen für den Lim-Vektor zu generieren. 
Limits = Parameter.(ModStr).([TagStr,'_Lim']);

%% 3. Abfrage ob Eingabe innerhalb der Grenzen des jeweiligen Parameters
%     liegt und ggf. Änderung des Parameters
if Param > Limits(2)
    
    % Ist Eingabe zu groß, so wird aktueller Wert angezeigt
    set(hObject,'String',Parameter.(ModStr).(TagStr));
    
    % Rückmeldung im Command Window
    disp('Eingabe zu groß');
    
elseif Param < Limits(1)
    
    % Ist Eingabe zu klein, so wird aktueller Wert angezeigt
    set(hObject,'String',Parameter.(ModStr).(TagStr));
    
    % Rückmeldung im Command Window
    disp('Eingabe zu klein');
    
else
% ist die Eingabe im akzeptablen Bereich -> Ändern des Wertes 
Parameter.(ModStr).(TagStr) = Param;

% Wert wurde in der Struktur geändert. Nun muss diese "neue" Struktur
% wieder an die Figure angehängt werden, damit der neue Wert in den
% weiteren Funktionen zur Verfügung steht. Die Standardwerte werden bei
% jedem Neustart des Programms erneut verwendet.

setappdata(gcf,'Parameter',Parameter);

% Anzeigen des geänderten Wertes, gleichzeitige Kontrolle ob Wert geändert
% wurde.
set(hObject,'String',Parameter.(ModStr).(TagStr));

% Rückmeldung im Command Window
% Hier wird der dritte Teil des Tags, also der sinnvoll gewählte Name,
% verwendet. Es werden die Trennzeichen . und - gesucht.
disp([hObject.Tag(strfind(hObject.Tag,'.')+1:strfind(hObject.Tag,'-')-1),' geändert zu:']);
disp(Parameter.(ModStr).(TagStr));

end
end