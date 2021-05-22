	.data
	
str1: .asciiz "Insira uma string"
	.text 

main:	la $a0, str1
	jal strlen
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	





strlen: li $v0, 0 #n=0
wh: 	addu $t1, $a0, $v0 #i = n = 0
	lb $t0, 0($t1)	#str + i = &str[i]
	beqz $t0, exit #while (str[i] != "\0")
	addi $v0, $v0, 1 #n++, i++
	j wh
exit: 	jr $ra
