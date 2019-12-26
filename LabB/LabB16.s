	.text
main:	#-----------------
	addi	$v0, $0, 5	# service 5
	syscall
	add	$t0, $0, $v0	# t0 = input
	#----------------------
	addi	$t6, $0, 1024	# t6 = 1024
	nor	$t6, $0, $t6	# nor t6
	#---------------------
	and	$t1, $t0, $t6	# t1 = and mask and input
	#--------------------
	addi	$v0, $0, 1	# service 1
	add	$a0, $0, $t1	# do print
	syscall
	#--------------------
fini:	jr	$ra
