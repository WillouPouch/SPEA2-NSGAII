%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Algorithme génétique NSGA2
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function NSGA2(UserInput,ProblemParameters,GAParameters)

%-----------------------------------------
%   Init individu vide
%-----------------------------------------
individuVide.Val = [];
individuVide.ValObjective = [];
individuVide.Rank = [];
individuVide.CrowdingDistance = [];
individuVide.DominationSet = [];
individuVide.DominatedCount = [];

%-----------------------------------------
%   Initialisation de la premiere population Po
%-----------------------------------------
Po = InitialisationNSGA2(individuVide, ProblemParameters,GAParameters);
G = 1;

%-----------------------------------------
%   Evaluation de Po (P)
%-----------------------------------------
P = EvaluationNSGA2(UserInput,Po);

%-----------------------------------------
%   Non Dominated Sorting
%-----------------------------------------
[P, F] = NonDominatedSorting(P);

%-----------------------------------------
%   Crowding Distance
%-----------------------------------------
P = CrowdingDistance(P,F);

%-----------------------------------------
%   Tri en fct du rang puis de la distance
%-----------------------------------------
[P, ~] = SortPopulation(P);

%-----------------------------------------
%   Itération pendant Gmax générations
%-----------------------------------------
while (G < GAParameters.Gmax)
    
    %-----------------------------------------
    %   Sélection du MP par tournoi binaire
    %-----------------------------------------
    MP = SelectionTournoi(individuVide, UserInput.Algorithme, P);

    %-----------------------------------------
    %   Croisement (simulated binary crossover)
    %-----------------------------------------
    Enfants = SimulatedBinaryCrossover(individuVide, GAParameters, ProblemParameters, MP);

    %-----------------------------------------
    %   Mutation (polynomial mutation)
    %-----------------------------------------
    Mutants = PolynomialMutation(UserInput.Algorithme,UserInput.Probleme, GAParameters, ProblemParameters, Enfants);
    Mutants = EvaluationNSGA2(UserInput, Mutants);

    %-----------------------------------------
    %   Parents + Enfants mutés
    %-----------------------------------------
    R = [P ; Mutants];
    
    %-----------------------------------------
    %   Non Dominated Sorting & Crowding Distance
    %-----------------------------------------
    [R, F] = NonDominatedSorting(R);
    R = CrowdingDistance(R,F);
    
    %-----------------------------------------
    %   Tri en fct du rang puis de la distance
    %-----------------------------------------
    [Q, ~] = SortPopulation(R);

    %-----------------------------------------
    %   On conserve les N (taille pop) premiers éléments
    %-----------------------------------------
    P = Q(1:GAParameters.PopSize);
    
    %-----------------------------------------
    %   Non Dominated Sorting & Crowding Distance
    %-----------------------------------------
    [P, F] = NonDominatedSorting(P);
    P = CrowdingDistance(P,F);
    
    %-----------------------------------------
    %   Tri en fct du rang puis de la distance
    %-----------------------------------------
    [P, F] = SortPopulation(P);
    
    % Store F1
    F1 = P(F{1});

    %-----------------------------------------
    %   Affichage résultats finaux
    %-----------------------------------------
    AffichageResultats(F1, G);
    
    G = G+1;
end

%-----------------------------------------
%   Affichage résultats finaux
%-----------------------------------------
AffichageResultats(F1, G);
