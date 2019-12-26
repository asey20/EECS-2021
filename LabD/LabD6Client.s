	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	addi	$a0, $0, 16
	jal	SB		# call the constructor
	add	$s0, $0, $v0

	add	$a0, $0, $s0
	addi	$a1, $0, 'A'
	jal	append		# append 'A'
	
	add	$a0, $0, $s0
	addi	$a1, $0, 'B'	# append 'B'
	jal 	append

	add	$a0, $0, $s0
	addi	$v0, $0, 4
	syscall			# print the string at a0

	add	$a0, $0, 0xA
	addi	$v0, $0, 11
	syscall			# print space

	add	$a0, $0, $s0
	add	$a1, $0, $0
	addi	$a2, $0, 'D'
	jal	setCharAt

	add	$a0, $0, $s0
	add	$v0, $0, 4
	syscall

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra
