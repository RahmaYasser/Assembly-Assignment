.data
a: .word 3
b: .word 3
c: .space 20  # size of c must be at least 2*a-1 -> 2*3-1 = 5



.text
.globl main
main:
    li $t0,0 #i=t0
    li $t6,0 #i as value not index

    lw $t3,a #a=t3
    sll $t3,$t3,2  #we multiply a*4 to handle the bytes
    
    lw $t4,b #b=t4
    sll $t4, $t4,2  #we multiply b*4 
    
fori: 
    slt $t2,$t0,$t3
    beq $t2,$0 end #if !(i<a) end 
    
    li $t1,0 #j=t1
    li $t7,0 #j as value not index
forj:
    slt $t2,$t1,$t4
    beq $t2,$0 endforj #if !(j<b) end the inner loop
    
    sub $t5,$t6,$t7 #i-j
    #li $t5,9
    sll $t2,$t0,1   #2*i, the address 
    sw $t5, c($t2)  #c[2*i] = i-j
    
    addi $t1,$t1,4 #j++
    addi $t7,$t7,1 #j++ as a value
    j forj
endforj:
    addi $t0,$t0,4 #i++
    addi $t6,$t6,1 #i++ as a value
    j fori
end:
    li $v0 ,10
    syscall  
    
    
