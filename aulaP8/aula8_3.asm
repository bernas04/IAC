	.data
	
nove: 	.byte '9'
zero:	.byte '0'
string: .asciiz "E8 gost5 as3"
fim: 	.byte '\0'
fstring:	.asciiz "O número de  carateres numéricos é: "



	.text
	.globl main
	
main:
	la $a1, string
	lb $a2, fim
	addi $t0,$a1, 0
	
	lb $t1,0($a1)
	
	lb $s0, zero
	lb $s1,nove
	addi $t4,$0, 0
	
while:	beq  $t1, $a2, done
	
	
	sle $t2,$t1,$s1
	sge $t3, $t1,$s0
	
	addi $t0, $t0,1
	lb $t1,0($t0)
	
	beq $t2,1,verificar
	
	j while


verificar:
	beq $t3,1,contar		
	j while		
	
contar:	addi $t4, $t4,1

	j while	

done:
	
	la $a0,fstring
	li $v0, 4
	syscall 
	
	move $a0,$t4
	li $v0, 1
	syscall 
	
	li $v0, 10
	syscall
