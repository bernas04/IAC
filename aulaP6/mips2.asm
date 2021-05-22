	.text
	.globl main
		
main:   li  $t0, 0x12345678; 
	li $t1, 0x0000000f; 
	and $t2, $t1, $t0;