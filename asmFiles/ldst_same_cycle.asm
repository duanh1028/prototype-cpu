org 0x0000
ORI $1, $2, 0x1
ORI $2, $3, 0x5
addr1:
sub $2, $2, $1
SW $2, 0xf0($0)
LW $5, 0xf0($0)
bne $2, $0, addr1
ORI $3, $2, 0x0
ORI $4, $2, 0x0

halt

