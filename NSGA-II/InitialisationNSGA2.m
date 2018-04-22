%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Étape d'initialisation
%
%       Génère des individus aléatoire
%       dans les limites du problème
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Pop = InitialisationNSGA2(individuVide, ProblemParameters,GAParameters)

%-----------------------------------------
%	Init variables
%-----------------------------------------
A = ProblemParameters.LowerLimit;
B = ProblemParameters.UpperLimit;
N = GAParameters.PopSize;
n = ProblemParameters.NbVariablesDecision;

%-----------------------------------------
%	Regroupement des colonnes en une tab
%-----------------------------------------
Pop = repmat(individuVide,N,1);

%-----------------------------------------
%   Génération d'une population aléatoire
%   entre les bornes du problème
%-----------------------------------------
for i = 1:N
    Pop(i).Val = A+(B-A)*rand(n,1);
end