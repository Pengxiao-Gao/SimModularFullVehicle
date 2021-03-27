%****************************3730**********************************
%*            Institut f�r Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% In dieser Datei werden die Ordnerstruktur der Module und die 
% GUI-Oberfl�che definiert. Sie gilt als Ausgangspunkt der Simulation.
% 
% Hinweise Programmstruktur:
% Innerhalb des Programms gibt es Kommentarbl�cke, die bestimmte
% Programminhalte und Hintergr�nde erl�utern.
%
%
% Aufbau dieser Datei:
%   1. Unterordner (Module) zu Arbeitsverzeichnis hinzuf�gen
%   2. Figure �ffnen und Modulparameter laden
%   3. Formatierung der Oberfl�che der Figure
%   4. Callbackfunktion des Run-Simulation-Buttons
 


function Hauptdatei
% Aufr�umen / definierter Zustand
clear; close all; format long; clc;

%% 1. Definition cell Array mit allen vorhandenen Modulen 
Module = dir;
Module = Module([Module.isdir]==1);
Module(1:2)=[];

%% Hinzuf�gen der Unterordner als Suchpfade
% Aktueller Ordner und alle Unterordner
addpath(genpath('.'))

%% 2. �ffnen der Figure f�r GUI
fig_ID = figure(1);
% Definition Gr��e, Position und Name
fig_ID.Position = [100 00 1000 750];
fig_ID.Resize = 'off';
fig_ID.Name = 'Hauptfenster';
fig_ID.MenuBar = 'none';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hinweis zu der Datenstruktur und Gliederung:
%
% Im Folgenden wird eine sogenannte Struktur verwendet. Eine Struktur
% erm�glicht eine logische Gliederung von Variablen, GUI-Elemente und
% weiterem. Haupts�chlich wird hier die Struktur verwendet, um die 
% Variablen der Parameter der verschiedenen Module zu trennen. Die Ebenen
% der Struktur werden mit dem Punktoperator . voneinander getrennt.
%
% Nomenklatur:      Struktur.Unterstruktur.Variable
%
% Beispiel 1:       Struktur.Gesamtdimension
% (Gibt an wie viele Freiheitsgrade das Gesamtsystem hat)
% Beispiel 2:       Struktur.Mod_Basis.Dimension
% (Gibt an wie viele Freiheitsgrade das Basismodul hat)
% Beispiel 3:       Struktur.Mod_Basis.l
% (Gibt in Mod_Basis_Parameter.m den Radstand des Basismoduls an)
%
% Da die Struktur f�r eine Gliederung der Parameter erstellt wird, bekommt
% sie den Namen "Parameter". Prinzipiell kann einer Struktur genau wie 
% einer Variable ein beliebiger Namen zugewiesen werden. Es ist nun m�glich
% Parameter zu definieren, die f�r alle Module gelten. Diese stehen dann in 
% der Struktur direkt (siehe Beispiel 1). Der Zugriff erfolgt �ber den 
% Strukturnamen, den Punktoperator und den Variablennamen. Alle anderen
% Parameter/ Variablen, die nur f�r ein Modul g�ltig sind, werden in einer
% anderen Ebene der Struktur definiert (siehe Beispiel 2). Dies ist die 
% Unterstruktur. Der Zugriff erfolgt �ber die Struktur, die Unterstruktur 
% und den Variablennamen. Jedes Modul bekommt eine eigene Unterstruktur mit
% dem Namen des Modulordners. 
%
% Anstatt viele einzelne Variablen von einer Funktion zu einer anderen
% Funktion zu �bergeben, ist es nun m�glich die Struktur als Ganzes zu
% �bergeben. Damit wird der gesamte Inhalt auch �bergeben und es wird nur
% eine Zeile ben�tigt um s�mtliche Parameter aller Module in den
% Unterfunktionen zur Verf�gung zu stellen.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Parameter.Gesamtdimension = 20;     % Gesamtdimension                          
Parameter.Mod_Basis.Dimension = 20; % Dimension des Basismoduls                   
                      
% Systemparameter werden in einer extra Datei abgelegt. F�r jedes Modul,
% wird eine eigene Parameterdatei geladen. Falls diese Datei nicht
% vorhanden ist wird eine Meldung im Command Window ausgegeben.
for idx = 1:length(Module)
    try
        Load_Par = str2func([Module(idx).name,'_Parameter']);
        Load_Par();
    catch
        disp(['Die Datei ',Module(idx).name,'_Parameter ist nicht vorhanden!']);
    end
