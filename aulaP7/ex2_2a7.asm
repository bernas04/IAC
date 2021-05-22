	.data 
str: .asciiz "Introduza um número\n"
str2: .asciiz "O fatorial do número inserido é: "
	.text 
	.globl main
main:
	la $a0, str
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t0, $v0 #n = iinput
	li $t1, 1 #f=1
for: 	beqz $t0, done
	mul $t1, $t1, $t0
	addi $t0, $t0, -1
	j for
done: la $a0, str2
	li $v0, 4
	syscall
	move $a0, $t1
	li $v0, 1
	syscall
	li $v0, 10
	syscall