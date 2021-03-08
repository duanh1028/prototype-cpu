org 0x0000
ori $1, $zero, 0xf0
ori $2, $zero, 0x80
ori $7, $7, 0xbeef

jal jump
lui $2, 0x0a0
j jump2
lui $1, 0xdad #will be ignored
halt

jump:
lui $7, 0xdead
jr $ra
halt

jump2:
lui $1, 0xbaba
halt
