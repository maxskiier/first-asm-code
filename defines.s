.setcpu "65C02"
.zeropage
.include "zeropage.s"

.segment "ROM"
LOADGRAPHICS: .byte $40, $3B, $58, $79, $F4, $5E, $00
LOADVALUES: .byte $77, $57, $F1, $0F, $E2, $4C, $92, $5E, $D1, $FB, $22, $B5, $00
LOADIRQVALUES: .byte $32, $7F, $A2, $CC, $BF, $F2, $DA, $00
LOADSTRINGDATA: .asciiz "Hello, world!"

.ifdef C02
.include "./progcode/programC02.s"
.else
.include ".progcode/program.s"
.endif

.segment "IRQROUTINE"
.ifdef C02
.include "./interruptcode/interruptC02.s"
.else
.include "./interruptcode/interrupt.s"
.endif

.segment "VECTORS"
VECTORS: .word IRQROUTINE, RESET, IRQROUTINE ; self explanatory, vectors for IRQ, RST, and NMI
