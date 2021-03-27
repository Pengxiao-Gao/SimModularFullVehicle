function Aenderung_Achsengrenzen(~, ~)
% Laden der Struktur
Parameter = getappdata(gcf,'Parameter');

% Den Parameter, der anzeigt ob Achsengrenzen automatisch ist ver�ndern. 
Parameter.Mod_Basis.Achsengrenzen = ~Parameter.Mod_Basis.Achsengrenzen;

% Laden eines Panels zur Strukturierung von Tab3. Bei Auswahl der
% automatischen Achsengrenzen k�nnen Einstellungsfelder f�r Achsengrenzen unsichtbar werden.
Panel_Achsengrenzen = findobj(gcf,'Tag','Main<Panel.Achsengrenzen');


if Parameter.Mod_Basis.Achsengrenzen
    % Erweiterung der GUI f�r Einstellungen zum Achsengrenzen
    Panel_Achsengrenzen.Visible = 'on';
else
    % schalten der Einstellungen zum Achsengrenzen ab
    Panel_Achsengrenzen.Visible = 'off';
end
% Struktur nach �nderungen an Figure anh�ngen
setappdata(gcf,'Parameter',Parameter);
end
