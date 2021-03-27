%******************************************************************
%*            Institut für Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Callbackfunktion zur Liste, in der die Fahrstrecke ausgewählt wird.
% Hier erfolgt die Auswahl der Strecke, mit der die Simulation durchgeführt
% werden soll. Die Bordsteinkante ist gegeben, die Landstraße muss implementiert werden.

function AuswahlMotor(hObject, ~) 
Parameter = getappdata(gcf,'Parameter');
% Auslesen des Wertes (Value) des aufrufenden Objektes
Val = get(hObject,'Value');

Liste = findobj(gcf,'Tag','Mod_Motor<Liste_Motorauslegung');
Panel_MotorauslegungX = findobj(gcf,'Tag','Mod_Motor<Panel.Motorparameterx');

if (Liste.Value == 1)
    Parameter.Mod_Motor.Auslegung = 'Längsauslegung';
 AuslegungL = uipanel('Parent',Panel_MotorauslegungX, 'Units','pixel', 'Position',[0 -1 780 220],...
    'Visible','on','Tag','Mod_Motor<Panel.Motorauslegung');
% Mortormasse 
% Textfeld Mortormasse
 uicontrol('Parent',AuslegungL,'Style','text','Position',[5,190,150,20],...
    'String', 'Mortormasse Mm [kg] :','FontSize',11,'HorizontalAlignment','left');
  
% Editfeld Mortormasse
uicontrol('Parent',AuslegungL,'Style','edit','Position',[220,190,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.Mm),...
    'Tag','Mod_Motor<Edit.Mortormasse-Mm','Callback',@Aenderung_Einstellungen); 
% Anbindungspunkt
% Textfeld 
 uicontrol('Parent',AuslegungL,'Style','text','Position',[5,160,150,20],...
    'String', 'Anbindungspunkte [m] :','FontSize',11,'HorizontalAlignment','left');
  
% Textfeld l1x
 uicontrol('Parent',AuslegungL,'Style','text','Position',[5,130,150,20],...
    'String', 'l1x :','FontSize',11,'HorizontalAlignment','center');
% Editfeld l1x
uicontrol('Parent',AuslegungL,'Style','edit','Position',[220,130,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.l1xl),...
    'Tag','Mod_Motor<Edit.Anbindungspunkt1xl-lx1l','Callback',@Aenderung_Einstellungen); 

% Textfeld l2x
 uicontrol('Parent',AuslegungL,'Style','text','Position',[5,100,150,20],...
    'String', 'l2x :','FontSize',11,'HorizontalAlignment','center');  
% Editfeld l2x
uicontrol('Parent',AuslegungL,'Style','edit','Position',[220,100,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.l2xl),...
    'Tag','Mod_Motor<Edit.Anbindungspunkt2xl-l2xl','Callback',@Aenderung_Einstellungen); 

% Textfeld l2y
 uicontrol('Parent',AuslegungL,'Style','text','Position',[5,70,150,20],...
    'String', 'l2y :','FontSize',11,'HorizontalAlignment','center');  
% Editfeld l2y
uicontrol('Parent',AuslegungL,'Style','edit','Position',[220,70,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.l2yl),...
    'Tag','Mod_Motor<Edit.Anbindungspunkt2yl-l2yl','Callback',@Aenderung_Einstellungen); 
% Textfeld l3y
 uicontrol('Parent',AuslegungL,'Style','text','Position',[5,40,150,20],...
    'String', 'l3y :','FontSize',11,'HorizontalAlignment','center');  
% Editfeld l3y
uicontrol('Parent',AuslegungL,'Style','edit','Position',[220,40,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.l3yl),...
    'Tag','Mod_Motor<Edit.Anbindungspunkt3yl-l3yl','Callback',@Aenderung_Einstellungen); 

% Bild
Achsen.Motor=axes('Parent',AuslegungL,'Units','pixels',...
    'Position',[300,-40,640,288]);
