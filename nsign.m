%******************************************************************
%*            Institut f�r Dynamik und Schwingungen               *
%*      Modellierung und Simulation in der Fahrzeugtechnik        *
%*                           Labor                                *
%******************************************************************
%
% Aufgeweichte Signum Funktion (auch Vorzeichenfunktion genannt)
% Wird verwendet, da echte Sigumfunktion numerisches L�sen erschwert.
function y = nsign(x)

nsignSlope = 1000;
y = 2/pi*atan(pi/2*nsignSlope*x);

end

% Diese Funktion wird bei steifen DGL's ben�tigt. Sie ordnet die Vorzeichen
% richtig zu.

% WICHTIG bei Sprungfunktionen