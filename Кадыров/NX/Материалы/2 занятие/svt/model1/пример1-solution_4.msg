


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
      NO. PART = 3
      NO. DUMMY PART = 0
      NO. JOINT = 2

    SPANNING TREE 
      NO. JOINT BEFORE SPANNING = 2
      NO. VIRTUALJOINT BEFORE SPANNING = 0
      NO. CUTJOINT BEFORE SPANNING = 0
      NO. JOINT AFTER SPANNING = 2
      NO. VIRTUALJOINT AFTER SPANNING = 0
      NO. CUTJOINT AFTER SPANNING = 0

    CHECKING CUTJOINT 
 ======================================================================== 
               CONVERT-PROCESSING IS SUCCESSFULLY FINISHED
 ======================================================================== 

 << RECURDYN/SOLVER PROCESSING >>

 
 ============================================================
 >> BUILDING THE RD/SOLVER STRUCTURE
 ============================================================
 ============================================================
 >> THE SIZE OF USED INBODY ARRAY =           3
 ------------------------------------------------------------
 >> THE SIZE OF USED JOINT ARRAY =          20
 ------------------------------------------------------------
 >> THE SIZE OF USED JOINTIV ARRAY                 =                0
 ------------------------------------------------------------
 >> THE SIZE OF USED EXTPARIV ARRAY                =                4
 ------------------------------------------------------------
 >> THE SIZE OF USED CUTJOINT ARRAY =           3
 ------------------------------------------------------------
 >> THE SIZE OF USED FLEXBODY ARRAY =           0
 ============================================================
 ========================================================================
 >> THE SIZE OF USED N120 ARRAY                    =             3600
 ------------------------------------------------------------------------
 >> THE SIZE OF USED IPN16_1 ARRAY                 =              200
 ------------------------------------------------------------------------
 >> THE SIZE OF USED IPN17 ARRAY                   =              100
 ------------------------------------------------------------------------
 >> THE SIZE OF USED IPN18 ARRAY                   =              200
 ========================================================================
 ========================================================================
 >> THE SIZE OF USED N90 ARRAY                     =             1600
 ------------------------------------------------------------------------
 >> THE SIZE OF USED N90n1 ARRAY                   =             1288
 ------------------------------------------------------------------------
 >> THE SIZE OF USED N90n2 ARRAY                   =             1000
 ------------------------------------------------------------------------
 >> THE SIZE OF USED N90n3 ARRAY                   =             1000
 ========================================================================
 ============================================================
 >> THE SIZE OF USED RBUS ARRAY =       18545
 ------------------------------------------------------------
 >> THE SIZE OF USED IBUS ARRAY =        1664
 ------------------------------------------------------------
 >> THE SIZE OF USED LBUS ARRAY =         296
 ------------------------------------------------------------
 >> THE SIZE OF USED MGRBUS ARRAY =         148
 ------------------------------------------------------------
 >> THE SIZE OF USED OBUS ARRAY                    =              190
 ========================================================================
 >>> SUCCESSFULLY BUILT THE RD/SOLVER STRUCTURE


                         JOINT INFORMATION 
      =======================================================
        JOINT ID  ACTION MARKER    BASE MARKER     TYPE
      =======================================================
            9          18              19        REVOLUTE   
           32          41              42        REVOLUTE   
      =======================================================
 
                          CONSTRAINT INFORMATION
 ========================================================================
         CONSTRAINT ID   ACTION MARKER   BASE MARKER    TYPE
 ========================================================================
              55              64             65           CVCV     
 ========================================================================
 
         CONSTRAINT ID    JOINT1    JOINT2    JOINT3    TYPE
 ========================================================================
      1000002            9                          MOTION
 ========================================================================
 
 
 ======================================================================
 *** WHAT = 
 sim/dyn,end=2.000000,step=500                                                  
  
 ======================================================================
 *** TOKEN SIMULATION TYPE = dyn
 *** TOKEN ENDTIME =   2.00000000000000        1.00000000000000     
 *** TOKEN PLOT STEPSIZE =         500          30
 
 ========================================================================
 >> POSITION ANALYSIS
 ========================================================================


                  INITIAL POSITION CONSTRAINT VIOLATION
 ========================================================================
        ID JOINT               ELEMENT                    VIOLATION
 ========================================================================
         9 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           0.000000E+00
                               ROTATION ABOUT X           0.000000E+00
 ========================================================================
        32 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           0.000000E+00
                               ROTATION ABOUT X           0.000000E+00
 ========================================================================
        55 CURVE TO CURV       TRANSLATION ALONG X       -2.916580E-06
 ========================================================================
                               TRANSLATION ALONG Y       -3.046677E-06
 ========================================================================
                               TRANSLATION ALONG Z        0.000000E+00
 ========================================================================
                               TANGENT ALONG CURVE        7.457944E-04
 ========================================================================
                               ROTATION ABOUT Y           0.000000E+00
 ========================================================================
                               ROTATION ABOUT X           0.000000E+00
 ========================================================================
   1000002 MOTION                                         0.000000E+00
 ========================================================================
 


                     REDUNDANT CONSTRAINT INFORMATION
 ========================================================================
   CONSTRAINT ID          TYPE                 REDUNDANT
 ========================================================================
              55          CVCV                 TRANSLATION ALONG Z     
              55          CVCV                 ROTATION ABOUT Y        
              55          CVCV                 ROTATION ABOUT X        
 ========================================================================
 ========================================================================
 ========================================================================
 ========================================================================
 ** NO. OF REDUNDANT CONSTRAINT =           3


                       POSITION CONSTRAINT VIOLATION
 ========================================================================
        ID JOINT               ELEMENT                    VIOLATION
 ========================================================================
         9 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           0.000000E+00
                               ROTATION ABOUT X           0.000000E+00
 ========================================================================
        32 REVOLUTE            TRANSLATION ALONG X        0.000000E+00
                               TRANSLATION ALONG Y        0.000000E+00
                               TRANSLATION ALONG Z        0.000000E+00
                               ROTATION ABOUT Y           0.000000E+00
                               ROTATION ABOUT X           0.000000E+00
 ========================================================================
        55 CURVE TO CURV       TRANSLATION ALONG X       -2.223511E-06
 ========================================================================
                               TRANSLATION ALONG Y       -2.322931E-06
 ========================================================================
                               TRANSLATION ALONG Z        REDUNDANT      
 ========================================================================
                               TANGENT ALONG CURVE       -5.197871E-09
 ========================================================================
                               ROTATION ABOUT Y           REDUNDANT      
 ========================================================================
                               ROTATION ABOUT X           REDUNDANT      
 ========================================================================
   1000002 MOTION                                         1.274374E-19
 ========================================================================
 >>> POSITION-ANALYSIS IS SUCCESSFULLY FINISHED
 ======================================================================== 
 >>> System Variables After Position Analysis
 ======================================================================== 
 SEQ TYPE                     NAME         DOF                    
 ------------------------------------------------------------------------ 
    1 REVOLUTE JOINT                  9    ROTATION ABOUT Z               
    2 REVOLUTE JOINT                 32    ROTATION ABOUT Z               
    3 CVCV CONSTRAINT                55    TRANSLATION ALONG X            
    4 CVCV CONSTRAINT                55    TRANSLATION ALONG Y            
   -5 CVCV CONSTRAINT                55    TRANSLATION ALONG Z            
    6 CVCV CONSTRAINT                55    TANGENT ALONG CURVE            
   -7 CVCV CONSTRAINT                55    ROTATION ABOUT Y               
   -8 CVCV CONSTRAINT                55    ROTATION ABOUT X               
    9 MOTION CONSTRAINT         1000002    JOINT /         9              
   10 CVCV EXTRA PARAMETER           55    CURVE /        68              
   11 CVCV EXTRA PARAMETER           55    CURVE /        69              
 DOFs =            0
 DOFs of Redundant Constraint =            3
 
 ========================================================================
 >> VELOCITY ANALYSIS
 ========================================================================


                  INITIAL VELOCITY CONSTRAINT VIOLATION
 ========================================================================
         CONSTRAINT ID          TYPE                VIOLATION
 ========================================================================
                                                  0.000000E+00
                                                  0.000000E+00
                                                    REDUNDANT
              55          CURVE TO CURV           0.000000E+00
                                                    REDUNDANT
                                                    REDUNDANT
 ========================================================================
         1000002                 MOTION           0.000000E+00
 ========================================================================


                         INDEPENDENT COORDINATE
 ========================================================================
              ID                TYPE                DIRECTION
 ========================================================================
 ========================================================================


                       VELOCITY CONSTRAINT VIOLATION
 ========================================================================
         CONSTRAINT ID          TYPE                VIOLATION
 ========================================================================
                                                  1.112413E-01
                                                  1.162947E-01
                                                    REDUNDANT
              55          CURVE TO CURV          -1.865448E+01
                                                    REDUNDANT
                                                    REDUNDANT
 ========================================================================
         1000002                 MOTION           0.000000E+00
 ========================================================================
 >>> VELOCITY-ANALYSIS IS SUCCESSFULLY FINISHED
 
 ========================================================================
 >> SEARCH DEPENDENT BODY
 ========================================================================
 
 ============================================================
 >> THE SIZE OF USED IBUS-ARRAY FOR DEPENDENT BODY =           0
 ============================================================
 ============================================================
 >> THE SIZE OF USED RBUS-ARRAY FOR DEPENDENT BODY =           0
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
      NUMBER OF GENERALIZED COORDINATE ............        2
      NUMBER OF GENERALIZED VELOCITY ..............        2
      NUMBER OF JOINT .............................   2
      NUMBER OF CUTJNT/ELEMENTARYJNT/PTCV/CVCV.....   1
      NUMBER OF RELATIVE DRIVING CONSTRAINT .......   1
      =======================================================
      TOTAL SPACE USED IN RBUS ARRAY ..............       9057
      =======================================================
      THE SYSTEM HAS        0 KINEMATIC DEGREES OF FREEDOM.
      =======================================================
 
 
 ========================================================================
 ** USED MAXIMUM ARRAY WITH RPT DATABASE           =              190
 ========================================================================
 ========================================================================
 ** USED ARRAY WITH RPT DATABASE                   =                0
 ========================================================================
 
 ========================================================================
 ** USED MAXIMUM ARRAY WITH RPT DATABASE           =              190
 ========================================================================
 ========================================================================
 ** USED ARRAY WITH RPT DATABASE                   =               71
 ========================================================================
 
      TIME       STEPSIZE     A_DELNRM      NJAC    NRES    ANRF    AINTF
 ========================================================================
  4.00000E-04  4.00000E-04  0.00000E+00       2       8       0       0
 ** POSITION ANALYSIS FAIL **  1.680000010000000E-002
 ** POSITION ANALYSIS FAIL **  1.660000010000000E-002
 ** POSITION ANALYSIS FAIL **  1.720000010000000E-002
 ** POSITION ANALYSIS FAIL **  1.700000010000000E-002
 ** POSITION ANALYSIS FAIL **  1.690000010000000E-002
 ** POSITION ANALYSIS FAIL **  1.685000010000001E-002
 ** POSITION ANALYSIS FAIL **  1.682500010000000E-002
 ** POSITION ANALYSIS FAIL **  1.681250010000000E-002
 ** POSITION ANALYSIS FAIL **  1.680625010000000E-002
 ** POSITION ANALYSIS FAIL **  1.680312510000000E-002
 ** POSITION ANALYSIS FAIL **  1.680156260000000E-002
 ** POSITION ANALYSIS FAIL **  1.680078135000001E-002
 ** POSITION ANALYSIS FAIL **  1.680039072500000E-002
 ** POSITION ANALYSIS FAIL **  1.680019541250000E-002
 ** POSITION ANALYSIS FAIL **  1.680009775625000E-002
 ** POSITION ANALYSIS FAIL **  1.680004892812501E-002
 ** POSITION ANALYSIS FAIL **  1.680002451406250E-002
 ** POSITION ANALYSIS FAIL **  1.680001230703125E-002
 ** POSITION ANALYSIS FAIL **  1.680000620351563E-002
 ** POSITION ANALYSIS FAIL **  1.680000315175782E-002
 ** POSITION ANALYSIS FAIL **  1.680000162587891E-002
 << WARNING : CURRENT STEPSIZE IS TOO SMALL   7.629394531249954E-010
 <<< SIMULATION TIME =  1.680000086293946E-002  CHECK YOUR SYSTEM
 
 --<< ERROR >>--
 >> .......................................#024002001
