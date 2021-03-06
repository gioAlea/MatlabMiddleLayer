function [r, lattice_title] = sirius_si_lattice(varargin)
% the_ring = sirius_si_lattice       : retorna o modelo atual do anel;
%
% the_ring = sirius_si_lattice(mode) : Ateh o momento, pode ser 'A', 'B' or 'C'(default).
%
% the_ring = sirius_si_lattice(mode,version): mode_version define o ponto de operacao 
%              e a otimizacao sextupolar a ser usada. Exemplos: '01', '02'...
% the_ring = sirius_si_lattice(mode,version, energy): energia em eV;
%
% [the_ring, title] = sirius_si_lattice(...): Also return the name of the
%                       lattice.
%
% Todos os inputs comutam e podem ser passados independentemente.
%
% 2012-08-28: nova rede. (xrr)
% 2013-08-08: inseri marcadores de IDs de 2 m nos trechos retos. (xrr)
% 2013-08-12: corretoras rapidas e atualizacao das lentas e dos BPMs (desenho CAD da Liu). (xrr)
% 2013-10-02: adicionei o mode_version como parametro de input. (Fernando)
% 2014-09-17: modificacao das corretoras para apenas uma par integrado de CV e CH rapidas e lentas no mesmo elemento. (Natalia) 
% 2014-10-07: atualizados nomes de alguns elementos. (xrr)
% 2015-11-03: agora modelo do BC é segmentado

global THERING;


%% global parameters 
%  =================

% --- system parameters ---
energy = 3e9;
mode   = 'S10';
version = '01';
strengths = @set_magnet_strengths;
harmonic_number = 864;

lattice_version = 'SI.V15.01';
% processamento de input (energia e modo de operacao)
for i=1:length(varargin)
    if ischar(varargin{i})
        if any(strcmpi(varargin{i},{'01'}))
            version = varargin{i};
        elseif any(strcmpi(varargin{i},{'S05','S10'}))
            mode = varargin{i};
        else
            fprintf(['%s was not identified as a valid version or mode.\n',...
                     'Continuing with default setup.'],varargin{i});
        end
    elseif isa(varargin{i},'function_handle')
        strengths = varargin{i};
    else
        energy = varargin{i} * 1e9;
    end;
end

lattice_title = [lattice_version, '_', mode, '.', version];
fprintf(['   Loading lattice ' lattice_title ' - ' num2str(energy/1e9) ' GeV' '\n']);

% carrega forcas dos imas de acordo com modo de operacao
strengths();

%% passmethods
%  ===========
bend_pass_method = 'BndMPoleSymplectic4Pass';
quad_pass_method = 'StrMPoleSymplectic4Pass';
sext_pass_method = 'StrMPoleSymplectic4Pass';


%% elements
%  ========
% marker to define points where momentum acceptance will be calculated
m_accep_fam_name = 'calc_mom_accep';
%MOMACCEP = marker(m_accep_fam_name, 'IdentityPass');  %    

% -- drifts --

LKK   = drift('lkk',  1.7630, 'DriftPass');
LPMU  = drift('lpmu', 0.3220, 'DriftPass');
LPMD  = drift('lpmd', 0.4629, 'DriftPass');
LIA   = drift('lia',  1.5179, 'DriftPass');
LIB   = drift('lib',  1.0879, 'DriftPass');
LIP   = drift('lip',  1.0879, 'DriftPass');

L035  = drift('l035', 0.035, 'DriftPass');
L050  = drift('l050', 0.050, 'DriftPass');
L061  = drift('l061', 0.061, 'DriftPass');
L066  = drift('l066', 0.066, 'DriftPass');
L074  = drift('l074', 0.074, 'DriftPass');
L077  = drift('l077', 0.077, 'DriftPass');
L081  = drift('l081', 0.081, 'DriftPass');
L083  = drift('l083', 0.083, 'DriftPass');
L105  = drift('l105', 0.105, 'DriftPass');
L112  = drift('l112', 0.112, 'DriftPass');
L125  = drift('l125', 0.125, 'DriftPass');
L134  = drift('l134', 0.134, 'DriftPass');
L135  = drift('l135', 0.135, 'DriftPass');
L140  = drift('l140', 0.140, 'DriftPass');
L150  = drift('l150', 0.150, 'DriftPass');
L155  = drift('l155', 0.155, 'DriftPass');
L170  = drift('l170', 0.170, 'DriftPass');
L216  = drift('l216', 0.216, 'DriftPass');
L230  = drift('l230', 0.230, 'DriftPass');
L240  = drift('l240', 0.240, 'DriftPass');
L267  = drift('l267', 0.267, 'DriftPass');
L270  = drift('l270', 0.270, 'DriftPass');
L275  = drift('l275', 0.275, 'DriftPass');
L336  = drift('l336', 0.336, 'DriftPass');
L419  = drift('l419', 0.419, 'DriftPass');
L474  = drift('l474', 0.474, 'DriftPass');
L500  = drift('l500', 0.500, 'DriftPass');
L537  = drift('l537', 0.537, 'DriftPass');
L715  = drift('l715', 0.715, 'DriftPass');


