% carrega forcas dos imas de acordo com modo de operacao
%%% Initial Conditions

if strcmpi(mode_version,'M1')
        
    %%% Initial Conditions
    IniCond.Dispersion = [0.231; 0.069; 0; 0];
    IniCond.beta = [9.321, 12.881];
    IniCond.alpha= [-2.647, 2.000];

    %%% Quadrupoles
    qf1a_strength = 1.70521151606;
    qf1b_strength = 1.734817173998;
    qd2_strength  = -2.8243902951;
    qf2_strength  = 2.76086143922;
    qf3_strength  = 2.632182549934;
    qd4a_strength = -3.048732667316;
    qf4_strength  = 3.613066375692;
    qd4b_strength = -1.46213606815;
    
elseif strcmp(mode_version,'M2')
    
    %%% Initial Conditions
    IniCond.Dispersion = [0.231; 0.069; 0; 0];
    IniCond.beta = [9.321, 12.881];
    IniCond.alpha= [-2.647, 2.000];
    
    %%% Quadrupoles
    qf1a_strength = 1.670801801437;
    qf1b_strength = 2.098494339697;
    qd2_strength  = -2.906779151209;
    qf2_strength  = 2.807031512313;
    qf3_strength  = 2.533815202102;
    qd4a_strength = -2.962460334623;
    qf4_strength  = 3.537403658428;
    qd4b_strength = -1.421177262593;
    
else
    error('caso nao implementado');
end
