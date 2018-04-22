%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Étape d'initialisation
%
%       Génère des individus aléatoire
%       dans les limites du problème et
%       l'ensemble vide archive
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Po = InitialisationSPEA2(individuVide, ProblemParameters,GAParameters,UserInput)

%-----------------------------------------
%	Init variables
%-----------------------------------------
A = ProblemParameters.LowerLimit;
B = ProblemParameters.UpperLimit;
N = GAParameters.PopSize;
n = ProblemParameters.NbVariablesDecision;

%Population initiale vide
Po = repmat(individuVide, N, 1);

%-----------------------------------------
%   Génération d'une population aléatoire
%   entre les bornes du problème
%-----------------------------------------
for i = 1:N
  
    Po(i).Val = A+(B-A)*rand(n,1);
    Po(i).ValObjective = Probleme(UserInput.Probleme,Po(i).Val);
    
end