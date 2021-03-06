function sirius_ts_init(OperationalMode)
%SIRIUS_TS_INIT - MML initialization file for the TS at sirius
%  lnlsinit(OperationalMode)
%
%  See also setoperationalmode

% 2013-12-02 Inicio (Ximenes)


setao([]);
setad([]);


% Base on the location of this file
[SIRIUS_ROOT, ~, ~] = fileparts(mfilename('fullpath'));

AD.Directory.ExcDataDir  = '/home/fac_files/siriusdb/excitation_curves';

%AD.Directory.ExcDataDir = [SIRIUS_ROOT, filesep, 'excitation_curves'];

setad(AD);


% BENDS

AO.bend.FamilyName  = 'bend';
AO.bend.MemberOf    = {'PlotFamily'; 'bend'; 'BEND'; 'Magnet';};
AO.bend.DeviceList  = getDeviceList(1,3);
AO.bend.ElementList = (1:size(AO.bend.DeviceList,1))';
AO.bend.Status      = ones(size(AO.bend.DeviceList,1),1);
AO.bend.Position    = [];
AO.bend.ExcitationCurves = sirius_getexcdata(repmat('tsma-bend', size(AO.bend.DeviceList,1), 1)); 

AO.bend.Monitor.MemberOf = {};
AO.bend.Monitor.Mode = 'Simulator';
AO.bend.Monitor.DataType = 'Scalar';
AO.bend.Monitor.ChannelNames = sirius_ts_getname(AO.bend.FamilyName, 'Monitor', AO.bend.DeviceList);
AO.bend.Monitor.HW2PhysicsFcn = @bend2gev;
AO.bend.Monitor.Physics2HWFcn = @gev2bend;
AO.bend.Monitor.Units        = 'Hardware';
AO.bend.Monitor.HWUnits      = 'Ampere';
AO.bend.Monitor.PhysicsUnits = 'GeV';

AO.bend.Setpoint.MemberOf = {'MachineConfig';};
AO.bend.Setpoint.Mode = 'Simulator';
AO.bend.Setpoint.DataType = 'Scalar';
AO.bend.Setpoint.ChannelNames = sirius_ts_getname(AO.bend.FamilyName, 'Setpoint', AO.bend.DeviceList);
AO.bend.Setpoint.HW2PhysicsFcn = @bend2gev;
AO.bend.Setpoint.Physics2HWFcn = @gev2bend;
AO.bend.Setpoint.Units        = 'Hardware';
AO.bend.Setpoint.HWUnits      = 'Ampere';
AO.bend.Setpoint.PhysicsUnits = 'GeV';
AO.bend.Setpoint.Range        = [0 300];
AO.bend.Setpoint.Tolerance    = .1;
AO.bend.Setpoint.DeltaRespMat = .01;

% Septa

AO.septex.FamilyName  = 'septex';
AO.septex.MemberOf    = {'PlotFamily'; 'septex'; 'SEPTUM'; 'Magnet';};
AO.septex.DeviceList  = getDeviceList(1,1);
AO.septex.ElementList = (1:size(AO.septex.DeviceList,1))';
AO.septex.Status      = ones(size(AO.septex.DeviceList,1),1);
AO.septex.Position    = [];
AO.septex.ExcitationCurves = sirius_getexcdata(repmat('tspm-sep', size(AO.septex.DeviceList,1), 1)); 

AO.septex.Monitor.MemberOf = {};
AO.septex.Monitor.Mode = 'Simulator';
AO.septex.Monitor.DataType = 'Scalar';
AO.septex.Monitor.ChannelNames  = sirius_ts_getname(AO.septex.FamilyName, 'Monitor', AO.septex.DeviceList);
AO.septex.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.septex.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.septex.Monitor.Units         = 'Hardware';
AO.septex.Monitor.HWUnits       = 'Ampere';
AO.septex.Monitor.PhysicsUnits  = 'Radian';

AO.septex.Setpoint.MemberOf = {'MachineConfig';};
AO.septex.Setpoint.Mode = 'Simulator';
AO.septex.Setpoint.DataType = 'Scalar';
AO.septex.Setpoint.ChannelNames  = sirius_ts_getname(AO.septex.FamilyName, 'Setpoint', AO.septex.DeviceList);
AO.septex.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.septex.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.septex.Setpoint.Units         = 'Hardware';
AO.septex.Setpoint.HWUnits       = 'Ampere';
AO.septex.Setpoint.PhysicsUnits  = 'Radian';
AO.septex.Setpoint.Range         = [0 300];
AO.septex.Setpoint.Tolerance     = .1;
AO.septex.Setpoint.DeltaRespMat  = .01;


AO.septin.FamilyName  = 'septin';
AO.septin.MemberOf    = {'PlotFamily'; 'septin'; 'SEPTUM'; 'Magnet';};
AO.septin.DeviceList  = getDeviceList(1,3);
AO.septin.ElementList = (1:size(AO.septin.DeviceList,1))';
AO.septin.Status      = ones(size(AO.septin.DeviceList,1),1);
AO.septin.Position    = [];
AO.septin.ExcitationCurves = sirius_getexcdata(repmat('tspm-sep', size(AO.septin.DeviceList,1), 1)); 

AO.septin.Monitor.MemberOf = {};
AO.septin.Monitor.Mode = 'Simulator';
AO.septin.Monitor.DataType = 'Scalar';
AO.septin.Monitor.ChannelNames  = sirius_ts_getname(AO.septin.FamilyName, 'Monitor', AO.septin.DeviceList);
AO.septin.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.septin.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.septin.Monitor.Units         = 'Hardware';
AO.septin.Monitor.HWUnits       = 'Ampere';
AO.septin.Monitor.PhysicsUnits  = 'Radian';

AO.septin.Setpoint.MemberOf = {'MachineConfig';};
AO.septin.Setpoint.Mode = 'Simulator';
AO.septin.Setpoint.DataType = 'Scalar';
AO.septin.Setpoint.ChannelNames  = sirius_ts_getname(AO.septin.FamilyName, 'Setpoint', AO.septin.DeviceList);
AO.septin.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.septin.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.septin.Setpoint.Units         = 'Hardware';
AO.septin.Setpoint.HWUnits       = 'Ampere';
AO.septin.Setpoint.PhysicsUnits  = 'Radian';
AO.septin.Setpoint.Range         = [0 300];
AO.septin.Setpoint.Tolerance     = .1;
AO.septin.Setpoint.DeltaRespMat  = .01;


% Quadrupoles

AO.qf1a.FamilyName  = 'qf1a';
AO.qf1a.MemberOf    = {'PlotFamily'; 'qf1a'; 'QUAD'; 'Magnet';};
AO.qf1a.DeviceList  = getDeviceList(1,1);
AO.qf1a.ElementList = (1:size(AO.qf1a.DeviceList,1))';
AO.qf1a.Status      = ones(size(AO.qf1a.DeviceList,1),1);
AO.qf1a.Position    = [];
AO.qf1a.ExcitationCurves = sirius_getexcdata(repmat('tsma-q', size(AO.qf1a.DeviceList,1), 1));
AO.qf1a.Monitor.MemberOf = {};
AO.qf1a.Monitor.Mode = 'Simulator';
AO.qf1a.Monitor.DataType = 'Scalar';
AO.qf1a.Monitor.ChannelNames = sirius_ts_getname(AO.qf1a.FamilyName, 'Monitor', AO.qf1a.DeviceList);
AO.qf1a.Monitor.HW2PhysicsFcn  = @sirius_hw2ph;
AO.qf1a.Monitor.Physics2HWFcn  = @sirius_ph2hw;
AO.qf1a.Monitor.Units        = 'Hardware';
AO.qf1a.Monitor.HWUnits      = 'Ampere';
AO.qf1a.Monitor.PhysicsUnits = 'meter^-2';
AO.qf1a.Setpoint.MemberOf      = {'MachineConfig'};
AO.qf1a.Setpoint.Mode          = 'Simulator';
AO.qf1a.Setpoint.DataType      = 'Scalar';
AO.qf1a.Setpoint.ChannelNames = sirius_ts_getname(AO.qf1a.FamilyName, 'Setpoint', AO.qf1a.DeviceList);
AO.qf1a.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf1a.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qf1a.Setpoint.Units         = 'Hardware';
AO.qf1a.Setpoint.HWUnits       = 'Ampere';
AO.qf1a.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qf1a.Setpoint.Range         = [0 225];
AO.qf1a.Setpoint.Tolerance     = 0.2;
AO.qf1a.Setpoint.DeltaRespMat  = 0.5; 


AO.qf1b.FamilyName  = 'qf1b';
AO.qf1b.MemberOf    = {'PlotFamily'; 'qf1b'; 'QUAD'; 'Magnet';};
AO.qf1b.DeviceList  = getDeviceList(1,1);
AO.qf1b.ElementList = (1:size(AO.qf1b.DeviceList,1))';
AO.qf1b.Status      = ones(size(AO.qf1b.DeviceList,1),1);
AO.qf1b.Position    = [];
AO.qf1b.ExcitationCurves = sirius_getexcdata(repmat('tsma-q', size(AO.qf1b.DeviceList,1), 1));
AO.qf1b.Monitor.MemberOf = {};
AO.qf1b.Monitor.Mode = 'Simulator';
AO.qf1b.Monitor.DataType = 'Scalar';
AO.qf1b.Monitor.ChannelNames = sirius_ts_getname(AO.qf1b.FamilyName, 'Monitor', AO.qf1b.DeviceList);
AO.qf1b.Monitor.HW2PhysicsFcn  = @sirius_hw2ph;
AO.qf1b.Monitor.Physics2HWFcn  = @sirius_ph2hw;
AO.qf1b.Monitor.Units        = 'Hardware';
AO.qf1b.Monitor.HWUnits      = 'Ampere';
AO.qf1b.Monitor.PhysicsUnits = 'meter^-2';
AO.qf1b.Setpoint.MemberOf      = {'MachineConfig'};
AO.qf1b.Setpoint.Mode          = 'Simulator';
AO.qf1b.Setpoint.DataType      = 'Scalar';
AO.qf1b.Setpoint.ChannelNames = sirius_ts_getname(AO.qf1b.FamilyName, 'Setpoint', AO.qf1b.DeviceList);
AO.qf1b.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf1b.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qf1b.Setpoint.Units         = 'Hardware';
AO.qf1b.Setpoint.HWUnits       = 'Ampere';
AO.qf1b.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qf1b.Setpoint.Range         = [0 225];
AO.qf1b.Setpoint.Tolerance     = 0.2;
AO.qf1b.Setpoint.DeltaRespMat  = 0.5; 


AO.qd2.FamilyName  = 'qd2';
AO.qd2.MemberOf    = {'PlotFamily'; 'qd2'; 'QUAD'; 'Magnet';};
AO.qd2.DeviceList  = getDeviceList(1,1);
AO.qd2.ElementList = (1:size(AO.qd2.DeviceList,1))';
AO.qd2.Status      = ones(size(AO.qd2.DeviceList,1),1);
AO.qd2.Position    = [];
AO.qd2.ExcitationCurves = sirius_getexcdata(repmat('tsma-q', size(AO.qd2.DeviceList,1), 1));
AO.qd2.Monitor.MemberOf = {};
AO.qd2.Monitor.Mode = 'Simulator';
AO.qd2.Monitor.DataType = 'Scalar';
AO.qd2.Monitor.ChannelNames = sirius_ts_getname(AO.qd2.FamilyName, 'Monitor', AO.qd2.DeviceList);
AO.qd2.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd2.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qd2.Monitor.Units        = 'Hardware';
AO.qd2.Monitor.HWUnits      = 'Ampere';
AO.qd2.Monitor.PhysicsUnits = 'meter^-2';
AO.qd2.Setpoint.MemberOf      = {'MachineConfig'};
AO.qd2.Setpoint.Mode          = 'Simulator';
AO.qd2.Setpoint.DataType      = 'Scalar';
AO.qd2.Setpoint.ChannelNames = sirius_ts_getname(AO.qd2.FamilyName, 'Setpoint', AO.qd2.DeviceList);
AO.qd2.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd2.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qd2.Setpoint.Units         = 'Hardware';
AO.qd2.Setpoint.HWUnits       = 'Ampere';
AO.qd2.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qd2.Setpoint.Range         = [0 225];
AO.qd2.Setpoint.Tolerance     = 0.2;
AO.qd2.Setpoint.DeltaRespMat  = 0.5; 


AO.qf2.FamilyName  = 'qf2';
AO.qf2.MemberOf    = {'PlotFamily'; 'qf2'; 'QUAD'; 'Magnet';};
AO.qf2.DeviceList  = getDeviceList(1,1);
AO.qf2.ElementList = (1:size(AO.qf2.DeviceList,1))';
AO.qf2.Status      = ones(size(AO.qf2.DeviceList,1),1);
AO.qf2.Position    = [];
AO.qf2.ExcitationCurves = sirius_getexcdata(repmat('tsma-q', size(AO.qf2.DeviceList,1), 1));
AO.qf2.Monitor.MemberOf = {};
AO.qf2.Monitor.Mode = 'Simulator';
AO.qf2.Monitor.DataType = 'Scalar';
AO.qf2.Monitor.ChannelNames = sirius_ts_getname(AO.qf2.FamilyName, 'Monitor', AO.qf2.DeviceList);
AO.qf2.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf2.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qf2.Monitor.Units        = 'Hardware';
AO.qf2.Monitor.HWUnits      = 'Ampere';
AO.qf2.Monitor.PhysicsUnits = 'meter^-2';
AO.qf2.Setpoint.MemberOf      = {'MachineConfig'};
AO.qf2.Setpoint.Mode          = 'Simulator';
AO.qf2.Setpoint.DataType      = 'Scalar';
AO.qf2.Setpoint.ChannelNames = sirius_ts_getname(AO.qf2.FamilyName, 'Setpoint', AO.qf2.DeviceList);
AO.qf2.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf2.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qf2.Setpoint.Units         = 'Hardware';
AO.qf2.Setpoint.HWUnits       = 'Ampere';
AO.qf2.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qf2.Setpoint.Range         = [0 225];
AO.qf2.Setpoint.Tolerance     = 0.2;
AO.qf2.Setpoint.DeltaRespMat  = 0.5; 


AO.qf3.FamilyName  = 'qf3';
AO.qf3.MemberOf    = {'PlotFamily'; 'qf3'; 'QUAD'; 'Magnet';};
AO.qf3.DeviceList  = getDeviceList(1,1);
AO.qf3.ElementList = (1:size(AO.qf3.DeviceList,1))';
AO.qf3.Status      = ones(size(AO.qf3.DeviceList,1),1);
AO.qf3.Position    = [];
AO.qf3.ExcitationCurves = sirius_getexcdata(repmat('tsma-q', size(AO.qf3.DeviceList,1), 1));
AO.qf3.Monitor.MemberOf = {};
AO.qf3.Monitor.Mode = 'Simulator';
AO.qf3.Monitor.DataType = 'Scalar';
AO.qf3.Monitor.ChannelNames = sirius_ts_getname(AO.qf3.FamilyName, 'Monitor', AO.qf3.DeviceList);
AO.qf3.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf3.MOnitor.Physics2HWFcn = @sirius_ph2hw;
AO.qf3.Monitor.Units        = 'Hardware';
AO.qf3.Monitor.HWUnits      = 'Ampere';
AO.qf3.Monitor.PhysicsUnits = 'meter^-2';
AO.qf3.Setpoint.MemberOf      = {'MachineConfig'};
AO.qf3.Setpoint.Mode          = 'Simulator';
AO.qf3.Setpoint.DataType      = 'Scalar';
AO.qf3.Setpoint.ChannelNames = sirius_ts_getname(AO.qf3.FamilyName, 'Setpoint', AO.qf3.DeviceList);
AO.qf3.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf3.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qf3.Setpoint.Units         = 'Hardware';
AO.qf3.Setpoint.HWUnits       = 'Ampere';
AO.qf3.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qf3.Setpoint.Range         = [0 225];
AO.qf3.Setpoint.Tolerance     = 0.2;
AO.qf3.Setpoint.DeltaRespMat  = 0.5; 


AO.qd4a.FamilyName  = 'qd4a';
AO.qd4a.MemberOf    = {'PlotFamily'; 'qd4a'; 'QUAD'; 'Magnet';};
AO.qd4a.DeviceList  = getDeviceList(1,1);
AO.qd4a.ElementList = (1:size(AO.qd4a.DeviceList,1))';
AO.qd4a.Status      = ones(size(AO.qd4a.DeviceList,1),1);
AO.qd4a.Position    = [];
AO.qd4a.ExcitationCurves = sirius_getexcdata(repmat('tsma-q', size(AO.qd4a.DeviceList,1), 1));
AO.qd4a.Monitor.MemberOf = {};
AO.qd4a.Monitor.Mode = 'Simulator';
AO.qd4a.Monitor.DataType = 'Scalar';
AO.qd4a.Monitor.ChannelNames = sirius_ts_getname(AO.qd4a.FamilyName, 'Monitor', AO.qd4a.DeviceList);
AO.qd4a.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd4a.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qd4a.Monitor.Units        = 'Hardware';
AO.qd4a.Monitor.HWUnits      = 'Ampere';
AO.qd4a.Monitor.PhysicsUnits = 'meter^-2';
AO.qd4a.Setpoint.MemberOf      = {'MachineConfig'};
AO.qd4a.Setpoint.Mode          = 'Simulator';
AO.qd4a.Setpoint.DataType      = 'Scalar';
AO.qd4a.Setpoint.ChannelNames = sirius_ts_getname(AO.qd4a.FamilyName, 'Setpoint', AO.qd4a.DeviceList);
AO.qd4a.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd4a.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qd4a.Setpoint.Units         = 'Hardware';
AO.qd4a.Setpoint.HWUnits       = 'Ampere';
AO.qd4a.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qd4a.Setpoint.Range         = [0 225];
AO.qd4a.Setpoint.Tolerance     = 0.2;
AO.qd4a.Setpoint.DeltaRespMat  = 0.5; 


AO.qf4.FamilyName  = 'qf4';
AO.qf4.MemberOf    = {'PlotFamily'; 'qf4'; 'QUAD'; 'Magnet';};
AO.qf4.DeviceList  = getDeviceList(1,1);
AO.qf4.ElementList = (1:size(AO.qf4.DeviceList,1))';
AO.qf4.Status      = ones(size(AO.qf4.DeviceList,1),1);
AO.qf4.Position    = [];
AO.qf4.ExcitationCurves = sirius_getexcdata(repmat('tsma-q', size(AO.qf4.DeviceList,1), 1));
AO.qf4.Monitor.MemberOf = {};
AO.qf4.Monitor.Mode = 'Simulator';
AO.qf4.Monitor.DataType = 'Scalar';
AO.qf4.Monitor.ChannelNames = sirius_ts_getname(AO.qf4.FamilyName, 'Monitor', AO.qf4.DeviceList);
AO.qf4.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf4.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qf4.Monitor.Units        = 'Hardware';
AO.qf4.Monitor.HWUnits      = 'Ampere';
AO.qf4.Monitor.PhysicsUnits = 'meter^-2';
AO.qf4.Setpoint.MemberOf      = {'MachineConfig'};
AO.qf4.Setpoint.Mode          = 'Simulator';
AO.qf4.Setpoint.DataType      = 'Scalar';
AO.qf4.Setpoint.ChannelNames = sirius_ts_getname(AO.qf4.FamilyName, 'Setpoint', AO.qf4.DeviceList);
AO.qf4.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qf4.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qf4.Setpoint.Units         = 'Hardware';
AO.qf4.Setpoint.HWUnits       = 'Ampere';
AO.qf4.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qf4.Setpoint.Range         = [0 225];
AO.qf4.Setpoint.Tolerance     = 0.2;
AO.qf4.Setpoint.DeltaRespMat  = 0.5; 

AO.qd4b.FamilyName  = 'qd4b';
AO.qd4b.MemberOf    = {'PlotFamily'; 'qd4b'; 'QUAD'; 'Magnet';};
AO.qd4b.DeviceList  = getDeviceList(1,1);
AO.qd4b.ElementList = (1:size(AO.qd4b.DeviceList,1))';
AO.qd4b.Status      = ones(size(AO.qd4b.DeviceList,1),1);
AO.qd4b.Position    = [];
AO.qd4b.ExcitationCurves = sirius_getexcdata(repmat('tsma-q', size(AO.qd4b.DeviceList,1), 1));
AO.qd4b.Monitor.MemberOf = {};
AO.qd4b.Monitor.Mode = 'Simulator';
AO.qd4b.Monitor.DataType = 'Scalar';
AO.qd4b.Monitor.ChannelNames = sirius_ts_getname(AO.qd4b.FamilyName, 'Monitor', AO.qd4b.DeviceList);
AO.qd4b.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd4b.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.qd4b.Monitor.Units        = 'Hardware';
AO.qd4b.Monitor.HWUnits      = 'Ampere';
AO.qd4b.Monitor.PhysicsUnits = 'meter^-2';
AO.qd4b.Setpoint.MemberOf      = {'MachineConfig'};
AO.qd4b.Setpoint.Mode          = 'Simulator';
AO.qd4b.Setpoint.DataType      = 'Scalar';
AO.qd4b.Setpoint.ChannelNames = sirius_ts_getname(AO.qd4b.FamilyName, 'Setpoint', AO.qd4b.DeviceList);
AO.qd4b.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.qd4b.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.qd4b.Setpoint.Units         = 'Hardware';
AO.qd4b.Setpoint.HWUnits       = 'Ampere';
AO.qd4b.Setpoint.PhysicsUnits  = 'meter^-2';
AO.qd4b.Setpoint.Range         = [0 225];
AO.qd4b.Setpoint.Tolerance     = 0.2;
AO.qd4b.Setpoint.DeltaRespMat  = 0.5;  


%%%%%%%%%%%%%%%%%%%%%
% Corrector Magnets %
%%%%%%%%%%%%%%%%%%%%%

% ch
AO.ch.FamilyName  = 'ch';
AO.ch.MemberOf    = {'PlotFamily'; 'COR'; 'ch'; 'Magnet'; 'HCM'};
AO.ch.DeviceList  = getDeviceList(1,4);
AO.ch.ElementList = (1:size(AO.ch.DeviceList,1))';
AO.ch.Status      = ones(size(AO.ch.DeviceList,1),1);
AO.ch.Position    = [];
AO.ch.ExcitationCurves = sirius_getexcdata(repmat('tsma-ch', size(AO.ch.DeviceList,1), 1));
AO.ch.Monitor.MemberOf = {'Horizontal'; 'COR'; 'ch'; 'Magnet';};
AO.ch.Monitor.Mode = 'Simulator';
AO.ch.Monitor.DataType = 'Scalar';
AO.ch.Monitor.ChannelNames  = sirius_ts_getname(AO.ch.FamilyName, 'Monitor', AO.ch.DeviceList);
AO.ch.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.ch.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.ch.Monitor.Units         = 'Physics';
AO.ch.Monitor.HWUnits       = 'Ampere';
AO.ch.Monitor.PhysicsUnits  = 'Radian';
AO.ch.Setpoint.MemberOf = {'MachineConfig'; 'Horizontal'; 'COR'; 'ch'; 'Magnet'; 'Setpoint'; 'measbpmresp';};
AO.ch.Setpoint.Mode = 'Simulator';
AO.ch.Setpoint.DataType = 'Scalar';
AO.ch.Setpoint.ChannelNames = sirius_ts_getname(AO.ch.FamilyName, 'Setpoint', AO.ch.DeviceList);
AO.ch.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.ch.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.ch.Setpoint.Units        = 'Physics';
AO.ch.Setpoint.HWUnits      = 'Ampere';
AO.ch.Setpoint.PhysicsUnits = 'Radian';
AO.ch.Setpoint.Range        = [-10 10];
AO.ch.Setpoint.Tolerance    = 0.00001;
AO.ch.Setpoint.DeltaRespMat = 0.0005; 

% cv
AO.cv.FamilyName  = 'cv';
AO.cv.MemberOf    = {'PlotFamily'; 'COR'; 'cv'; 'Magnet'; 'VCM'};
AO.cv.DeviceList  = getDeviceList(1,6);
AO.cv.ElementList = (1:size(AO.cv.DeviceList,1))';
AO.cv.Status      = ones(size(AO.cv.DeviceList,1),1);
AO.cv.Position    = [];
AO.cv.ExcitationCurves = sirius_getexcdata(repmat('tsma-cv', size(AO.cv.DeviceList,1), 1));
AO.cv.Monitor.MemberOf = {'Vertical'; 'COR'; 'cv'; 'Magnet';};
AO.cv.Monitor.Mode = 'Simulator';
AO.cv.Monitor.DataType = 'Scalar';
AO.cv.Monitor.ChannelNames = sirius_ts_getname(AO.cv.FamilyName, 'Monitor', AO.cv.DeviceList);
AO.cv.Monitor.HW2PhysicsFcn = @sirius_hw2ph;
AO.cv.Monitor.Physics2HWFcn = @sirius_ph2hw;
AO.cv.Monitor.Units        = 'Physics';
AO.cv.Monitor.HWUnits      = 'Ampere';
AO.cv.Monitor.PhysicsUnits = 'Radian';
AO.cv.Setpoint.MemberOf = {'MachineConfig'; 'Horizontal'; 'COR'; 'cv'; 'Magnet'; 'Setpoint'; 'measbpmresp';};
AO.cv.Setpoint.Mode = 'Simulator';
AO.cv.Setpoint.DataType = 'Scalar';
AO.cv.Setpoint.ChannelNames = sirius_ts_getname(AO.cv.FamilyName, 'Setpoint', AO.cv.DeviceList);
AO.cv.Setpoint.HW2PhysicsFcn = @sirius_hw2ph;
AO.cv.Setpoint.Physics2HWFcn = @sirius_ph2hw;
AO.cv.Setpoint.Units        = 'Physics';
AO.cv.Setpoint.HWUnits      = 'Ampere';
AO.cv.Setpoint.PhysicsUnits = 'Radian';
AO.cv.Setpoint.Range        = [-10 10];
AO.cv.Setpoint.Tolerance    = 0.00001;
AO.cv.Setpoint.DeltaRespMat = 0.0005; 


