	.text
main:	add	$s0, $0, $0	# s0 = 0
	addi	$v0, $0, 5	# service 5
	syscall
	add	$t0, $v0, $0	# t0 = input
	add	$t5, $0, $0	# t5 = 0
	#-------------------
loop:	slt	$t9, $t5, $t0	# t9 = (t5 < t0) ? 1: 0
	beq	$t9, $0, done
	add	$s0, $s0, $t5	# s0 = s0 + t0
	addi	$t5, $t5, 1	#t5++
	j 	loop
	#-------------------
done:	addi	$v0, $0, 1 	# service 1
	add	$a0, $0, $s0	# do print
	syscall
	#--------------------
fini:	jr	$ra		# return	 	
