	.text
	.data
	.globl main
	
main: 	li $t0, 0xFF00F0F0
	
	sll $t1, $t0, 4	# t1= desloca-se t0 para a esquerda em 4 casas, preenchendo o resto com 0s ( = t0*2^4)
	srl $t2, $t0,3	#t2 =  desloca-se t0 3 casas para a esquerda ( = t0*2^-3-)
	sra $t3, $t0, 2 #t3 = igual a SRL mas mantém o sinal!
	
	li $t0, -128
	sra $t0,$t0,5 # t0= t0*2^(-5) = 32
	
	div $t0,$t1
	
	mflo $t2 # t2= carrega o resto
	mfhi $t3 # t3 = carrega a divisao inteira
	