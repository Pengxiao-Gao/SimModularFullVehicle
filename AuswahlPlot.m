%******************************************************************
%*            Institut für Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Callbackfunktion zu den Listen, mit denen die zu plottenden Daten 
% ausgewählt werden.Diese Funktion soll die, mit Hilfe der Listen, 
% ausgewählten Daten in das zuvor ausgewählte Achsenobjekt plotten. Eine 
% Plotformatierung sollte hier ebenfalls erfolgen. Beispielhafter Plot für 
% die Vertikalauslenkung des Aufbaus (Aufruf über Liste für x-Achse).

function AuswahlPlot (hObject, ~) 

% Auswahl aus der aufrufenden Liste entnehmen
Val = get(hObject,'Value');
% Lösungsvektoren laden
t = getappdata(gcf,'t');
xi = getappdata(gcf,'xi');

% Listen der zu plottenden Daten laden
Modulcheck_Insassen = findobj(gcf,'Tag','Main<Checkbox.Insassen');
Modulcheck_Insassen = findobj(gcf,'Tag','Main<Checkbox.Motor');
ListeX = findobj(gcf,'Tag','Main<Liste.AuswahlXAchse');
ListeY = findobj(gcf,'Tag','Main<Liste.AuswahlYAchse');

% Auslesen des Tags des aktuellen Achsenobjekts
CurrentTag = get(gca,'Tag');

%% Abfrage welche zu plottenden Daten ausgewählt wurden (Ändern/Erweitern!)
% Zustand der Checkbox
% Auslesen der vorhandenen Module
Module = getappdata(gcf, 'Module');
Parameter = getappdata(gcf, 'Parameter');


if (Parameter.Mod_Insassen.Aktiv == 0)&(Parameter.Mod_Motor.Aktiv == 0)

