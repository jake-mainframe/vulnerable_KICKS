//HERC01P  JOB CLASS=C,MSGCLASS=A,MSGLEVEL=(1,1)
//*
//ASM      EXEC PGM=IFOX00,
//            PARM='DECK,NOLIST'
//SYSLIB   DD DSN=SYS1.MACLIB,DISP=SHR
//         DD DSN=HERC01.KICKSSYS.V1R5M0.MACLIB,DISP=SHR
//SYSUT1   DD UNIT=SYSDA,SPACE=(CYL,(2,1))
//SYSUT2   DD UNIT=SYSDA,SPACE=(CYL,(2,1))
//SYSUT3   DD UNIT=SYSDA,SPACE=(CYL,(2,1))
//SYSPRINT DD SYSOUT=*
//SYSLIN   DD DUMMY
//SYSPUNCH DD DSN=&&OBJSET,
//         UNIT=SYSDA,SPACE=(80,(200,200)),
//         DISP=(,PASS)
//SYSIN    DD *
         PRINT GEN
         KIKPCT TYPE=INITIAL,SUFFIX=1$
*
*        KICKS SUPPLIED TRANACTIONS
*
*GOOD MORNING MESSAGE (PRESS CLEAR TO ESCAPE)
*     SET REFRESH TIME (IN SECONDS) WITH TWASIZE
*     MIN  3 SECS, MAX 60 SECONDS, OTHERWISE NO REFRESH
*          6 SEEMS TO WORK WELL IN TERMS OF SYNC
*            WITH FLASHING 'FOR TSO' -- W/QWSPLUS
*
KSGM     KIKPCT TYPE=ENTRY,TRANSID=KSGM,PROGRAM=KSGMPGM,TWASIZE=6
CSGM     KIKPCT TYPE=ENTRY,TRANSID=CSGM,PROGRAM=KSGMPGM NO REFRESH
* FOLLOWING IS VERSION WITH A FIXED SET OF COLORS FOR TESTING...
KSG1     KIKPCT TYPE=ENTRY,TRANSID=KSG1,PROGRAM=KSGMPGM,TWASIZE=1
*
*SIGN OFF (SHUTDOWN KICKS)
*
KSSF     KIKPCT TYPE=ENTRY,TRANSID=KSSF,PROGRAM=KSSFPGM
CSSF     KIKPCT TYPE=ENTRY,TRANSID=CSSF,PROGRAM=KSSFPGM
LOGO     KIKPCT TYPE=ENTRY,TRANSID=LOGO,PROGRAM=KSSFPGM
K999     KIKPCT TYPE=ENTRY,TRANSID=K999,PROGRAM=K999PGM
*
*CRLP TERMINAL CONTROL TRANSACTION
*
CRLP     KIKPCT TYPE=ENTRY,TRANSID=CRLP,PROGRAM=CRLPPGM
*
*COMMAND LEVEL DEBUGGER
*
KEDF     KIKPCT TYPE=ENTRY,TRANSID=KEDF,PROGRAM=KEDFPGM
CEDF     KIKPCT TYPE=ENTRY,TRANSID=CEDF,PROGRAM=KEDFPGM
*
*QUEUE BROWSER
*
KEBR     KIKPCT TYPE=ENTRY,TRANSID=KEBR,PROGRAM=KEBRPGM
CEBR     KIKPCT TYPE=ENTRY,TRANSID=CEBR,PROGRAM=KEBRPGM
*
*MASTER TERMINAL TRANSACTION
*
KSMT     KIKPCT TYPE=ENTRY,TRANSID=KSMT,PROGRAM=KSMTPGM
KEMT     KIKPCT TYPE=ENTRY,TRANSID=KEMT,PROGRAM=KSMTPGM
CSMT     KIKPCT TYPE=ENTRY,TRANSID=CSMT,PROGRAM=KSMTPGM
CEMT     KIKPCT TYPE=ENTRY,TRANSID=CEMT,PROGRAM=KSMTPGM
*
*
*        ACCOUNTS AND CONTRIBUTIONS PCT ENTRIES
*
*        MASTER MENU
*
         KIKPCT TYPE=ENTRY,TRANSID=BTC0,PROGRAM=TACMENU,               *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
*  ****  WILL NEVER EXIST  TRANSID=BTC1
*
*        AUTO REFUND
*
         KIKPCT TYPE=ENTRY,TRANSID=BTC2,PROGRAM=TACARA,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTC3,PROGRAM=TACARR,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTC4,PROGRAM=TACARC,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTC5,PROGRAM=TACARD,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
*
*        MANUAL REFUND
*
         KIKPCT TYPE=ENTRY,TRANSID=BTC6,PROGRAM=TACMRA,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTC7,PROGRAM=TACMRR,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTC8,PROGRAM=TACMRC,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTC9,PROGRAM=TACMRD,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
