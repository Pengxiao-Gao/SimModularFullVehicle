%******************************************************************
%*            Institut f�r Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Hinweis: 
%
% In dieser Datei soll nach dem untenstehenden Aufbau eine GUI erstellt 
% werden, in der verschiedene Parameter, durch Eingaben ver�ndert werden 
% k�nnen. Die Funktion wird aufgerufen, wenn der Einstellungsbutton des 
% Testmoduls bet�tigt wird.
%
% Callbackfunktion zum �ffnen eines Fensters, in dem Einstellungen f�r das
% Modul ver�ndert werden k�nnen.
% Aufbau dieser Datei:
%   1. Struktur laden.
%   2. Figure �ffnen und Oberfl�che gestalten.
%   3. Callbackfunktion zum Schlie�en der Figure.

function Mod_Insassen_Einstellungen(~,~)

% Handle der Hauptfigure auslesen
fig_ID = findobj(groot,'Name','Hauptfenster');

Parameter = getappdata(fig_ID,'Parameter');
% Ausblenden der Hauptgui, solange Einstellungen eingeblendet
set(fig_ID,'Visible','off');

%% 2. Figure �ffnen und Oberfl�che gestalten
fig_Insassen = figure;
fig_Insassen.Name = 'Eigenschaften des Moduls von Insassen';
fig_Insassen.Position = [480 120 800 700];
fig_Insassen.Resize = 'off';
fig_Insassen.MenuBar = 'none';
% Aufrufen Buttonfunktion zum Schlie�en bei Beenden �ber X (rechts oben)
set(fig_Insassen,'CloseRequestFcn',{@Schliessen});
setappdata(gcf,'Parameter',Parameter);
%%%%%%%%%
%% Eigenschaften des Fahrers
Panel_Fahrer = uipanel('Parent',fig_Insassen,'Title','Fahrer',...
    'FontSize',12,'Units','pixel','Position',[10 540 300 150],...
    'Tag','Mod_Insassen<Panel.Fahrer');
% Textfeld Fahrermasse
uicontrol('Parent',Panel_Fahrer,'Style','text','Position',[5,100,100,20],...
    'String', 'Masse mf:','FontSize',11,'HorizontalAlignment','left');
% Editfeld Fahrermasse
uicontrol('Parent',Panel_Fahrer,'Style','edit','Position',[200,100,50,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Insassen.mf),...
    'Tag','Mod_Insassen<Edit.Fahrermasse-Mf','Callback',@Aenderung_Einstellungen);    
% Textfeld Einheit
uicontrol('Parent',Panel_Fahrer,'Style','text','Position',[250,100,50,20],...
    'String', '  kg','FontSize',11,'HorizontalAlignment','left');

% Textfeld Abstand in X-Richtung
uicontrol('Parent',Panel_Fahrer,'Style','text','Position',[5,70,100,20],...
    'String', 'Abstand X af:','FontSize',11,'HorizontalAlignment','left');
% Editfeld Abstand in X-Richtung
uicontrol('Parent',Panel_Fahrer,'Style','edit','Position',[200,70,50,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Insassen.af),...
    'Tag','Mod_Insassen<Edit.Fahrerx-af','Callback',@Aenderung_Einstellungen);    
% Textfeld Einheit
uicontrol('Parent',Panel_Fahrer,'Style','text','Position',[250,70,50,20],...
    'String', '  m','FontSize',11,'HorizontalAlignment','left');

% Textfeld Abstand in Y-Richtung
uicontrol('Parent',Panel_Fahrer,'Style','text','Position',[5,40,100,20],...
    'String', 'Abstand Y bf:','FontSize',11,'HorizontalAlignment','left');
% Editfeld Abstand in Y-Richtung
uicontrol('Parent',Panel_Fahrer,'Style','edit','Position',[200,40,50,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Insassen.bf),...
    'Tag','Mod_Insassen<Edit.Fahrery-bf','Callback',@Aenderung_Einstellungen);    
% Textfeld Einheit
uicontrol('Parent',Panel_Fahrer,'Style','text','Position',[250,40,50,20],...
    'String', '  m','FontSize',11,'HorizontalAlignment','left');


%% Eigenschaften der 2. �nsassen
Panel_Insassen2 = uipanel('Parent',fig_Insassen,'Title','2. Insassen',...
    'FontSize',12,'Units','pixel','Position',[10 390 300 150],...
    'Tag','Mod_Insassen<Panel.Insassen2');
