org 0x0000
ori $1, $0, 0xF0
ori $2, $0, 0x80
ori $7, $7, 0xbeef

beq $0, $0, newbranch
lui $2, 0xaaaa

halt

newbranch:
lui $7, 0xdead
bne $7, $0, secondbranch
lui $1, 0xdad

secondbranch:
lui $3, 0xdead
beq $0, $3, thirdbranch
bne $7, $zero, thirdbranch
halt

thirdbranch:
lui $4, 0xdead

halt
