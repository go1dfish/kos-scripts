RUN GTISP.
SET DVLEFT TO 0. IF AISP {
IF AISP=4200 {SET FM TO SHIP:XENONGAS*FD.} ELSE {
 SET OA TO MIN(SHIP:OXIDIZER, 11*(SHIP:LIQUIDFUEL/9)).
 SET LA TO MIN(SHIP:LIQUIDFUEL, 9*(SHIP:OXIDIZER/11)).
 SET FM TO (OA+LA)*FD.
} IF FM>0 {SET DVLEFT TO AISP*LN(TM/(TM-FM))*KG.}}
