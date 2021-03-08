org 0x0000

ori $29, $0, 0xfffc #stack pointer
ori $1, $0, 0x5
ori $2, $0, 0x6

ori $3, $0, 0x0 #store result
ori $4, $0, 0x1 #use to count

add_loop:
beq $2, $0, return
addu $3, $3, $1
subu $2, $2, $4 #count--
j add_loop

return:
push $3
halt
