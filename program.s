.segment "ROM"
.setcpu "65C02"
GRAPHICS: .byte $40, $00, $58, $79, $F4, $5E, $00
VALUES: .byte $77, $57, $F1, $0F, $E2, $4C, $92, $5E, $D1, $FB, $22, $B5, $00
IRQVALUES: .byte $32, $7F, $A2, $CC, $BF, $F2, $DA

RESET: ; Reset routine
  SEI ; Ensure no interrupts can come in while writing to stack
  LDX #$FF
  TXS ; initialize stack
  LDX #$00 ; return to prior value
  JSR FROMRESET1 ; End of reset routine,
  CLI
  LDX #$00 ; setup writeseq subroutine

WRITESEQ: ; writing RAM values
  LDA VALUES,Y ; lookup table of assorted values
  STA $0400,X ; indexed to allow to loop
  INX
  INY
  CPY #$0B ;compare to hex B, decimal 11
  BNE WRTSEQ2 ; branch to second compare ifneq, otherwise load hex 0 into Y
  LDY #$00 
WRTSEQ2:
  CPX #$FF ; checks if finished
  BEQ RESET ; if equal, branch back to the reset subroutine
  JMP WRITESEQ ; otherwise, loop

FROMRESET1: ; sets up "graphics"
  SEI ; ensure no interrupts
  LDA GRAPHICS,X
  STA $2006 ;would-be NES PPUADDR register
  INX
  CPX #$02 ; compare to hex 2, (when it should be done)
  BNE FROMRESET1 ; loop if not equal, otherwise proceed to second graphics loop
FROMRESET2: ; write "graphics" data
  LDA GRAPHICS,X ; load the value
  STA $2007 ; store at would-be NES PPUDATA register
  INX
  CPX #$07 ; compare to hex 7, remember indexed at 2 when loop begins
  BNE FROMRESET2 ; loop ifneq
  RTS ; return to finish reset routine

 .segment "IRQROUTINE"
IRQROUTINE:
  PHA ; Saves write (if applicable)
  TYA
  PHA ; Saves value from loops in case in loop
  PHP ; saves processor status in case of changes
  LDY #$00 ; initialize Y register for indexing
IRQLOOP: ; writing loop of assorted values
  LDA IRQVALUES,Y ; lookup table, see zero-page at beginning of file
  STA $06A0,Y ; store at hex 06A0, 1708 decimal
  INY
  CPY #$7 ;compare Y to hex 7 (when it should be done)
  BNE IRQLOOP ; ifneq, loop, otherwise end loop and return to prior processor status
  PLP ; pull processor status back
  PLA ; pull value of Y register prior to IRQ back
  TAY ; transfer to Y
  PLA ; pull value of accumulator prior to IRQ back
  RTI ; return to prior code

  .segment "VECTORS"
VECTORS: .word IRQROUTINE, RESET, IRQROUTINE ; self explanatory, vectors for IRQ, RST, and NMI
