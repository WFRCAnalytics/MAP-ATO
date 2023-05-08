ParentDir    = 'K:\TDM\0 - ModelDev\Official Release\v8.3.1\WF TDM v8.3.1 - 2020-08-17\'
ScenarioDir  = 'Scenarios\BY_2019\'
ScenarioName = 'BY_2019'
UsedZones    = 2881


; Employment within 30 Minutes of Transit
RUN PGM=MATRIX  MSG='Network Processing 4: calculate employment within 30 minutes of transit'
    FILEI ZDATI   = '@ParentDir@@ScenarioDir@0_InputProcessing\SE_File_v831_SE19_Net19.dbf'
    FILEI MATI[1] = '@ParentDir@@ScenarioDir@5_AssignHwy\5_FinalNetSkims\Skm_PM.mtx'
    FILEI MATI[2] = '@ParentDir@@ScenarioDir@4_ModeChoice\1a_Skims\1Skm_TotTransitTime_Pk.mtx'

    FILEO PRINTO[1] = 'intermediate\travelshed\@ScenarioName@_TAZOpportunitySheds_Auto.csv'
    FILEO PRINTO[2] = 'intermediate\travelshed\@ScenarioName@_TAZOpportunitySheds_Tran.csv'
    FILEO PRINTO[3] = 'intermediate\travelshed\@ScenarioName@_TAZOpportunitySheds_HHsEMP.csv'

    ;general parameters
    ZONEMSG = 50

    ;define array
    ARRAY HHs10min_Auto=@UsedZones@
    ARRAY HHs20min_Auto=@UsedZones@
    ARRAY HHs30min_Auto=@UsedZones@
    ARRAY EMP10min_Auto=@UsedZones@
    ARRAY EMP20min_Auto=@UsedZones@
    ARRAY EMP30min_Auto=@UsedZones@
    
    ARRAY HHs10min_Tran=@UsedZones@
    ARRAY HHs20min_Tran=@UsedZones@
    ARRAY HHs30min_Tran=@UsedZones@
    ARRAY EMP10min_Tran=@UsedZones@
    ARRAY EMP20min_Tran=@UsedZones@
    ARRAY EMP30min_Tran=@UsedZones@
    

    IF (I=1)
        PRINT PRINTO=1, CSV=T,
            FORM=8.0, 
            LIST='I','J','SHED'
    ENDIF

    JLOOP
        
        ;calculate employment within 30 min of transit array
        IF (mi.1.GP_TotTime[J]<=10)

            HHs10min_Auto[I] = HHs10min_Auto[I] + ZI.1.TOTHH[J]
            EMP10min_Auto[I] = EMP10min_Auto[I] + ZI.1.TOTEMP[J]
                
            PRINT PRINTO=1, 
                FORM=8.0, 
                LIST=I, J, 10

        ELSEIF (mi.1.GP_TotTime[J]<=20)

            HHs20min_Auto[I] = HHs20min_Auto[I] + ZI.1.TOTHH[J]
            EMP20min_Auto[I] = EMP20min_Auto[I] + ZI.1.TOTEMP[J]
                
            PRINT PRINTO=1, 
                FORM=8.0, 
                LIST=I, J, 20

        ELSEIF (mi.1.GP_TotTime[J]<=30)

            HHs30min_Auto[I] = HHs30min_Auto[I] + ZI.1.TOTHH[J]
            EMP30min_Auto[I] = EMP30min_Auto[I] + ZI.1.TOTEMP[J]
                
            PRINT PRINTO=1, 
                FORM=8.0, 
                LIST=I, J, 30

        ENDIF

        IF ((mi.2.w4time[J]>0 & mi.2.w4time[J]<=10) |
            (mi.2.w5time[J]>0 & mi.2.w5time[J]<=10) |
            (mi.2.w6time[J]>0 & mi.2.w6time[J]<=10) |
            (mi.2.w7time[J]>0 & mi.2.w7time[J]<=10) |
            (mi.2.w8time[J]>0 & mi.2.w8time[J]<=10) |
            (mi.2.w9time[J]>0 & mi.2.w9time[J]<=10) |
            (mi.2.d4time[J]>0 & mi.2.d4time[J]<=10) |
            (mi.2.d5time[J]>0 & mi.2.d5time[J]<=10) |
            (mi.2.d6time[J]>0 & mi.2.d6time[J]<=10) |
            (mi.2.d7time[J]>0 & mi.2.d7time[J]<=10) |
            (mi.2.d8time[J]>0 & mi.2.d8time[J]<=10) |
            (mi.2.d9time[J]>0 & mi.2.d9time[J]<=10))

            HHs10min_Tran[I] = HHs10min_Tran[I] + ZI.1.TOTHH[J]
            EMP10min_Tran[I] = EMP10min_Tran[I] + ZI.1.TOTEMP[J]
                
            PRINT PRINTO=2, 
                FORM=8.0, 
                LIST=I, J, 10

        ELSEIF ((mi.2.w4time[J]>10 & mi.2.w4time[J]<=20) |
                (mi.2.w5time[J]>10 & mi.2.w5time[J]<=20) |
                (mi.2.w6time[J]>10 & mi.2.w6time[J]<=20) |
                (mi.2.w7time[J]>10 & mi.2.w7time[J]<=20) |
                (mi.2.w8time[J]>10 & mi.2.w8time[J]<=20) |
                (mi.2.w9time[J]>10 & mi.2.w9time[J]<=20) |
                (mi.2.d4time[J]>10 & mi.2.d4time[J]<=20) |
                (mi.2.d5time[J]>10 & mi.2.d5time[J]<=20) |
                (mi.2.d6time[J]>10 & mi.2.d6time[J]<=20) |
                (mi.2.d7time[J]>10 & mi.2.d7time[J]<=20) |
                (mi.2.d8time[J]>10 & mi.2.d8time[J]<=20) |
                (mi.2.d9time[J]>10 & mi.2.d9time[J]<=20))

            HHs20min_Tran[I] = HHs20min_Tran[I] + ZI.1.TOTHH[J]
            EMP20min_Tran[I] = EMP20min_Tran[I] + ZI.1.TOTEMP[J]
                
            PRINT PRINTO=2, 
                FORM=8.0, 
                LIST=I, J, 20

        ELSEIF ((mi.2.w4time[J]>20 & mi.2.w4time[J]<=30) |
                (mi.2.w5time[J]>20 & mi.2.w5time[J]<=30) |
                (mi.2.w6time[J]>20 & mi.2.w6time[J]<=30) |
                (mi.2.w7time[J]>20 & mi.2.w7time[J]<=30) |
                (mi.2.w8time[J]>20 & mi.2.w8time[J]<=30) |
                (mi.2.w9time[J]>20 & mi.2.w9time[J]<=30) |
                (mi.2.d4time[J]>20 & mi.2.d4time[J]<=30) |
                (mi.2.d5time[J]>20 & mi.2.d5time[J]<=30) |
                (mi.2.d6time[J]>20 & mi.2.d6time[J]<=30) |
                (mi.2.d7time[J]>20 & mi.2.d7time[J]<=30) |
                (mi.2.d8time[J]>20 & mi.2.d8time[J]<=30) |
                (mi.2.d9time[J]>20 & mi.2.d9time[J]<=30))

            HHs30min_Tran[I] = HHs30min_Tran[I] + ZI.1.TOTHH[J]
            EMP30min_Tran[I] = EMP30min_Tran[I] + ZI.1.TOTEMP[J]
                
            PRINT PRINTO=2, 
                FORM=8.0, 
                LIST=I, J, 30

        ENDIF





    ENDJLOOP
    
    IF (I=1)
        PRINT PRINTO=3, CSV=T,
            FORM=8.0, 
            LIST='Z', 
                 'HHs10Min_Auto',
                 'HHs20Min_Auto',
                 'HHs30Min_Auto',
                 'EMP10Min_Auto',
                 'EMP20Min_Auto',
                 'EMP30Min_Auto',
                 'HHs10Min_Tran',
                 'HHs20Min_Tran',
                 'HHs30Min_Tran',
                 'EMP10Min_Tran',
                 'EMP20Min_Tran',
                 'EMP30Min_Tran'
    ENDIF

    PRINT PRINTO=3, CSV=T,
        FORM=8.0, 
        LIST=I,
             HHs10Min_Auto[I],
             HHs20Min_Auto[I],
             HHs30min_Auto[I],
             EMP10min_Auto[I],
             EMP20min_Auto[I],
             EMP30min_Auto[I],
             HHs10min_Tran[I],
             HHs20min_Tran[I],
             HHs30min_Tran[I],
             EMP10min_Tran[I],
             EMP20min_Tran[I],
             EMP30min_Tran[I]

ENDRUN