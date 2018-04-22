%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Étape d'évaluation
%
%       Affectation d'une 'qualité' à chaque
%       individu, une valeur de fitness
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function P = EvaluationSPEA2(UserInput, GAParameters,P)

%-----------------------------------------
%	Init variables
%-----------------------------------------
N = GAParameters.PopSize;
NA = GAParameters.ArchiveSize;
NP = size(P,1);
dominance = false(NP,NP);
k = round(sqrt(N+NA));

%On initialise S à 0
for i = 1:NP
    P(i).S = 0;
end

%-----------------------------------------
%	Test de domination => donne S
%-----------------------------------------
for i = 1:NP
   
    for j = i+1:NP
        
        %Si les variables de décision de i dominent j
        if all(P(i).ValObjective <= P(j).ValObjective) && any(P(i).ValObjective < P(j).ValObjective)
            P(i).S = P(i).S + 1;
            dominance(i,j) = true;
            
        %Si les variables de décision j dominent i
        elseif all(P(j).ValObjective <= P(i).ValObjective) && any(P(j).ValObjective < P(i).ValObjective)
            P(j).S = P(j).S + 1;
            dominance(j,i) = true;
        end
    end
end

%-----------------------------------------
%	Calcul de R = Raw Fitness
%-----------------------------------------
S = [P.S];
for i = 1:NP
    P(i).R = sum(S(dominance(:,i)));
end

%-----------------------------------------
%	Calcul de densité D
%-----------------------------------------

z = [];
for i = 1:NP
    z = [z; Probleme(UserInput.Probleme,P(i).Val)];
end

%tableau de distance entre les individus, puis tri
sigma = pdist2(abs(z),abs(z)); 
sigma = sort(sigma);

for i = 1:NP
    P(i).sigma = sigma(:,i);
    P(i).sigmaK = P(i).sigma(k);
    
    %densité D
    P(i).D = 1/(P(i).sigmaK+2);
end

%-----------------------------------------
%	Calcul de F
%-----------------------------------------
for i = 1:NP
    P(i).F = P(i).R + P(i).D;
end







