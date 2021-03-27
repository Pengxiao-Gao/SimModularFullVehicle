%******************************************************************
%*            Institut für Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
% 
% Diese Datei beinhaltet die Differentialgleichungen des Vorlagenmoduls.
% In der Funktion Mod_Basis_ODE muss diese Funktion, falls erforderlich,
% aufgerufen werden. Dabei fügen sich die zusätzlichen Freiheitsgrade an 
% das Differentialgleichungssystem des Basismoduls hinten dran. 
% Dies geschieht über den Parameter/ Index 
% idx. Für eine unterschiedliche Anzahl an Modulen, die in beliebiger
% Reihenfolge aktiviert werden können, ermöglicht der Index den Zusatz der
% Freiheitsgrade. Der Index zählt somit die Differenz
% zwischen Gesamtdimension und Dimension aller aktivierten Module. 
% Diese Datei dient als Vorlage, sie erweitert nicht das Basismodul!
% 
function [xi_p] = Mod_Insassen_ODE(xi_p,t,xi,Parameter)
%Auslesen der Modulindizes aus Struktur
idx = Parameter.Mod_Insassen.idx;

% Position der Fahrer und Insassen 
zf = xi(idx(1));
z2 = xi(idx(2));
z3 = xi(idx(3));
z4 = xi(idx(4));
zf_p = xi(idx(5));
z2_p = xi(idx(6));
z3_p = xi(idx(7));
z4_p = xi(idx(8));
% Aufbauposition bei Insassen
zaf=xi(3)-Parameter.Mod_Insassen.bf*sin(xi(5))+Parameter.Mod_Insassen.af*sin(xi(4));
zaf_p=xi(13)-Parameter.Mod_Insassen.bf*xi(15)*cos(xi(5))+Parameter.Mod_Insassen.af*xi(14)*cos(xi(4));

za2=xi(3)-Parameter.Mod_Insassen.b2*sin(xi(5))-Parameter.Mod_Insassen.a2*sin(xi(4));
za2_p=xi(13)-Parameter.Mod_Insassen.b2*xi(15)*cos(xi(5))-Parameter.Mod_Insassen.a2*xi(14)*cos(xi(4));

za3=xi(3)+Parameter.Mod_Insassen.b3*sin(xi(5))+Parameter.Mod_Insassen.a3*sin(xi(4));
za3_p=xi(13)+Parameter.Mod_Insassen.b3*xi(15)*cos(xi(5))+Parameter.Mod_Insassen.a3*xi(14)*cos(xi(4));

za4=xi(3)+Parameter.Mod_Insassen.b4*sin(xi(5))-Parameter.Mod_Insassen.a4*sin(xi(4));
za4_p=xi(13)+Parameter.Mod_Insassen.b4*xi(15)*cos(xi(5))-Parameter.Mod_Insassen.a4*xi(14)*cos(xi(4));
% Kraefte zwischen Aufbau und Motor berechnen
Fzf = Parameter.Mod_Insassen.ci*(zaf-xi(idx(1)))+Parameter.Mod_Insassen.bi*(zaf_p-xi(idx(5)));

if Parameter.Mod_Insassen2.Aktiv
   Fz2 = Parameter.Mod_Insassen.ci*(za2-xi(idx(2)))+Parameter.Mod_Insassen.bi*(za2_p-xi(idx(6)));
else
   Fz2 = 0;
end


if Parameter.Mod_Insassen3.Aktiv
    Fz3 = Parameter.Mod_Insassen.ci*(za3-xi(idx(3)))+Parameter.Mod_Insassen.bi*(za3_p-xi(idx(7)));
else 
    Fz3 = 0;
end


if Parameter.Mod_Insassen4.Aktiv
    Fz4 = Parameter.Mod_Insassen.ci*(za4-xi(idx(4)))+Parameter.Mod_Insassen.bi*(za4_p-xi(idx(8)));   
else
    Fz4 = 0;
end
% Berücksichtigung eventueller Kopplungen zu Freiheitsgraden Basismodul
% xi_p(5) = xi_p(5)+xi(idx(1));
% Nickwinkelbeschleunigung
xi_p(13) = xi_p(13)-(Fzf+Fz2+Fz3+Fz4)/Parameter.Mod_Basis.mA;
xi_p(14) = xi_p(14)-(Fzf*Parameter.Mod_Insassen.af+Fz3*Parameter.Mod_Insassen.a3...
                    -Fz2*Parameter.Mod_Insassen.a2-Fz4*Parameter.Mod_Insassen.a4)/Parameter.Mod_Basis.JxA;
xi_p(15) = xi_p(15)-(-Fzf*Parameter.Mod_Insassen.bf-Fz2*Parameter.Mod_Insassen.b2...
                    +Fz3*Parameter.Mod_Insassen.b3+Fz4*Parameter.Mod_Insassen.b4)/Parameter.Mod_Basis.JyA;
% ODE des Moduls
%xi_p(idx(1)) = xi(idx(2));
%xi_p(idx(2)) = -xi(idx(1))+xi(2);

% Mototmassebeschleunigung in z-Richtung
xi_p(idx(1)) = xi(idx(5));
xi_p(idx(2)) = xi(idx(6));
xi_p(idx(3)) = xi(idx(7));
xi_p(idx(4)) = xi(idx(8));
xi_p(idx(5)) = Fzf/Parameter.Mod_Insassen.mf;
xi_p(idx(6)) = Fz2/Parameter.Mod_Insassen.m2;
xi_p(idx(7)) = Fz3/Parameter.Mod_Insassen.m3;
xi_p(idx(8)) = Fz4/Parameter.Mod_Insassen.m4;


end