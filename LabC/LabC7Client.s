		.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4
	
	addi	$v0, $0, 5
	syscall
	add	$a0, $v0, $0
	jal isPrime
	add	$a0, $v0, $0
	addi	$v0, $0, 1
	syscall
	
	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra
