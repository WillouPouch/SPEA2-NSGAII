%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Tri pop en fct du rang et de la distance
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [I, F] = SortPopulation(I)

    % Tri par Crowding Distance
    [~, CDSO] = sort([I.CrowdingDistance],'descend');
    I = I(CDSO);
    
    % Tri par Rank
    [~, RSO] = sort([I.Rank]);
    I = I(RSO);
    
    % Remet à jour les indices de chaque front
    Ranks = [I.Rank];
    MaxRank = max(Ranks);
    F = cell(MaxRank,1);

    for r = 1:MaxRank
        F{r} = find(Ranks==r);
    end
end