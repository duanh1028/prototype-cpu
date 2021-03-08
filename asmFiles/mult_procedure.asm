org 0x0000

main:
ori $29, $0, 0xfffc #stack pointer
ori $28, $0, 0xfff8
ori $1, $0, 0x5 #operand 1
ori $2, $0, 0x6 #operand 2
ori $3, $0, 0x7 #operand 3

ori $5, $0, 0x1 #use to count

push $1
push $2
push $3

get_operand:
beq $29, $28, finish
pop $6
pop $7
ori $4, $0, 0x0 #store result

add_loop:
beq $6, $0, return
addu $4, $4, $7
subu $6, $6, $5 #count--
j add_loop

return:
 push $4
j get_operand

finish:
halt
