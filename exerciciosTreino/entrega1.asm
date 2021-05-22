
	.data
str:   .asciiz "Número de termos: "
str1:	.asciiz "Serie  "		
message:.asciiz "0" 
virgula:.asciiz ","
	.text
	.globl main
	
	j main

fibo:	beq $a2, $0, equalToZero
	addi $sp,$sp, -12   	# 3 espaços
	sw $ra, 8($sp)      	
	sw $s0, 4($sp)	   	
	sw $s1, 0($sp)		
	move $s0, $a0  	   	#s0 = n
	li $v0, 1	
	ble $s0, 2, exitseq
	addi $a0, $s0, -1  	
	jal fibo 	        
	move $s1,$v0	   	#aux
	addi $a0, $s0, -2 	
	jal fibo 		
	
	add $v0,$s1,$v0   	
			
exitseq:
	lw $ra, 8($sp)
	lw $s0, 4($sp) 	
	lw $s1, 0($sp)
	addi $sp, $sp, 12
	jr $ra
	
main:	
	# Print str
	li $v0, 4
	la $a0, str
	syscall

	# Read int
	li $v0, 5
	syscall                  
	
	move $a2, $v0		
	
	
	# Print str1
	li $v0, 4
	la $a0, str1
	syscall
	
	la $a0, 0($0)		
	
	
	j equalToZero		
for:	
	beq $a2, $0, done	
	 
	
	jal fibo
	move $a1, $v0          
	#
	li $v0, 1
	move $a0, $a1
	syscall
	addi $a2,$a2,-1
	#
	li $v0, 4
	la $a0, virgula
	syscall
	#
	li $a0,1
	addi $t0,$t0,1
	add $a0,$a0,$t0
	j for

equalToZero:
	li $v0, 1
	
	syscall		
	
	li $v0, 4
	la $a0, virgula
	syscall		#imprime virgula
	
	move $a0, $0
	addi $a0,$a0,1
	j for

done:	#sai
	li $v0, 10
	syscall
	

		
	
	