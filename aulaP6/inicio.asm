	.eqv print_str, 4

.data
	str1: .asciiz "És uma cona!"
.text
	li $v0, print_str
	la $a0, str1
	syscall
	