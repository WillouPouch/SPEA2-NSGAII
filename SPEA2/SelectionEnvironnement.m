%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Sélection environnement
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function archive = SelectionEnvironnement(P, GAParameters)

%-----------------------------------------
%	Init variables
%-----------------------------------------
NP = size(P,1);
archiveSize = GAParameters.ArchiveSize;
nextGenArchive = [];

%-----------------------------------------
%	On trouve la population non dominée (ou F < 1)
%-----------------------------------------
for i = 1:NP
    if P(i).F < 1
        nextGenArchive = [nextGenArchive; P(i)];
    end
end

%Si la taillePopNonDominee < tailleArchive, on copie les meilleurs NA-tailleArchive
if size(nextGenArchive,1) <= archiveSize
    
    %on trie par valeur de fitness
    [~, indexTri] = sort([P.F]);
    P = P(indexTri);
    
    %On garde les NA-tailleArchive meilleurs dans l'archive
    nextGenArchive = P(1:archiveSize);
    
%Si la taillePopNonDominee > tailleArchive, on tronque 
else %if size(nextGenArchive) > archiveSize
    
    %sigma non dominés
    tempSigma = [P.sigma];
    sigma = tempSigma(:,[P.F]<1); 
    
    %Tant que la taillePopNonDominee > tailleArchive on continue de tronquer
    while size(nextGenArchive,1) > archiveSize
        
        k = 2;
        while min(sigma(k,:)) == max(sigma(k,:)) && k < size(sigma,1)
            k = k + 1;
        end
        
        %On garde l'index j de l'individu qui a une distance minimale a un autre individu
        [~, j] = min(sigma(k,:));
            
        %On tronque l'archive à l'indice j
        nextGenArchive(j) = [];
        sigma(:,j) = [];
    end
end

archive = nextGenArchive;