% Textfeld 2. Insassen
uicontrol('Parent',Panel_Insassen2,'Style','text','Position',[5,100,100,20],...
    'String', '2. Insassen','FontSize',11,'HorizontalAlignment','left');
uicontrol('Parent',Panel_Insassen2,'Style','checkbox','Position',[218 100 20 20],...
            'Tag', ['Mod_Insassen<Checkbox.','Insassen2'],'Value',Parameter.Mod_Insassen2.Aktiv,...
            'Callback',str2func(['Mod_','Insassen2','_DeActivate']));
% Textfeld 2. Insassenmasse
uicontrol('Parent',Panel_Insassen2,'Style','text','Position',[5,70,100,20],...
    'String', 'Masse      m2:','FontSize',11,'HorizontalAlignment','left');
% Editfeld 2. Insassenmasse
uicontrol('Parent',Panel_Insassen2,'Style','edit','Position',[200,70,50,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Insassen.m2),...
    'Tag','Mod_Insassen<Edit.Insassen2-m2','Callback',@Aenderung_Einstellungen);    
% Textfeld Einheit
uicontrol('Parent',Panel_Insassen2,'Style','text','Position',[250,70,50,20],...
    'String', '  kg','FontSize',11,'HorizontalAlignment','left');

% Textfeld Abstand in X-Richtung
uicontrol('Parent',Panel_Insassen2,'Style','text','Position',[5,40,100,20],...
    'String', 'Abstand X a2:','FontSize',11,'HorizontalAlignment','left');
% Editfeld Abstand in X-Richtung
uicontrol('Parent',Panel_Insassen2,'Style','edit','Position',[200,40,50,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Insassen.a2),...
    'Tag','Mod_Insassen<Edit.Insassen2x-a2','Callback',@Aenderung_Einstellungen);    
% Textfeld Einheit
uicontrol('Parent',Panel_Insassen2,'Style','text','Position',[250,40,50,20],...
    'String', '  m','FontSize',11,'HorizontalAlignment','left');

% Textfeld Abstand in Y-Richtung
uicontrol('Parent',Panel_Insassen2,'Style','text','Position',[5,10,100,20],...
    'String', 'Abstand Y b2:','FontSize',11,'HorizontalAlignment','left');
% Editfeld Abstand in Y-Richtung
uicontrol('Parent',Panel_Insassen2,'Style','edit','Position',[200,10,50,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Insassen.b2),...
    'Tag','Mod_Insassen<Edit.Insassen2x-b2','Callback',@Aenderung_Einstellungen);    
% Textfeld Einheit
uicontrol('Parent',Panel_Insassen2,'Style','text','Position',[250,10,50,20],...
    'String', '  m','FontSize',11,'HorizontalAlignment','left');



%% Eigenschaften der 3. Insassen
Panel_Insassen3 = uipanel('Parent',fig_Insassen,'Title','3. Insassen',...
    'FontSize',12,'Units','pixel','Position',[10 240 300 150],...
    'Tag','Mod_Insassen<Panel.Insassen3');
% Textfeld 3. Insassen
uicontrol('Parent',Panel_Insassen3,'Style','text','Position',[5,100,100,20],...
    'String', '3. Insassen','FontSize',11,'HorizontalAlignment','left');
uicontrol('Parent',Panel_Insassen3,'Style','checkbox','Position',[218 100 20 20],...
            'Tag', ['Mod_Insassen<Checkbox.','Insassen3'],'Value',Parameter.Mod_Insassen3.Aktiv,...
            'Callback',str2func(['Mod_','Insassen3','_DeActivate']));
% Textfeld 3. Insassenmasse
uicontrol('Parent',Panel_Insassen3,'Style','text','Position',[5,70,100,20],...
    'String', 'Masse      m3:','FontSize',11,'HorizontalAlignment','left');
% Editfeld 3. Insassenmasse
uicontrol('Parent',Panel_Insassen3,'Style','edit','Position',[200,70,50,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Insassen.m3),...
    'Tag','Mod_Insassen<Edit.Insassen3-m3','Callback',@Aenderung_Einstellungen);    
% Textfeld Einheit
uicontrol('Parent',Panel_Insassen3,'Style','text','Position',[250,70,50,20],...
    'String', '  kg','FontSize',11,'HorizontalAlignment','left');

% Textfeld Abstand in X-Richtung
uicontrol('Parent',Panel_Insassen3,'Style','text','Position',[5,40,100,20],...
    'String', 'Abstand X a3:','FontSize',11,'HorizontalAlignment','left');
