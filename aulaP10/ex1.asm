	.data 

blabla: .asciiz "Número a calcular o fatorial: "
str2: .asciiz "O fatorial do número " 
str3: .asciiz " é: " 
	.text 

main:
	la $a0, blabla #print String1
	li $v0, 4 
	syscall 
	
	li $v0, 5 #lê o inteiro
	syscall
	move $a0, $v0
	move $s0, $v0
	
	jal factorial
	
	
	move $t0, $v0 
	
	la $a0, str2 #print String
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	la $a0, str3
	li $v0,4
	syscall
	
	move $a0, $t0
	li $v0, 1 #print result
	syscall
	
	li $v0, 10
	syscall  #exit

factorial: 
	
	li $t0, 1 # res = 1
	move $t1, $a0
for:	ble $t1, 0, exit # t1 = t2 ---> exit
	mul $t0, $t0, $t1 # res = res * i
	addi $t1,$t1, -1
	j for
exit: 
	move $v0, $t0
	jr 	$ra
