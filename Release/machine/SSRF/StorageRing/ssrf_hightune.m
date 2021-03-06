function ssrf_hightune
% SSRF example lattice definition file
% Created 08/15/2005 


global FAMLIST THERING GLOBVAL

Energy = 3.5e9;

GLOBVAL.E0 = Energy;
GLOBVAL.LatticeFile = mfilename;
FAMLIST = cell(0);
D1   =    drift('D1' ,0.340000,'DriftPass');
D2   =    drift('D2' ,0.120000,'DriftPass');
D3   =    drift('D3' ,0.475000,'DriftPass');
D3T  =    drift('D3T',0.09750,'DriftPass');
D4   =    drift('D4' ,0.120000,'DriftPass');
D5   =    drift('D5' ,0.280000,'DriftPass');
D6   =    drift('D6' ,0.590000,'DriftPass');
D6T  =    drift('D6T',0.1950000,'DriftPass');
D7   =    drift('D7' ,0.360000,'DriftPass');
D7T  =    drift('D7T',0.280000,'DriftPass');
D8   =    drift('D8' ,0.450000,'DriftPass');
D8T  =    drift('D8T',0.1250000,'DriftPass');
D9   =    drift('D9' ,0.180000,'DriftPass');
D9T  =    drift('D9T',0.100000,'DriftPass');
D33  =    drift('D33',0.580000,'DriftPass');
D33T =    drift('D33T',0.15000,'DriftPass');
D51  =    drift('D51',0.120000,'DriftPass');
D52  =    drift('D52',0.600000,'DriftPass');
DL   =    drift('DL' ,6.000000,'DriftPass');
DLT  =    drift('DLT',5.920000,'DriftPass');
DM   =    drift('DM' ,3.250000,'DriftPass');
DMT  =    drift('DMT',3.170000,'DriftPass');

DB   =    drift('DB' ,0.040000,'DriftPass');
DC   =    drift('DC' ,0.100000,'DriftPass');
%QF and QD valus set to have the tune at (22.22,11.32)
Q1L    =    quadrupole('Q1L' , 0.32000, -1.063770,'QuadLinearPass');
Q2L    =    quadrupole('Q2L' , 0.58000,  1.358860,'QuadLinearPass');
Q3L    =    quadrupole('Q3L' , 0.32000, -1.192160,'QuadLinearPass');
Q4L    =    quadrupole('Q4L' , 0.26000, -1.077410,'QuadLinearPass');
Q5L    =    quadrupole('Q5L' , 0.32000,  1.392450,'QuadLinearPass');
Q1     =    quadrupole('Q1'  , 0.32000, -1.562500,'QuadLinearPass');
Q2     =    quadrupole('Q2'  , 0.58000,  1.532730,'QuadLinearPass');
Q3     =    quadrupole('Q3'  , 0.32000, -1.014220,'QuadLinearPass');
Q4     =    quadrupole('Q4'  , 0.26000, -1.366690,'QuadLinearPass');
Q5     =    quadrupole('Q5'  , 0.32000,  1.455000,'QuadLinearPass');
% Fitted values to produce normalized chromaticities 0,0                     
S1     =    sextupole('S1'  , 0.20000,  1.555155/0.20,'StrMPoleSymplectic4Pass');
S2     =    sextupole('S2'  , 0.24000, -3.001088/0.24,'StrMPoleSymplectic4Pass');
S3     =    sextupole('S3'  , 0.20000,  2.542476/0.20,'StrMPoleSymplectic4Pass');
S4     =    sextupole('S4'  , 0.24000, -2.691814/0.24,'StrMPoleSymplectic4Pass');
S5     =    sextupole('S5'  , 0.20000,  3.540568/0.20,'StrMPoleSymplectic4Pass');
S6     =    sextupole('S6'  , 0.24000, -4.578491/0.24,'StrMPoleSymplectic4Pass');
SD     =    sextupole('SD'  , 0.20000, -2.424032/0.20,'StrMPoleSymplectic4Pass');   
SF     =    sextupole('SF'  , 0.24000,  3.436611/0.24,'StrMPoleSymplectic4Pass');  

BBANGLE = pi/20;                                              
BB =    rbend('BB'  ,1.44,  ...                                                                                             
                 BBANGLE, BBANGLE/2,BBANGLE/2, 0, 'BendLinearPass');             
