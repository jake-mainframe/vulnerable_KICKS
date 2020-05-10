       ID DIVISION.
       PROGRAM-ID.    KAJCCOB.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  MAINMAP                   PIC X(7) VALUE 'MAINCOB'
       COPY TESTMSD.
       COPY DFHAID.
       LINKAGE SECTION.
       01  DFHCOMMAREA PIC X(100).
       PROCEDURE DIVISION.
           IF EIBAID = DFHCLEAR THEN
               EXEC CICS RETURN END-EXEC.
           IF EIBAID = DFHPF2 THEN
               EXEC CICS XCTL PROGRAM(MAINMAP) END-EXEC.
           EXEC CICS
           SEND MAP('KAJCMAP') MAPSET('TESTMSD') ERASE
           END-EXEC.
           EXEC CICS RETURN
               TRANSID(EIBTRNID)
           END-EXEC.
