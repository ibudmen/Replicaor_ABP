// Mesurements Of Platform Actual & Global Settings

// Mesurements ACTUAL

PlateWidth = 200;
PlateDepth = 150;
PlateHeight = 8;

ArmWidth = 15;
ArmHeight = 15;
ArmForwardProjection = 20;
ArmRearProjection = 50;
ArmVOffset = 30;

BaseWidth = 100;
BaseHeight = 5;
BaseForwardProjection = 10;
BaseRearProjection = 10;
BaseVOffset = 35;

BaseDeflectorLength = 20;
BaseDeflectorAngle = 45;

ScrewsWidthOutset = 5;
ScrewsDepthOutset = 5;

RearPlugWidth = 10;
RearPlugHeight = 5;
RearPlugVOffset = 1;

// Options
d = 0.1;


ClipSticksize = 3;
PlateThickness = 8;

SlideGap = 6;

//lips to keep the belt in
Lip = 3;
TopLip = 500;
UpperLip = 500;
LowerLip = 500;
BottomLip = 500;


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


PlateArmOverhang = PlateWidth/2 - BaseWidth/2  - ArmWidth; 
