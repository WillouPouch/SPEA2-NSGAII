%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Polynomial Mutation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Mutants = PolynomialMutation(idAlgo, idProbleme, GAParameters, ProblemParameters, Enfants)

%-----------------------------------------
%	Init variables
%-----------------------------------------
L = ProblemParameters.LowerLimit;
U = ProblemParameters.UpperLimit;
pm = GAParameters.Pm;
n = 5;
Mutants = Enfants;
N = size(Enfants,1);
NbDecVar = ProblemParameters.NbVariablesDecision;

%-----------------------------------------
%	Parcours des enfants
%-----------------------------------------
for i = 1:N
   
    if(rand < pm)
        u = rand;
        if(u < 0.5)
              deltaBar = power((2*u),(1/(n+1)))-1;
        elseif(u >= 0.5)
              deltaBar = 1-power(2*(1-u),(1/n+1));
        end

        Mutants(i).Val = abs(Enfants(i).Val + (U-L)*deltaBar);
    end

end

%Opération de faisabilité
for i = 1:size(Mutants)
    for j = 1:NbDecVar
        if  Mutants(i).Val(j) < L
            Mutants(i).Val(j) = L;
        elseif Mutants(i).Val(j) > U
            Mutants(i).Val(j) = U;                    
        end
    end
end

%Si SPEA2, on recalcule les valeur objectivess
if(idAlgo == 1)
    for i = 1:N
        Mutants(i).ValObjective = Probleme(idProbleme,Mutants(i).Val);
    end
end