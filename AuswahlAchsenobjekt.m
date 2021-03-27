%******************************************************************
%*            Institut f�r Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Callbackfunktion zur Liste, mit der das Achsenobjekt ausgew�hlt wird.
% Mit dieser Funktion wird zwischen den beiden Achsenobjekten
% unterschieden, in denen die L�sungen der Simulation geplottet werden k�nnen.
% Es ist keine �nderung erforderlich!

function AuswahlAchsenobjekt (hObject, ~) 
% Auswahl entnehmen
Val = get(hObject,'Value');
% Figurehandle laden
fig_ID = gcf;
% Achsenobjekte laden
Axes1 = findobj(gcf,'Tag','Main<Achse.Axes1');
Axes2 = findobj(gcf,'Tag','Main<Achse.Axes2');

%% Abfrage welches Achsenobjekt ausgew�hlt wurde
if Val == 1
    % Aktuelles Achsenobjekt der Figure ist das obere
    fig_ID.CurrentAxes = Axes1;
    
    % R�ckmeldung im Command Window
    disp('Oberes Achsenobjekt ausgew�hlt');
else
    % Aktuelles Achsenobjekt der Figure ist das untere
    fig_ID.CurrentAxes = Axes2;
    
    % R�ckmeldung im Command Window
    disp('Unteres Achsenobjekt ausgew�hlt');
    
end
end