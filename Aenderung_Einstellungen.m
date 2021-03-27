%******************************************************************
%*            Institut f�r Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Funktion zur �nderung der Parameter und Einstellungen des Basismoduls.
%
% Aufbau dieser Datei
% 1. Laden der erforderlichen Daten 
% 2. Abfrage welches Element die Funktion aufgerufen hat und laden der
%    jeweilige Begrenzung des Parameters der ge�ndert werden soll.
% 3. Abfrage ob Eingabe innerhalb der Grenzen des jeweiligen Parameters
%    liegt und ggf. �nderung des Parameters


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

% Abfrage nach der Modulzugeh�rigkeit, um auf die richtige Variable
% zuzugreifen
ModStr = hObject.Tag(1:(strfind(hObject.Tag,'<')-1));

% Jeder Parameter ist in einem gewissen Intervall limitiert (Siehe 
% Parameterdatei) . Es folgt die Abfrage, ob der eingegebene Wert in dem
% f�r diesen Parameter festgelegten Intervall liegt.
% Hierf�r wird zuerst der Vektor mit dem Intervall geladen.
% Es wird hier wieder ein Teil des Tags verwendet um den vollst�ndigen
% Variablennamen f�r den Lim-Vektor zu generieren. 
Limits = Parameter.(ModStr).([TagStr,'_Lim']);

%% 3. Abfrage ob Eingabe innerhalb der Grenzen des jeweiligen Parameters
%     liegt und ggf. �nderung des Parameters
if Param > Limits(2)
    
    % Ist Eingabe zu gro�, so wird aktueller Wert angezeigt
    set(hObject,'String',Parameter.(ModStr).(TagStr));
    
    % R�ckmeldung im Command Window
    disp('Eingabe zu gro�');
    
elseif Param < Limits(1)
    
    % Ist Eingabe zu klein, so wird aktueller Wert angezeigt
    set(hObject,'String',Parameter.(ModStr).(TagStr));
    
    % R�ckmeldung im Command Window
    disp('Eingabe zu klein');
    
else
% ist die Eingabe im akzeptablen Bereich -> �ndern des Wertes 
Parameter.(ModStr).(TagStr) = Param;

% Wert wurde in der Struktur ge�ndert. Nun muss diese "neue" Struktur
% wieder an die Figure angeh�ngt werden, damit der neue Wert in den
% weiteren Funktionen zur Verf�gung steht. Die Standardwerte werden bei
% jedem Neustart des Programms erneut verwendet.

setappdata(gcf,'Parameter',Parameter);

% Anzeigen des ge�nderten Wertes, gleichzeitige Kontrolle ob Wert ge�ndert
% wurde.
set(hObject,'String',Parameter.(ModStr).(TagStr));

% R�ckmeldung im Command Window
% Hier wird der dritte Teil des Tags, also der sinnvoll gew�hlte Name,
% verwendet. Es werden die Trennzeichen . und - gesucht.
disp([hObject.Tag(strfind(hObject.Tag,'.')+1:strfind(hObject.Tag,'-')-1),' ge�ndert zu:']);
disp(Parameter.(ModStr).(TagStr));

end
end