if (ListeX.Value == 1 && ListeY.Value == 1)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.¸Ä
    plot(t,xi(:,3));
    xlabel('Zeit in s');
    ylabel('Vertikalauslenkung in m');
    title('Weg über Zeit');
    grid on;
    %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');    
  elseif (ListeX.Value == 1 && ListeY.Value == 2)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,13));
       xlabel('Zeit in s');
       ylabel('Veritikalgeschwindigkeit in m/s');
       title('Vertikalgeschwindigkeit über Zeit');
       grid on;    
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
  elseif (ListeX.Value == 1 && ListeY.Value == 3)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,5)*180/pi);
       xlabel('Zeit in s');
       ylabel('Nickwinkel in °');
       title('Nickwinkel über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
  elseif (ListeX.Value == 1 && ListeY.Value == 4)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,15)*180/pi);
       xlabel('Zeit in s');
       ylabel('Nickgeschwindigkeit in °/s');
       title('Nickgeschwindigkeit über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');   
  elseif (ListeX.Value == 1 && ListeY.Value == 5)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,4)*180/pi);
       xlabel('Zeit in s');
       ylabel('Wankwinkel in °');
       title('Wankwinkel über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');    
  elseif (ListeX.Value == 1 && ListeY.Value == 6)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,14)*180/pi);
       xlabel('Zeit in s');
       ylabel('Wankgeschwindigkeit in °/s');
       title('Wankgeschwindigkeit über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
  elseif (ListeX.Value == 2 && ListeY.Value == 2)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(xi(:,3),xi(:,13));
       xlabel('Vertikalauslenkung in m');
       ylabel('Vertikalgeschwindigkeit in m/s');
       title('Phasenportrait Aufbau');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');
  elseif (ListeX.Value == 3 && ListeY.Value == 4)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(xi(:,5)*180/pi,xi(:,15)*180/pi);
       xlabel('Nickwinkel in °');
       ylabel('Nickgeschwindigkeit in °/s');
       title('Phasenportrait Nicken');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
  elseif (ListeX.Value == 4 && ListeY.Value == 6)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(xi(:,4)*180/pi,xi(:,14)*180/pi);
       xlabel('Wankwinkel in °');
       ylabel('Wankgeschwindigkeit in °/s');
       title('Phasenportrait Wank');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
 

end
elseif (Parameter.Mod_Insassen.Aktiv == 1)&(Parameter.Mod_Motor.Aktiv == 0)

    if (ListeX.Value == 1 && ListeY.Value == 1)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.¸Ä
    plot(t,xi(:,3));
    xlabel('Zeit in s');
    ylabel('Vertikalauslenkung in m');
    title('Weg über Zeit');
    grid on;
    %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');    
  elseif (ListeX.Value == 1 && ListeY.Value == 2)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,13));
       xlabel('Zeit in s');
       ylabel('Veritikalgeschwindigkeit in m/s');
       title('Vertikalgeschwindigkeit über Zeit');
       grid on;    
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
  elseif (ListeX.Value == 1 && ListeY.Value == 3)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,5)*180/pi);
       xlabel('Zeit in s');
       ylabel('Nickwinkel in °');
       title('Nickwinkel über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
  elseif (ListeX.Value == 1 && ListeY.Value == 4)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,15)*180/pi);
       xlabel('Zeit in s');
       ylabel('Nickgeschwindigkeit in °/s');
       title('Nickgeschwindigkeit über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');   
  elseif (ListeX.Value == 1 && ListeY.Value == 5)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,4)*180/pi);
       xlabel('Zeit in s');
       ylabel('Wankwinkel in °');
       title('Wankwinkel über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');    
  elseif (ListeX.Value == 1 && ListeY.Value == 6)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,14)*180/pi);
       xlabel('Zeit in s');
       ylabel('Wankgeschwindigkeit in °/s');
       title('Wankgeschwindigkeit über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
  elseif (ListeX.Value == 2 && ListeY.Value == 2)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(xi(:,3),xi(:,13));
       xlabel('Vertikalauslenkung in m');
       ylabel('Vertikalgeschwindigkeit in m/s');
       title('Phasenportrait Aufbau');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');
  elseif (ListeX.Value == 3 && ListeY.Value == 4)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(xi(:,5)*180/pi,xi(:,15)*180/pi);
       xlabel('Nickwinkel in °');
       ylabel('Nickgeschwindigkeit in °/s');
       title('Phasenportrait Nicken');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
  elseif (ListeX.Value == 4 && ListeY.Value == 6)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(xi(:,4)*180/pi,xi(:,14)*180/pi);
       xlabel('Wankwinkel in °');
       ylabel('Wankgeschwindigkeit in °/s');
       title('Phasenportrait Wank');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
 

    % Insassen  
    % Fahrer
elseif (ListeX.Value == 1 && ListeY.Value == 7)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(1)));
      xlabel('Zeit in s');
      ylabel('Vertikalauslenkung in m')
      title('Weg zur zeit /Fahrer');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 1 && ListeY.Value == 8)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(5)));
      xlabel('Zeit in s');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Geschwindigkeit /Fahrer');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 5 && ListeY.Value == 8)
       idx = Parameter.Mod_Insassen.idx;
      plot(xi(:,idx(1)),xi(:,idx(5)));
      xlabel('Vertikalauslenkung in m');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Phasenportrait Fahrer');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
 % 2.Insassen
 elseif (ListeX.Value == 1 && ListeY.Value == 9)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(2)));
      xlabel('Zeit in s');
      ylabel('Vertikalauslenkung in m')
      title('Weg zur zeit /2.Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 1 && ListeY.Value == 10)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(6)));
      xlabel('Zeit in s');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Geschwindigkeit /2. Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 6 && ListeY.Value == 10)
       idx = Parameter.Mod_Insassen.idx;
      plot(xi(:,idx(2)),xi(:,idx(6)));
      xlabel('Vertikalauslenkung in m');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Phasenportrait 2.Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
% 3.Insassen
elseif (ListeX.Value == 1 && ListeY.Value == 11)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(3)));
      xlabel('Zeit in s');
      ylabel('Vertikalauslenkung in m')
      title('Weg zur zeit /3.Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 1 && ListeY.Value == 12)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(7)));
      xlabel('Zeit in s');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Geschwindigkeit /3. Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 7 && ListeY.Value == 12)
       idx = Parameter.Mod_Insassen.idx;
      plot(xi(:,idx(3)),xi(:,idx(7)));
      xlabel('Vertikalauslenkung in m');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Phasenportrait 3.Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
% 4.Insassen
elseif (ListeX.Value == 1 && ListeY.Value == 13)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(4)));
      xlabel('Zeit in s');
      ylabel('Vertikalauslenkung in m')
      title('Weg zur zeit /4.Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 1 && ListeY.Value == 14)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(8)));
      xlabel('Zeit in s');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Geschwindigkeit /4. Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 8 && ListeY.Value == 14)
       idx = Parameter.Mod_Insassen.idx;
      plot(xi(:,idx(4)),xi(:,idx(8)));
      xlabel('Vertikalauslenkung in m');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Phasenportrait 4.Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
    end
