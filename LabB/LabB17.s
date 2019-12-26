	.text
main:	#-----------------
	addi	$v0, $0, 5	# service 5
	syscall
	add	$t0, $0, $v0	# t0 = input
	#----------------------
	lui	$t7, 0xffff	# sets upper half of register to 0xffff
	ori	$t7, $t7, 0xfbff # sets lower half of register to 0xfbff
	#---------------------
	and	$t1, $t0, $t7	# t1 = and mask and input
	#--------------------
	addi	$v0, $0, 1	# service 1
	add	$a0, $0, $t1	# do print
	syscall
	#--------------------
fini:	jr	$ra
