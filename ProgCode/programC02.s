RESET: ; Reset routine
  SEI ; Ensure no interrupts can come in while writing to stack
  LDY #$00 ; intialize Y register
  LDX #$FF
  TXS ; initialize stack
  LDX #$00 ; return to prior value
  JSR ZPINIT1 ; End of reset routine,
  JSR FROMRESET1
  JSR PRINTSTRING
  CLI
MAIN:
  LDX #$00
  LDY #$00
  JMP WRITESEQ
ZPINIT1: ; initialize values into the zeropage
  LDA LOADGRAPHICS,X ; load value
  BEQ ZPPREP2 ; if value is $0, jump to ZPPREP2
  STA GRAPHICS,X ; otherwise, store that value in GRAPHICS...
  INX ; ...increment X...
  BRA ZPINIT1 ; ...and loop.
ZPPREP2:
  LDX #$00 ; reinitialize and fall through
ZPINIT2:
  LDA LOADVALUES,X ; load value,
  BEQ ZPPREP3 ; if $0, jump to ZPINIT3
  STA VALUES,X
  INX
  BRA ZPINIT2 ; loop
ZPPREP3:
  LDX #$00 ;  reinitialize X
ZPINIT3:
  LDA LOADIRQVALUES,X ; load values
  BEQ ZPPREP4 ; if value loaded is $0, jump to ZPPREP4
  STA IRQVALUES,X ; otherwise, store that value
  INX
  BRA ZPINIT3 ; and loop
ZPPREP4:
  LDX #00 ; reinitialize X
ZPINIT4:
  LDA LOADSTRINGDATA,X ; load string data
  BEQ INITRETURN ; if value loaded is $0, return from subroutine
  STA STRINGDATA,X
  INX
  BRA ZPINIT4
INITRETURN:
  RTS

WRITESEQ: ; writing RAM values
  LDA VALUES,Y ; lookup table of assorted values
  BEQ YRESET ; if A=$0, store $0 in Y
  STA $0400,X ; indexed to allow to loop until $FF
  INX ; increment indexing registers
  INY
  BRA WRTSEQ2 ; skip yreset
YRESET:
  TAY ; because A=0 when this is run, transfer 0 to Y
WRTSEQ2:
  CPX #$FF ; checks if finished
  BEQ RESET ; if equal, branch back to the reset subroutine
  BRA WRITESEQ ; otherwise, loop

FROMRESET1: ; sets up "graphics"
  SEI ; ensure no interrupts
  LDX #$00 ; initialize indexing register
FROMRESETLOOP1:
  LDA GRAPHICS,X
  STA $210,X ; example address
  INX ; increment X
  CPX #$02 ; compare to hex 2, (when it should be done)
  BNE FROMRESETLOOP1 ; loop if not equal, otherwise proceed to second graphics loop
FROMRESET2: ; write "graphics" data
  LDA GRAPHICS,X ; load the value
  BEQ RESETRETURN ; return from subroutine if $0
  STA $220,X ; another example address
  INX ; increment X
  BRA FROMRESET2 ; branch always, loop
RESETRETURN:
  RTS ; return to finish reset routine

PRINTSTRING:
  LDX #$00 ; initialize indexing register
PRINTSTRINGLOOP:
  LDA STRINGDATA,X ; load string values
  BEQ RESETRETURN ; checks if 0, return from subroutine if so
  STA $5000,X ; example serial interface
  INX ; increment
  BRA PRINTSTRINGLOOP ; branch always and loop

