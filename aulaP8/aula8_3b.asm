	.data
string:	.asciiz "a12345v8910jjjdhhh6e7"
fim:	.byte '\0'
stringf:	.asciiz "Número de caracteres numéricos da string: "
	.text
	.globl main

main:	
	la $a1, string
	lb $a2, fim
	addi $t0,$a1, 0
	lb $t1, 0($t0)
	addi $t2,$0,0
	
while:	beq $t1,$a2,done

	blt $t1,'0', continue
	bgt $t1,'9',continue
	addi $t2,$t2,1
continue:
	addi $t0,$t0, 1
	lb $t1, 0($t0)
	j while

done:	
	la $a0,stringf
	li $v0,4
	syscall

	move $a0, $t2
	li $v0,1
	syscall
	
	li $v0,10
	syscall
