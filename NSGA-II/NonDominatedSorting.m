%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Non Dominated Sorting
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [P, F] = NonDominatedSorting(P)

%-----------------------------------------
%	Init variables
%-----------------------------------------
N = size(P,1);
F{1}=[];

%-----------------------------------------
%	Boucle de comparaison entre
%   les individus
%-----------------------------------------
for i = 1:N
    %Sélection d'un individu
    individu = P(i);
    individu.DominationSet=[];
    individu.DominatedCount=0;

    for j = 1:N
        %Eviter de comparer un individu à lui-meme
        if j==i
            continue;
        end

        %Comparaison de l'individu avec les autres individus
        %(dominance)
        individuCompar = P(j);
        
        %Rapport de dominance
        if RappDom(individu,individuCompar)
            %Dominance de l'individu => on ajoute l'individu comparé dans
            %"DominationSet"
            individu.DominationSet = [individu.DominationSet j];
        elseif RappDom(individuCompar,individu)
            %Dominance de l'individu comparé => on incrémente le compteur
            %dominé de l'individu
            individu.DominatedCount = individu.DominatedCount+1;
        end
    end
    
    %Rang 1 pour l'individu qui domine tous les autres
    if individu.DominatedCount == 0
        individu.Rank = 1;
        F{1}=[F{1} i];
    end
    
    %On réinsère les changements d'un individu dans le tableau
    P(i) = individu;
end

f = 1; %numéro du rang

%-----------------------------------------
%	Boucle de classement par rang 
%   de la population
%-----------------------------------------
while true
    Q = [];

    for i = 1:size(F{f},2)
        individu = P(F{f}(i));

        for j = 1:size(individu.DominationSet,2)
            indivDom = P(individu.DominationSet(j));          
            indivDom.DominatedCount = indivDom.DominatedCount - 1;

            if(indivDom.DominatedCount == 0)
                indivDom.Rank = f + 1; %rang suivant
                Q = [Q individu.DominationSet(j)];
            end
            
            P(individu.DominationSet(j)) = indivDom; %maj d'un individu dominé
        end
    end
    
    %Condition de sortie de la boucle infinie
    if isempty(Q)
        break;
    end

    F{f+1} = Q;
    f = f + 1;
end