% Editfeld Abstand in X-Richtung
uicontrol('Parent',Panel_Insassen3,'Style','edit','Position',[200,40,50,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Insassen.a3),...
    'Tag','Mod_Insassen<Edit.Insassen3x-a3','Callback',@Aenderung_Einstellungen);    
% Textfeld Einheit
uicontrol('Parent',Panel_Insassen3,'Style','text','Position',[250,40,50,20],...
    'String', '  m','FontSize',11,'HorizontalAlignment','left');

% Textfeld Abstand in Y-Richtung
uicontrol('Parent',Panel_Insassen3,'Style','text','Position',[5,10,100,20],...
    'String', 'Abstand Y b3:','FontSize',11,'HorizontalAlignment','left');
% Editfeld Abstand in Y-Richtung
uicontrol('Parent',Panel_Insassen3,'Style','edit','Position',[200,10,50,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Insassen.b3),...
    'Tag','Mod_Insassen<Edit.Insassen3x-b3','Callback',@Aenderung_Einstellungen);    
% Textfeld Einheit
uicontrol('Parent',Panel_Insassen3,'Style','text','Position',[250,10,50,20],...
    'String', '  m','FontSize',11,'HorizontalAlignment','left');

%% Eigenschaften der 4. Insassen
Panel_Insassen4 = uipanel('Parent',fig_Insassen,'Title','4. Insassen',...
    'FontSize',12,'Units','pixel','Position',[10 90 300 150],...
    'Tag','Mod_Insassen<Panel.Insassen4');
% Textfeld 4. Insassen
uicontrol('Parent',Panel_Insassen4,'Style','text','Position',[5,100,100,20],...
    'String', '4. Insassen','FontSize',11,'HorizontalAlignment','left');
uicontrol('Parent',Panel_Insassen4,'Style','checkbox','Position',[218 100 20 20],...
            'Tag', ['Mod_Insassen<Checkbox.','Insassen4'],'Value',Parameter.Mod_Insassen4.Aktiv,...
            'Callback',str2func(['Mod_','Insassen4','_DeActivate']));
% Textfeld 4. Insassenmasse
uicontrol('Parent',Panel_Insassen4,'Style','text','Position',[5,70,100,20],...
    'String', 'Masse      m4:','FontSize',11,'HorizontalAlignment','left');
% Editfeld 4. Insassenmasse
uicontrol('Parent',Panel_Insassen4,'Style','edit','Position',[200,70,50,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Insassen.m4),...
    'Tag','Mod_Insassen<Edit.Insassen4-m4','Callback',@Aenderung_Einstellungen);    
% Textfeld Einheit
uicontrol('Parent',Panel_Insassen4,'Style','text','Position',[250,70,50,20],...
    'String', '  kg','FontSize',11,'HorizontalAlignment','left');

% Textfeld Abstand in X-Richtung
uicontrol('Parent',Panel_Insassen4,'Style','text','Position',[5,40,100,20],...
    'String', 'Abstand X a4:','FontSize',11,'HorizontalAlignment','left');
% Editfeld Abstand in X-Richtung
uicontrol('Parent',Panel_Insassen4,'Style','edit','Position',[200,40,50,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Insassen.a4),...
    'Tag','Mod_Insassen<Edit.Insassen4x-a4','Callback',@Aenderung_Einstellungen);    
% Textfeld Einheit
uicontrol('Parent',Panel_Insassen4,'Style','text','Position',[250,40,50,20],...
    'String', '  m','FontSize',11,'HorizontalAlignment','left');

% Textfeld Abstand in Y-Richtung
uicontrol('Parent',Panel_Insassen4,'Style','text','Position',[5,10,100,20],...
    'String', 'Abstand Y b4:','FontSize',11,'HorizontalAlignment','left');
% Editfeld Abstand in Y-Richtung
uicontrol('Parent',Panel_Insassen4,'Style','edit','Position',[200,10,50,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Insassen.b4),...
    'Tag','Mod_Insassen<Edit.Insassen4x-b4','Callback',@Aenderung_Einstellungen);    
% Textfeld Einheit
uicontrol('Parent',Panel_Insassen4,'Style','text','Position',[250,10,50,20],...
    'String', '  m','FontSize',11,'HorizontalAlignment','left');
%% Insassenauslegung
Panel_Auslegung = uipanel('Parent',fig_Insassen,'Title','Insassenauslegung',...
    'FontSize',12,'Units','pixel','Position',[380 90 400 600],...
    'Tag','Mod_Insassen<Panel.Auslegung');
