function bts(varargin)
% Lattice definition file - generated by dimad2at v1.300000 
%
% Eugene Tan 2006-08-16: Modified to load lattice into the global variable
%                        LTB rather than THERING. Set various elements to
%                        work with asboosterinit.
%
% ThinCorrectorPass is obsolete. Only use CorrectorPass
% 

global FAMLIST THERING GLOBVAL

GLOBVAL.E0 = 3e9;
GLOBVAL.LatticeFile = 'btswrk';
FAMLIST = cell(0);

disp('   ** Loading lattice from bts.m **');

extrseptum	=	sbend('extrseptum'	,1.520391e+000,-1.197296e-001,0.000000e+000,0.000000e+000,0.000000e+000,'BndMPoleSymplectic4Pass');
FAMLIST{extrseptum}.ElemData.PolynomB(3) = 0.000000e+000;
drbr2	=	drift('drbr2'	,1.205000e+000,'DriftPass');
extrmagnet	=	sbend('extrmagnet'	,1.200000e+000,-1.745329e-001,-8.726646e-002,-8.726646e-002,0.000000e+000,'BndMPoleSymplectic4Pass');
FAMLIST{extrmagnet}.ElemData.PolynomB(3) = 0.000000e+000;
d11	=	drift('d11'	,7.500000e-001,'DriftPass');
q11	=	drift('q11'	,2.500000e-001,'DriftPass');
d12	=	drift('d12'	,1.050000e+000,'DriftPass');
q12	=	drift('q12'	,2.500000e-001,'DriftPass');
d13	=	drift('d13'	,4.317000e-001,'DriftPass');
b1	=	sbend('b1'	,1.800000e+000,2.617994e-001,1.308997e-001,1.308997e-001,0.000000e+000,'BndMPoleSymplectic4Pass');
FAMLIST{b1}.ElemData.PolynomB(3) = 0.000000e+000;
d21	=	drift('d21'	,5.000000e-001,'DriftPass');
q21	=	quadrupole('q21'	,2.500000e-001,1.635763e+000,'QuadLinearPass');
d22	=	drift('d22'	,1.000000e+000,'DriftPass');
q22	=	quadrupole('q22'	,2.500000e-001,-1.731690e+000,'QuadLinearPass');
d23	=	drift('d23'	,4.386000e+000,'DriftPass');
d23a	=	drift('d23a'	,.368-.125,'DriftPass');
scr1 = marker('scr1','IdentityPass');
d23b	=	drift('d23b'	,4.386000e+000-(.368-0.125),'DriftPass');
d31	=	drift('d31'	,1.078300e+000,'DriftPass');
q31	=	quadrupole('q31'	,3.500000e-001,2.033091e+000,'QuadLinearPass');
d32	=	drift('d32'	,1.278300e+000,'DriftPass');
q32	=	quadrupole('q32'	,2.500000e-001,-2.546913e+000,'QuadLinearPass');
d33	=	drift('d33'	,1.178300e+000,'DriftPass');
d33a	=	drift('d33a'	,0.390-0.125,'DriftPass');
scr2 = marker('scr2','IdentityPass');
d33b	=	drift('d33b'	,1.178300e+000-(0.390-0.125),'DriftPass');
q33	=	quadrupole('q33'	,2.500000e-001,1.512666e+000,'QuadLinearPass');
d34	=	drift('d34'	,1.078300e+000,'DriftPass');
d41	=	drift('d41'	,4.093600e-001,'DriftPass');
q41	=	quadrupole('q41'	,2.500000e-001,-1.132422e+000,'QuadLinearPass');
d42	=	drift('d42'	,4.094000e-001,'DriftPass');
q42	=	quadrupole('q42'	,2.500000e-001,1.672718e+000,'QuadLinearPass');
d43	=	drift('d43'	,3.909350e+000,'DriftPass');
q43	=	quadrupole('q43'	,2.500000e-001,-2.610624e+000,'QuadLinearPass');
d44	=	drift('d44'	,3.594000e-001,'DriftPass');
q44	=	quadrupole('q44'	,3.500000e-001,2.357145e+000,'QuadLinearPass');
d45	=	drift('d45'	,3.594000e-001,'DriftPass');
d51	=	drift('d51'	,3.120000e-001,'DriftPass');
q51	=	quadrupole('q51'	,3.500000e-001,-2.164315e+000,'QuadLinearPass');
d52	=	drift('d52'	,3.500000e-001,'DriftPass');
d52a	=	drift('d52a'	,0.355-0.175,'DriftPass');
scr3 = marker('scr3','IdentityPass');
d52b	=	drift('d52b'	,0.350-(0.355-0.175),'DriftPass');
q52	=	quadrupole('q52'	,5.000000e-001,1.943713e+000,'QuadLinearPass');
d53	=	drift('d53'	,2.750000e-001,'DriftPass');
q53	=	quadrupole('q53'	,2.500000e-001,8.114869e-001,'QuadLinearPass');
d54	=	drift('d54'	,3.498393e-001,'DriftPass');
injmagnet	=	sbend('injmagnet'	,6.000000e-001,8.726646e-002,4.363323e-002,4.363323e-002,0.000000e+000,'BndMPoleSymplectic4Pass');
FAMLIST{injmagnet}.ElemData.PolynomB(3) = 0.000000e+000;
dsr2	=	drift('dsr2'	,3.740000e-001,'DriftPass');
pre_septum	=	sbend('pre_septum'	,1.108157e+000,8.726646e-002,0.000000e+000,0.000000e+000,0.000000e+000,'BndMPoleSymplectic4Pass');
FAMLIST{pre_septum}.ElemData.PolynomB(3) = 0.000000e+000;
dsr1	=	drift('dsr1'	,2.700000e-001,'DriftPass');
injseptum	=	sbend('injseptum'	,1.573117e+000,1.238817e-001,0.000000e+000,0.000000e+000,0.000000e+000,'BndMPoleSymplectic4Pass');
FAMLIST{injseptum}.ElemData.PolynomB(3) = 0.000000e+000;
scr4 = marker('scr4','IdentityPass');
enddrift	=	drift('enddrift'	,1.300000e+000,'DriftPass');

