	.eqv print_string, 4
	.eqv done, 10
	.eqv print_int16, 34
	.eqv print_char,11
	.eqv read_int,5
	.data
prompt: .asciiz "Introduza um n�mero \n"
strpar: .asciiz "O n�mero � par \n"
strimpar: .asciiz "O n�mero � �mpar \n"
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