end

% Erdbeschleunigung
Parameter.g = 9.81;

% Anh�ngen der Struktur an Figurehandle f�r Verf�gbarkeit in Subfunktionen
setappdata(fig_ID, 'Parameter', Parameter);
setappdata(fig_ID, 'Module', Module);

%% 3. Formatierung Oberfl�che
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hinweise zum Zugriff auf angelegte GUI-Elemente:
%
% Mit Hilfe von findobj kann nach Eigenschaften von GUI-Elementen innerhalb 
% einer Figure gesucht werden. Daher wird allen GUI-Elementen (Textfelder
% k�nnen hiervon ausgeschlossen werden) ein Tag (die Eigenschaft 'Tag') 
% zugewiesen. Dabei muss eine einheitliche Nomenklatur beachtet werden. 
% Der Zugriff auf die GUI-Elemente kann damit problemlos erfolgen: 
% 
% Nomenklatur:    Modul<Typ.Bezeichnung-Variable
% 
% Beispiel 1:     Mod_Basis<Edit.Radstand-l 
% (Verwendet in Einstellungen_Modul_Basis f�r die L�nge des Radstandes)
% Beispiel 2:     Main<Liste.Fahrstrecken
% (Verwendet in Hauptdatei f�r die aktuell ausgew�hlte Fahrstrecke)
% 
% Folgende drei Zeichen werden zur sp�teren Identifikation ben�tigt 
% (Trennzeichen im Tag) und sind daher in Variablennamen zu vermeiden:
% < . -
% 
% Erl�uterung Nomenklatur:
% Der Tag besteht aus 4 Teilen. Als ERSTES wird der Modulname (in der
% Hauptdatei wird "Main" verwendet) angegeben. ZWEITER Teil ist der Typ des
% GUI-Elementes, welchem der Tag zugewiesen wird. In dem DRITTEN Teil wird
% dem GUI-Element ein sinnvoller Name gegeben. Der VIERTE Teil gibt den
% Variablennamen an, der in der Parameterdatei hinterlegt ist. Er ist nicht
% immer erforderlich. Der vierte Teil wird verwendet, wenn das GUI-Element
% sich auf den angegebenen Parameter bezieht, der in der Parameterdatei eines
% Moduls festegelegt ist (Beispiel 1). Als Beispiel sei hier ein Editfeld
% genannt, mit welchem ein Parameter ver�ndert werden soll. In diesem Fall
% werden unterschiedliche Bereiche des Strings einzeln verwendet 
% ('Aenderung_Einstellungen.m'). Wird der vierte Teil des Strings nicht 
% ben�tigt, so kann er in diesen F�llen entfallen (Beispiel 2), da hier 
% nur die eindeutige Identifikation des GUI-Elementes verlangt wird.
% 
% Beim Suchen mit Hilfe des Tags bekommt man eine Struktur, mit welcher die
% Eigenschaften des GUI-Elementes ausgelesen bzw. auch ver�ndert werden 
% k�nnen. Diese Struktur erh�lt man ebenfalls als R�ckgabewert bei der
% Erstellung des Objektes, wenn dem Objekt direkt ein Variablenname
% zugewiesen wird.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Zweigeteilte Oberfl�che - Panel 1 mit Darstellungsplots
Panel_links = uipanel('Parent',fig_ID, 'Title','Plots', 'Units','pixel',...
    'Position',[10 10 680 740],'Tag','Main<Panel.PanelLinks');

Axes1 = axes('Parent',Panel_links, 'Units','pixel',...
    'Tag','Main<Achse.Axes1', 'Position',[60 415 600 280]);

axes('Parent',Panel_links, 'Units','pixel',...
    'Tag','Main<Achse.Axes2', 'Position',[60 50 600 280]);

% Das aktuell ausgew�hlte Achsenobjekt soll standardm��ig das obere sein.
fig_ID.CurrentAxes = Axes1;

% Zweigeteilte Oberfl�che - Panel 2 mit Einstellungsm�glichkeiten
Panel_rechts = uipanel('Parent',fig_ID,'Title','Einstellungen',...
    'Units','pixel','Position',[700 75 290 675],'Tag','Main<Panel.PanelRechts');

%% Tabgroup erstellen 
Tabgroup = uitabgroup('Parent', Panel_rechts);
tab1 = uitab('Parent', Tabgroup, 'Title', 'Simulation');
tab2 = uitab('Parent', Tabgroup, 'Title', 'Module');
tab3 = uitab('Parent', Tabgroup, 'Title', 'Plots');