elseif (Parameter.Mod_Insassen.Aktiv == 0)&(Parameter.Mod_Motor.Aktiv == 1)
    if (ListeX.Value == 1 && ListeY.Value == 1)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.¸Ä
    plot(t,xi(:,3));
    xlabel('Zeit in s');
    ylabel('Vertikalauslenkung in m');
    title('Weg über Zeit');
    grid on;
    %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');    
  elseif (ListeX.Value == 1 && ListeY.Value == 2)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,13));
       xlabel('Zeit in s');
       ylabel('Veritikalgeschwindigkeit in m/s');
       title('Vertikalgeschwindigkeit über Zeit');
       grid on;    
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
  elseif (ListeX.Value == 1 && ListeY.Value == 3)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,5)*180/pi);
       xlabel('Zeit in s');
       ylabel('Nickwinkel in °');
       title('Nickwinkel über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
  elseif (ListeX.Value == 1 && ListeY.Value == 4)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,15)*180/pi);
       xlabel('Zeit in s');
       ylabel('Nickgeschwindigkeit in °/s');
       title('Nickgeschwindigkeit über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');   
  elseif (ListeX.Value == 1 && ListeY.Value == 5)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,4)*180/pi);
       xlabel('Zeit in s');
       ylabel('Wankwinkel in °');
       title('Wankwinkel über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');    
  elseif (ListeX.Value == 1 && ListeY.Value == 6)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,14)*180/pi);
       xlabel('Zeit in s');
       ylabel('Wankgeschwindigkeit in °/s');
       title('Wankgeschwindigkeit über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
  elseif (ListeX.Value == 2 && ListeY.Value == 2)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(xi(:,3),xi(:,13));
       xlabel('Vertikalauslenkung in m');
       ylabel('Vertikalgeschwindigkeit in m/s');
       title('Phasenportrait Aufbau');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');
  elseif (ListeX.Value == 3 && ListeY.Value == 4)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(xi(:,5)*180/pi,xi(:,15)*180/pi);
       xlabel('Nickwinkel in °');
       ylabel('Nickgeschwindigkeit in °/s');
       title('Phasenportrait Nicken');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
  elseif (ListeX.Value == 4 && ListeY.Value == 6)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(xi(:,4)*180/pi,xi(:,14)*180/pi);
       xlabel('Wankwinkel in °');
       ylabel('Wankgeschwindigkeit in °/s');
       title('Phasenportrait Wank');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
  elseif (ListeX.Value == 1 && ListeY.Value == 7)
      idx = Parameter.Mod_Motor.idx;
      plot(t,xi(:,idx(1)));
      xlabel('Zeit in s');
      ylabel('Vertikalauslenkung in m')
      title('Vertikalauslenkung Motormasse');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
   elseif (ListeX.Value == 1 && ListeY.Value == 8)
       idx = Parameter.Mod_Motor.idx;
      plot(t,xi(:,idx(2)));
      xlabel('Vertikalauslenkung in m');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Vertikalgeschwindigkeit Motormasse');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
     elseif (ListeX.Value == 5 && ListeY.Value == 8)
       idx = Parameter.Mod_Motor.idx;
      plot(xi(:,idx(1)),xi(:,idx(2)));
      xlabel('Zeit in s');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Phasenportrait Motor');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
    end
else
    if (ListeX.Value == 1 && ListeY.Value == 1)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.¸Ä
    plot(t,xi(:,3));
    xlabel('Zeit in s');
    ylabel('Vertikalauslenkung in m');
    title('Weg über Zeit');
    grid on;
    %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');    
  elseif (ListeX.Value == 1 && ListeY.Value == 2)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,13));
       xlabel('Zeit in s');
       ylabel('Veritikalgeschwindigkeit in m/s');
       title('Vertikalgeschwindigkeit über Zeit');
       grid on;    
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
  elseif (ListeX.Value == 1 && ListeY.Value == 3)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,5)*180/pi);
       xlabel('Zeit in s');
       ylabel('Nickwinkel in °');
       title('Nickwinkel über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
  elseif (ListeX.Value == 1 && ListeY.Value == 4)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,15)*180/pi);
       xlabel('Zeit in s');
       ylabel('Nickgeschwindigkeit in °/s');
       title('Nickgeschwindigkeit über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');   
  elseif (ListeX.Value == 1 && ListeY.Value == 5)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,4)*180/pi);
       xlabel('Zeit in s');
       ylabel('Wankwinkel in °');
       title('Wankwinkel über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');    
  elseif (ListeX.Value == 1 && ListeY.Value == 6)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(t,xi(:,14)*180/pi);
       xlabel('Zeit in s');
       ylabel('Wankgeschwindigkeit in °/s');
       title('Wankgeschwindigkeit über Zeit');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
  elseif (ListeX.Value == 2 && ListeY.Value == 2)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(xi(:,3),xi(:,13));
       xlabel('Vertikalauslenkung in m');
       ylabel('Vertikalgeschwindigkeit in m/s');
       title('Phasenportrait Aufbau');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert');
  elseif (ListeX.Value == 3 && ListeY.Value == 4)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(xi(:,5)*180/pi,xi(:,15)*180/pi);
       xlabel('Nickwinkel in');
       ylabel('Nickgeschwindigkeit in °/s');
       title('Phasenportrait Nicken');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
  elseif (ListeX.Value == 4 && ListeY.Value == 6)
    % Die dritte Spalte der Lösung entspricht dem dritten Freiheitsgrad.
       plot(xi(:,4)*180/pi,xi(:,14)*180/pi);
       xlabel('Wankwinkel in');
       ylabel('Wankgeschwindigkeit in °/s');
       title('Phasenportrait Wank');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
  elseif (ListeX.Value == 1 && ListeY.Value == 7)
      idx = Parameter.Mod_Motor.idx;
      plot(t,xi(:,idx(1)));
      xlabel('Zeit in s');
      ylabel('Vertikalauslenkung in m')
      title('Vertikalauslenkung Motormasse');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
   elseif (ListeX.Value == 1 && ListeY.Value == 8)
       idx = Parameter.Mod_Motor.idx;
      plot(t,xi(:,idx(2)));
      xlabel('Vertikalauslenkung in m');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Vertikalgeschwindigkeit Motormasse');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
     elseif (ListeX.Value == 5 && ListeY.Value == 8)
       idx = Parameter.Mod_Motor.idx;
      plot(xi(:,idx(1)),xi(:,idx(2)));
      xlabel('Zeit in s');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Phasenportrait Motor');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 

    % Insassen  
    % Fahrer
