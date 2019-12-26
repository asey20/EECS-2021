	.globl	Fraction
	.globl	getNumerator
	.globl	getDenominator
	.globl	printFraction
	.globl	println
	.globl	adding
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

adding:
	#------------------------------------------------------
	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	
	
	add	$a0, $0, $s0
	jal	getNumerator
	add	$t1, $0, $v0	# t1 = 3

	add	$a0, $0, $s0
	jal	getDenominator
	add	$t2, $0, $v0	# t2 = 8
	
	add	$a0, $0, $s1
	jal	getNumerator
	add	$t3, $0, $v0 	# t3 = 1
	
	add	$a0, $0, $s1
	jal	getDenominator
	add	$t4, $0, $v0	# t4 = 2

	mult 	$t1, $t4	# t1 * t4 (3 * 2)
	mflo	$t1		# t1 = 3 * 2 = 6

	mult	$t2, $t3	# t2 * t3 (8 * 1)
	mflo	$t3		# t3 = 8 * 1 = 8
	
	add	$t1, $t1, $t3	# t1 = 6 + 8 = 14
	add	$a0,	$0,	$t1
	add	$v0,	$0,	1
	syscall

	mult	$t2, $t4	# t2 * t4 (8 * 2)
	mflo	$t2		# t2 = 8 * 2 = 16
	add	$a0,	$0,	$t2
	add	$v0,	$0,	1
	syscall
	
	
	addi	$sp, $sp, 4
	lw	$ra, 0($sp)


	jr	$ra


