	.globl	Fraction
	.globl	getNumerator
	.globl	getDenominator
	.globl	printFraction
	.globl	println
	#---------------------------------------------------
	.text
	#---------------------------------------------------
Fraction:
	#---------------------------------------------------
	add	$t0, $0, $a0	# t0 = numerator
	add	$t1, $0, $a1	# t1 = denominator
	
	addi	$v0, $0, 9
	addi	$a0, $0, 8
	syscall

	sw	$t0, 0($v0)
	sw	$t1, 4($v0)	

	# store the attributes somewhere in memory
	# and return a reference to where they are

	jr	$ra

getNumerator:
	#--------------------------------------------------
	lw	$v0, 0($a0)

	jr	$ra

getDenominator:
	#--------------------------------------------------
	lw	$v0, 4($a0)

	jr	$ra

printFraction:
	#--------------------------------------------------
	sw	$ra, 0($sp)
	addi	$sp, $sp, -4
	
	add	$t0, $0, $a0
	
	add	$a0, $0, $t0
	jal	getNumerator
	add	$a0, $0, $v0
	addi	$v0, $0, 1
	syscall

	addi	$v0, $0, 11
	addi	$a0, $0, 47
	syscall

	add	$a0, $0, $t0
	jal	getDenominator
	add	$a0, $0, $v0
	addi	$v0, $0, 1
	syscall

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)

	jr	$ra

println:
	#------------------------------------------------------
	addi	$v0, $0, 11
	addi	$a0, $0, 0xA
	syscall
	
	jr	$ra