%% Button zur Simulation erstellen
uicontrol('Parent',fig_ID,'Style','pushbutton',...
    'String','Run Simulation','Units','pixel','Position',[700 10 290 55],...
    'FontSize',15,'Tag','Main<Button.RunSim','CallBack',@RunSimulation);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tab1: Einstellen Simulationsparameter
% Zum Beispiel Auswahl Fahrszenario, Auswahl Solver, etc.

% Aufteilung/Strukturierung Tab1
uipanel('Parent',tab1,'Units','pixel','Position',[0 190 285 136],...
    'Tag','Main<Panel.Integrationsintervall');

uipanel('Parent',tab1,'Units','pixel', 'Position',[0 320 285 430],...
    'Tag','Main<Panel.Solver');

uipanel('Parent',tab1,'Units','pixel', 'Position',[0 530 285 320],...
    'Tag','Main<Panel.Fahrstrecke');

Panel_Bordstein = uipanel('Parent',tab1, 'Units','pixel', 'Position',[0 -1 285 100],...
    'Visible','on','Tag','Main<Panel.Bordstein');

%% Elemente zur Auswahl der Strecke
uicontrol('Parent', tab1, 'Style','text', 'Position',[5 590 200 20],...
    'String', 'Fahrstrecke ausw�hlen:','FontSize',12,...
    'HorizontalAlignment','left');

% Vektor der Listenelemente
Liste_Fahrstrecken = {'Bordsteinkante','Landstra�e'};

% Liste zur Auswahl der verschiedenen Fahrstrecken
uicontrol('Parent', tab1, 'Style','popupmenu',...
    'Position',[10 560 240 20], 'String', Liste_Fahrstrecken,...
    'FontSize',10,'HorizontalAlignment','right','CallBack',@AuswahlStrecke,...
    'Tag','Main<Liste.Fahrstrecken');

%% Funktionen zur Auswahl des Solvers
uicontrol('Parent', tab1, 'Style','text', 'Position',[5 490 150 20],...
    'String','Solver ausw�hlen:','FontSize',12,'HorizontalAlignment','left');

% Vektor mit Namen der verschiedenen Solver
Liste_Solverauswahl = {'ode45','ode23','ode23s','ode15s'};

% Liste zur Auswahl der Solver
uicontrol('Parent', tab1, 'Style','popupmenu','Position',[10 460 240 20],...
    'String',Liste_Solverauswahl,'FontSize',10,...
    'HorizontalAlignment','right','Tag','Mod_Basis<Liste.Solverauswahl',...
    'CallBack',@AuswahlSolver);
%% Solver-optionen festlegen: relative und absolute Toleranz
% �berschrift
uicontrol('Parent', tab1, 'Style','text','Position',[5 400 220 20],...
    'String', 'Toleranzen festlegen:','FontSize',12,...
    'HorizontalAlignment','left');

% Textfeld relative Toleranz
uicontrol('Parent', tab1, 'Style','text','Position',[5 370 220 20],...
    'String', 'relative Toleranz:','FontSize',11,...
    'HorizontalAlignment','left');

% Editfeld relative Toleranz
uicontrol('Parent',tab1,'Style','edit','Position',[180 370 80 20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Basis.RelTol),...
    'Tag','Mod_Basis<Edit.RelativeToleranz-relTol',...
    'Callback',@Aenderung_Einstellungen);

% Textfeld absolute Toleranz
uicontrol('Parent', tab1, 'Style','text','Position',[5 340 220 20],...
    'String', 'absolute Toleranz:','FontSize',11,...
    'HorizontalAlignment','left');

% Editfeld absolute Toleranz
uicontrol('Parent',tab1,'Style','edit','Position',[180 340 80 20],...
    'String', num2str(Parameter.Mod_Basis.AbsTol),'FontSize',10,...
    'Tag','Mod_Basis<Edit.AbsoluteToleranz-AbsTol',...
    'Callback',@Aenderung_Einstellungen);

%% Funktionen zur Festlegung des Intgrationsintervalls
% �berschrift
uicontrol('Parent', tab1, 'Style','text','Position',[5 280 220 20],...
    'String', 'Integrationsintervall festlegen:',...
    'FontSize',12,'HorizontalAlignment','left');
% Text Anfangswert
uicontrol('Parent', tab1, 'Style','text','Position',[20 250 35 20],...
    'String', 'Von:','FontSize',11,'HorizontalAlignment','left');
