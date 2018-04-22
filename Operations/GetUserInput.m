%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Récupérer les données utilisateur
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [UserInput, GAParameters] = GetUserInput()

disp('Algorithme génétique multi-objectif');
disp('------------------------------------------------------------');

%-----------------------------------------
%   Choix problème
%-----------------------------------------
disp('I - Problème à traiter');
UserInput.Probleme = input('     1 = SCH, 2 = FON, 3 = POL, 4 = KUR, 5 = ZDT1, 6 = ZDT2, 7 = ZDT3, 8 = ZDT4, 9 = ZDT6\n     Votre choix : ');
%Test validité
if (UserInput.Probleme ~= 1 && UserInput.Probleme ~= 2 && UserInput.Probleme ~= 3 && UserInput.Probleme ~= 4 && UserInput.Probleme ~= 5 && UserInput.Probleme ~= 6 && UserInput.Probleme ~= 7 && UserInput.Probleme ~= 8 && UserInput.Probleme ~= 9)
    disp('     Choix non valide -> Problème 1 = SCH choisi par défaut');
    UserInput.Probleme = 1;
end

%-----------------------------------------
%   Choix problème
%-----------------------------------------
disp('II - Algorithme à utiliser');
UserInput.Algorithme = input('     1 = SPEA2, 2 = NGSA-II\n     Votre choix : ');
%Test validité
if (UserInput.Algorithme ~= 1 && UserInput.Algorithme ~= 2)
    disp('     Choix non valide -> Algorithme 1 = SPEA2 choisi par défaut');
    UserInput.Algorithme = 1;
end

%-----------------------------------------
%   Paramètres généraux
%-----------------------------------------
disp('III - Paramètres généraux du problème');
GAParameters.PopSize = input('     Taille de population (N) : ');
GAParameters.ArchiveSize = input('     Taille archive (NA) : ');
GAParameters.Gmax = input('     Nombre de générations max (Gmax) : ');
GAParameters.Pc = input('     Probabilité de croisement Pc (entre 0 et 1) : ');
GAParameters.Pm = input('     Probabilité de mutation Pm (entre 0 et 1) : ');

%-----------------------------------------
%   Autres paramètres appliqués
%-----------------------------------------
disp('IV - Autres paramètres appliqués par défaut');
disp('     Sélection : Par tournoi binaire');
disp('     Croisement : Simulated Binary');
disp('     Mutation : Polynomial');



disp('V - Lancement');
disp('------------------------------------------------------------');