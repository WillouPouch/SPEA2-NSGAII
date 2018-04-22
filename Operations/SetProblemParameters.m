%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%   Set les paramètres du problème en fonction
%   du problème choisi
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ProblemParameters = SetProblemParameters(idProbleme)

%SCH
if idProbleme == 1
        ProblemParameters.UpperLimit = 1000;
        ProblemParameters.LowerLimit = -1000;
        ProblemParameters.NbVariablesDecision = 1;
%FON
elseif idProbleme == 2
        ProblemParameters.UpperLimit = 4;
        ProblemParameters.LowerLimit = -4;
        ProblemParameters.NbVariablesDecision = 3;
%POL
elseif idProbleme == 3
        ProblemParameters.UpperLimit = pi;
        ProblemParameters.LowerLimit = -pi;
        ProblemParameters.NbVariablesDecision = 2;
%KUR
elseif idProbleme == 4
        ProblemParameters.UpperLimit = 5;
        ProblemParameters.LowerLimit = -5;
        ProblemParameters.NbVariablesDecision = 3;
%ZDT1, ZDT2, ZDT3
elseif idProbleme == 5 || idProbleme == 6 || idProbleme == 7
        ProblemParameters.UpperLimit = 1;
        ProblemParameters.LowerLimit = 0;
        ProblemParameters.NbVariablesDecision = 30;
%ZDT4
elseif idProbleme == 8
        ProblemParameters.UpperLimit = 5;
        ProblemParameters.LowerLimit = -5;
        ProblemParameters.NbVariablesDecision = 10;
%ZDT6        
elseif idProbleme == 9
        ProblemParameters.UpperLimit = 1;
        ProblemParameters.LowerLimit = 0;
        ProblemParameters.NbVariablesDecision = 10;
end