	.text
main:	#---------------
	addi	$v0, $0, 5	# service 5
	syscall
	add	$t0, $0, $v0	# t0 = input
	#---------------
	xori	$t1, $t0, 1024	# XOR with mask 
	#--------------
	addi	$v0, $0, 1	# service 1
	add	$a0, $0, $t1	# do print
	syscall
	#--------------
fini:	jr	$ra
