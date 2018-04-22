%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Algorithme génétique SPEA2
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function SPEA2(UserInput,ProblemParameters,GAParameters)

%-----------------------------------------
%   Init individu vide
%-----------------------------------------
individuVide.Val = [];
individuVide.ValObjective = [];
individuVide.S = [];
individuVide.R = [];
individuVide.sigma = [];
individuVide.sigmaK = [];
individuVide.D = [];
individuVide.F = [];

%-----------------------------------------
%   Initialisation
%-----------------------------------------
Pop = InitialisationSPEA2(individuVide, ProblemParameters,GAParameters,UserInput);
archive = [];
G = 1;

%-----------------------------------------
%   Itération pendant Gmax générations
%-----------------------------------------
while (G < GAParameters.Gmax) 
    
    P = [Pop; archive];
    
    %-----------------------------------------
    %   Evaluation
    %-----------------------------------------
    P = EvaluationSPEA2(UserInput,GAParameters,P);

    %-----------------------------------------
    %   Sélection de l'environnement
    %-----------------------------------------
    archive = SelectionEnvironnement(P, GAParameters);
    
    %-----------------------------------------
    %   Traitements
    %-----------------------------------------
    %Approximation du front de pareto
    paretoFront = archive([archive.F] < 1);
    
    %Plot Résultat
    AffichageResultats(paretoFront, G);
    
    %Vérification condition de fin
    if G >= GAParameters.Gmax
        break;
    end 
    
    %-----------------------------------------
    %   Sélection du MP par tournoi binaire
    %-----------------------------------------
    MP = SelectionTournoi(individuVide, UserInput.Algorithme, archive);
    
    %-----------------------------------------
    %   Croisement (simulated binary crossover)
    %-----------------------------------------
    Enfants = SimulatedBinaryCrossover(individuVide, GAParameters, ProblemParameters, MP);
    
    %-----------------------------------------
    %   Mutation (polynomial mutation)
    %-----------------------------------------
    Pop = PolynomialMutation(UserInput.Algorithme,UserInput.Probleme, GAParameters, ProblemParameters, Enfants);
    
    G = G+1;
end

%-----------------------------------------
%   Affichage résultats finaux
%-----------------------------------------
AffichageResultats(paretoFront, G);
   