axis equal
xlim([0,800]);
ylim([-150,150]);
axis off
fig_Motor.CurrentAxes=Achsen.Motor;
Motor=rectangle('Position',[180,-20,70,40],'LineWidth',1.5);
cylinder1 = rectangle('Position',[184,-8,16,16],'Curvature',[1 1],'FaceColor','k');
cylinder1 = rectangle('Position',[200,-8,16,16],'Curvature',[1 1],'FaceColor','k');
cylinder1 = rectangle('Position',[216,-8,16,16],'Curvature',[1 1],'FaceColor','k');
cylinder1 = rectangle('Position',[232,-8,16,16],'Curvature',[1 1],'FaceColor','k');
line2 = line([270,270],[-60,60],'Color','k','LineWidth',2);
Rad1 = rectangle('Position',[232.5,60,75,30],'LineWidth',1.5);
Rad2 = rectangle('Position',[232.5,-90,75,30],'LineWidth',1.5);
line3 = line([270,520],[0,0],'Color','k','LineWidth',2);
line4 = line([520,520],[-60,60],'Color','k','LineWidth',2);
Rad3 = rectangle('Position',[482.5,60,75,30],'LineWidth',1.5);
Rad4 = rectangle('Position',[482.5,-90,75,30],'LineWidth',1.5);

AP1 = rectangle('Position',[175,-5,10,10],'Curvature',[1 1],'FaceColor','r');
AP2 = rectangle('Position',[245,15,10,10],'Curvature',[1 1],'FaceColor','r');
AP3 = rectangle('Position',[245,-25,10,10],'Curvature',[1 1],'FaceColor','r');

%show the length
lineL=line([180,180],[20,115],'Color','k');
lineR=line([270,270],[90,115],'Color','k');
Line=line([180,270],[110,110],'Color','k');
uicontrol('Parent',AuslegungL,'Style','text','Position',[464,195,25,15],...
    'String', 'l1x','FontSize',10);
lineL=line([250,250],[25,45],'Color','k');
lineR=line([270,270],[0,45],'Color','k');
Line=line([210,270],[40,40],'Color','k');
uicontrol('Parent',AuslegungL,'Style','text','Position',[464,135,25,15],...
    'String', 'l2x','FontSize',10);
lineL=line([255,310],[20,20],'Color','k');
Line=line([305,305],[0,20],'Color','k');
uicontrol('Parent',AuslegungL,'Style','text','Position',[550,105,25,15],...
    'String', 'l2y','FontSize',10);
lineL=line([255,310],[-20,-20],'Color','k');
Line=line([305,305],[0,-20],'Color','k');
uicontrol('Parent',AuslegungL,'Style','text','Position',[550,85,25,15],...
    'String', 'l3y','FontSize',10);


disp('Auswahl der Längsauslegung');
else
    Parameter.Mod_Motor.Auslegung = 'Querauslegung';
    AuslegungQ = uipanel('Parent',Panel_MotorauslegungX, 'Units','pixel', 'Position',[0 -1 780 220],...
    'Visible','on','Tag','Mod_Motor<Panel.Motorauslegung');
% Mortormasse 
% Textfeld Mortormasse
uicontrol('Parent',AuslegungQ,'Style','text','Position',[5,190,150,20],...
    'String', 'Mortormasse Mm [kg] :','FontSize',11,'HorizontalAlignment','left');
% Editfeld Mortormasse
uicontrol('Parent',AuslegungQ,'Style','edit','Position',[220,190,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.Mm),...
    'Tag','Mod_Motor<Edit.Mortormasse-Mm','Callback',@Aenderung_Einstellungen); 
% Anbindungspunkte
uicontrol('Parent',AuslegungQ,'Style','text','Position',[5,160,150,20],...
    'String', 'Anbindungspunkte [m] :','FontSize',11,'HorizontalAlignment','left');

% Textfeld l1x
uicontrol('Parent',AuslegungQ,'Style','text','Position',[5,130,150,20],...
    'String', 'l1x :','FontSize',11,'HorizontalAlignment','center');
% Editfeld l1x
uicontrol('Parent',AuslegungQ,'Style','edit','Position',[220,130,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.l1xq),...
    'Tag','Mod_Motor<Edit.Anbindungspunkt1xq-l1xq','Callback',@Aenderung_Einstellungen); 

% Textfeld l1y
uicontrol('Parent',AuslegungQ,'Style','text','Position',[5,100,150,20],...
    'String', 'l1yx :','FontSize',11,'HorizontalAlignment','center');
% Editfeld l1y
uicontrol('Parent',AuslegungQ,'Style','edit','Position',[220,100,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.l1yq),...
    'Tag','Mod_Motor<Edit.Anbindungspunkt1yq-l1yq','Callback',@Aenderung_Einstellungen); 

% Textfeld l2x
uicontrol('Parent',AuslegungQ,'Style','text','Position',[5,70,150,20],...
    'String', 'l2x :','FontSize',11,'HorizontalAlignment','center');