% Eingabefeld Anfangswert
uicontrol('Parent',tab1,'Style','edit','Position',[60 250 60 20],...
    'String', num2str(Parameter.Mod_Basis.tspan_min),'FontSize',10,...
    'Tag','Mod_Basis<Edit.IntegrationsintervallStart-tspan_min',...
    'Callback',@Aenderung_Einstellungen);

% Text Endwert
uicontrol('Parent', tab1, 'Style','text','Position',[160 250 30 20],...
    'String', 'Bis:','FontSize',11,'HorizontalAlignment','left');
% Eingabefeld Endwert
uicontrol('Parent',tab1,'Style','edit','Position',[200 250 60 20],...
    'String', num2str(Parameter.Mod_Basis.tspan_max),'FontSize',10,...
    'Tag','Mod_Basis<Edit.IntegrationsintervallEnde-tspan_max',...
    'Callback',@Aenderung_Einstellungen);

% Text Schrittweite
uicontrol('Parent', tab1, 'Style','text','Position',[20 215 85 20],...
    'String', 'Schrittweite:','FontSize',11,'HorizontalAlignment','left');
% Eingabefeld Schrittweite
uicontrol('Parent',tab1,'Style','edit','Position',[120 215 120 20],...
    'String', num2str(Parameter.Mod_Basis.tspan_Schritt),'FontSize',10,...
    'Tag','Mod_Basis<Edit.Schrittweite-tspan_Schritt',...
    'Callback',@Aenderung_Einstellungen);

%% Einstellungsm�glichkeiten bei Auswahl der Bordsteinkante
% �berschrift
uicontrol('Parent',Panel_Bordstein,'Style','text',...
    'Position',[5,70,280,20],'HorizontalAlignment','left',...
    'String', 'Einstellungen f�r die Bordsteinkante:', 'FontSize',12);
    
% Textfeld H�he    
uicontrol('Parent',Panel_Bordstein,'Style','text',...
    'Position',[5,40,80,20], 'String', 'H�he in m:','FontSize',11,...
    'HorizontalAlignment','left');
% Editfeld H�he 
uicontrol('Parent',Panel_Bordstein,'Style','edit',...
    'Position',[100,40,70,20],'FontSize',10,...
    'String', num2str(Parameter.Mod_Basis.h),...
    'Tag','Main<Edit.HoeheBordstein-h','Callback',@Aenderung_Einstellungen);
    
% Textfeld Winkel  
uicontrol('Parent',Panel_Bordstein,'Style','text',...
    'Position',[5,10,80,20], 'String', 'Winkel in ?','FontSize',11,...
    'HorizontalAlignment','left');   
% Editfeld Winkel
uicontrol('Parent',Panel_Bordstein,'Style','edit',...
    'Position',[100,10,70,20],'FontSize',10,...
    'String', num2str(Parameter.Mod_Basis.alpha),...
    'Tag','Main<Edit.WinkelBordstein-alpha','Callback',@Aenderung_Einstellungen);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tab2: Modulauswahl
% Aktivieren der einzelnen Module und festlegen der Einstellungen f�r jedes
% Modul.
% Modul: Basis, immer aktiv

% Textfeld Basismodul
uicontrol('Parent', tab2, 'Style','text','Position',[30 580 100 20],...
    'String','Basis','FontSize',11,'HorizontalAlignment','left');
% Pushbutton Basismodul, zum �ffnen der Einstellungen
uicontrol('Parent', tab2, 'Style','pushbutton',...
    'Position',[170 580 100 25], 'String', 'Einstellungen',...
    'FontSize',10,'Tag','Main<Button.EinstellungenBasismodul',...
    'Callback',@Mod_Basis_Einstellungen);

