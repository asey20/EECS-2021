	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	addi	$a0, $0, 3
	addi	$a1, $0, 8
	jal	Fraction
	add	$s0, $0, $v0 # s0 holds a

	add	$a0, $0, $s0
	jal printFraction

	jal println	
	
	addi	$a0, $0, 1
	addi	$a1, $0, 2
	jal Fraction
	add	$s1, $0, $v0 # s1 holds a

	add 	$a0, $0, $s1
	jal printFraction
	
	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra
