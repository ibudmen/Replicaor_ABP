// Mesurements Of Platform Actual & Global Settings
// Mesurements ACTUAL
PlateWidth = 228;
PlateDepth = 145;
PlateHeight = 5;

ArmWidth = 20;
ArmHeight = 24;
ArmForwardProjection = 25;
ArmRearProjection = 50;
ArmVOffset = 15;

BaseWidth = 129;
BaseHeight = 5;
BaseForwardProjection = 10;
BaseRearProjection = 10;
BaseVOffset = 20;

BaseDeflectorLength = 20;
BaseDeflectorAngle = 45;

ScrewsWidthOutset = 35;
ScrewsDepthOutset = 35;
ScrewsHeadRadius = 10;
ScrewsHeadHeight = 2;
ScrewsHeadProtrusion = 5;
ScrewsShaftRadius = 2;
ScrewsHeadCutoutRadius = 2;

RearPlugWidth = 10;
RearPlugHeight = 5;
RearPlugVOffset = 1;

// Options
// ****************************************************************************************************

d = 0.1;   //Delta

ClipSticksize = 8;
PlateThickness = 5;

TensionerBearingRadius = 2;
TensionerOffsetRadius = 15;
TensionerAngle = 45;
TensionerBearingExtention = 3;
TensionerInset = 2;

//lips to keep the belt in
Lip = 3;
//TopLip = 500;
BottomLip = 5;

MidPlateOverlap = 20;
MidPlateOverlapHeight = 10;
MidPlateOverlapOffset = 5;
ClipHoleSize = 5;

LowerPlateCrossover = 15;

RollerCore = 2;
RollerClearance = 0.5;
RollerLength = PlateDepth - 2*RollerClearance;

UpperRollerProjection  = 40;
UpperRollerRadius = 8;

LowerRollerProjection = 20;
LowerRollerRadius = 6;

UpperRollerBearingCutoutRadius = 3;
LowerRollerBearingCutoutRadius = 3;

// Calculated
// ************************************************************************************************************
PlateX = BaseWidth/2;

RollerLength = PlateDepth - 2*RollerClearance;
PlateArmOverhang = PlateWidth/2 - BaseWidth/2  - ArmWidth; 

UpperRollerPlateX = ArmWidth+PlateArmOverhang+UpperRollerProjection-UpperRollerRadius;
UpperRollerPlateY = -UpperRollerRadius; 

LowerRollerPlateX = ArmWidth+PlateArmOverhang+LowerRollerProjection-LowerRollerRadius;
LowerRollerPlateY = -(ArmVOffset+ArmHeight)+LowerRollerRadius;