% Editfeld l2x
uicontrol('Parent',AuslegungQ,'Style','edit','Position',[220,70,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.l2xq),...
    'Tag','Mod_Motor<Edit.Anbindungspunkt2xq-l2xq','Callback',@Aenderung_Einstellungen); 
% Textfeld l2y
uicontrol('Parent',AuslegungQ,'Style','text','Position',[5,40,150,20],...
    'String', 'l2y :','FontSize',11,'HorizontalAlignment','center');
% Editfeld l2y
uicontrol('Parent',AuslegungQ,'Style','edit','Position',[220,40,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.l2yq),...
    'Tag','Mod_Motor<Edit.Anbindungspunkt2yq-l2yq','Callback',@Aenderung_Einstellungen); 
% Textfeld l3x
uicontrol('Parent',AuslegungQ,'Style','text','Position',[5,10,150,20],...
    'String', 'l3x :','FontSize',11,'HorizontalAlignment','center');
% Editfeld l3x
uicontrol('Parent',AuslegungQ,'Style','edit','Position',[220,10,80,20],...
    'FontSize',10,'String', num2str(Parameter.Mod_Motor.l3xq),...
    'Tag','Mod_Motor<Edit.Anbindungspunkt3xq-l3xq','Callback',@Aenderung_Einstellungen); 

% Bild
Achsen.Motor=axes('Parent',AuslegungQ,'Units','pixels',...
    'Position',[300,-40,640,288]);
axis equal
xlim([0,800]);
ylim([-150,150]);
axis off
fig_Motor.CurrentAxes=Achsen.Motor;
Motor=rectangle('Position',[200,-15,40,70],'LineWidth',1.5);
cylinder1 = rectangle('Position',[212,-14,16,16],'Curvature',[1 1],'FaceColor','k');
cylinder1 = rectangle('Position',[212,3,16,16],'Curvature',[1 1],'FaceColor','k');
cylinder1 = rectangle('Position',[212,21,16,16],'Curvature',[1 1],'FaceColor','k');
cylinder1 = rectangle('Position',[212,39,16,16],'Curvature',[1 1],'FaceColor','k');
line2 = line([270,270],[-60,60],'Color','k','LineWidth',2);
Rad1 = rectangle('Position',[232.5,60,75,30],'LineWidth',1.5);
Rad2 = rectangle('Position',[232.5,-90,75,30],'LineWidth',1.5);
line3 = line([270,520],[0,0],'Color','k','LineWidth',2);
line4 = line([520,520],[-60,60],'Color','k','LineWidth',2);
Rad3 = rectangle('Position',[482.5,60,75,30],'LineWidth',1.5);
Rad4 = rectangle('Position',[482.5,-90,75,30],'LineWidth',1.5);

rectangle('Position',[195,-20,10,10],'Curvature',[1 1],'FaceColor','r');
rectangle('Position',[235,-20,10,10],'Curvature',[1 1],'FaceColor','r');
rectangle('Position',[215,50,10,10],'Curvature',[1 1],'FaceColor','r');

%show the length
lineL=line([220,220],[60,115],'Color','k');
lineR=line([270,270],[90,115],'Color','k');
Line=line([220,270],[110,110],'Color','k');
uicontrol('Parent',AuslegungQ,'Style','text','Position',[484,195,25,15],...
    'String', 'l1x','FontSize',10);
line([270,350],[55,55],'Color','k');
line([270,350],[-15,-15],'Color','k');
line([345,345],[-15,55],'Color','k');
uicontrol('Parent',AuslegungQ,'Style','text','Position',[582,120,20,15],...
    'String', 'l1y','FontSize',10);
uicontrol('Parent',AuslegungQ,'Style','text','Position',[582,84,20,15],...
    'String', 'l2y','FontSize',10);

line([200,200],[-20,-120],'Color','k');
line([270,270],[-90,-120],'Color','k');
line([200,270],[-115,-115],'Color','k');
uicontrol('Parent',AuslegungQ,'Style','text','Position',[482,14,20,15],...
    'String', 'l2x','FontSize',10);
line([240,240],[-20,-50],'Color','k');
line([240,270],[-45,-45],'Color','k');
uicontrol('Parent',AuslegungQ,'Style','text','Position',[495,70,20,15],...
    'String', 'l3x','FontSize',10);
disp('Auswahl der Querauslegung');


end
setappdata(gcf,'Parameter',Parameter);
end