       ID DIVISION.
       PROGRAM-ID.    LISTCOB.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       COPY TESTMSD.
       COPY DFHAID.
       LINKAGE SECTION.
       01  DFHCOMMAREA PIC X(100).
       PROCEDURE DIVISION.
               IF EIBAID = DFHCLEAR THEN
                   EXEC CICS RETURN END-EXEC.
               END-IF