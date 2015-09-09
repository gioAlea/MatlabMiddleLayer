function updateatindex
%UPDATEATINDEX - Updates the AT indices in the MiddleLayer with the present AT lattice (THERING)
% 2013-12-02 Init (ximenes)


global THERING


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Append Accelerator Toolbox information %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Since changes in the AT model could change the AT indexes, etc,
% It's best to regenerate all the model indices whenever a model is loaded

% Sort by family first (findcells is linear and slow)
Indices = atindex(THERING);

AO = getao;

try
    % spec
    AO.spec.AT.ATType = 'spec';
    AO.spec.AT.ATIndex = buildatindex(AO.spec.FamilyName, Indices.spec);
    AO.spec.Position = findspos(THERING, AO.spec.AT.ATIndex(:,1+floor(size(AO.spec.AT.ATIndex,2)/2)))';
      
catch
    warning('spec family not found in the model.');
end
try
    % bp
    AO.bp.AT.ATType = 'bp';
    AO.bp.AT.ATIndex = buildatindex(AO.bp.FamilyName, Indices.bp);
    AO.bp.Position = findspos(THERING, AO.bp.AT.ATIndex(:,1+floor(size(AO.bp.AT.ATIndex,2)/2)))';
      
catch
    warning('bp family not found in the model.');
end
try
    % bn
    AO.bn.AT.ATType = 'bn';
    AO.bn.AT.ATIndex = buildatindex(AO.bn.FamilyName, Indices.bn);
    AO.bn.Position = findspos(THERING, AO.bn.AT.ATIndex(:,1+floor(size(AO.bn.AT.ATIndex,2)/2)))';
      
catch
    warning('bn family not found in the model.');
end
try
    % septin
    AO.septin.AT.ATType = 'septin';
    AO.septin.AT.ATIndex = buildatindex(AO.septin.FamilyName, Indices.septin);
    AO.septin.Position = findspos(THERING, AO.septin.AT.ATIndex(:,1+floor(size(AO.septin.AT.ATIndex,2)/2)))';
      
catch
    warning('septin family not found in the model.');
end


try
    % q1a
    AO.q1a.AT.ATType = 'Quad';
    AO.q1a.AT.ATIndex = buildatindex(AO.q1a.FamilyName, Indices.q1a);
    AO.q1a.Position = findspos(THERING, AO.q1a.AT.ATIndex(:,1))';
catch
    warning('q1a family not found in the model.');
end

try
    % q1b
    AO.q1b.AT.ATType = 'Quad';
    AO.q1b.AT.ATIndex = buildatindex(AO.q1b.FamilyName, Indices.q1b);
    AO.q1b.Position = findspos(THERING, AO.q1b.AT.ATIndex(:,1))';
catch
    warning('q1b family not found in the model.');
end

try
    % q1c
    AO.q1c.AT.ATType = 'Quad';
    AO.q1c.AT.ATIndex = buildatindex(AO.q1c.FamilyName, Indices.q1c);
    AO.q1c.Position = findspos(THERING, AO.q1c.AT.ATIndex(:,1))';
catch
    warning('q1c family not found in the model.');
end

try
    % qd2
    AO.qd2.AT.ATType = 'Quad';
    AO.qd2.AT.ATIndex = buildatindex(AO.qd2.FamilyName, Indices.qd2);
    AO.qd2.Position = findspos(THERING, AO.qd2.AT.ATIndex(:,1))';
catch
    warning('qd2 family not found in the model.');
end

try
    % qf2
    AO.qf2.AT.ATType = 'Quad';
    AO.qf2.AT.ATIndex = buildatindex(AO.qf2.FamilyName, Indices.qf2);
    AO.qf2.Position = findspos(THERING, AO.qf2.AT.ATIndex(:,1))';
catch
    warning('qf2 family not found in the model.');
end

try
    % qd3a
    AO.qd3a.AT.ATType = 'Quad';
    AO.qd3a.AT.ATIndex = buildatindex(AO.qd3a.FamilyName, Indices.qd3a);
    AO.qd3a.Position = findspos(THERING, AO.qd3a.AT.ATIndex(:,1))';
catch
    warning('qd3a family not found in the model.');
end

try
    % qf3a
    AO.qf3a.AT.ATType = 'Quad';
    AO.qf3a.AT.ATIndex = buildatindex(AO.qf3a.FamilyName, Indices.qf3a);
    AO.qf3a.Position = findspos(THERING, AO.qf3a.AT.ATIndex(:,1))';
catch
    warning('qf3a family not found in the model.');
