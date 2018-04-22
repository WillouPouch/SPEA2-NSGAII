%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   TP2 - Métaheuristiques en optimisation
%
%   Esmé James - JAME15539504
%   Wilfried Pouchous - POUW04069501
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------
%	Clear
%-----------------------------------------
clc;
clear;
close all;

%-----------------------------------------
%   Ajout de chemins
%-----------------------------------------
addpath(genpath('Problemes'));
addpath(genpath('SPEA2'));
addpath(genpath('NSGA-II'));
addpath(genpath('Operations'));

%-----------------------------------------
%   Choix utilisateurs
%-----------------------------------------
%[UserInput, GAParameters] = GetUserInput();

%###########################################################################################################
%--ATTENTION : PAS DE TEST SUR LES VALEURS ENTREES ICI

UserInput.Probleme = 1; %1 = SCH, 2 = FON, 3 = POL, 4 = KUR, 5 = ZDT1, 6 = ZDT2, 7 = ZDT3, 8 = ZDT4, 9 = ZDT6
UserInput.Algorithme = 2; %1 = SPEA2, 2 = NGSA-II

GAParameters.PopSize = 100; %temp
GAParameters.ArchiveSize = 100; %temp
GAParameters.Gmax = 100; %temp
GAParameters.Pc = 0.7; %temp
GAParameters.Pm = 0.4; %temp

%###########################################################################################################

%-----------------------------------------
%   Set des paramètres du problème
%-----------------------------------------
ProblemParameters = SetProblemParameters(UserInput.Probleme);

%-----------------------------------------
%   Appel de l'algorithme génétique
%-----------------------------------------
switch (UserInput.Algorithme)
    % 1 = SPEA2
    case 1
        SPEA2(UserInput,ProblemParameters,GAParameters);
    %2 = NSGA-II
    case 2
        NSGA2(UserInput,ProblemParameters,GAParameters);
end

%-----------------------------------------
%   Suppression des chemins
%-----------------------------------------
rmpath('Problemes');
rmpath('SPEA2');
rmpath('NSGA-II');
rmpath('Operations');