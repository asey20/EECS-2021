	.text
main:	#-----------------
	addi	$v0, $0, 5	# service 5
	syscall
	add	$t0, $0, $v0	# t0 = input
	#----------------------
	ori	$t5, $0, 0xffff		# t5 = 0xffff
	sll	$t5, $t5, 16		# shift left 16 times
	ori	$t5, $t5, 0xfbff	# t5 = t5 | 0xfbff
	#---------------------
	and	$t1, $t0, $t5	# t1 = and mask and input
	#--------------------
	addi	$v0, $0, 1	# service 1
	add	$a0, $0, $t1	# do print
	syscall
	#--------------------
fini:	jr	$ra
