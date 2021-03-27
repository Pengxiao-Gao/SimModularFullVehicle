%******************************************************************
%*            Institut für Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Hinweis: 
%
% In dieser Datei soll nach dem untenstehenden Aufbau eine GUI erstellt 
% werden, in der verschiedene Parameter, durch Eingaben verändert werden 
% können. Die Funktion wird aufgerufen, wenn der Einstellungsbutton des 
% Testmoduls betätigt wird.
%
% Callbackfunktion zum Öffnen eines Fensters, in dem Einstellungen für das
% Modul verändert werden können.
% Aufbau dieser Datei:
%   1. Struktur laden.
%   2. Figure öffnen und Oberfläche gestalten.
%   3. Callbackfunktion zum Schließen der Figure.

function Mod_Motor_Einstellungen(~,~)

% Handle der Hauptfigure auslesen
fig_ID = findobj(groot,'Name','Hauptfenster');

Parameter = getappdata(fig_ID,'Parameter');
% Ausblenden der Hauptgui, solange Einstellungen eingeblendet
set(fig_ID,'Visible','off');

%% 2. Figure öffnen und Oberfläche gestalten
fig_Motor = figure;
fig_Motor.Name = 'Eigenschaften des Moduls von Motormasse';
fig_Motor.Position = [480 120 800 700];
fig_Motor.Resize = 'off';
fig_Motor.MenuBar = 'none';
% Aufrufen Buttonfunktion zum Schließen bei Beenden über X (rechts oben)
set(fig_Motor,'CloseRequestFcn',{@Schliessen});
setappdata(gcf,'Parameter',Parameter);
%%%%%%%%%
%% Panel zur Erstellung der individuelle Modulparameter
Panel_MotorauslegungX = uipanel('Parent',fig_Motor,'Title','Motorauslegung',...
    'FontSize',12,'Units','pixel','Position',[10 390 780 300],...
    'Tag','Mod_Motor<Panel.Motorparameterx');
Panel_MotorauslegungY = uipanel('Parent',fig_Motor,'Title',...
    'Federsteifigkeit und Dämpferkonstanten von Motorhaltong',...
    'FontSize',12,'Units','pixel','Position',[10 230 780 160],...
    'Tag','Mod_Motor<Panel.Motorparameterz');
Panel_MotorauslegungZ = uipanel('Parent',fig_Motor,'Title',...
    'zylindern und Motordrehzahl',...
    'FontSize',12,'Units','pixel','Position',[10 70 780 160],...
    'Tag','Mod_Motor<Panel.Motorparametery');

%% Auslegung
% Motorauslegung waehlen
uicontrol('Parent',Panel_MotorauslegungX,'Style','text','Position',[5,240,120,20],...
    'String', 'Motorauslegung :','FontSize',11,'HorizontalAlignment','left');
Liste_Motorauslegung = {'Längsauslegung','Querauslegung'};
uicontrol('Parent', Panel_MotorauslegungX, 'Style','popupmenu','Position',[220 240 150 20],...
    'String',Liste_Motorauslegung,'FontSize',10,'HorizontalAlignment','right',...
     'CallBack',@AuswahlMotor,'Tag','Mod_Motor<Liste_Motorauslegung');

%% Federsteifigkeit und Daempferkonstanten von Motorhaltong
% Federsteifigkeit zwischen Aufbau und Motormasse
% Textfeld Federsteifigkeit zwischen Aufbau und Motormasse
uicontrol('Parent',Panel_MotorauslegungY,'Style','text','Position',[5,100,320,20],...
    'String', 'Steifigkeit von Motorhalterung [N/m]:','FontSize',11,'HorizontalAlignment','left');
 % Editfeld Radstand
uicontrol('Parent',Panel_MotorauslegungY,'Style','edit','Position',[420,100,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.cm),...
    'Tag','Mod_Motor<Edit.Steifigkeit von Motorhalterung-cm','Callback',@Aenderung_Einstellungen);
% Daempferkonstanten von Motorhalterung
% Textfeld Deampferkonstanten
uicontrol('Parent',Panel_MotorauslegungY,'Style','text','Position',[5,20,320,20],...
    'FontSize',11,'String','Dämpferkonnstante von Motorhalterung [Ns/m]:',...
    'HorizontalAlignment','left');
% Editfeld Deampferkonstanten
uicontrol('Parent',Panel_MotorauslegungY,'Style','edit','Position',[420,20,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.bm),...
    'Tag','Mod_Motor<Edit.Deampferkonstanten-bm',...
    'Callback',@Aenderung_Einstellungen);
%% zylindern und Motordrehzahl


uicontrol('Parent',Panel_MotorauslegungZ,'Style','text','Position',[5,60,320,20],...
    'FontSize',11,'String','Motordrehzahl [U/min]:',...
    'HorizontalAlignment','left');
% Editfeld Deampferkonstanten
uicontrol('Parent',Panel_MotorauslegungZ,'Style','edit','Position',[420,60,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.U),...
    'Tag','Mod_Motor<Edit.Motordrehzahl-U',...
    'Callback',@Aenderung_Einstellungen);





%% Push-Button zum Akzeptieren und Schliessen
uicontrol('Parent', fig_Motor, 'Style','pushbutton',...
    'Position',[500 25 250 30], 'String', 'Akzeptieren und Schliessen',...
    'FontSize',12,'HorizontalAlignment','center','Callback',@Schliessen);


%% Push-Button zum Akzeptieren und Schliessen
uicontrol('Parent', fig_Motor, 'Style','pushbutton',...
    'Position',[500 25 250 30], 'String', 'Akzeptieren und Schliessen',...
    'FontSize',12,'HorizontalAlignment','center','Callback',@Schliessen);
end

%% 3. Callbackfunktion zum Schließen der Figure findobj(groot,'Name','Hauptfenster')
function Schliessen(~,~)
% Die Parameterstruktur wird aus der aktuellen Figure (Eigenschaften des 
% Basismoduls) ausgelesen
Parameter = getappdata(gcf,'Parameter');
% Figure (Eigenschaften des Basismoduls) wird geschlossen
delete(gcf);
% Handle der Hauptfigure auslesen
fig_ID = findobj(groot,'Name','Hauptfenster');
% Parameterstruktur wird an die Hauptfigure angehängt
setappdata(fig_ID,'Parameter',Parameter);
% Wiedereinblenden der Hauptgui
set(fig_ID,'Visible','on');
end