end

try
    % qf3b
    AO.qf3b.AT.ATType = 'Quad';
    AO.qf3b.AT.ATIndex = buildatindex(AO.qf3b.FamilyName, Indices.qf3b);
    AO.qf3b.Position = findspos(THERING, AO.qf3b.AT.ATIndex(:,1))';
catch
    warning('qf3b family not found in the model.');
end

try
    % qd3b
    AO.qd3b.AT.ATType = 'Quad';
    AO.qd3b.AT.ATIndex = buildatindex(AO.qd3b.FamilyName, Indices.qd3b);
    AO.qd3b.Position = findspos(THERING, AO.qd3b.AT.ATIndex(:,1))';
catch
    warning('qd3b family not found in the model.');
end

try
    % qf4
    AO.qf4.AT.ATType = 'Quad';
    AO.qf4.AT.ATIndex = buildatindex(AO.qf4.FamilyName, Indices.qf4);
    AO.qf4.Position = findspos(THERING, AO.qf4.AT.ATIndex(:,1))';
catch
    warning('qf4 family not found in the model.');
end

try
    % qd4
    AO.qd4.AT.ATType = 'Quad';
    AO.qd4.AT.ATIndex = buildatindex(AO.qd4.FamilyName, Indices.qd4);
    AO.qd4.Position = findspos(THERING, AO.qd4.AT.ATIndex(:,1))';
catch
    warning('qd4 family not found in the model.');
end

try
    % qf5
    AO.qf5.AT.ATType = 'Quad';
    AO.qf5.AT.ATIndex = buildatindex(AO.qf5.FamilyName, Indices.qf5);
    AO.qf5.Position = findspos(THERING, AO.qf5.AT.ATIndex(:,1))';
catch
    warning('qf5 family not found in the model.');
end

try
    % qd5
    AO.qd5.AT.ATType = 'Quad';
    AO.qd5.AT.ATIndex = buildatindex(AO.qd5.FamilyName, Indices.qd5);
    AO.qd5.Position = findspos(THERING, AO.qd5.AT.ATIndex(:,1))';
catch
    warning('qd5 family not found in the model.');
end

try
    % BPMx
    AO.bpmx.AT.ATType = 'X';
    AO.bpmx.AT.ATIndex = buildatindex(AO.bpmx.FamilyName, Indices.bpm);
    AO.bpmx.Position = findspos(THERING, AO.bpmx.AT.ATIndex(:,1))';   
catch
    warning('bpmx family not found in the model.');
end

try
    % BPMy
    AO.bpmy.AT.ATType = 'Y';
    AO.bpmy.AT.ATIndex = buildatindex(AO.bpmy.FamilyName, Indices.bpm);
    AO.bpmy.Position = findspos(THERING, AO.bpmy.AT.ATIndex(:,1))';   
catch
    warning('bpmy family not found in the model.');
end

try
    % HCM
    AO.hcm.AT.ATType = 'hcm';
    li = [];
    if isfield(Indices, 'cm'), li = [li Indices.cm]; end;
    if isfield(Indices, 'hcm'), li = [li Indices.hcm]; end;
    AO.hcm.AT.ATIndex = buildatindex(AO.hcm.FamilyName, sort(li));
    AO.hcm.Position = findspos(THERING, AO.hcm.AT.ATIndex(:,1))';   
catch
    warning('HCM family not found in the model.');
end


try
    % VCM
    AO.vcm.AT.ATType = 'vcm';
    li = [];
    if isfield(Indices, 'cm'), li = [li Indices.cm]; end;
    if isfield(Indices, 'vcm'), li = [li Indices.vcm]; end;
    AO.vcm.AT.ATIndex = buildatindex(AO.vcm.FamilyName, sort(li));
    AO.vcm.Position = findspos(THERING, AO.vcm.AT.ATIndex(:,1))';   
catch
    warning('VCM family not found in the model.');
end





setao(AO);



% Set TwissData at the start of the storage ring
% try
%     % BTS twiss parameters at the input
%     TwissData.alpha = [0 0]';
%     TwissData.beta  = [15.6475 0.7037]';
%     TwissData.mu    = [0 0]';
%     TwissData.ClosedOrbit = [0 0 0 0]';
%     TwissData.dP = 0;
%     TwissData.dL = 0;
%     TwissData.Dispersion  = [0 0 0 0]';
%     
%     setpvmodel('TwissData', '', TwissData);  % Same as, THERING{1}.TwissData = TwissData;
% catch
%      warning('Setting the twiss data parameters in the MML failed.');
% end