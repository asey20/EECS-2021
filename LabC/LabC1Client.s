	.text
main:	lw	$a0, MAX($0)
	addi	$v0, $0, 1
	syscall

	addi	$v0, $0, 11
	addi	$a0, $0, 0xA
	syscall
	
	lbu	$a0, SIZE($0)
	addi	$v0, $0, 1
	syscall

	jr	$ra
