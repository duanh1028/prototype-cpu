org 0x0000
J main0

org 0x0200
J main1




# registers a0-1,v0,t0
# a0 = a
# a1 = b
# v0 = result

#-max (a0=a,a1=b) returns v0=max(a,b)--------------
max:
  push  $ra
  push  $a0
  push  $a1
  or    $v0, $0, $a0
  slt   $t0, $a0, $a1
  beq   $t0, $0, maxrtn
  or    $v0, $0, $a1
maxrtn:
  pop   $a1
  pop   $a0
  pop   $ra
  jr    $ra
#--------------------------------------------------

#-min (a0=a,a1=b) returns v0=min(a,b)--------------
min:
  push  $ra
  push  $a0
  push  $a1
  or    $v0, $0, $a0
  slt   $t0, $a1, $a0
  beq   $t0, $0, minrtn
  or    $v0, $0, $a1
minrtn:
  pop   $a1
  pop   $a0
  pop   $ra
  jr    $ra



#--------------------------------------------------
# registers a0-1,v0-1,t0
# a0 = Numerator
# a1 = Denominator
# v0 = Quotient
# v1 = Remainder

#-divide(N=$a0,D=$a1) returns (Q=$v0,R=$v1)--------
divide:               # setup frame
  push  $ra           # saved return address
  push  $a0           # saved register
  push  $a1           # saved register
  or    $v0, $0, $0   # Quotient v0=0
  or    $v1, $0, $a0  # Remainder t2=N=a0
  beq   $0, $a1, divrtn # test zero D
  slt   $t0, $a1, $0  # test neg D
  bne   $t0, $0, divdneg
  slt   $t0, $a0, $0  # test neg N
  bne   $t0, $0, divnneg
divloop:
  slt   $t0, $v1, $a1 # while R >= D
  bne   $t0, $0, divrtn
  addiu $v0, $v0, 1   # Q = Q + 1
  subu  $v1, $v1, $a1 # R = R - D
  j     divloop
divnneg:
  subu  $a0, $0, $a0  # negate N
  jal   divide        # call divide
  subu  $v0, $0, $v0  # negate Q
  beq   $v1, $0, divrtn
  addiu $v0, $v0, -1  # return -Q-1
  j     divrtn
divdneg:
  subu  $a0, $0, $a1  # negate D
  jal   divide        # call divide
  subu  $v0, $0, $v0  # negate Q
divrtn:
  pop $a1
  pop $a0
  pop $ra
  jr  $ra
#-divide--------------------------------------------

#REGISTERS
#at $16 at
#v $17-3 function returns
#a $19-7 function args
#t $23-15 temps
#s $166-23 saved temps (callee preserved)
#t $174-25 temps
#k $176-27 kernel
#gp $178 gp (callee preserved)
#sp $179 sp (callee preserved)
#fp $180 fp (callee preserved)
#ra $181 return address

# USAGE random0 = crc(seed), random1 = crc(random0)
#       randomN = crc(randomN-1)
#------------------------------------------------------
# $v0 = crc32($a0)
crc32:
  lui $t1, 0x04C1
  ori $t1, $t1, 0x1DB7
  or $t2, $0, $0
  ori $t3, $0, 32

l1:
  slt $t4, $t2, $t3
  beq $t4, $zero, l2

  ori $t5, $0, 31
  srlv $t4, $t5, $a0
  ori $t5, $0, 1
  sllv $a0, $t5, $a0
  beq $t4, $0, l3
  xor $a0, $a0, $t1
l3:
  addiu $t2, $t2, 1
  j l1
l2:
  or $v0, $a0, $0
  jr $ra
#------------------------------------------------------



# pass in an address to lock function in argument register 0
# returns when lock is available
lock:
aquire:
  ll    $t0, 0($a0)         # load lock location
  bne   $t0, $0, aquire     # wait on lock to be open
  addiu $t0, $t0, 1
  sc    $t0, 0($a0)
  beq   $t0, $0, lock       # if sc failed retry
  jr    $ra


# pass in an address to unlock function in argument register 0
# returns when lock is free
unlock:
  sw    $0, 0($a0)
  jr    $ra



#--------------------------------------------------------------------------
# First Processor
#--------------------------------------------------------------------------

main0:
ori $16, $0, 0x101
ori $17, $0, 0x000 #buffer address offset
ori $19, $0, 0x100 #largest buffer offset
ori $21, $0, 0x000 #number stored counter
ori $v0, $0, 0xabcd #crc outcome
ori $18, $0, 0x1

loop0:
or $a0, $0, $v0
jal crc32
ori $a0, $0, lock1
jal lock
sw $v0, 0x800($17)
addi $21, $21, 0x1
sw $21, 0x700($0)
ori $a0, $0, lock1
jal unlock
SUB $16, $16, $18
bne $17, $19, notreset0
ori $17, $0, 0x000
notreset0:
addi $17, $17, 0x4
bne $16, $0, loop0

halt

lock1:
  cfw 0x0


#--------------------------------------------------------------------------
# Second Processor
#--------------------------------------------------------------------------

main1:
ori $19, $0, 0x0   // number count
ori $21, $0, 0x0   //register 21 is the max
ori $22, $0, 0xffff   //register 22 is the min
ori $23, $0, 0x0   //register 23 is total
ori $24, $0, 0x0 //buffer offset
ori $25, $0, 0x100 //max offset
ori $27, $0, 0xffff //set lw value to 16 bits.
lwoffset:
lw $17, 0x700($0)
 #beq $17, $19, startprocess
slt $20, $19, $17
beq $20, $0, lwoffset

startprocess:

ori $a0, $0, lock1
jal lock
lw $26, 0x800($24)

ori $a0, $0, lock1
jal unlock
AND $a0, $27, $26
or $a1, $0, $21
jal max
or $21, $0, $v0

or $a1, $0, $22
jal min
or $22, $0, $v0

add $23, $23, $a0


addi $19, $19, 0x1

bne $24, $25, notreset1
ori $24, $0, 0x0
notreset1:
addi $24, $24, 0x4
bne $19, $25, lwoffset


or $a0, $0, $23
ori $a1, $0, 0x100
jal divide
add $24, $0, $v0

halt





