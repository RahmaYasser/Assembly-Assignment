.data
t1: .word -1

.text
.globl main
main:
    lw $t1,t1  
    
    addi $a0,$a0,10 #n=10  
    jal sumODD  #call sumODD
    addi $t1,$v0,0
    sw $t1,t1
    
    
    #printf("%d",t1)
    li $a0,0
    add $a0,$a0,$t1
    li $v0,1
    syscall 

end:
    li $v0 ,10
    syscall  
sumODD:
    li $t3,0 #i=0
    li $t4,0 #result =0
for:
   #for condition
   slt $t2,$t3,$a0 
   beq $t2,0,endfor
   
   
   #for body
   rem $t2,$t3,2
   beq $t2,0,skip
   add $t4,$t4,$t3  
   
skip:   
   #i++
   addi $t3,$t3,1
   j for
endfor:
    add $v0, $t4, $0 # put return value in $v0
    jr $ra 