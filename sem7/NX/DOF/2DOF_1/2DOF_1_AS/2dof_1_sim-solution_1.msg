


  ************************************************************
  *                                                          *
  *                         RecurDyn                         *
  *                                                          *
  *             Recursive Dynamics Analysis Program          *
  *                                                          *
  ************************************************************
  *                                                          *
  *                Solver Version : SDK 7.25.0               *
  *                                                          *
  *                Build Date : Jul 15 2014                  *
  *                Build Time :    13:58:13                  *
  *                Build Platform : Window 64                *
  *                                                          *
  *                Copyright (C) 1997 - 2014                 *
  *                                                          *
  *                    Function Bay, Inc.                    *
  *                                                          *
  ************************************************************


 << RECURDYN/CONVERTER PROCESSING >>

    READING THE RMD FILE 
      NO. PART = 15
      NO. DUMMY PART = 0
      NO. JOINT = 17

    SPANNING TREE 
      NO. JOINT BEFORE SPANNING = 17
      NO. VIRTUALJOINT BEFORE SPANNING = 0
      NO. CUTJOINT BEFORE SPANNING = 0
      NO. JOINT AFTER SPANNING = 17
      NO. VIRTUALJOINT AFTER SPANNING = 0
      NO. CUTJOINT AFTER SPANNING = 3

    CHECKING CUTJOINT 
 ======================================================================== 
               CONVERT-PROCESSING IS SUCCESSFULLY FINISHED
 ======================================================================== 

 << RECURDYN/SOLVER PROCESSING >>

 
 ============================================================
 >> BUILDING THE RD/SOLVER STRUCTURE
 ============================================================
 ============================================================
 >> THE SIZE OF USED INBODY ARRAY =          15
 ------------------------------------------------------------
 >> THE SIZE OF USED JOINT ARRAY =         140
 ------------------------------------------------------------
 >> THE SIZE OF USED JOINTIV ARRAY                 =                0
 ------------------------------------------------------------
 >> THE SIZE OF USED EXTPARIV ARRAY                =                0
 ------------------------------------------------------------
 >> THE SIZE OF USED CUTJOINT ARRAY =           9
 ------------------------------------------------------------
 >> THE SIZE OF USED FLEXBODY ARRAY =           0
 ============================================================
 ========================================================================
 >> THE SIZE OF USED N120 ARRAY                    =             8064
 ------------------------------------------------------------------------
 >> THE SIZE OF USED IPN16_1 ARRAY                 =             1818
 ------------------------------------------------------------------------
 >> THE SIZE OF USED IPN17 ARRAY                   =             1818
 ------------------------------------------------------------------------
 >> THE SIZE OF USED IPN18 ARRAY                   =              200
 ========================================================================
 ========================================================================
 >> THE SIZE OF USED N90 ARRAY                     =            22252
 ------------------------------------------------------------------------
 >> THE SIZE OF USED N90n1 ARRAY                   =            15112
 ------------------------------------------------------------------------
 >> THE SIZE OF USED N90n2 ARRAY                   =             1000
 ------------------------------------------------------------------------
 >> THE SIZE OF USED N90n3 ARRAY                   =             1000
 ========================================================================
 ============================================================
 >> THE SIZE OF USED RBUS ARRAY =       86435
 ------------------------------------------------------------
 >> THE SIZE OF USED IBUS ARRAY =        5589
 ------------------------------------------------------------
 >> THE SIZE OF USED LBUS ARRAY =        9509
 ------------------------------------------------------------
 >> THE SIZE OF USED MGRBUS ARRAY =         292
 ------------------------------------------------------------
 >> THE SIZE OF USED OBUS ARRAY                    =              728
 ========================================================================
 >>> SUCCESSFULLY BUILT THE RD/SOLVER STRUCTURE


                         JOINT INFORMATION 
      =======================================================
        JOINT ID  ACTION MARKER    BASE MARKER     TYPE
      =======================================================
          427         436             437          FIXED    
          129         138             139        REVOLUTE   
          152         161             162        REVOLUTE   
          382         391             392        REVOLUTE   
          175         184             185        REVOLUTE   
          244         253             254        REVOLUTE   
          359         368             369        REVOLUTE   
          198         207             208        REVOLUTE   
          267         276             277        REVOLUTE   
          336         345             346        REVOLUTE   
          405         414             415        REVOLUTE   
          559         569             568        REVOLUTE   
          221         230             231        REVOLUTE   
          634         612             613        REVOLUTE   
      =======================================================
 
                          CONSTRAINT INFORMATION
 ========================================================================
         CONSTRAINT ID   ACTION MARKER   BASE MARKER    TYPE
 ========================================================================
             513             523            522       REVOLUTE     
             536             546            545       REVOLUTE     
             611             589            588       REVOLUTE     
 ========================================================================
 
         CONSTRAINT ID    JOINT1    JOINT2    JOINT3    TYPE
 ========================================================================
 ========================================================================
 
 
 ======================================================================
 *** WHAT = 
 sim/dyn,end=6.000000,step=1000                                                 
  
 ======================================================================
 *** TOKEN SIMULATION TYPE = dyn
 *** TOKEN ENDTIME =   6.00000000000000        1.00000000000000     
 *** TOKEN PLOT STEPSIZE =        1000          30
 
 ========================================================================
 >> POSITION ANALYSIS
 ========================================================================


                  INITIAL POSITION CONSTRAINT VIOLATION
 ========================================================================
        ID JOINT               ELEMENT                    VIOLATION
 ========================================================================
       427 FIXED               TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Z           0.000000E+00
                               ROTATION ABOUT Y           5.474742E-17
                               ROTATION ABOUT X          -1.323489E-23
 ========================================================================
       129 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -1.409837E-14
                               ROTATION ABOUT X           1.053011E-16
 ========================================================================
       152 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           2.240500E-15
                               ROTATION ABOUT X           5.637851E-17
 ========================================================================
       382 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           9.426487E-15
                               ROTATION ABOUT X          -5.594483E-17
 ========================================================================
       175 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           1.076256E-14
                               ROTATION ABOUT X           9.957993E-17
 ========================================================================
       244 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           6.372355E-15
                               ROTATION ABOUT X          -5.507747E-17
 ========================================================================
       359 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           1.109312E-14
                               ROTATION ABOUT X           5.551115E-17
 ========================================================================
       198 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           8.477118E-17
                               ROTATION ABOUT X           4.406877E-17
 ========================================================================
       267 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -2.611598E-16
                               ROTATION ABOUT X           5.377643E-17
 ========================================================================
       336 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           1.183385E-14
                               ROTATION ABOUT X           5.464379E-17
 ========================================================================
       405 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           4.676255E-15
                               ROTATION ABOUT X          -2.975731E-17
 ========================================================================
       559 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           7.232934E-15
                               ROTATION ABOUT X           4.978996E-17
 ========================================================================
       221 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -7.361237E-15
                               ROTATION ABOUT X           4.978996E-17
 ========================================================================
       634 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           4.123601E-15
                               ROTATION ABOUT X           5.464379E-17
 ========================================================================
       513 REVOLUTE            TRANSLATION ALONG X        9.223733E-13
 ========================================================================
                               TRANSLATION ALONG Y        8.597567E-13
 ========================================================================
                               TRANSLATION ALONG Z        1.136868E-13
 ========================================================================
                               ROTATION ABOUT Y          -1.874060E-15
 ========================================================================
                               ROTATION ABOUT X          -8.767360E-16
 ========================================================================
       536 REVOLUTE            TRANSLATION ALONG X       -1.948663E-12
 ========================================================================
                               TRANSLATION ALONG Y       -1.165290E-12
 ========================================================================
                               TRANSLATION ALONG Z        3.410605E-13
 ========================================================================
                               ROTATION ABOUT Y          -9.912487E-15
 ========================================================================
                               ROTATION ABOUT X          -1.437569E-15
 ========================================================================
       611 REVOLUTE            TRANSLATION ALONG X       -7.105427E-13
 ========================================================================
                               TRANSLATION ALONG Y        9.854541E-13
 ========================================================================
                               TRANSLATION ALONG Z       -5.400125E-13
 ========================================================================
                               ROTATION ABOUT Y           8.861401E-15
 ========================================================================
                               ROTATION ABOUT X          -6.452738E-15
 ========================================================================
 


                     REDUNDANT CONSTRAINT INFORMATION
 ========================================================================
   CONSTRAINT ID          TYPE                 REDUNDANT
 ========================================================================
             513          REVOLUTE             ROTATION ABOUT X        
             536          REVOLUTE             ROTATION ABOUT X        
             611          REVOLUTE             TRANSLATION ALONG Z     
             611          REVOLUTE             ROTATION ABOUT X        
 ========================================================================
 ========================================================================
 ========================================================================
 ========================================================================
 ** NO. OF REDUNDANT CONSTRAINT =           4


                       POSITION CONSTRAINT VIOLATION
 ========================================================================
        ID JOINT               ELEMENT                    VIOLATION
 ========================================================================
       427 FIXED               TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Z           0.000000E+00
                               ROTATION ABOUT Y           5.474742E-17
                               ROTATION ABOUT X          -1.323489E-23
 ========================================================================
       129 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -1.409837E-14
                               ROTATION ABOUT X           1.053011E-16
 ========================================================================
       152 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           2.240279E-15
                               ROTATION ABOUT X           5.594483E-17
 ========================================================================
       382 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           9.426921E-15
                               ROTATION ABOUT X          -5.637851E-17
 ========================================================================
       175 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           1.076256E-14
                               ROTATION ABOUT X           9.957993E-17
 ========================================================================
       244 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           6.373159E-15
                               ROTATION ABOUT X          -5.551115E-17
 ========================================================================
       359 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           1.109269E-14
                               ROTATION ABOUT X           5.464379E-17
 ========================================================================
       198 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           8.477118E-17
                               ROTATION ABOUT X           4.406877E-17
 ========================================================================
       267 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -2.610625E-16
                               ROTATION ABOUT X           5.247539E-17
 ========================================================================
       336 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           1.183385E-14
                               ROTATION ABOUT X           5.290907E-17
 ========================================================================
       405 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           4.731766E-15
                               ROTATION ABOUT X          -3.105835E-17
 ========================================================================
       559 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           7.232500E-15
                               ROTATION ABOUT X           4.978996E-17
 ========================================================================
       221 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -7.361237E-15
                               ROTATION ABOUT X           4.978996E-17
 ========================================================================
       634 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           4.122484E-15
                               ROTATION ABOUT X           5.507747E-17
 ========================================================================
       513 REVOLUTE            TRANSLATION ALONG X        8.881784E-16
 ========================================================================
                               TRANSLATION ALONG Y       -1.421085E-14
 ========================================================================
                               TRANSLATION ALONG Z        0.000000E+00
 ========================================================================
                               ROTATION ABOUT Y           1.331896E-17
 ========================================================================
                               ROTATION ABOUT X           REDUNDANT      
 ========================================================================
       536 REVOLUTE            TRANSLATION ALONG X       -5.329071E-15
 ========================================================================
                               TRANSLATION ALONG Y       -1.421085E-14
 ========================================================================
                               TRANSLATION ALONG Z       -2.842171E-14
 ========================================================================
                               ROTATION ABOUT Y          -4.149336E-17
 ========================================================================
                               ROTATION ABOUT X           REDUNDANT      
 ========================================================================
       611 REVOLUTE            TRANSLATION ALONG X        7.105427E-15
 ========================================================================
                               TRANSLATION ALONG Y       -8.362770E-15
 ========================================================================
                               TRANSLATION ALONG Z        REDUNDANT      
 ========================================================================
                               ROTATION ABOUT Y           1.387779E-17
 ========================================================================
                               ROTATION ABOUT X           REDUNDANT      
 ========================================================================
 >>> POSITION-ANALYSIS IS SUCCESSFULLY FINISHED
 ======================================================================== 
 >>> System Variables After Position Analysis
 ======================================================================== 
 SEQ TYPE                     NAME         DOF                    
 ------------------------------------------------------------------------ 
    1 REVOLUTE JOINT                129    ROTATION ABOUT Z               
    2 REVOLUTE JOINT                152    ROTATION ABOUT Z               
    3 REVOLUTE JOINT                382    ROTATION ABOUT Z               
    4 REVOLUTE JOINT                175    ROTATION ABOUT Z               
    5 REVOLUTE JOINT                244    ROTATION ABOUT Z               
    6 REVOLUTE JOINT                359    ROTATION ABOUT Z               
    7 REVOLUTE JOINT                198    ROTATION ABOUT Z               
    8 REVOLUTE JOINT                267    ROTATION ABOUT Z               
    9 REVOLUTE JOINT                336    ROTATION ABOUT Z               
   10 REVOLUTE JOINT                405    ROTATION ABOUT Z               
   11 REVOLUTE JOINT                559    ROTATION ABOUT Z               
   12 REVOLUTE JOINT                221    ROTATION ABOUT Z               
   13 REVOLUTE JOINT                634    ROTATION ABOUT Z               
   14 REVOLUTE CONSTRAINT           513    TRANSLATION ALONG X            
   15 REVOLUTE CONSTRAINT           513    TRANSLATION ALONG Y            
   16 REVOLUTE CONSTRAINT           513    TRANSLATION ALONG Z            
   17 REVOLUTE CONSTRAINT           513    ROTATION ABOUT Y               
  -18 REVOLUTE CONSTRAINT           513    ROTATION ABOUT X               
   19 REVOLUTE CONSTRAINT           536    TRANSLATION ALONG X            
   20 REVOLUTE CONSTRAINT           536    TRANSLATION ALONG Y            
   21 REVOLUTE CONSTRAINT           536    TRANSLATION ALONG Z            
   22 REVOLUTE CONSTRAINT           536    ROTATION ABOUT Y               
  -23 REVOLUTE CONSTRAINT           536    ROTATION ABOUT X               
   24 REVOLUTE CONSTRAINT           611    TRANSLATION ALONG X            
   25 REVOLUTE CONSTRAINT           611    TRANSLATION ALONG Y            
  -26 REVOLUTE CONSTRAINT           611    TRANSLATION ALONG Z            
   27 REVOLUTE CONSTRAINT           611    ROTATION ABOUT Y               
  -28 REVOLUTE CONSTRAINT           611    ROTATION ABOUT X               
 DOFs =            2
 DOFs of Redundant Constraint =            4
 
 ========================================================================
 >> VELOCITY ANALYSIS
 ========================================================================


                  INITIAL VELOCITY CONSTRAINT VIOLATION
 ========================================================================
         CONSTRAINT ID          TYPE                VIOLATION
 ========================================================================
                                                  0.000000E+00
                                                  0.000000E+00
             513          REVOLUTE                0.000000E+00
                                                  0.000000E+00
                                                    REDUNDANT
 ========================================================================
                                                  0.000000E+00
                                                  0.000000E+00
             536          REVOLUTE                0.000000E+00
                                                  0.000000E+00
                                                    REDUNDANT
 ========================================================================
                                                  0.000000E+00
                                                  0.000000E+00
             611          REVOLUTE                  REDUNDANT               
                                                  0.000000E+00
                                                    REDUNDANT
 ========================================================================


                         INDEPENDENT COORDINATE
 ========================================================================
              ID                TYPE                DIRECTION
 ========================================================================
             382                REVOLUTE           ROTATION   Z
             359                REVOLUTE           ROTATION   Z
 ========================================================================


                       VELOCITY CONSTRAINT VIOLATION
 ========================================================================
         CONSTRAINT ID          TYPE                VIOLATION
 ========================================================================
                                                  0.000000E+00
                                                  0.000000E+00
             513          REVOLUTE                0.000000E+00
                                                  0.000000E+00
                                                    REDUNDANT
 ========================================================================
                                                  0.000000E+00
                                                  0.000000E+00
             536          REVOLUTE                0.000000E+00
                                                  0.000000E+00
                                                    REDUNDANT
 ========================================================================
                                                  0.000000E+00
                                                  0.000000E+00
             611          REVOLUTE                  REDUNDANT               
                                                  0.000000E+00
                                                    REDUNDANT
 ========================================================================
 >>> VELOCITY-ANALYSIS IS SUCCESSFULLY FINISHED
 
 ========================================================================
 >> SEARCH DEPENDENT BODY
 ========================================================================
 
 ============================================================
 >> THE SIZE OF USED IBUS-ARRAY FOR DEPENDENT BODY =           8
 ============================================================
 ============================================================
 >> THE SIZE OF USED RBUS-ARRAY FOR DEPENDENT BODY =         576
 ============================================================
 >>> SUCCESSFULLY SEARCHED DEPENDENT COORDINATES
 >>> SUCCESSFULLY SEARCHED VARIATION COORDINATES
 >>> SUCCESSFULLY MARKED LOGICAL MAP
 
 ========================================================================
 >> ACCELERATION ANALYSIS
 ========================================================================
 >>> ACCELERATION-ANALYSIS IS SUCCESSFULLY FINISHED


                        SYSTEM CONFIGURATION
      =======================================================
      NUMBER OF GENERALIZED COORDINATE ............       13
      NUMBER OF GENERALIZED VELOCITY ..............       13
      NUMBER OF JOINT .............................  14
      NUMBER OF CUTJNT/ELEMENTARYJNT/PTCV/CVCV.....   3
      NUMBER OF SPRING-DAMPER-ACTUATOR ............   8
      NUMBER OF TRANSLATIONAL FORCE ...............   2
      =======================================================
      TOTAL SPACE USED IN RBUS ARRAY ..............      38583
      =======================================================
      THE SYSTEM HAS        2 KINEMATIC DEGREES OF FREEDOM.
      =======================================================
 
 
 ========================================================================
 ** USED MAXIMUM ARRAY WITH RPT DATABASE           =              728
 ========================================================================
 ========================================================================
 ** USED ARRAY WITH RPT DATABASE                   =                0
 ========================================================================
 
 ========================================================================
 ** USED MAXIMUM ARRAY WITH RPT DATABASE           =              728
 ========================================================================
 ========================================================================
 ** USED ARRAY WITH RPT DATABASE                   =              504
 ========================================================================
 
                 G-ALPHA IMPLICIT INTEGRATOR INFORMATION
 ========================================================================
         RHO INFINITE          =    0.00000E+00
         ALPHAF AND ALPHAM     =    0.00000E+00   -1.00000E+00
         BETA AND GAMMA        =    1.00000E+00    1.50000E+00
 ========================================================================
 
      TIME       STEPSIZE     A_DELNRM      NJAC    NRES    ANRF    AINTF
 ========================================================================
   2.73000E-04  8.00000E-06  1.03080E-05     100     300       0       0
   2.78500E-03  6.40000E-05  4.29842E-05     199     597       0       0
   1.02000E-01  6.00000E-03  2.57305E-05     298     894       0       0
   6.96000E-01  6.00000E-03  3.26025E-05     397    1191       0       0
   1.29000E+00  6.00000E-03  4.52035E-11     496    1488       0       0
   1.88400E+00  6.00000E-03  5.27606E-11     595    1785       0       0
   2.47800E+00  6.00000E-03  3.13212E-05     694    2082       0       0
   3.07200E+00  6.00000E-03  3.28704E-08     793    2379       0       0
   3.66600E+00  6.00000E-03  3.76926E-11     892    2676       0       0
   4.26000E+00  6.00000E-03  7.18407E-11     991    2973       0       0
   4.85400E+00  6.00000E-03  1.50631E-11    1090    3270       0       0
   5.44800E+00  6.00000E-03  6.36090E-05    1189    3567       0       0
   6.00000E+00  6.00000E-03  1.01590E-04    1281    3843       0       0
 
 ======================================================================
 *** WHAT = 
 stop                                                                           
  
 ======================================================================
 !!! STOP MESSAGE IN THE SIMULATION COMMAND !!!
 
 ======================================================================
 >> MODEL NAME INFORMATION : RecurDyn_Model                                                                      
 ======================================================================
 * STARTING TIME/DATE =  10:56: 6 / 2025.11.28
 * ENDING TIME/DATE   =  10:56: 7 / 2025.11.28
 ======================================================================
 * USED TIME =        1 SECOND
 ======================================================================
 
 ========================================================================
 >> MAKING THE OUTPUT FILES
 ========================================================================
 >>> SUCCESSFULLY MADE THE OUTPUT FILES
 
 ============================================================
 >> RD/SOLVER-PROCESSING IS SUCCESSFULLY FINISHED
 ============================================================
                                                                          
 ======================================================================== 