% -- dipoles -- 

%deg2rad = pi/180.0;
% B2E = rbend_sirius('b2', 1.231/3, 4.0964*deg2rad/3, 1.4143*deg2rad/2, 0,   0, 0, 0, [0 0 0], [0 -0.78 0], bend_pass_method);
% B2M = rbend_sirius('b2', 1.231/3, 4.0964*deg2rad/3, 0, 0,   0, 0, 0, [0 0 0], [0 -0.78 0], bend_pass_method);
% B2S = rbend_sirius('b2', 1.231/3, 4.0964*deg2rad/3, 0, 1.4143*deg2rad/2,   0, 0, 0, [0 0 0], [0 -0.78 0], bend_pass_method);
% B2  = [MOMACCEP,B2E,MOMACCEP,B2M,MOMACCEP,B2S,MOMACCEP];

[BC, ~] = sirius_si_bc_segmented_model(bend_pass_method, m_accep_fam_name);
[B1, ~] = sirius_si_b1_segmented_model(bend_pass_method, m_accep_fam_name);
[B2, ~] = sirius_si_b2_segmented_model(bend_pass_method, m_accep_fam_name);


% -- quadrupoles --

[QFA, ~] = sirius_si_q20_segmented_model('qfa', qfa_strength,  quad_pass_method);
[QDA, ~] = sirius_si_q14_segmented_model('qda', qda_strength,  quad_pass_method);
[QDB2,~] = sirius_si_q14_segmented_model('qdb2',qdb2_strength, quad_pass_method);
[QFB, ~] = sirius_si_q30_segmented_model('qfb', qfb_strength,  quad_pass_method);
[QDB1,~] = sirius_si_q14_segmented_model('qdb1',qdb1_strength, quad_pass_method);
[QDP2,~] = sirius_si_q14_segmented_model('qdp2',qdp2_strength, quad_pass_method);
[QFP, ~] = sirius_si_q30_segmented_model('qfp', qfp_strength,  quad_pass_method);
[QDP1,~] = sirius_si_q14_segmented_model('qdp1',qdp1_strength, quad_pass_method);
[Q1,  ~] = sirius_si_q20_segmented_model('q1',  q1_strength,   quad_pass_method);
[Q2,  ~] = sirius_si_q20_segmented_model('q2',  q2_strength,   quad_pass_method);
[Q3,  ~] = sirius_si_q20_segmented_model('q3',  q3_strength,   quad_pass_method);
[Q4,  ~] = sirius_si_q20_segmented_model('q4',  q4_strength,   quad_pass_method);


