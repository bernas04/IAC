	.eqv print_string, 4
	.eqv done, 10
	.eqv print_int16, 34
	.eqv print_char,11
	.eqv read_int,5
	.data
prompt: .asciiz "Insira um número \n"
	.text
	.globl main
main:
 # O a vai ficar no registo t1 enquanto o i vai ficar no registo 0
	la $a0,prompt
	li $v0,print_string
	syscall
	
	li $v0,read_int
	syscall
	
	move $t1,$v0
	li $t0,0
	
for: beq $t1,$t0,acaba
	la $a0,'-'
	li $v0, print_char
	syscall
	addi $t0,$t0,1
	j for
	
	
acaba: 
	li $v0,done
	syscall