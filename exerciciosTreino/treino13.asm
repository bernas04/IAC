.data
str: .asciiz "Te3m In5tei1ros Mis8tura9dos "
msg: .asciiz "\nO nr de Alfas e:"
.text
.globl main
main: la $a0, msg
	li $v0, 4
	syscall
	
	la $a1, str
	jal nalphas
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
nalphas: 
	li $t0, 0
	li $t1, 0
for: lb $t2, 0($a1)
	beqz $t2, retorno
	blt $t2, 'A', incremento
	bgt $t2, 'z', incremento
	addi $t0, $t0,1
incremento: addi $a1, $a1,1
	j for
retorno: move $v0, $t0
	jr $ra