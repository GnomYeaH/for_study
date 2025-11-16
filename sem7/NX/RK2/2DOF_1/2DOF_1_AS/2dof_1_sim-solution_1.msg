


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
 >> THE SIZE OF USED IPN16_1 ARRAY                 =             1674
 ------------------------------------------------------------------------
 >> THE SIZE OF USED IPN17 ARRAY                   =             1674
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
 >> THE SIZE OF USED RBUS ARRAY =       85815
 ------------------------------------------------------------
 >> THE SIZE OF USED IBUS ARRAY =        5301
 ------------------------------------------------------------
 >> THE SIZE OF USED LBUS ARRAY =        9509
 ------------------------------------------------------------
 >> THE SIZE OF USED MGRBUS ARRAY =         292
 ------------------------------------------------------------
 >> THE SIZE OF USED OBUS ARRAY                    =              700
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
 sim/dyn,end=1.000000,step=1000                                                 
  
 ======================================================================
 *** TOKEN SIMULATION TYPE = dyn
 *** TOKEN ENDTIME =   1.00000000000000        1.00000000000000     
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
                               ROTATION ABOUT Z          -5.551115E-17
                               ROTATION ABOUT Y           5.474784E-17
                               ROTATION ABOUT X           1.323489E-23
 ========================================================================
       129 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -1.107147E-14
                               ROTATION ABOUT X           1.053011E-16
 ========================================================================
       152 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           2.240769E-15
                               ROTATION ABOUT X           1.118897E-16
 ========================================================================
       382 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           9.427355E-15
                               ROTATION ABOUT X          -1.127570E-16
 ========================================================================
       175 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           7.102567E-15
                               ROTATION ABOUT X           9.957993E-17
 ========================================================================
       244 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           6.373454E-15
                               ROTATION ABOUT X          -5.464379E-17
 ========================================================================
       359 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           1.109356E-14
                               ROTATION ABOUT X           5.290907E-17
 ========================================================================
       198 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           8.200953E-17
                               ROTATION ABOUT X           9.957993E-17
 ========================================================================
       267 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -2.611613E-16
                               ROTATION ABOUT X           1.088539E-16
 ========================================================================
       336 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           1.183428E-14
                               ROTATION ABOUT X           1.092876E-16
 ========================================================================
       405 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -2.614181E-15
                               ROTATION ABOUT X           2.532017E-17
 ========================================================================
       559 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -4.569812E-15
                               ROTATION ABOUT X          -6.123234E-17
 ========================================================================
       221 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           3.551557E-15
                               ROTATION ABOUT X          -5.721189E-18
 ========================================================================
       634 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           4.124137E-15
                               ROTATION ABOUT X           5.507747E-17
 ========================================================================
       513 REVOLUTE            TRANSLATION ALONG X       -7.434053E-13
 ========================================================================
                               TRANSLATION ALONG Y        3.907985E-13
 ========================================================================
                               TRANSLATION ALONG Z        5.968559E-13
 ========================================================================
                               ROTATION ABOUT Y          -1.293925E-14
 ========================================================================
                               ROTATION ABOUT X           2.620466E-15
 ========================================================================
       536 REVOLUTE            TRANSLATION ALONG X       -1.608047E-12
 ========================================================================
                               TRANSLATION ALONG Y       -6.892265E-13
 ========================================================================
                               TRANSLATION ALONG Z        6.252776E-13
 ========================================================================
                               ROTATION ABOUT Y          -6.115966E-15
 ========================================================================
                               ROTATION ABOUT X           1.266226E-14
 ========================================================================
       611 REVOLUTE            TRANSLATION ALONG X        3.161915E-13
 ========================================================================
                               TRANSLATION ALONG Y        5.471018E-13
 ========================================================================
                               TRANSLATION ALONG Z       -2.557954E-13
 ========================================================================
                               ROTATION ABOUT Y           1.575563E-15
 ========================================================================
                               ROTATION ABOUT X          -3.787335E-15
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
                               ROTATION ABOUT Z          -5.551115E-17
                               ROTATION ABOUT Y           5.474784E-17
                               ROTATION ABOUT X           1.323489E-23
 ========================================================================
       129 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -1.107147E-14
                               ROTATION ABOUT X           1.053011E-16
 ========================================================================
       152 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           2.240351E-15
                               ROTATION ABOUT X           1.110223E-16
 ========================================================================
       382 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           9.426921E-15
                               ROTATION ABOUT X          -1.127570E-16
 ========================================================================
       175 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           7.102567E-15
                               ROTATION ABOUT X           9.957993E-17
 ========================================================================
       244 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           6.372329E-15
                               ROTATION ABOUT X          -5.421011E-17
 ========================================================================
       359 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           1.109312E-14
                               ROTATION ABOUT X           5.204170E-17
 ========================================================================
       198 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           8.200953E-17
                               ROTATION ABOUT X           9.957993E-17
 ========================================================================
       267 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -2.609722E-16
                               ROTATION ABOUT X           1.084202E-16
 ========================================================================
       336 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           1.183428E-14
                               ROTATION ABOUT X           1.101549E-16
 ========================================================================
       405 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -2.614181E-15
                               ROTATION ABOUT X           2.575385E-17
 ========================================================================
       559 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y          -4.569812E-15
                               ROTATION ABOUT X          -6.123234E-17
 ========================================================================
       221 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           3.551557E-15
                               ROTATION ABOUT X          -5.721189E-18
 ========================================================================
       634 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           4.123056E-15
                               ROTATION ABOUT X           5.594483E-17
 ========================================================================
       513 REVOLUTE            TRANSLATION ALONG X       -4.440892E-16
 ========================================================================
                               TRANSLATION ALONG Y        2.131628E-14
 ========================================================================
                               TRANSLATION ALONG Z       -8.526513E-14
 ========================================================================
                               ROTATION ABOUT Y           1.058658E-16
 ========================================================================
                               ROTATION ABOUT X           REDUNDANT      
 ========================================================================
       536 REVOLUTE            TRANSLATION ALONG X       -5.773160E-15
 ========================================================================
                               TRANSLATION ALONG Y       -7.105427E-15
 ========================================================================
                               TRANSLATION ALONG Z       -2.842171E-14
 ========================================================================
                               ROTATION ABOUT Y           3.292509E-17
 ========================================================================
                               ROTATION ABOUT X           REDUNDANT      
 ========================================================================
       611 REVOLUTE            TRANSLATION ALONG X       -2.131628E-14
 ========================================================================
                               TRANSLATION ALONG Y       -8.065620E-15
 ========================================================================
                               TRANSLATION ALONG Z        REDUNDANT      
 ========================================================================
                               ROTATION ABOUT Y           2.602085E-17
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
             336                REVOLUTE           ROTATION   Z
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
      NUMBER OF SPRING-DAMPER-ACTUATOR ............   4
      NUMBER OF TRANSLATIONAL FORCE ...............   2
      =======================================================
      TOTAL SPACE USED IN RBUS ARRAY ..............      37963
      =======================================================
      THE SYSTEM HAS        2 KINEMATIC DEGREES OF FREEDOM.
      =======================================================
 
 
 ========================================================================
 ** USED MAXIMUM ARRAY WITH RPT DATABASE           =              700
 ========================================================================
 ========================================================================
 ** USED ARRAY WITH RPT DATABASE                   =                0
 ========================================================================
 
 ========================================================================
 ** USED MAXIMUM ARRAY WITH RPT DATABASE           =              700
 ========================================================================
 ========================================================================
 ** USED ARRAY WITH RPT DATABASE                   =              476
 ========================================================================
 
                 G-ALPHA IMPLICIT INTEGRATOR INFORMATION
 ========================================================================
         RHO INFINITE          =    0.00000E+00
         ALPHAF AND ALPHAM     =    0.00000E+00   -1.00000E+00
         BETA AND GAMMA        =    1.00000E+00    1.50000E+00
 ========================================================================
 
      TIME       STEPSIZE     A_DELNRM      NJAC    NRES    ANRF    AINTF
 ========================================================================
   2.73000E-04  8.00000E-06  2.41510E-06     100     300       0       0
   5.00000E-03  3.44000E-04  6.76708E-02     199     600       0       0
   8.90000E-02  1.00000E-03  1.40973E+00     341    1139       1       1
   1.88000E-01  1.00000E-03  3.80347E-02     440    1548       1       1
   2.22500E-01  2.50000E-04  3.62516E-01     549    1961       2       4
   2.48250E-01  2.50000E-04  1.14199E-01     654    2354       5       4
   2.97000E-01  1.00000E-03  5.78620E-01     771    2775       7       7
   3.65000E-01  1.00000E-03  3.97989E-02     874    3103       8       7
   4.33000E-01  1.00000E-03  2.29422E-03     974    3402       8       8
   5.32000E-01  1.00000E-03  3.95021E-06    1073    3699       8       8
   6.31000E-01  1.00000E-03  6.72282E-09    1172    3996       8       8
   7.30000E-01  1.00000E-03  1.25025E-11    1271    4293       8       8
   8.29000E-01  1.00000E-03  1.67640E-12    1370    4590       8       8
   9.28000E-01  1.00000E-03  1.01508E-12    1469    4887       8       8
   1.00000E+00  1.00000E-03  8.93660E-13    1541    5103       8       8
 
 ======================================================================
 *** WHAT = 
 stop                                                                           
  
 ======================================================================
 !!! STOP MESSAGE IN THE SIMULATION COMMAND !!!
 
 ======================================================================
 >> MODEL NAME INFORMATION : RecurDyn_Model                                                                      
 ======================================================================
 * STARTING TIME/DATE =  17:47:42 / 2025.11.14
 * ENDING TIME/DATE   =  17:47:42 / 2025.11.14
 ======================================================================
 * USED TIME =        0 SECOND
 ======================================================================
 
 ========================================================================
 >> MAKING THE OUTPUT FILES
 ========================================================================
 >>> SUCCESSFULLY MADE THE OUTPUT FILES
 
 ============================================================
 >> RD/SOLVER-PROCESSING IS SUCCESSFULLY FINISHED
 ============================================================
                                                                          
 ======================================================================== 
