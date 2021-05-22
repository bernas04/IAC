	.eqv done,10
	.eqv print_int10,1
	.eqv print_str,4
	.eqv read_int,5
	.eqv print_int16,34
	.eqv print_intu10, 36
	
	.data
str1: .asciiz "Introduza dois números: "
str2: .asciiz "A soma de dois números é: "
	
	
	.text
	.global main: 
	
main:   la 	$a0, str1
	li 	$v0, print_str
	syscall 
	
	li	$v0, read_int
	syscall
	move	$t0, $v0
	
	li	$v0, read_int
	syscall 
	move 	$t1, $v0
	
	la 	$a0, str2
	li 	$v0, print_str
	syscall
	
	add 	$a0, $t0, $t1
	
	li	$v0, print_intu10
	  syscall 
	  
	 li	$v0, done
	 syscall	