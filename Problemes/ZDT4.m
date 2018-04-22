%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   ZDT4
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function f = ZDT4(x)

f1 = x(1,1);

somme = 0;
for i = 2:size(x,1)
    somme = somme + ( x(i).^2 - 10*cos(4*pi*x(i)) );
end
g = 1 + 10*(size(x,1)-1) + somme;
f2 = g * ( 1 - sqrt(x(1,1)/g) );

f = [f1; f2];