% -- sextupoles --
SDA0  = sextupole('sda0',  0.150, sda0_strength,  sext_pass_method); % CH-CV
SDBA0 = sextupole('sdba0', 0.150, sdba0_strength, sext_pass_method); % CH-CV
SDBP0 = sextupole('sdbp0', 0.150, sdbp0_strength, sext_pass_method); % CH-CV
SDP0  = sextupole('sdp0',  0.150, sdp0_strength,  sext_pass_method); % CH-CV
SDA1  = sextupole('sda1',  0.150, sda1_strength,  sext_pass_method); % QS
SDBA1 = sextupole('sdba1', 0.150, sdba1_strength, sext_pass_method); % QS
SDBP1 = sextupole('sdbp1', 0.150, sdbp1_strength, sext_pass_method); % QS
SDP1  = sextupole('sdp1',  0.150, sdp1_strength,  sext_pass_method); % QS
SDA2  = sextupole('sda2',  0.150, sda2_strength,  sext_pass_method); % CH-CV
SDBA2 = sextupole('sdba2', 0.150, sdba2_strength, sext_pass_method); % CH-CV
SDBP2 = sextupole('sdbp2', 0.150, sdbp2_strength, sext_pass_method); % CH-CV
SDP2  = sextupole('sdp2',  0.150, sdp2_strength,  sext_pass_method); % CH-CV
SDA3  = sextupole('sda3',  0.150, sda3_strength,  sext_pass_method); % --
SDBA3 = sextupole('sdba3', 0.150, sdba3_strength, sext_pass_method); % --
SDBP3 = sextupole('sdbp3', 0.150, sdbp3_strength, sext_pass_method); % --
SDP3  = sextupole('sdp3',  0.150, sdp3_strength,  sext_pass_method); % --
SFA0  = sextupole('sfa0',  0.150, sfa0_strength,  sext_pass_method); % CV
SFBA0 = sextupole('sfba0', 0.150, sfba0_strength, sext_pass_method); % CV
SFBP0 = sextupole('sfbp0', 0.150, sfbp0_strength, sext_pass_method); % CV
SFP0  = sextupole('sfp0',  0.150, sfp0_strength,  sext_pass_method); % CV
SFA1  = sextupole('sfa1',  0.150, sfa1_strength,  sext_pass_method); % QS
SFBA1 = sextupole('sfba1', 0.150, sfba1_strength, sext_pass_method); % QS
SFBP1 = sextupole('sfbp1', 0.150, sfbp1_strength, sext_pass_method); % QS
SFP1  = sextupole('sfp1',  0.150, sfp1_strength,  sext_pass_method); % QS
SFA2  = sextupole('sfa2',  0.150, sfa2_strength,  sext_pass_method); % CH
SFBA2 = sextupole('sfba2', 0.150, sfba2_strength, sext_pass_method); % CH-CV
SFBP2 = sextupole('sfbp2', 0.150, sfbp2_strength, sext_pass_method); % CH
SFP2  = sextupole('sfp2',  0.150, sfp2_strength,  sext_pass_method); % CH-CV

% --- slow correctors ---
CV   = sextupole('cv',        0.150, 0.0, sext_pass_method); % same model as BO correctors

% -- pulsed magnets --
KICKIN = sextupole('kick_in', 0.500, 0.0, sext_pass_method); % injection kicker
PMM    = sextupole('pmm',     0.470, 0.0, sext_pass_method); % pulsed multipole magnet

% -- bpms and fast correctors --
BPM    = marker('bpm', 'IdentityPass');
FC     = sextupole('fc', 0.100, 0.0, sext_pass_method);
RBPM   = marker('rbpm', 'IdentityPass');

% -- rf cavities --
RFC = rfcavity('cav', 0, 3.0e6, 500e6, harmonic_number, 'CavityPass');

% -- lattice markers --
START  = marker('start',    'IdentityPass'); % start of the model
END    = marker('end',      'IdentityPass'); % end of the model
MIA    = marker('mia',      'IdentityPass'); % center of long straight sections (even-numbered)
MIB    = marker('mib',      'IdentityPass'); % center of short straight sections (odd-numbered)
MIP    = marker('mip',      'IdentityPass'); % center of short straight sections (even-numbered)
GIR    = marker('girder',   'IdentityPass'); % marker used to delimitate girders. one marker at begin and another at end of girder.
MIDA   = marker('id_enda',  'IdentityPass'); % marker for the extremities of IDs in long straight sections
MIDB   = marker('id_endb',  'IdentityPass'); % marker for the extremities of IDs in short straight sections
MIDP   = marker('id_endp',  'IdentityPass'); % marker for the extremities of IDs in short straight sections
SEPTIN = marker('eseptinj', 'IdentityPass'); % end of thin injection septum
DCCT1  = marker('dcct1',    'IdentityPass'); % dcct1 to measure beam current
DCCT2  = marker('dcct2',    'IdentityPass'); % dcct2 to measure beam current


%% transport lines

