	.text
main:	#-------------------
	addi	$t0, $0, -60
	sra	$a0, $t0, 2	#arith. right shift by _
	addi	$v0, $0, 1	# service 1
	add	$a0, $0, $a0	# prints a0
	syscall
	addi	$v0, $0, 11	# service 11
	add	$a0, $0, ' '	# prints ' '
	syscall
	sll	$a0, $t0, 1	#left shit by _
	addi	$v0, $0, 1	# service 1
	add	$a0, $0, $a0	# prints a0 
	#--------------------
fini:	jr	$ra