% bpmx
AO.bpmx.FamilyName  = 'bpmx';
AO.bpmx.MemberOf    = {'PlotFamily'; 'BPM'; 'bpmx'; 'Diagnostics'};
AO.bpmx.DeviceList  = getDeviceList(1,5);
AO.bpmx.ElementList = (1:size(AO.bpmx.DeviceList,1))';
AO.bpmx.Status      = ones(size(AO.bpmx.DeviceList,1),1);
AO.bpmx.Position    = [];
AO.bpmx.Golden      = zeros(length(AO.bpmx.ElementList),1);
AO.bpmx.Offset      = zeros(length(AO.bpmx.ElementList),1);

AO.bpmx.Monitor.MemberOf = {'bpmx'; 'Monitor';};
AO.bpmx.Monitor.Mode = 'Simulator';
AO.bpmx.Monitor.DataType = 'Scalar';
AO.bpmx.Monitor.ChannelNames = sirius_ts_getname(AO.bpmx.FamilyName, 'Monitor', AO.bpmx.DeviceList);
AO.bpmx.Monitor.HW2PhysicsParams = 1e-6;  % HW [um], Simulator [Meters]
AO.bpmx.Monitor.Physics2HWParams =  1e6;
AO.bpmx.Monitor.Units        = 'Hardware';
AO.bpmx.Monitor.HWUnits      = 'um';
AO.bpmx.Monitor.PhysicsUnits = 'meter';

% bpmy
AO.bpmy.FamilyName  = 'bpmy';
AO.bpmy.MemberOf    = {'PlotFamily'; 'BPM'; 'bpmy'; 'Diagnostics'};
AO.bpmy.DeviceList  = getDeviceList(1,5);
AO.bpmy.ElementList = (1:size(AO.bpmy.DeviceList,1))';
AO.bpmy.Status      = ones(size(AO.bpmy.DeviceList,1),1);
AO.bpmy.Position    = [];
AO.bpmy.Golden      = zeros(length(AO.bpmy.ElementList),1);
AO.bpmy.Offset      = zeros(length(AO.bpmy.ElementList),1);

AO.bpmy.Monitor.MemberOf = {'bpmy'; 'Monitor';};
AO.bpmy.Monitor.Mode = 'Simulator';
AO.bpmy.Monitor.DataType = 'Scalar';
AO.bpmy.Monitor.ChannelNames = sirius_ts_getname(AO.bpmy.FamilyName, 'Monitor', AO.bpmy.DeviceList);
AO.bpmy.Monitor.HW2PhysicsParams = 1e-6;  % HW [um], Simulator [Meters]
AO.bpmy.Monitor.Physics2HWParams =  1e6;
AO.bpmy.Monitor.Units        = 'Hardware';
AO.bpmy.Monitor.HWUnits      = 'um';
AO.bpmy.Monitor.PhysicsUnits = 'meter';

% The operational mode sets the path, filenames, and other important parameters
% Run setoperationalmode after most of the AO is built so that the Units and Mode fields
% can be set in setoperationalmode
setao(AO);
%setoperationalmode(OperationalMode);

 
function DList = getDeviceList(NSector,NDevices)

DList = [];
DL = ones(NDevices,2);
DL(:,2) = (1:NDevices)';
for i=1:NSector
    DL(:,1) = i;
    DList = [DList; DL];
end