M1A      = [GIR,L134,GIR,QDA,L150,SDA0,L066,FC,L074,QFA,L150,SFA0,L135,BPM,RBPM,GIR];                 % high beta xxM1 girder (with fasc corrector)
M1BA     = [GIR,L134,GIR,QDB1,L150,SDBA0,L240,QFB,L150,SFBA0,L050,FC,L035,QDB2,L140,BPM,RBPM,GIR];    % low beta xxM1 girder
M1BP     = [GIR,L134,GIR,QDB1,L150,SDBP0,L240,QFB,L150,SFBP0,L050,FC,L035,QDB2,L140,BPM,RBPM,GIR];    % low beta xxM1 girder
M1P      = [GIR,L134,GIR,QDP1,L150,SDP0,L240,QFP,L150,SFP0,L050,FC,L035,QDP2,L140,BPM,RBPM,GIR];      % low beta xxM1 girder
M2A      = fliplr(M1A);                                                                               % high beta xxM2 girder (with fast correctors)
M2BA     = fliplr(M1BA);                                                                              % low beta xxM2 girder
M2BP     = fliplr(M1BP);                                                                              % low beta xxM2 girder
M2P      = fliplr(M1P);                                                                               % low beta xxM2 girder
IDA      = [L500,LIA,L500,MIDA,L500,L500,MIA,L500,L500,MIDA,L500,LIA,L500];                           % high beta ID straight section
INJ      = [L500,LIA,L419,SEPTIN,L081,L500,L500,END,START,MIA,LKK,KICKIN,LPMU,PMM,LPMD];              % high beta INJ straight section
IDB      = [L500,LIB,L500,MIDB,L500,L500,MIB,L500,L500,MIDB,L500,LIB,L500];                           % low beta ID straight section
IDP      = [L500,LIP,L500,MIDP,L500,L500,MIP,L500,L500,MIDP,L500,LIP,L500];                           % low beta ID straight section
CAV      = [L500,LIP,L500,L500,L500,MIP,RFC,L500,L500,L500,LIP,L500];                                 % low beta RF cavity straight section 


C1A      = [GIR,L474,GIR,SDA1, L170,Q1,L135,BPM,L125,SFA1, L230,Q2,L170,SDA2, GIR,L155,GIR,BPM,L061];    % arc sector in between B1-B2 (high beta odd-numbered straight sections)
C1BA     = [GIR,L474,GIR,SDBA1,L170,Q1,L135,BPM,L125,SFBA1,L230,Q2,L170,SDBA2,GIR,L155,GIR,BPM,L061];    % arc sector in between B1-B2 (low beta even-numbered straight sections)
C1BP     = [GIR,L474,GIR,SDBP1,L170,Q1,L135,BPM,L125,SFBP1,L230,Q2,L170,SDBP2,GIR,L155,GIR,BPM,L061];    % arc sector in between B1-B2 (low beta even-numbered straight sections)
C1P      = [GIR,L474,GIR,SDP1, L170,Q1,L135,BPM,L125,SFP1, L230,Q2,L170,SDP2, GIR,L155,GIR,BPM,L061];    % arc sector in between B1-B2 (low beta even-numbered straight sections)
C2A      = [GIR,L336,GIR,SDA3, L170,Q3,L230,SFA2, L077,FC,L083,Q4,GIR,L537,GIR,CV,L105,BPM,RBPM,L035];   % arc sector in between B2-BC (high beta odd-numbered straight sections)
C2A_DCCT = [GIR,L336,GIR,SDA3, L170,Q3,L230,SFA2, L077,FC,L083,Q4,GIR,L270,DCCT1,L267,GIR,CV,L105,BPM,RBPM,L035];    % arc sector in between B2-BC with DCCT1 (high beta odd-numbered straight sections)
C2BA     = [GIR,L336,GIR,SDBA3,L170,Q3,L230,SFBA2,L077,FC,L083,Q4,GIR,L537,GIR,CV,L105,BPM,RBPM,L035];   % arc sector in between B2-BC (low beta even-numbered straight sections)
C2BP     = [GIR,L336,GIR,SDBP3,L170,Q3,L230,SFBP2,L077,FC,L083,Q4,GIR,L537,GIR,CV,L105,BPM,RBPM,L035];   % arc sector in between B2-BC (low beta even-numbered straight sections)
C2BP_DCCT= [GIR,L336,GIR,SDBP3,L170,Q3,L230,SFBP2,L077,FC,L083,Q4,GIR,L270,DCCT2,L267,GIR,CV,L105,BPM,RBPM,L035];    % arc sector in between B2-BC with DCCT2 (low beta even-numbered straight sections)
C2P      = [GIR,L336,GIR,SDP3, L170,Q3,L230,SFP2, L077,FC,L083,Q4,GIR,L537,GIR,CV,L105,BPM,RBPM,L035];   % arc sector in between B2-BC (low beta even-numbered straight sections)
C3A      = [GIR,L715,GIR,BPM,RBPM,L112,Q4,L083,FC,L077,SFA2, L230,Q3,L170,SDA3, GIR,L275,GIR,BPM,L061];  % arc sector in between BC-B2 (high beta odd-numbered straight sections)
C3BA     = [GIR,L715,GIR,BPM,RBPM,L112,Q4,L083,FC,L077,SFBA2,L230,Q3,L170,SDBA3,GIR,L275,GIR,BPM,L061];  % arc sector in between BC-B2 (low beta even-numbered straight sections)
C3BP     = [GIR,L715,GIR,BPM,RBPM,L112,Q4,L083,FC,L077,SFBP2,L230,Q3,L170,SDBP3,GIR,L275,GIR,BPM,L061];  % arc sector in between BC-B2 (low beta even-numbered straight sections)
C3P      = [GIR,L715,GIR,BPM,RBPM,L112,Q4,L083,FC,L077,SFP2, L230,Q3,L170,SDP3, GIR,L275,GIR,BPM,L061];  % arc sector in between BC-B2 (low beta even-numbered straight sections)
C4A      = [GIR,L216,GIR,SDA2, L170,Q2,L230,SFA1, L125,BPM,L135,Q1,L170,SDA1, GIR,L474,GIR];             % arc sector in between B2-B1 (high beta odd-numbered straight sections)
C4BA     = [GIR,L216,GIR,SDBA2,L170,Q2,L230,SFBA1,L125,BPM,L135,Q1,L170,SDBA1,GIR,L474,GIR];             % arc sector in between B2-B1 (low beta even-numbered straight sections)
C4BP     = [GIR,L216,GIR,SDBP2,L170,Q2,L230,SFBP1,L125,BPM,L135,Q1,L170,SDBP1,GIR,L474,GIR];             % arc sector in between B2-B1 (low beta even-numbered straight sections)
C4P      = [GIR,L216,GIR,SDP2, L170,Q2,L230,SFP1, L125,BPM,L135,Q1,L170,SDP1, GIR,L474,GIR];             % arc sector in between B2-B1 (low beta even-numbered straight sections)



