	.text
main:	#-------------------
	addi	$t0, $0, 60
	addi	$t1, $0, 7
	#-------------------
	#division
	div	$t0, $t1
	mflo	$a0
	addi	$v0, $0, 1
	syscall
	addi	$v0, $0, 11
	add	$a0, $0, ' '
	syscall
	addi	$v0, $0, 1
	mfhi	$a0
	syscall
	#------------------
	addi	$v0, $0, 11
	add	$a0, $0, 10
	syscall
	#multi
	addi	$v0, $0, 1
	mult	$t0, $t1
	mfhi	$a0
	syscall
	mflo	$a0
	syscall
	#-----------------
fini:	jr	$ra
