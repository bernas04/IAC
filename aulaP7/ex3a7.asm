	.eqv print_string, 4
	.eqv done, 10
	.eqv print_int16, 34
	.eqv print_char,11
	.eqv read_int,5
	.eqv print_int10,1
	.eqv print_str,...
	.data
inicial: .asciiz "Introduza um número: "
fatorial: .asciiz "O fatorial do número inserido é: "
	.text
	.globl main

main: 	la 	$a0, inicial
	li	$v0, print_str
	syscall
	
	li	$v0, read_int
	syscall
	move	$t0, $v0
	
	li	$t1, 1
for: 	beqz	$t0, efor
	mul	$t1,$t1,$t0
	
	addi	$t0, $t0, -1
	j for
	
efor:	la 	$a0, fatorial
	li 	$v0, print_str
	syscall
	
	move	$a0, $t1
	li	$v0, print_int10
	syscall
	
	li	$v0, done
	syscall
	