%******************************************************************
%*            Institut für Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Callbackfunktion zur Liste, mit der das Achsenobjekt ausgewählt wird.
% Mit dieser Funktion wird zwischen den beiden Achsenobjekten
% unterschieden, in denen die Lösungen der Simulation geplottet werden können.
% Es ist keine Änderung erforderlich!

function AuswahlAchsenobjekt (hObject, ~) 
% Auswahl entnehmen
Val = get(hObject,'Value');
% Figurehandle laden
fig_ID = gcf;
% Achsenobjekte laden
Axes1 = findobj(gcf,'Tag','Main<Achse.Axes1');
Axes2 = findobj(gcf,'Tag','Main<Achse.Axes2');

%% Abfrage welches Achsenobjekt ausgewählt wurde
if Val == 1
    % Aktuelles Achsenobjekt der Figure ist das obere
    fig_ID.CurrentAxes = Axes1;
    
    % Rückmeldung im Command Window
    disp('Oberes Achsenobjekt ausgewählt');
else
    % Aktuelles Achsenobjekt der Figure ist das untere
    fig_ID.CurrentAxes = Axes2;
    
    % Rückmeldung im Command Window
    disp('Unteres Achsenobjekt ausgewählt');
    
end
end