elseif (ListeX.Value == 1 && ListeY.Value == 9)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(1)));
      xlabel('Zeit in s');
      ylabel('Vertikalauslenkung in m')
      title('Weg zur zeit /Fahrer');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 1 && ListeY.Value == 10)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(5)));
      xlabel('Zeit in s');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Geschwindigkeit /Fahrer');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 6 && ListeY.Value == 10)
       idx = Parameter.Mod_Insassen.idx;
      plot(xi(:,idx(1)),xi(:,idx(5)));
      xlabel('Vertikalauslenkung in m');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Phasenportrait Fahrer');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
 % 2.Insassen
 elseif (ListeX.Value == 1 && ListeY.Value == 11)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(2)));
      xlabel('Zeit in s');
      ylabel('Vertikalauslenkung in m')
      title('Weg zur zeit /2.Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 1 && ListeY.Value == 12)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(6)));
      xlabel('Zeit in s');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Geschwindigkeit /2. Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 7 && ListeY.Value == 12)
       idx = Parameter.Mod_Insassen.idx;
      plot(xi(:,idx(2)),xi(:,idx(6)));
      xlabel('Vertikalauslenkung in m');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Phasenportrait 2.Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
% 3.Insassen
elseif (ListeX.Value == 1 && ListeY.Value == 13)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(3)));
      xlabel('Zeit in s');
      ylabel('Vertikalauslenkung in m')
      title('Weg zur zeit /3.Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 1 && ListeY.Value == 14)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(7)));
      xlabel('Zeit in s');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Geschwindigkeit /3. Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 8 && ListeY.Value == 14)
       idx = Parameter.Mod_Insassen.idx;
      plot(xi(:,idx(3)),xi(:,idx(7)));
      xlabel('Vertikalauslenkung in m');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Phasenportrait 3.Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
% 4.Insassen
elseif (ListeX.Value == 1 && ListeY.Value == 15)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(4)));
      xlabel('Zeit in s');
      ylabel('Vertikalauslenkung in m')
      title('Weg zur zeit /4.Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 1 && ListeY.Value == 16)
       idx = Parameter.Mod_Insassen.idx;
      plot(t,xi(:,idx(8)));
      xlabel('Zeit in s');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Geschwindigkeit /4. Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 
elseif (ListeX.Value == 9 && ListeY.Value == 16)
       idx = Parameter.Mod_Insassen.idx;
      plot(xi(:,idx(4)),xi(:,idx(8)));
      xlabel('Vertikalauslenkung in m');
      ylabel('Vertikalgeschwindigkeit in m/s')
      title('Phasenportrait 4.Insassen');
       grid on;
        %Aenderung der Achsengrenzen
    if Parameter.Mod_Basis.Achsengrenzen == 1
      xlim([Parameter.Mod_Basis.Xmin Parameter.Mod_Basis.Xmax]);
      ylim([Parameter.Mod_Basis.Ymin Parameter.Mod_Basis.Ymax]);
    else
        xlim auto;
        ylim auto;
    end
    % Rückmeldung im Command Window
    disp('Plot aktualisiert'); 

    end
end


% alten Tag neu als Eigenschaft setzten, da bei Titelbeschriftung Tag
% gelöscht wird
set(gca,'Tag',CurrentTag);
end