%% GIRDERS

% straight sections
SS_S01 = INJ; SS_S02 = IDB;
SS_S03 = CAV; SS_S04 = IDB;
SS_S05 = IDA; SS_S06 = IDB;
SS_S07 = IDP; SS_S08 = IDB;
SS_S09 = IDA; SS_S10 = IDB;
SS_S11 = IDP; SS_S12 = IDB;
SS_S13 = IDA; SS_S14 = IDB;
SS_S15 = IDP; SS_S16 = IDB;
SS_S17 = IDA; SS_S18 = IDB;
SS_S19 = IDP; SS_S20 = IDB;

% down and upstream straight sections
M1_S01 = M1A;  M2_S01 = M2A;  
M1_S02 = M1BA; M2_S02 = M2BP;
M1_S03 = M1P;  M2_S03 = M2P;
M1_S04 = M1BP; M2_S04 = M2BA;
M1_S05 = M1A;  M2_S05 = M2A;  
M1_S06 = M1BA; M2_S06 = M2BP;
M1_S07 = M1P;  M2_S07 = M2P;
M1_S08 = M1BP; M2_S08 = M2BA;
M1_S09 = M1A;  M2_S09 = M2A;  
M1_S10 = M1BA; M2_S10 = M2BP;
M1_S11 = M1P;  M2_S11 = M2P;
M1_S12 = M1BP; M2_S12 = M2BA;
M1_S13 = M1A;  M2_S13 = M2A;  
M1_S14 = M1BA; M2_S14 = M2BP;
M1_S15 = M1P;  M2_S15 = M2P;
M1_S16 = M1BP; M2_S16 = M2BA;
M1_S17 = M1A;  M2_S17 = M2A;  
M1_S18 = M1BA; M2_S18 = M2BP;
M1_S19 = M1P;  M2_S19 = M2P;
M1_S20 = M1BP; M2_S20 = M2BA;

