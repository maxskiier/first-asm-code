IRQROUTINE:
  PHA ; Saves write (if applicable)
  TYA
  PHA ; Saves y from loops in case in loop
  TXA
  PHA ; saves indexing register
  PHP ; saves processor status in case of changes
  PHP ; push and pull to A to check for break flag
  PLA
  AND #%00010000 ; check for break flag
  CMP #%00010000
  BEQ BREAK
  LDY #$00 ; initialize Y register for indexing
  LDX #$00 ; reserved for future use
IRQLOOP: ; writing loop of assorted values
  LDA IRQVALUES,Y ; lookup table, see zero-page at beginning of file
  BEQ IRQEND ; if $0, end loop and return to prior processor status
  STA $0300,Y
  INY
  JMP IRQLOOP
IRQEND:
  PLP ; pull processor status back
  PLA ; pull value of X register
  TAX
  PLA ; pull value of Y register prior to IRQ back
  TAY
  PLA ; pull value of accumulator prior to IRQ back
  RTI ; return to prior code
BREAK:
  RTI ; placeholder for now
