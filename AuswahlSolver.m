function AuswahlSolver(hObject, ~) 
% Laden der Struktur
Parameter = getappdata(gcf,'Parameter');
% Auslesen des Wertes (Value) des aufrufenden Objektes
Val = get(hObject,'Value');

%% Unterscheidug ob Bordsteinkante oder Landstraße
if Val == 1
    Parameter.Mod_Basis.Solver = 'ode45';
    
    % Rückmeldung im Command Window
    disp('ode45 Ausgewählt');
    
elseif Val == 2
    Parameter.Mod_Basis.Solver = 'ode23';
    
    % Rückmeldung im Command Window
    disp('ode23 Ausgewählt');
    
elseif Val == 3
    Parameter.Mod_Basis.Solver = 'ode23s';
    
    % Rückmeldung im Command Window
    disp('ode23s Ausgewählt');
    
elseif Val == 4
    Parameter.Mod_Basis.Solver = 'ode15s';
    
    % Rückmeldung im Command Window
    disp('ode15s Ausgewählt');
end

% Struktur nach Änderungen an Figure anhängen
setappdata(gcf,'Parameter',Parameter);
end