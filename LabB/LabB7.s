	.globl fini
	.text
main:	#------------------
	addi 	$v0, $0, 5	# v0 = readInt
	syscall
	add	$t0, $0, $v0
	addi	$t1, $0, 7	# t1 = 7
	add	$t2, $t0, $t1	# t2 = t0+t1
	sub	$t3, $t0, $t1	# t3 = t0-t1
	#------------------
	slt 	$t4, $t0, $t1	# x = (t0 < t1) ? 1 : 0
	bne	$t4, $0, XX	
	addi	$v0, $0, 1	# service 1
	add	$a0, $0, $t3	# do print t3
	syscall
	j YY
XX:	addi	$v0, $0, 1	# service 1
	add	$a0, $0, $t2	# do print t2
	syscall
YY:	#------------------
fini:	jr	$ra		# return
