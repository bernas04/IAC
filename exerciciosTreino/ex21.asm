	.eqv print_string, 4
	.eqv done, 10
	.eqv print_int16, 34
	.eqv print_char,11
	.eqv read_int,5
	.data
prompt: .asciiz "Introduza um número \n"
strpar: .asciiz "O número é par \n"
strimpar: .asciiz "O número é ímpar \n"
	.text
	.globl main
main:
	la $a0, prompt
	li $v0, print_string
	syscall
	li $v0,read_int
	syscall
	
	andi $t0,$v0,1
	beq  $t0,$0,par
	la $a0,strimpar
	j print
	
par:	la $a0,strpar
print:	li $v0,print_string
	syscall
	
	li $v0,done
	syscall