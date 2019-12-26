	.text
main:	#-------------
	addi	$v0, $0, 5	# service 5
	syscall
	add	$t0, $0, $v0	# t0 = input
	#------------
	andi	$t1, $t0, 0x400	# AND t0 with 2014 and save in t1
	beq	$t1, $0, PRINT	# if t1 is 0, jump to PRINT
	addi	$t1, $0, 1	# change t1 to 1
	#-----------
PRINT:	addi	$v0, $0, 1	# service 1
	add	$a0, $0, $t1	# do print
	syscall
	#----------
fini:	jr	$ra
