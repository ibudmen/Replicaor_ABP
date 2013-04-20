Description of files


--Top level--
-Libraries/-
All Libaries used such as gears

-Modules/-
Contains file for each part or parts of the project

-PrintSheets/-
Contains file for laying out parts in preperation for Gcode generation

-Settings.scad-       
Contains all globals( PUT VARIABLES HERE )

-Construction.scad-   
Contains a constructed representation of the project, do not specify parts in this file. This file is JUST for seeing what it would look like when put together around the replicator HBP.




-Modules/-
Rig.scad            
Contains a model of the build platform for reference, not printable or part of the ABP.

Plates.scad 
the 4 corner fixtures that attach to the rollers

Connector.scad
File for the default connector type used to join parts

FrontPlates.scad
The top front and back plates

Gears.scad
Parts related to gears and splindles for turning rollers

LBeam.scad
Internal front back support,, it used to be L shaped.. now it isnt

Misc.scad
Other stuff

Rollers.scad
The 4 Rollers

Undercarrage.scad
Goes underneath to support worm gears for extending the plate calibration knobs.




-Libraries-
involute_gears.scad
amazing library for all your gear needs: https://github.com/elmom/MCAD


