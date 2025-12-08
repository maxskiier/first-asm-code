.setcpu "65C02"
.zeropage
.include "zeropage.s"

.segment "ROM"
LOADGRAPHICS: .byte $40, $3B, $58, $79, $F4, $5E, $00
LOADVALUES: .byte $77, $57, $F1, $0F, $E2, $4C, $92, $5E, $D1, $FB, $22, $B5, $00
LOADIRQVALUES: .byte $32, $7F, $A2, $CC, $BF, $F2, $DA, $00

RESET: ; Reset routine
  SEI ; Ensure no interrupts can come in while writing to stack
  LDY #$00 ; intialize Y register
  LDX #$FF
  TXS ; initialize stack
  LDX #$00 ; return to prior value
  JSR ZPINIT1 ; End of reset routine,
  JSR FROMRESET1
  CLI
MAIN:
  JMP WRITESEQPREP
ZPINIT1: ; initialize values into the zeropage
  LDA LOADGRAPHICS,X ; load value
  BEQ ZPPREP2 ; if value is $0, jump to ZPPREP2
  STA GRAPHICS,X ; otherwise, store that value in GRAPHICS...
  INX ; ...increment X...
  JMP ZPINIT1 ; ...and loop.
ZPPREP2:
  LDX #$00 ; reinitialize and fall through
ZPINIT2:
  LDA LOADVALUES,X ; load value,
  BEQ ZPPREP3 ; if $0, jump to ZPINIT3
  STA VALUES,X
  INX
  JMP ZPINIT2 ; loop
ZPPREP3:
  LDX #$00 ;  reinitialize X
ZPINIT3:
  LDA LOADIRQVALUES,X ; load values
  BEQ INITRETURN ; if value loaded is $0, return from subroutine
  STA IRQVALUES,X ; otherwise, store that value
  INX
  JMP ZPINIT3 ; and loop
INITRETURN:
  RTS

WRITESEQPREP:
  LDX #$00 ; initalize indexing registers
  LDY #$00
WRITESEQ: ; writing RAM values
  LDA VALUES,Y ; lookup table of assorted values
  BEQ YRESET ; if A=$0, store $0 in Y
  STA $0400,X ; indexed to allow to loop until $FF
  INX ; increment indexing registers
  INY
  JMP WRTSEQ2 ; skip yreset
YRESET:
  TAY ; because A=0 when this is run, transfer 0 to Y
WRTSEQ2:
  CPX #$FF ; checks if finished
  BEQ MAIN ; if equal, branch back to the reset subroutine
  JMP WRITESEQ ; otherwise, loop

FROMRESET1: ; sets up "graphics"
  SEI ; ensure no interrupts
  LDX #$00 ; initialize indexing register
FROMRESETLOOP1:
  LDA GRAPHICS,X
  STA $2006 ;would-be NES PPUADDR register
  INX
  CPX #$02 ; compare to hex 2, (when it should be done)
  BNE FROMRESETLOOP1 ; loop if not equal, otherwise proceed to second graphics loop
FROMRESET2: ; write "graphics" data
  LDA GRAPHICS,X ; load the value
  BEQ RESETRETURN ; return from subroutine if $0
  STA $2007 ; store at would-be NES PPUDATA register
  INX
  JMP FROMRESET2
RESETRETURN:
  RTS ; return to finish reset routine

.segment "IRQROUTINE"
.ifdef C02
.include "interruptC02.s"
.else
.include "interrupt.s"
.endif

.segment "VECTORS"
VECTORS: .word IRQROUTINE, RESET, IRQROUTINE ; self explanatory, vectors for IRQ, RST, and NMI
