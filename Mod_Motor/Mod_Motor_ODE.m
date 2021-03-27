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
function [xi_p] = Mod_Motor_ODE(xi_p,t,xi,Parameter)
%Auslesen der Modulindizes aus Struktur
idx = Parameter.Mod_Motor.idx;

% Position der Motormasse 
zm = xi(idx(1));
zm_p = xi(idx(2));

% Oszillierende Massenkraft Fos 

m2 = 10; r = 0.15; la = 0.33; w = Parameter.Mod_Motor.U*2*pi/60;
Fos = -4*m2*r*w^2*la*cos(2*w*t);

% Oszillierende Massenmoment Mx
Mx = -4*m2*r^2*w^2*(0.5*sin(2*w*t)+(la/2)^2*sin(4*w*t));

if strcmp(Parameter.Mod_Motor.Auslegung , 'Längsauslegung')
    % 3 Anbindungspunkte
Fm1 = Parameter.Mod_Motor.cm*(zm-(xi(3)-(Parameter.Mod_Basis.lv+Parameter.Mod_Motor.l1xl)*sin(xi(5))))...
    +Parameter.Mod_Motor.bm*(zm_p-(xi(13)-(Parameter.Mod_Basis.lv+Parameter.Mod_Motor.l1xl)*xi(15)*cos(xi(5))));

Fm2 = Parameter.Mod_Motor.cm*(zm-(xi(3)-(Parameter.Mod_Basis.lv+Parameter.Mod_Motor.l2xl)*sin(xi(5))...
    -Parameter.Mod_Motor.l2yl*sin(xi(4))))...
    +Parameter.Mod_Motor.bm*(zm_p-(xi(13)-(Parameter.Mod_Basis.lv+Parameter.Mod_Motor.l2xl)*xi(15)*cos(xi(5))...
    -Parameter.Mod_Motor.l2yl*xi(14)*cos(xi(4))));
Fm3 = Parameter.Mod_Motor.cm*(zm-(xi(3)-(Parameter.Mod_Basis.lv+Parameter.Mod_Motor.l2xl)*sin(xi(5))...
    +Parameter.Mod_Motor.l3yl*sin(xi(4))))...
    +Parameter.Mod_Motor.bm*(zm_p-(xi(13)-(Parameter.Mod_Basis.lv+Parameter.Mod_Motor.l2xl)*xi(15)*cos(xi(5))...
    +Parameter.Mod_Motor.l3yl*xi(14)*cos(xi(4))));

xi_p(13) = xi_p(13)+(Fm1+Fm2+Fm3+Fos)/Parameter.Mod_Basis.mA;
xi_p(14) = xi_p(14)+(Mx-Fm2*Parameter.Mod_Motor.l2yl+Fm3*Parameter.Mod_Motor.l3yl)/Parameter.Mod_Basis.JxA; 
xi_p(15) = xi_p(15)+((-Fm1+Fos/3)*(Parameter.Mod_Motor.l1xl+Parameter.Mod_Basis.lv)...
                    +(-Fm2-Fm3+2*Fos/3)*(Parameter.Mod_Motor.l2xl+Parameter.Mod_Basis.lv))/Parameter.Mod_Basis.JyA; 
xi_p(idx(1)) = xi(idx(2));
xi_p(idx(2)) = (-Fm1-Fm2-Fm3+Fos)/Parameter.Mod_Motor.Mm;     

    
elseif strcmp(Parameter.Mod_Motor.Auslegung , 'Querauslegung')
% Kraefte zwischen Aufbau und Motor berechnen
Fm1 = Parameter.Mod_Motor.cm*(zm-(xi(3)-Parameter.Mod_Motor.l1yq*sin(xi(4))-(Parameter.Mod_Basis.lv+Parameter.Mod_Motor.l1xq)*sin(xi(5))))...
    +Parameter.Mod_Motor.bm*(zm_p-(xi(13)-Parameter.Mod_Motor.l1yq*xi(14)*cos(xi(4))-(Parameter.Mod_Basis.lv+Parameter.Mod_Motor.l1xq)*xi(15)*cos(xi(5))));
Fm2 = Parameter.Mod_Motor.cm*(zm-(xi(3)+Parameter.Mod_Motor.l2yq*sin(xi(4))-(Parameter.Mod_Basis.lv+Parameter.Mod_Motor.l2xq)*sin(xi(5))))...
    +Parameter.Mod_Motor.bm*(zm_p-(xi(13)+Parameter.Mod_Motor.l2yq*xi(14)*cos(xi(4))-(Parameter.Mod_Basis.lv+Parameter.Mod_Motor.l2xq)*xi(15)*cos(xi(5))));
Fm3 = Parameter.Mod_Motor.cm*(zm-(xi(3)+Parameter.Mod_Motor.l2yq*sin(xi(4))-(Parameter.Mod_Basis.lv+Parameter.Mod_Motor.l3xq)*sin(xi(5))))...
    +Parameter.Mod_Motor.bm*(zm_p-(xi(13)+Parameter.Mod_Motor.l2yq*xi(14)*cos(xi(4))-(Parameter.Mod_Basis.lv+Parameter.Mod_Motor.l3xq)*xi(15)*cos(xi(5))));

% Berücksichtigung eventueller Kopplungen zu Freiheitsgraden Basismodul
% xi_p(5) = xi_p(5)+xi(idx(1));
% Nickwinkelbeschleunigung
xi_p(13) = xi_p(13)+(Fm1+Fm2+Fm3+Fos)/Parameter.Mod_Basis.mA;
xi_p(14) = xi_p(14)+((-Fm1+Fos/3)*Parameter.Mod_Motor.l1yq-(-Fm2-Fm3+2*Fos/3)*Parameter.Mod_Motor.l2yq)/Parameter.Mod_Basis.JxA; 
xi_p(15) = xi_p(15)+((-Fm1+Fos/3)*(Parameter.Mod_Motor.l1xq+Parameter.Mod_Basis.lv)+(-Fm2+Fos/3-Mx/(Parameter.Mod_Motor.l2xq-Parameter.Mod_Motor.l3xq))*(Parameter.Mod_Motor.l2xq+Parameter.Mod_Basis.lv)...
                    +(-Fm3+Fos/3+Mx/(Parameter.Mod_Motor.l2xq-Parameter.Mod_Motor.l3xq)*Parameter.Mod_Motor.l2yq)*(Parameter.Mod_Motor.l3xq+Parameter.Mod_Basis.lv))/Parameter.Mod_Basis.JyA; 
% ODE des Moduls
%xi_p(idx(1)) = xi(idx(2));
%xi_p(idx(2)) = -xi(idx(1))+xi(2);

% Mototmassebeschleunigung in z-Richtung
xi_p(idx(1)) = xi(idx(2));
xi_p(idx(2)) = (-Fm1-Fm2-Fm3+Fos)/Parameter.Mod_Motor.Mm;      
end

end