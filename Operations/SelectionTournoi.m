%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Sélection par tournoi
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MP = SelectionTournoi(individuVide, idAlgo, P)

%-----------------------------------------
%   Init variables
%-----------------------------------------
k = 2; %Nb d'individus en compétition dans le tournoi (binaire)

%-----------------------------------------
%   Variables différement en fonction de l'algorithme
%-----------------------------------------
switch(idAlgo)
    case 1
        F = [P.F];
    case 2
        F = [P.Rank];
end


N = size(P,1);
MP = repmat(individuVide, N, 1);


%-----------------------------------------
%   Parcours du nombre d'individus à sélectionner (N dans le cas général)
%-----------------------------------------
for i = 1:N

    kj = [];
    
    %Génération de k permutations aléatoires
    for j = 1:k
        kj = [kj; randperm(N)];
    end
    
    if F(kj(1,i)) > F(kj(2,i))
        MP(i) = P(kj(1,i));
    else
        MP(i) = P(kj(2,i));
    end
%     if P(kj(1,i)).F > P(kj(2,i)).F
%         MP(i) = P(kj(1,i));
%     else
%         MP(i) = P(kj(2,i));
%     end

end