Achsen.Insassen=axes('Parent',Panel_Auslegung,'Units','pixels','Position',[1,1,400,600]);
axis equal
xlim([-200,200]);
ylim([-300,300]);
axis off
fig_Insassen.CurrentAxes=Achsen.Insassen;
Fahrer=rectangle('Position',[-100,40,80,96],'Curvature',[0.4 0.3333],'LineWidth',2);
Insassen2=rectangle('Position',[20,40,80,96],'Curvature',[0.4 0.3333],'LineWidth',2);
Insassen3=rectangle('Position',[-100,-136,80,96],'Curvature',[0.4 0.3333],'LineWidth',2);
Insassen4=rectangle('Position',[20,-136,80,96],'Curvature',[0.4 0.3333],'LineWidth',2);

line([-140, 140],[0,0],'Color','k');
line([0, 0],[-180,180],'Color','k');

line([-60, -60],[136,180],'Color','k');
line([60, 60],[136,180],'Color','k');
line([-60, 60],[170,170],'Color','k');

line([-60, -60],[-136,-180],'Color','k');
line([60, 60],[-136,-180],'Color','k');
line([-60, 60],[-170,-170],'Color','k');

line([-100, -140],[88,88],'Color','k');
line([-100,-140],[-88,-88],'Color','k');
line([-130,-130],[-88,88],'Color','k');

line([100, 140],[88,88],'Color','k');
line([100,140],[-88,-88],'Color','k');
line([130,130],[-88,88],'Color','k');

uicontrol('Parent',Panel_Auslegung,'Style','text','Position',[165,480,25,15],...
    'String', 'af','FontSize',11,'HorizontalAlignment','left');
uicontrol('Parent',Panel_Auslegung,'Style','text','Position',[225,480,25,15],...
    'String', 'a2','FontSize',11,'HorizontalAlignment','left');
uicontrol('Parent',Panel_Auslegung,'Style','text','Position',[165,110,25,15],...
    'String', 'a3','FontSize',11,'HorizontalAlignment','left');
uicontrol('Parent',Panel_Auslegung,'Style','text','Position',[225,110,25,15],...
    'String', 'a4','FontSize',11,'HorizontalAlignment','left');

uicontrol('Parent',Panel_Auslegung,'Style','text','Position',[45,340,25,15],...
    'String', 'bf','FontSize',11,'HorizontalAlignment','left');
uicontrol('Parent',Panel_Auslegung,'Style','text','Position',[45,250,25,15],...
    'String', 'b3','FontSize',11,'HorizontalAlignment','left');
uicontrol('Parent',Panel_Auslegung,'Style','text','Position',[340,340,25,15],...
    'String', 'b2','FontSize',11,'HorizontalAlignment','left');
uicontrol('Parent',Panel_Auslegung,'Style','text','Position',[340,250,25,15],...
    'String', 'b4','FontSize',11,'HorizontalAlignment','left');

uicontrol('Parent',Panel_Auslegung,'Style','text','Position',[130,385,25,15],...
    'String', 'mf','FontSize',11,'HorizontalAlignment','left');
uicontrol('Parent',Panel_Auslegung,'Style','text','Position',[250,385,25,15],...
    'String', 'm2','FontSize',11,'HorizontalAlignment','left');
uicontrol('Parent',Panel_Auslegung,'Style','text','Position',[130,210,25,15],...
    'String', 'm3','FontSize',11,'HorizontalAlignment','left');
uicontrol('Parent',Panel_Auslegung,'Style','text','Position',[250,210,25,15],...
    'String', 'm4','FontSize',11,'HorizontalAlignment','left');

%% Push-Button zum Akzeptieren und Schliessen
uicontrol('Parent', fig_Insassen, 'Style','pushbutton',...
    'Position',[500 25 250 30], 'String', 'Akzeptieren und Schliessen',...
    'FontSize',12,'HorizontalAlignment','center','Callback',@Schliessen);
end

%% 3. Callbackfunktion zum Schlie�en der Figure findobj(groot,'Name','Hauptfenster')
function Schliessen(~,~)
% Die Parameterstruktur wird aus der aktuellen Figure (Eigenschaften des 
% Basismoduls) ausgelesen
Parameter = getappdata(gcf,'Parameter');
% Figure (Eigenschaften des Basismoduls) wird geschlossen
delete(gcf);
% Handle der Hauptfigure auslesen
fig_ID = findobj(groot,'Name','Hauptfenster');
% Parameterstruktur wird an die Hauptfigure angeh�ngt
setappdata(fig_ID,'Parameter',Parameter);
% Wiedereinblenden der Hauptgui
set(fig_ID,'Visible','on');
end

