Dim Shared ReservedWords( 1000 ) as String

  dim ReservedWordFile as string
  dim ReservedWordIn as string
  dim ReservedWordCounter as Integer
  dim As Byte ReservedwordLoop = 0
    Dim Shared As UByte   ReservedwordC = 0

  'Detect GCBASIC install directory
  Dim ID as string
  ID = ""
  If ID = "" Or ID = "." THEN
    ID = CURDIR
    #IFDEF __FB_UNIX__
      If Right(ID, 1) = "" Then ID = Left(ID, Len(ID) - 1)
    #ELSE
      If Right(ID, 1) = "" Then ID = Left(ID, Len(ID) - 1)
    #ENDIF
  End If

  'Read list
  #IFDEF __FB_UNIX__
    ReservedWordFile = ID + "\reservedwords.dat"
  #ELSE
    ReservedWordFile = ID + "\reservedwords.dat"
  #ENDIF
  IF Dir(ReservedWordFile) = "" THEN
    PRINT "Cannot find " + ReservedWordFile
    Print
    PRINT "Great Cow BASIC cannot operate without this file"
  END IF

  ReservedWordCounter = 0
  OPEN ReservedWordFile FOR INPUT AS #1
  Do While NOT EOF(1)
      Line Input #1,  ReservedWordIn
      ReservedWords( ReservedWordCounter )  = ReservedWordIn
'      print ReservedWords( ReservedWordCounter )
      ReservedWordCounter = ReservedWordCounter +1
      For ReservedwordLoop = 1 to len ( ReservedWordIn )
          If ReservedWordCounter > 1 then
            ReservedwordC = ReservedwordC + ASC( Mid(ReservedWordIn,ReservedwordLoop ,1) )
          End if
      Next 
  Loop
  CLOSE  #1
  Print 255-ReservedwordC
