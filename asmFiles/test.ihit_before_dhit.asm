org 0x0000

ori $1, $0, 0x80
ori $6, $0, 0x2
sw $6, 0($1)

loop:
  ori $5, $0, 0x1
  sub $6, $6, $5
bne $6, $0, loop

lw $7, 0($1)

halt
