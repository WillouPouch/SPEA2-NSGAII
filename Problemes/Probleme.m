%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Probleme
%
%       Sélectionne le problème à traiter
%       en fonction du choix utilisateur
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function f = Probleme(idProbleme,x)

switch idProbleme
    %SCH
    case 1
        f = SCH(x);
    %FON
    case 2
        f = FON(x);
    %POL
    case 3 
        f = POL(x);
    %KUR
    case 4
        f = KUR(x);
    %ZDT1
    case 5
        f = ZDT1(x);
    %ZDT2
    case 6
        f = ZDT2(x);
    %ZDT3
    case 7
        f = ZDT3(x);
    %ZDT4
    case 8
        f = ZDT4(x);
    %ZDT6
    case 9
        f = ZDT6(x);
end