	.data
str1: .space 50
str2: .asciiz "Universidade de "
str3: .asciiz "Aveiro"
	
	.text
	.globl main
main: 	la $a0, str2
	la $a1, str3
	
	jal strcpy #a função aceita dois argumentos de entrada
	
	move $a0, $v0
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	
	
strcat: addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	move $a2, $a0
	
stc_loop: lb $t0, 0($a0)
	beqz $t0, stc_cp
	addiu $a0, $a0, 1
	j stc_loop
stc_cp: jal strcpy
 	move $v0, $a2
 	
 	lw $ra, 0($sp)
 	addiu $sp, $sp, 4
 	jr $ra







strcpy: 	li $t0, 0 #i=0
scp_while: 	addu $t1, $a0, $t0 #dst_i = &dst[i] = dst + i
		addu $t2, $a1, $t0 #src_i = &src[i] = src + i
		
		lb $v0, 0($t2) #v0 = src[i]
		sb $v0, 0($t1)#dst[i] = $v0 = src[i]
		beqz $v0, scp_ex #if (src[i]==0) ---> exit
		addiu $t0, $t0, 1 #i++
		j scp_while
scp_ex: 	move $v0, $a0 #return dst
		jr $ra	#return to caller