*
*        CANCELLATIONS
*
         KIKPCT TYPE=ENTRY,TRANSID=BTCA,PROGRAM=TACCCA,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCB,PROGRAM=TACCCR,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
*  ****  WILL NEVER EXIST  TRANSID=BTCC
         KIKPCT TYPE=ENTRY,TRANSID=BTCD,PROGRAM=TACCCD,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
*
*        DISHONORED ITEMS
*
         KIKPCT TYPE=ENTRY,TRANSID=BTCE,PROGRAM=TACDHA,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCF,PROGRAM=TACDHR,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCG,PROGRAM=TACDHC,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCH,PROGRAM=TACDHD,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
*
*        DEPOSITS
*
         KIKPCT TYPE=ENTRY,TRANSID=BTCI,PROGRAM=TACDPA,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCJ,PROGRAM=TACDPR,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCK,PROGRAM=TACDPC,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCL,PROGRAM=TACDPD,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
*
*        REDEEMPTIONS
*
         KIKPCT TYPE=ENTRY,TRANSID=BTCM,PROGRAM=TACRDA,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCN,PROGRAM=TACRDR,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCO,PROGRAM=TACRDC,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCP,PROGRAM=TACRDD,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
*
*        OTHER MANUAL PROCESSES
*
         KIKPCT TYPE=ENTRY,TRANSID=BTCQ,PROGRAM=TACOTA,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCR,PROGRAM=TACOTR,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCS,PROGRAM=TACOTC,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
         KIKPCT TYPE=ENTRY,TRANSID=BTCT,PROGRAM=TACOTD,                *
               TRANSEC=00,TPURGE=YES,SPURGE=YES,TWASIZE=000
*
*        MURACH/LOWE CICS FOR THE COBOL PROGRAMMER
*
         KIKPCT TYPE=ENTRY,TRANSID=CMNT,PROGRAM=CSTMNTP
         KIKPCT TYPE=ENTRY,TRANSID=DFXX,PROGRAM=DFXXP00A
         KIKPCT TYPE=ENTRY,TRANSID=DIN1,PROGRAM=DB2INQ1
         KIKPCT TYPE=ENTRY,TRANSID=INQ1,PROGRAM=CUSTINQ1
         KIKPCT TYPE=ENTRY,TRANSID=INQ2,PROGRAM=CUSTINQ2
         KIKPCT TYPE=ENTRY,TRANSID=INQ3,PROGRAM=CUSTINQ3
         KIKPCT TYPE=ENTRY,TRANSID=MENU,PROGRAM=INVMENU
         KIKPCT TYPE=ENTRY,TRANSID=MNT1,PROGRAM=CUSTMNT1
         KIKPCT TYPE=ENTRY,TRANSID=MNT2,PROGRAM=CUSTMNT2
         KIKPCT TYPE=ENTRY,TRANSID=MNT3,PROGRAM=CUSTMNT3
         KIKPCT TYPE=ENTRY,TRANSID=ORD1,PROGRAM=ORDRENT
         KIKPCT TYPE=ENTRY,TRANSID=SUM1,PROGRAM=INVSUM1
*
*        TRANSACTIONS FOR GENERAL TESTING, KOOKBOOK RECIPES, ETC
*
         KIKPCT TYPE=ENTRY,TRANSID=TEST,PROGRAM=TESTPGM
         KIKPCT TYPE=ENTRY,TRANSID=TCOB,PROGRAM=TESTCOB
         KIKPCT TYPE=ENTRY,TRANSID=KB12,PROGRAM=KB12PGM
         KIKPCT TYPE=ENTRY,TRANSID=KB13,PROGRAM=KB13PGM
*
         KIKPCT TYPE=ENTRY,TRANSID=PAYM,PROGRAM=PAYMCOB
         KIKPCT TYPE=ENTRY,TRANSID=LIST,PROGRAM=LISTCOB
         KIKPCT TYPE=ENTRY,TRANSID=MAIN,PROGRAM=MAINCOB
         KIKPCT TYPE=ENTRY,TRANSID=KAJC,PROGRAM=KAJCCOB
*
         KIKPCT TYPE=FINAL
         END
/*
//LKED     EXEC PGM=IEWL,PARM='XREF,MAP,LET,NCAL',
//         COND=(0,NE,ASM)
//SYSLIN   DD DSN=&&OBJSET,DISP=(OLD,DELETE)
//SYSIN    DD DUMMY
//SYSLMOD  DD DSN=HERC01.KICKSSYS.V1R5M0.SKIKLOAD(KIKPCT1$),DISP=SHR
//SYSUT1   DD UNIT=SYSDA,SPACE=(CYL,(2,1))
//SYSPRINT DD SYSOUT=*