% dispersive arcs
C1_S01 = C1A; C2_S01 = C2A;    C3_S01 = C3BA;C4_S01 = C4BA;
C1_S02 = C1BP;C2_S02 = C2BP;   C3_S02 = C3P; C4_S02 = C4P;
C1_S03 = C1P; C2_S03 = C2P;    C3_S03 = C3BP;C4_S03 = C4BP;
C1_S04 = C1BA;C2_S04 = C2BA;   C3_S04 = C3A; C4_S04 = C4A;
C1_S05 = C1A; C2_S05 = C2A;    C3_S05 = C3BA;C4_S05 = C4BA;
C1_S06 = C1BP;C2_S06 = C2BP;   C3_S06 = C3P; C4_S06 = C4P;
C1_S07 = C1P; C2_S07 = C2P;    C3_S07 = C3BP;C4_S07 = C4BP;
C1_S08 = C1BA;C2_S08 = C2BA;   C3_S08 = C3A; C4_S08 = C4A;
C1_S09 = C1A; C2_S09 = C2A;    C3_S09 = C3BA;C4_S09 = C4BA;
C1_S10 = C1BP;C2_S10 = C2BP;   C3_S10 = C3P; C4_S10 = C4P;
C1_S11 = C1P; C2_S11 = C2P;    C3_S11 = C3BP;C4_S11 = C4BP;
C1_S12 = C1BA;C2_S12 = C2BA;   C3_S12 = C3A; C4_S12 = C4A;
C1_S13 = C1A; C2_S13 =C2A_DCCT;C3_S13 = C3BA;C4_S13 = C4BA;
C1_S14 = C1BP;C2_S14=C2BP_DCCT;C3_S14 = C3P; C4_S14 = C4P;
C1_S15 = C1P; C2_S15 = C2P;    C3_S15 = C3BP;C4_S15 = C4BP;
C1_S16 = C1BA;C2_S16 = C2BA;   C3_S16 = C3A; C4_S16 = C4A;
C1_S17 = C1A; C2_S17 = C2A;    C3_S17 = C3BA;C4_S17 = C4BA;
C1_S18 = C1BP;C2_S18 = C2BP;   C3_S18 = C3P; C4_S18 = C4P;
C1_S19 = C1P; C2_S19 = C2P;    C3_S19 = C3BP;C4_S19 = C4BP;
C1_S20 = C1BA;C2_S20 = C2BA;   C3_S20 = C3A; C4_S20 = C4A;


%% SECTORS # 01..20

S01 = [M1_S01, SS_S01, M2_S01, B1, C1_S01, B2, C2_S01, BC, C3_S01, B2, C4_S01, B1];
S02 = [M1_S02, SS_S02, M2_S02, B1, C1_S02, B2, C2_S02, BC, C3_S02, B2, C4_S02, B1];
S03 = [M1_S03, SS_S03, M2_S03, B1, C1_S03, B2, C2_S03, BC, C3_S03, B2, C4_S03, B1];
S04 = [M1_S04, SS_S04, M2_S04, B1, C1_S04, B2, C2_S04, BC, C3_S04, B2, C4_S04, B1];
S05 = [M1_S05, SS_S05, M2_S05, B1, C1_S05, B2, C2_S05, BC, C3_S05, B2, C4_S05, B1];
S06 = [M1_S06, SS_S06, M2_S06, B1, C1_S06, B2, C2_S06, BC, C3_S06, B2, C4_S06, B1];
S07 = [M1_S07, SS_S07, M2_S07, B1, C1_S07, B2, C2_S07, BC, C3_S07, B2, C4_S07, B1];
S08 = [M1_S08, SS_S08, M2_S08, B1, C1_S08, B2, C2_S08, BC, C3_S08, B2, C4_S08, B1];
S09 = [M1_S09, SS_S09, M2_S09, B1, C1_S09, B2, C2_S09, BC, C3_S09, B2, C4_S09, B1];
S10 = [M1_S10, SS_S10, M2_S10, B1, C1_S10, B2, C2_S10, BC, C3_S10, B2, C4_S10, B1];
S11 = [M1_S11, SS_S11, M2_S11, B1, C1_S11, B2, C2_S11, BC, C3_S11, B2, C4_S11, B1];
S12 = [M1_S12, SS_S12, M2_S12, B1, C1_S12, B2, C2_S12, BC, C3_S12, B2, C4_S12, B1];
S13 = [M1_S13, SS_S13, M2_S13, B1, C1_S13, B2, C2_S13, BC, C3_S13, B2, C4_S13, B1];
S14 = [M1_S14, SS_S14, M2_S14, B1, C1_S14, B2, C2_S14, BC, C3_S14, B2, C4_S14, B1];
S15 = [M1_S15, SS_S15, M2_S15, B1, C1_S15, B2, C2_S15, BC, C3_S15, B2, C4_S15, B1];
S16 = [M1_S16, SS_S16, M2_S16, B1, C1_S16, B2, C2_S16, BC, C3_S16, B2, C4_S16, B1];
S17 = [M1_S17, SS_S17, M2_S17, B1, C1_S17, B2, C2_S17, BC, C3_S17, B2, C4_S17, B1];
S18 = [M1_S18, SS_S18, M2_S18, B1, C1_S18, B2, C2_S18, BC, C3_S18, B2, C4_S18, B1];
S19 = [M1_S19, SS_S19, M2_S19, B1, C1_S19, B2, C2_S19, BC, C3_S19, B2, C4_S19, B1];
S20 = [M1_S20, SS_S20, M2_S20, B1, C1_S20, B2, C2_S20, BC, C3_S20, B2, C4_S20, B1];
anel = [S01,S02,S03,S04,S05,S06,S07,S08,S09,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20];
elist = anel;


