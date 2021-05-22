
.data
	Str1: .asciiz "Primeiro número: "
	Str2: .asciiz "Segundo número: "
	Str3: .asciiz "Resultado: "

.text
	li $v0, 4
	la $a0, Str1
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 4
	la $a0, Str2
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	
	li $v0, 4
	la $a0, Str3
	syscall
	
	add $a0, $t0, $t1
	
	
	
	li $v0, 1
	syscall