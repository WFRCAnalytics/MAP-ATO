
; IMPORTANT!!! RUN FOR EACH SET OF MODELS

;initialize by reading in scenario general and specific parameters
READ FILE = 'A:\1 - TDM\3 - Model Dev\1 - WF\1 - Official Release\v9x\v9.0\WF TDM v9.0 - official\Scenarios\RTP_2050\0GeneralParameters.block'
READ FILE = 'A:\1 - TDM\3 - Model Dev\1 - WF\1 - Official Release\v9x\v9.0\WF TDM v9.0 - official\Scenarios\RTP_2050\1ControlCenter.block'

RUN PGM=MATRIX  MSG='Prepare Travel Shed Tables'
    FILEI ZDATI   = '@ParentDir@@ScenarioDir@0_InputProcessing\SE_File_@RID@.dbf'
    FILEI MATI[1] = '@ParentDir@@ScenarioDir@5_AssignHwy\5_FinalNetSkims\Skm_PM.mtx'
    FILEI MATI[2] = '@ParentDir@@ScenarioDir@4_ModeChoice\1a_Skims\1Skm_TotTransitTime_Pk.mtx'

    FILEO PRINTO[1] = 'intermediate\travelsheds\@RID@_TAZOpportunitySheds_Auto.csv'
    FILEO PRINTO[2] = 'intermediate\travelsheds\@RID@_TAZOpportunitySheds_Tran.csv'
    FILEO PRINTO[3] = 'intermediate\travelsheds\@RID@_TAZOpportunitySheds_Summary.csv'

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
        PRINT PRINTO=2, CSV=T,
            FORM=8.0, 
            LIST='I','J','SHED'
    ENDIF

    JLOOP
        
        ;calculate employment within 30 min of transit array
        IF (mi.1.GP_TotTime[J]<=10)

            HHs10min_Auto[I] = HHs10min_Auto[I] + ZI.1.TOTHH[J]
            EMP10min_Auto[I] = EMP10min_Auto[I] + ZI.1.TOTEMP[J]
                
            PRINT PRINTO=1, CSV=T,
                FORM=8.0, 
                LIST=I, J, 10

        ELSEIF (mi.1.GP_TotTime[J]<=20)

            HHs20min_Auto[I] = HHs20min_Auto[I] + ZI.1.TOTHH[J]
            EMP20min_Auto[I] = EMP20min_Auto[I] + ZI.1.TOTEMP[J]
                
            PRINT PRINTO=1, CSV=T,
                FORM=8.0, 
                LIST=I, J, 20

        ELSEIF (mi.1.GP_TotTime[J]<=30)

            HHs30min_Auto[I] = HHs30min_Auto[I] + ZI.1.TOTHH[J]
            EMP30min_Auto[I] = EMP30min_Auto[I] + ZI.1.TOTEMP[J]
                
            PRINT PRINTO=1, CSV=T,
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
                
            PRINT PRINTO=2, CSV=T,
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
                
            PRINT PRINTO=2, CSV=T,
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
                
            PRINT PRINTO=2, CSV=T,
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