%% finalizations

THERING = buildlat(elist);
THERING = setcellstruct(THERING, 'Energy', 1:length(THERING), energy);

% shifts lattice to start at the marker 'start'
idx = findcells(THERING, 'FamName', 'start');
if ~isempty(idx)
    THERING = [THERING(idx:end) THERING(1:idx-1)];
end

% checks if there are negative-drift elements
lens = getcellstruct(THERING, 'Length', 1:length(THERING));
if any(lens < 0)
    error(['AT model with negative drift in ' mfilename ' !\n']);
end

% adjusts RF frequency according to lattice length and synchronous condition
%[beta, ~, ~] = lnls_beta_gamma(energy/1e9);
const  = lnls_constants;
L0_tot = findspos(THERING, length(THERING)+1);
%rev_freq    = beta * const.c / L0_tot;
rev_freq    = const.c / L0_tot;
fprintf('   Circumference: %.5f m\n', L0_tot);

rf_idx      = findcells(THERING, 'FamName', 'cav');
rf_frequency = rev_freq * harmonic_number;
THERING{rf_idx}.Frequency = rf_frequency;
fprintf(['   RF frequency set to ' num2str(rf_frequency/1e6) ' MHz.\n']);

% by default cavities and radiation is set to off 
setcavity('off'); 
setradiation('off');

% sets default NumIntSteps values for elements
THERING = set_num_integ_steps(THERING);

% define vacuum chamber for all elements
THERING = set_vacuum_chamber(THERING);

% defines girders
THERING = set_girders(THERING);

% pre-carrega passmethods de forma a evitar problema com bibliotecas recem-compiladas
lnls_preload_passmethods;

r = THERING;



function the_ring = set_girders(the_ring)

gir = findcells(the_ring,'FamName','girder');

gir_ini = gir(1:2:end);
gir_end = gir(2:2:end);
if isempty(gir), return; end

for ii=1:length(gir_ini)
    idx = gir_ini(ii):gir_end(ii);
    name_girder = sprintf('%03d',ii);
    the_ring = setcellstruct(the_ring,'Girder',idx,name_girder);
end
the_ring(gir) = [];

function the_ring = set_num_integ_steps(the_ring)

mags = findcells(the_ring, 'PolynomB');
bends = findcells(the_ring,'BendingAngle');
quad_sext = setdiff(mags,bends);
kicks = findcells(the_ring, 'XGrid');

% value determined by a convergence study and relaxed by running time:
len_b  = 5e-2;
len_qs = 1.5e-2;

bends_len = getcellstruct(the_ring, 'Length', bends);
bends_nis = ceil(bends_len / len_b);
the_ring = setcellstruct(the_ring, 'NumIntSteps', bends, bends_nis);

quad_sext_len = getcellstruct(the_ring, 'Length', quad_sext);
quad_sext_nis = ceil(quad_sext_len / len_qs);
the_ring = setcellstruct(the_ring, 'NumIntSteps', quad_sext, quad_sext_nis);

the_ring = setcellstruct(the_ring, 'NumIntSteps', kicks, 1);

