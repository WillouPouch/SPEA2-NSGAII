%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   ZDT1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function f = ZDT1(x)

f1 = x(1,1);

somme = 0;
for i = 2:size(x,1)
    somme = somme + x(i);
end
g = 1 + 9 * somme/(size(x,1)-1);
f2 = g * (1 - sqrt(x(1,1)/g));

f = [f1; f2];

  