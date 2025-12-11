IRQROUTINE:
  PHA ; Saves write (if applicable)
  PHY ; Saves y from loops in case in loop
  PHX ; saves indexing register
  PHP ; saves processor status in case of changes
  PHP ; transfer processor status to A
  LDY #$00 ; initialize y register for indexing
  PLA ; pull processor status to A
  STA TESTLOC ; store to TESTLOC for bit testing
  BBS4 TESTLOC, CHKSTATUS ; if yes, output processor status to monitor
IRQLOOP: ; writing loop of assorted values
  LDA IRQVALUES,Y ; lookup table, see zero-page at beginning of file
  BEQ IRQEND ; if $0, end loop and return to prior processor status
  STA $0300,Y
  INY
  JMP IRQLOOP
IRQEND:
  PLP ; pull processor status back
  PLX ; pull value of X register
  PLY ; pull value of Y register prior to IRQ back
  PLA ; pull value of accumulator prior to IRQ back
  RTI ; return to prior code
CHKSTATUS: ; break code
  STA $5000 ; would be serial interface, output processor status to it
  BRA IRQEND ; branch always, end IRQ
