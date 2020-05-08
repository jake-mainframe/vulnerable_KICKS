//HERC01Z JOB  CLASS=C,MSGCLASS=A,MSGLEVEL=(1,1),REGION=1024K
//*
//* LOAD TEST DATA FOR 'MURACH' KICKS SAMPLE APPS
//*
//* MODIFIED TO USE 'DISPLAY' NUMERICS INSTEAD OF 'COMP-3'
//* -- THIS TO FACILITATE FILES THAT CAN BE READILY SHIPPED
//*    (IE, NO PACKED DATA TO GET FOULED UP)
//*
//* STKCARDS USED BELOW IS A 'C' PROGRAM TO COPY MULTIPLE
//* SHORT (CARD IMAGE) RECORDS TO A LONGER RECORD. IT'S ALSO
//* USED TO SET LRECL AS NEEDED FOR REPRO.
//*
//* FIRST DELETE/DEFINE CUSTMAS, PRODUCT, INVOICE & INVCTL
//*
//DELDEF EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
 DELETE HERC01.KICKS.MURACH.CUSTMAS
 SET MAXCC = 0
 DEFINE CLUSTER                                       -
      (NAME(HERC01.KICKS.MURACH.CUSTMAS) VOLUMES(PUB002) -
       TRACKS(15 15)  INDEXED                         -
       SHAREOPTIONS(1 3) UNIQUE                       -
       RECORDSIZE(118 118)                            -
       KEYS(6 0)                                      -
      )                                               -
     DATA ( NAME(HERC01.KICKS.MURACH.CUSTMAS.DATA))   -
    INDEX ( NAME(HERC01.KICKS.MURACH.CUSTMAS.INDEX))
/*
//*
//* LOAD 118 BYTE RECORDS (2 CARDS PER) INTO CUSTMAS
//*
//LOAD1A EXEC PGM=STKCARDS,PARM='1'
//* DATA FROM P78, LOWE, CICS FOR THE COBOL PGMR, PART 2
//STEPLIB  DD DSN=HERC01.KICKSSYS.V1R5M0.SKIKLOAD,DISP=SHR
//SYSTERM  DD SYSOUT=*,DCB=BLKSIZE=120
//SYSPRINT DD DSN=&REPROIN,DISP=(,PASS),UNIT=SYSDA,
//         SPACE=(CYL,(1,1)),DCB=(RECFM=FB,LRECL=9,BLKSIZE=90)
//SYSIN    DD *,DCB=BLKSIZE=80
HERC01123
HERC02234
HERC03456
HERC04302
/*
//LOAD1B EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//CUSTMAS   DD DSN=&REPROIN,DISP=(OLD,DELETE)
//SYSIN DD *
 REPRO INFILE(CUSTMAS) OUTDATASET(HERC01.KICKS.MURACH.CUSTMAS)
/*
