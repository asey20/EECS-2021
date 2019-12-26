	.text
main:	#-------------
	addi	$v0, $0, 5	# service 5
	syscall
	add	$t0, $0, $v0	# t0 = input
	#------------
	sll	$t1, $t0, 21	# shift left 21
	srl	$t1, $t1, 31	# shift right 31
	#-----------
	addi	$v0, $0, 1	# service 1
	add	$a0, $0, $t1	# do print
	syscall
	#----------
fini:	jr	$ra
