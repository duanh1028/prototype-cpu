org 0x0000

main: 
    ori $29, $0, 0xfffc //stack pointer
    ori $28, $0, 0xfff8
    ori $1, $0, 0x9    //month
    ori $2, $0, 0x2    //day
    ori $3, $0, 2020    //year

calculate_month:
    addi $1, $1, -1 //month - 1
    ori $4, $0, 30
    push $1
    push $4
    jal get_operand
    pop $5 //store 30 * (month - 1)
    ori $4, $0, 365
    addi $3, $3, -2000
    push $4
    push $3
    jal get_operand
    pop $6 //store 365 * (year - 2000)
    add $2, $2, $5
    add $2, $2, $6 //final result in $1
    halt

get_operand:
    pop $6
    pop $7 
    ori $8, $0, 0x0 //store result

add_loop:
    beq $6, $0, return
    addu $8, $8, $7
    addi $6, $6, -1 //count--
    j add_loop

return:
    push $8
    jr $ra
