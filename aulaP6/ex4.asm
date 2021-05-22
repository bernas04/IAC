	.eqv done,10
	.eqv print_int10,1
	.eqv print_str,4
	.eqv read_int,5
	.eqv print_int16,34
	.eqv print_intu10, 36
	.eqv print_char, 11
	.text
	.global main
	
main: li 	$t1, 0xe5230678

	move	$a0, $t1
	li	$v0, print_int16
	syscall
	li	$a0, " :"
	li	$v0, print_char
	syscall
	li	$a0, ' '
	li	$v0, print_char
	syscall
	
	li 	$t2, 0x00f00000
	and 	$a0, $t1, $t2
	srl	$a0, $a0, 28
	
	li	$v0, print_int16
	syscall
	
	li	$a0, ' '
	li	$v0, print_char
	syscall
	
	li 	$a0, ' '
	li	$v0, print_char
	
	li 	$t2, 0x00f00000
	and 	$a0, $t1, $t2
	srl	$a0, $a0, 20
	
	li	$v0, print_int16
	syscall
	
	li	$a0, ' '
	li	$v0, print_char
	syscall
	
	li 	$t2, 0x000f0000
	and 	$a0, $t1, $t2
	srl	$a0, $a0, 16
	
	li	$v0, print_int16
	syscall
	
	li	$v0, done
	syscall
	
	
	