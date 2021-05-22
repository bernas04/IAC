	.eqv print_string, 4
	.eqv done, 10
	.eqv print_int16, 34
	.eqv print_char,11
	.eqv read_int,5
	.eqv print_int,1
	.eqv print_intu10,36
	.eqv read_string,8
	.data
lista: .word -2,3,6,4,8,126,-131,17
str: .asciiz " : "
	.text
	.globl main
	
main:
	la $a1,lista
	li $t0,0 #valor de i 
	li $t7,2
	
for:	beq $t0,8,fim
	sll $t2,$t0,2
	add $t1,$a1,$t2 #lista[i]
	lw $t3,0($t1)
	rem $t5, $t3,$t7
	bne $t5,0,incrementar
	la $a0,($t3)
	li $v0,print_int
	syscall
	la $a0,str
	li $v0,print_string
	syscall
incrementar:
	addi $t0,$t0,1
	j for
	
	
fim:
	li $v0,done
	syscall