%% Zusatzmodule erkennen und jeweilige GUI-Elemente erstellen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hinweis zum einf�gen der Zusatzmodule:
%
% Im Folgenden wird abgefragt welche Module, in Form eines Modulordners
% vorhanden sind. F�r jedes vorhandene Modul wird dann automatisch eine 
% Checkbox, zur De- bzw. Aktivierung, ein Textfeld und ein Button f�r die 
% Einstellungen erzeugt. Wird die Nomenklatur richtig verwendet, so werden
% neue Module automatisch integriert. Das Basismodul ist davon nicht 
% betroffen, es ist immer vorhanden und aktiv.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Korrekturwert, da Basismodul nicht gez�hlt wird
dxkor = 0;
for idx = 1:length(Module)
    Name = Module(idx).name(strfind(Module(idx).name,'_')+1:end);
    if strcmp(Name,'Basis')
        % Korrekturwert �ndern, damit Verschiebungsfaktor der Position (dx)
        % nicht exakt mit idx mitl�uft.
        dxkor = -1;
        % keine weiteren GUI-Elemente erforderlich
    else
        % Verschiebungsfaktor der Positionen der GUI-Elemente w�chst mit idx
        dx = idx;   
        % Checkbox Zusatzmodule 
        ModulCheck = uicontrol('Parent',tab2,'Style','checkbox',...
            'Position',[5 580-(dx+dxkor)*40 20 20],...
            'Tag', ['Main<Checkbox.',Name],...
            'Callback',str2func(['Mod_',Name,'_DeActivate']));
        % Textfeld Zusatzmodul
        uicontrol('Parent', tab2, 'Style','text','Position',...
            [30 580-(dx+dxkor)*40 120 20],'String',['Modul: ',Name],...
            'FontSize',11,'HorizontalAlignment','left');
        % Pushbutton Zusatzmodule, zum �ffnen der Einstellungen
        ModulButton = uicontrol('Parent', tab2, 'Style','pushbutton',...
            'Position',[170 580-(dx+dxkor)*40 100 25],...
            'String', 'Einstellungen','FontSize',10,...
            'Tag',['Main<Button.Einstellungen',Name],...
            'Callback',str2func(['Mod_',Name,'_Einstellungen']));
        
        % Pr�fen ob alle vier erforderlichen Dateien vorhanden sind
        for dxfile = 1:4
            % Vektor mit Namen der Dateien (nach Modulnamen)
            Namensvektor = {'DeActivate';'Einstellungen';'ODE';'Parameter'};
            % �berpr�fung ob die Datei (des ersten Schleifendurchlaufs) 
            % vorhanden ist
            Abfrage = exist([Module(idx).name,'_',Namensvektor{dxfile}],'file');
            % Ist eine Datei nicht vorhanden, so wird dies im Command
            % Window ausgegeben und die Checkbox zur Aktivierung, sowie der
            % Button f�r die Einstellungen deaktiviert.
            if Abfrage ~= 2
                disp(['Datei: ',Module(idx).name,'_',Namensvektor{dxfile},...
                    ' ist nicht vorhanden!']);
                ModulCheck.Enable = 'off';
                ModulButton.Enable = 'off';
            else
                % keine �nderung wenn die Datei vorhanden ist
            end
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tab 3: Plotten der Daten

%Aufteilung des Tab3 ��
Panel_Achsengrenzen = uipanel('Parent',tab3, 'Units','pixel', 'Position',[0 -1 285 115],...
    'Visible','on','Tag','Main<Panel.Achsengrenzen');

% Vektor mit den Namen beider auszuw�hlenden Achsenobjekte
 Liste_AuswahlAchsenobjekt = {'Oberes Achsenobjekt','Unteres Achsenobjekt'};
        % Liste zur Auswahl der Achsenobjekte
        uicontrol('Parent', tab3, 'Style','popupmenu','Position',[10 560 240 20],...
        'String', Liste_AuswahlAchsenobjekt,'FontSize',10,...
        'Tag','Main<Liste.AuswahlAchsenobjekt','CallBack',@AuswahlAchsenobjekt);
% Vektor mit Plotm�glichkeiten f�r die x-Achse (Erweitern!)

Liste_Auswahl_XAchse = Parameter.Mod_Basis.XAchse;
% Liste zur Auswahl der zu plottenden Daten auf der x-Achse��
uicontrol('Parent', tab3, 'Style','popupmenu','Position',[10 460 240 20],...
'String', Liste_Auswahl_XAchse,'FontSize',10,...
'Tag','Main<Liste.AuswahlXAchse','CallBack',@AuswahlPlot);
% Vektor mit Plotm�glichkeiten f�r die y-Achse (Erweitern!)
Liste_Auswahl_YAchse = Parameter.Mod_Basis.YAchse;
% Liste zur Auswahl der zu plottenden Daten auf der y-Achse
uicontrol('Parent', tab3, 'Style','popupmenu','Position',[10 390 240 20],...
'String', Liste_Auswahl_YAchse,'FontSize',10,...
'Tag','Main<Liste.AuswahlYAchse','CallBack',@AuswahlPlot); 






% Textfelder
% Textfeld Auswahl der Achse
uicontrol('Parent', tab3, 'Style','text','Position',[10 590 200 20],...
    'String','Achsenobjekt auswaelen:','FontSize',12,...
    'HorizontalAlignment','left');

