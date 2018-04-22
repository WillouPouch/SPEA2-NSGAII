%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Crowding Distance
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function P = CrowdingDistance(P,F)

m = 2; %nombre de valeurs objectives
nbFront = size(F,2); %nombre de valeurs dans le front F

%On parcourt chaque front un par un
for i = 1:nbFront
    Fi = F{i};
    nbSolFront = size(Fi,2);
    
    valObj = [P(Fi).ValObjective];
    dist = zeros(nbSolFront, m);
    
    %Calcul de la crowding distance pour chaque objectif
    for j = 1:m        
        [valTri, indTri] = sort(valObj(j,:));
        
        dist(indTri(1),j) = inf;
        for k = 2:nbSolFront-1
            dist(indTri(k),j) = abs(valTri(k+1)-valTri(k-1))/abs(valTri(1)-valTri(end));
        end
        dist(indTri(end),j) = inf;
    end
    
    for j = 1:nbSolFront
        P(Fi(j)).CrowdingDistance = sum(dist(j,:));
    end

end