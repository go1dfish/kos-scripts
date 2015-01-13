SET TISP TO 0. SET MTL TO 0. SET AISP TO 0. SET FF TO 0. LIST ENGINES IN ENGINES. FOR ENGINE IN ENGINES {
IF ENGINE:ISP>0 AND (NOT (ENGINE:FLAMEOUT)) {SET TISP TO TISP+(ENGINE:MAXTHRUST/ENGINE:ISP).
SET MTL TO MTL+(ENGINE:MAXTHRUST*(ENGINE:THRUSTLIMIT/100)).}}
SET FD TO 5. SET FR TO 9/(9+11).
IF TISP {SET AISP TO MTL/TISP. SET TM TO SHIP:MASS*1000.}
IF AISP=4200 {SET FD TO 0.1. SET FR TO 1.}
IF TISP {SET FF TO -1*(MAXTHRUST/AISP)*(1000/(KG*FD)).}