% bpm&corrector                 
BPM =  marker('BPM', 'IdentityPass');
HVC = corrector('HVC',0.0,[ 0 0 ],'CorrectorPass');
%Cavity
THETA=9/180*pi;
L0 = 4.320000000e+002;	% design length [m]
C0 =   299792458; 				% speed of light [m/s]
HarmNumber = 720;
CAV	= rfcavity('RFCAV' , 0.0 , 4.0e+6 , HarmNumber*C0/L0, HarmNumber,'CavityPass');  
% Begin Lattice
M1 =[  DLT  DB BPM DB...
       Q1L  D1  S1   D2   Q2L ...
       D33T DC HVC DC D33T DB BPM DB ...
       Q3L  D51  S2  D52  ...
       BB  D6   Q4L DB BPM DB   D7T ...
       SD   D8T DC HVC DC D8T  Q5L  ...
       D9 SF DB BPM DB  D9T...
       Q5  D8  SD   D7T  DB BPM DB ...
       Q4  D6T DC HVC DC D6T  BB ...
       D5   Q3  D4  S4   ...
       DB BPM DB D3T DC HVC DC D3T  ...
       Q2  D2  S3  D1 Q1 ...
       DB BPM DB DMT ] ; 
M2 =[  DMT  DB BPM DB...
       Q1  D1   S3  D2   Q2 ...
       D3T DC HVC DC D3T DB BPM DB... 
       S4   D4   Q3  D5  ...
       BB  D6   Q4  DB BPM DB   D7T...
       SD   D8T DC HVC DC D8T   Q5 ...
       D9  SF DB BPM DB  D9T...
       Q5  D8  SD   D7T  DB BPM DB...
       Q4  D6T DC HVC DC D6T  BB ...
       D5   Q3  D4  S6  ...
       DB BPM DB D3T DC HVC DC D3T  ...
       Q2  D2  S5  D1  Q1 ...
       DB BPM DB  DMT ] ;        
M3 = [ DMT  DB BPM DB...
       Q1  D1   S5  D2   Q2 ...
       D3T DC HVC DC D3T DB BPM DB... 
       S6   D4   Q3  D5  ...
       BB  D6   Q4  DB BPM DB   D7T...
       SD   D8T DC HVC DC D8T   Q5...
       D9  SF DB BPM DB  D9T...
       Q5  D8   SD  D7T  DB BPM DB...
       Q4  D6T DC HVC DC D6T  BB ...
       D5   Q3  D4   S6 ...
       DB BPM DB D3T DC HVC DC D3T  ...
       Q2  D2  S5  D1  Q1...
       DB BPM DB  DMT ] ; 
M4 =[  DMT  DB BPM DB...
       Q1  D1   S5  D2  Q2  ...
       D3T DC HVC DC D3T DB BPM DB... 
       S6   D4   Q3  D5 ...
       BB  D6   Q4 DB BPM DB   D7T ...
       SD   D8T DC HVC DC D8T   Q5 ...
       D9  SF DB BPM DB  D9T...
       Q5  D8   SD  D7T  DB BPM DB...
       Q4  D6T DC HVC DC D6T  BB ...
       D5   Q3  D4   S4  ...
       DB BPM DB D3T DC HVC DC D3T  ...  
       Q2  D2  S3  D1  Q1 ...
       DB BPM DB  DMT] ;  
M5 =[  DMT  DB BPM DB...
       Q1  D1   S3  D2  Q2  ...
       D3T DC HVC DC D3T DB BPM DB... 
       S4   D4   Q3  D5 ...
       BB  D6   Q4  DB BPM DB   D7T ...
       SD   D8T DC HVC DC D8T   Q5 ...
       D9  SF DB BPM DB  D9T...
       Q5L  D8   SD  D7T  DB BPM DB...
       Q4L  D6T DC HVC DC D6T  BB ...
       D52  S2   D51  Q3L ...
       DB BPM DB D33T DC HVC DC D33T  ...
       Q2L  D2  S1  D1  Q1L  ...
       DB BPM DB DLT ] ;                   
CELL =  [   M1   M2   M3  M4  M5 ];
ELIST =  [ CAV CELL  CELL  CELL  CELL ];
buildlat(ELIST);
% Compute total length and RF frequency
L0_tot=0;
for i=1:length(THERING)
    L0_tot=L0_tot+THERING{i}.Length;
end
fprintf('   L0 = %.6f m   \n', L0_tot)
fprintf('   RF = %.6f MHz \n', HarmNumber*C0/L0_tot/1e6)


% Newer AT versions requires 'Energy' to be an AT field
THERING = setcellstruct(THERING, 'Energy', 1:length(THERING), Energy);



