.data
   # myMsg: .asciiz "Hello Rahoma\n" 
   # myCharMsg: .byte 'm'
  # age: .word 23
   
.text
.globl main
main:
    addi $s0,$0,30 # s0 = g  , initialize g = 30 
    addi $s1,$0,30 # s1 = h  , initialize h = 20
    slt $t0,$s1,$s0
    beq $t0,0,elseif
    add $s0,$s0,$s1
    j end 

elseif:
    slt $t0,$s0,$s1
    beq $t0,0,else
    sub $s0,$s0,$s1
    j end 

else:
    mul $s0,$s0,$s1
end:
    li $v0 ,10
    syscall  
    #li $v0,4 #print smth to screen
    #la $a0,myMsg  #load the msg to register 
    #la $a0,myCharMsg  #load the msg to register 
    
    
   # li $v0 ,1
   # lw $a0, age
   # syscall
    
    