% Textfeld Auswahl der Daten auf der x-Achse
uicontrol('Parent', tab3, 'Style','text','Position',[10 490 200 20],...
    'String','Daten auf x-Achse:','FontSize',12,...
    'HorizontalAlignment','left');

% Textfeld Auswahl der Daten auf der y-Achse
uicontrol('Parent', tab3, 'Style','text','Position',[10 420 200 20],...
    'String','Daten auf y-Achse:','FontSize',12,...
    'HorizontalAlignment','left');

% Felder f�r Eingabe der Achsengrenzen ��
% Textfeld Achsengrenzen
uicontrol('Parent', tab3, 'Style','text','Position',[10 170 200 20],...
    'String', 'Achsengrenzen aedern:','FontSize',12,...
    'HorizontalAlignment','left');

%Textfeld Achsengrenzen
uicontrol('Parent', tab3, 'Style','text','Position',[50 130 180 20],...
    'String', 'automatisch','FontSize',12,...
    'HorizontalAlignment','left');
%Checkbox Achsengrenzen
uicontrol('Parent',tab3,'Style','checkbox',...
            'Position',[10 130 20 20],...
            'Tag','Main<Checkbox.Achsengrenzen','Callback',@Aenderung_Achsengrenzen);


% x-min
uicontrol('Parent', Panel_Achsengrenzen, 'Style','edit','Position',[70 80 50 25],...
    'String',num2str(Parameter.Mod_Basis.Xmin),'FontSize',10,'Tag',...
    'Mod_Basis<Edit.Xmin-Xmin','Callback',@Aenderung_Einstellungen);
% x-max
uicontrol('Parent', Panel_Achsengrenzen, 'Style','edit','Position',[130 80 50 25],...
    'String',num2str(Parameter.Mod_Basis.Xmax),'FontSize',10,'Tag',...
    'Mod_Basis<Edit.Xmax-Xmax','Callback',@Aenderung_Einstellungen);
% y-min
uicontrol('Parent', Panel_Achsengrenzen, 'Style','edit','Position',[70 50 50 25],...
    'String',num2str(Parameter.Mod_Basis.Ymin),'FontSize',10,'Tag',...
    'Mod_Basis<Edit.Ymin-Ymin','Callback',@Aenderung_Einstellungen);
% y-max
uicontrol('Parent', Panel_Achsengrenzen, 'Style','edit','Position',[130 50 50 25],...
    'String',num2str(Parameter.Mod_Basis.Ymax),'FontSize',10,'Tag',...
    'Mod_Basis<Edit.Ymax-Ymax','Callback',@Aenderung_Einstellungen);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
%% 4. Callback-Funktionen
function RunSimulation(~, ~)
disp('Berechnung wird durchgef�hrt');
% Auslesen der Parameterstruktur aus Figure
Parameter = getappdata(gcf, 'Parameter');

% Erstellen eines Zeitintervalls f�r die Integration
tspan = Parameter.Mod_Basis.tspan_min:Parameter.Mod_Basis.tspan_Schritt:Parameter.Mod_Basis.tspan_max; 

% Anfangswerte f�r die Freiheitsgrade festlegen
xi0 = zeros(Parameter.Gesamtdimension,1);
xi0(11) = Parameter.Mod_Basis.v;

% Aufruf des ausgew�hlten Solvers zum L�sen des Gleichungssystems
if strcmp(Parameter.Mod_Basis.Solver,'ode45')
    [t,xi] = ode45(@Mod_Basis_ODE,tspan,xi0,[],Parameter);
    
elseif strcmp(Parameter.Mod_Basis.Solver,'ode23')
    [t,xi] = ode23(@Mod_Basis_ODE,tspan,xi0,[],Parameter);
    
elseif strcmp(Parameter.Mod_Basis.Solver,'ode23s')
    [t,xi] = ode23s(@Mod_Basis_ODE,tspan,xi0,[],Parameter);
    
elseif strcmp(Parameter.Mod_Basis.Solver,'ode15s')
    [t,xi] = ode15s(@Mod_Basis_ODE,tspan,xi0,[],Parameter);
else disp('Solver nicht verf�gbar');
end

% Anh�ngen der L�sungsvektoren an Figure zur Verwendung in Unterfunktionen
setappdata(gcf,'t',t);
setappdata(gcf,'xi',xi);

% R�ckmeldungen im Command Window
disp('Simulation abgeschlossen');
end








