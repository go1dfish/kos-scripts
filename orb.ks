DECLARE PARAMETER APO. DECLARE PARAMETER PER. SET MN TO 0.
LOCK TAPO TO APOAPSIS. LOCK TPER TO PERIAPSIS.
LOCK APOERR TO (APO-TAPO)/(ABS(TAPO)+1).
LOCK PERERR TO (PER-TPER)/(ABS(TPER)+1).
IF (APOERR>0) OR (PERERR>0) {SAS ON.
 IF WARP>0 {SET WARP TO 0.}
 SET MN TO NODE(TIME:SECONDS, 0, 0, 0). ADD MN.
 LOCK TAPO TO MN:ORBIT:APOAPSIS.
 LOCK TPER TO MN:ORBIT:PERIAPSIS.
}
IF APOAPSIS<ATMOLIMIT {
  UNTIL APOERR>ATMOLIMIT {SET MN:PROGRADE TO MN:PROGRADE+MAX(0.01,MIN(10,10*APOERR)).}
} ELSE IF PERIAPSIS<ATMOLIMIT {
  IF ETA:APOAPSIS<ETA:PERIAPSIS {SET MN:ETA TO ETA:APOAPSIS.}
  UNTIL TPER>ATMOLIMIT {SET MN:PROGRADE TO MN:PROGRADE+MAX(0.01,MIN(10,10*PERERR)).}
} ELSE IF (ETA:APOAPSIS<ETA:PERIAPSIS) {
  IF PERERR>0 {
    SET MN:ETA TO ETA:APOAPSIS.
    UNTIL PERERR<=0 {SET MN:PROGRADE TO MN:PROGRADE+MAX(0.01,MIN(10,10*PERERR)).}
  } ELSE IF APOERR>0 {
    SET MN:ETA TO ETA:PERIAPSIS.
    UNTIL APOERR<=0 {SET MN:PROGRADE TO MN:PROGRADE+MAX(0.01,MIN(10,10*APOERR)).}
  }
} ELSE {
  IF APOERR>0 {
    SET MN:ETA TO ETA:PERIAPSIS.
    UNTIL APOERR<=0 {SET MN:PROGRADE TO MN:PROGRADE+MAX(0.01,MIN(10,10*APOERR)).}
  } ELSE IF PERERR>0 {
    SET MN:ETA TO ETA:APOAPSIS.
    UNTIL PERERR<=0 {SET MN:PROGRADE TO MN:PROGRADE+MAX(0.01,MIN(10,10*PERERR)).}
  }
} IF MN=0 {} ELSE {SAS OFF.}