% Begin declaration of element groups and lattice.
btswrk = [ extrseptum drbr2 extrmagnet d11 q11 d12 q12 d13 b1...
    d21 q21 d22 q22 d23 b1...
    d31 q31 d32 q32 d33 q33 d34 b1...
    d41 q41 d42 q42 d43 q43 d44 q44 d45 b1...
    d51 q51 d52 q52 d53 q53 d54 injmagnet dsr2 pre_septum dsr1 injseptum enddrift ];
% lattice with screens
btswrk1 = [ extrseptum drbr2 extrmagnet d11 q11 d12 q12 d13 b1...
    d21 q21 d22 q22 d23a scr1 d23b b1...
    d31 q31 d32 q32 d33a scr2 d33b q33 d34 b1...
    d41 q41 d42 q42 d43 q43 d44 q44 d45 b1...
    d51 q51 d52a scr3 d52b q52 d53 q53 d54 injmagnet dsr2 pre_septum dsr1 injseptum scr4 enddrift ];


buildlat(btswrk1);

% Set the energy of the LTB elemnts
BTS = setcellstruct(THERING, 'Energy', 1:length(THERING), GLOBVAL.E0);

% if nargin > 0
%     fprintf('   Using lattice : %s \n', varargin{1});
%     BTS = eval(['buildlat(' varargin{1} ');']);
% else
%     % Default lattice to load
%     fprintf('   Using default lattice : btswrk\n');
%     BTS = buildlat(btswrk1);
% end
%
%% Set the energy of the LTB elemnts
%BTS = setcellstruct(BTS, 'Energy', 1:length(BTS), GLOBVAL.E0);

% Make global variables available in the user workspace.
%evalin('caller','global BTS GLOBVAL');

% New AT 1.3 does not require FAMLIST and is fazing out GLOBVAL
clear global FAMLIST
