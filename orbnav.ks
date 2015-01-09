IF MN=0 AND (NOT SAS) {RUN GMN.} IF MN=0 {SAS ON. WAIT 1. IF WARP>0 {SET WARP TO 0.}} ELSE IF NOT SAS {
 SET MT TO MN:ETA+T. SET MNV TO MN:DELTAV.
 IF MNV:MAG>0.01 {SET SV TO (1000*MNV:VEC:NORMALIZED):DIRECTION.}
 RUN DVF.KS(MNV:MAG). SET FB TO ((FM/FD)*FR). SET TF TO FUEL+FB.
 SET EBT TO ABS((FB/FR)/FF). SET ST TO T+MN:ETA-(EBT*0.55).
 IF (MN:ETA<600) AND (MNV:MAG>0.1) AND (VANG(FACING:VECTOR,SV:VECTOR)>2) {
   IF WARP>0 {SET WARP TO 0.}
 } ELSE {RUN WRPTO(ST).}
 IF T>=ST {SET CPUTHROT TO 1.
  UNTIL (FUEL<TF) OR SAS {LIGHTS ON.}
  SET CPUTHROT TO 0. REMOVE MN. SET MN TO 0.
 }
 IF (T-ST)>60 {WAIT 1.}
} ELSE IF WARP>0 {SET WARP TO 0.}
