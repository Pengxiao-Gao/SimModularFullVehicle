function AuswahlSolver(hObject, ~) 
% Laden der Struktur
Parameter = getappdata(gcf,'Parameter');
% Auslesen des Wertes (Value) des aufrufenden Objektes
Val = get(hObject,'Value');

%% Unterscheidug ob Bordsteinkante oder Landstra�e
if Val == 1
    Parameter.Mod_Basis.Solver = 'ode45';
    
    % R�ckmeldung im Command Window
    disp('ode45 Ausgew�hlt');
    
elseif Val == 2
    Parameter.Mod_Basis.Solver = 'ode23';
    
    % R�ckmeldung im Command Window
    disp('ode23 Ausgew�hlt');
    
elseif Val == 3
    Parameter.Mod_Basis.Solver = 'ode23s';
    
    % R�ckmeldung im Command Window
    disp('ode23s Ausgew�hlt');
    
elseif Val == 4
    Parameter.Mod_Basis.Solver = 'ode15s';
    
    % R�ckmeldung im Command Window
    disp('ode15s Ausgew�hlt');
end

% Struktur nach �nderungen an Figure anh�ngen
setappdata(gcf,'Parameter',Parameter);
end