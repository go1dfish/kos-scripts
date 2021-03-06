IF MN=0 AND (NOT SAS) {RUN GMN.} IF MN=0 {SET ST TO 0.} ELSE IF ST=0 {
 RUN DVF.KS(MN:DELTAV:MAG/2).
 SET FB TO ((FM/FD)*FR).
 SET EBT TO ABS((FB/FR)/FF).
 SET ST TO T+MN:ETA-EBT.
 RUN DVF.KS(MN:DELTAV:MAG).
 SET FB TO ((FM/FD)*FR).
 SET TF TO FUEL+FB.
 SET EBT TO ABS((FB/FR)/FF).
 SET ET TO ST+EBT.
} IF MN=0 {SAS ON. WAIT 1. IF WARP>0 {SET WARP TO 0.}} ELSE IF NOT SAS {
 IF VANG(SV:VECTOR,MN:DELTAV:VEC)>1 {SET SV TO LOOKDIRUP(MN:DELTAV:VEC, SUN:POSITION).}
 IF VANG(FACING:VECTOR,SV:VECTOR)>1 AND MN:ETA<60*30 {IF WARP>0 {SET WARP TO 0.}} ELSE {RUN WRPTO(ST).}
 LOCK THROTTLE TO MIN(1, 10000*MAX(0, T-ST))*MIN(1, 30*MAX(0, FUEL-TF)).
 IF T>=ET {SET CPUTHROT TO 0. SET ST TO 0. LOCK THROTTLE TO CPUTHROT.
  IF NOT SAS {REMOVE MN. SET MN TO 0. SAS ON.}
}} ELSE IF WARP>0 {SET WARP TO 0.}
