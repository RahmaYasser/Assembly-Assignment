.data
arr: .ascii "AAABBaaaab" 
upperMSG: .asciiz "\nnumber of uppercase letters\n" 
lowerMSG: .asciiz "\nnumber of lower letters\n" 
.text
.globl main
main:
    
    la $s0,arr #s0 is the address of the array
    li $t1,0   #t1 is the number of upper letters
    li $t2,0   #t2 is the number of lower letters
    li $t0,0   #t0 is the counter
    
for: 
    slti $t3,$t0,10
    beq $t3,$0,endfor #if !(i < 10) break 
    addi $s0,$s0,1
    lb $t4,0($s0) #t4 is the character
    slti $t5,$t4,97
    beq $t5,$0,lower
    addi $t1,$t1,1 #t1++, increase uppercase
    addi $t0,$t0,1  #i++
    j for
lower: 
    addi $t2,$t2,1
    addi $t0,$t0,1  #i++
    j for 
    #lb $a0,0($s0)
    #li $v0,11
    #syscall 
endfor:
    #print upper msg
    la $a0,upperMSG  
    li $v0,4
    syscall 
    
    #print upper num
    addi $a0,$t1,0
    li $v0,1
    syscall 
    
    #print lower msg
    la $a0,lowerMSG
    li $v0,4
    syscall

    #print lower num
    addi $a0,$t2,0
    li $v0,1
    syscall 
   
end:
    li $v0 ,10
    syscall  
    
    
