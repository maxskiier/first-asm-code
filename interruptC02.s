IRQROUTINE:
  PHA ; Saves write (if applicable)
  PHY ; Saves y from loops in case in loop
  PHX ; saves indexing register
  PHP ; saves processor status in case of changes
  LDY #$00 ; initialize Y register for indexing
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

