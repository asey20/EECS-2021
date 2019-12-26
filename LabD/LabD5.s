	.globl	Fraction
	.globl	getNumerator
	.globl	getDenominator
	.globl	printFraction
	.globl	println
	.globl	adding
	.globl	setNumerator
	.globl 	setDenominator
	.globl	multiply
	.globl	subtract
	.globl	divide
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

	add	$t0, $0, $a0
	add	$t1, $0, $a1
	
	add	$a0, $0, $t0
	jal	getNumerator
	add	$t2, $0, $v0	# t2 = this.num

	add	$a0, $0, $t0
	jal	getDenominator
	add	$t3, $0, $v0	# t3 = this.den
	
	add	$a0, $0, $t1
	jal	getNumerator
	add	$t4, $0, $v0 	# t4 = other.num
	
	add	$a0, $0, $t1
	jal	getDenominator
	add	$t5, $0, $v0	# t5 = other.den

	mult 	$t2, $t5	# this.num * other.den
	mflo	$t2		# t2 = this.num * other.den

	mult	$t3, $t4	# this.den * other.num
	mflo	$t4		# t4 = this.den * other.num
	
	add	$t2, $t2, $t4	# t2 = this.num * other.den + this.den * other.num

	add	$a0, $0, $t2	# sets numerator to t2
	jal	setNumerator

	mult	$t3, $t5	# this.den * other.den
	mflo	$t3		# t3 = this.den * other.den
	
	add	$a0, $0, $t3	#sets denominator to t3
	jal	setDenominator
	
	addi	$sp, $sp, 4
	lw	$ra, 0($sp)

	jr	$ra

setNumerator:
	#-----------------------------------------------------
	sw	$a0, 0($s2)	#loads numerator into 0($s2) (new fraction)
	
	jr	$ra

setDenominator:
	#-----------------------------------------------------
	sw	$a0, 4($s2)	#loads denominator into 4($s2) (new fraction)
	
	jr	$ra

multiply:
	#------------------------------------------------------
	sw	$ra, 0($sp)
	addi	$sp, $sp, -4
	
	add	$t8, $0, $a0
	add	$t9, $0, $a1

	add	$a0, $0, $t8
	jal	getNumerator
	add	$t1, $0, $v0	# t1 = 3 (this.num)

	add	$a0, $0, $t9
	jal	getNumerator
	add	$t2, $0, $v0	# t2 = 1 (other.num)	
	
	mult	$t1, $t2	# t1 * t2
	mflo	$t1		# t1 = this.num * other.num

	add	$a0, $0, $t1	# sets numerator to t1
	jal 	setNumerator
	
	add	$a0, $0, $t8
	jal	getDenominator
	add	$t2, $0, $v0	# t2 = 8 (this.den)
	
	add	$a0, $0, $t9
	jal	getDenominator
	add	$t3, $0, $v0	# t3 = 2 (other.den)

	mult	$t2, $t3	# t2 * t3
	mflo	$t2		# t2 =	this.den * other.den 
	
	add	$a0, $0, $t2	# sets denominator to t2
	jal	setDenominator

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)

	jr	$ra

subtract:
	#-----------------------------------------------------------
	sw	$ra, 0($sp)
	addi	$sp, $sp, -4
	
	add	$t0, $0, $a0
	add	$t1, $0, $a1

	add	$a0, $0, $t1
	jal	getNumerator
	add	$t2, $0, $v0	# t2 = other.num
	addi	$t3, $0, -1	# t3 = -1
	 
	mult	$t2, $t3	# other.num * -1
	mflo	$t2 		# t2 = -other.num

	add	$a0, $0, $t1
	jal	getDenominator
	add	$t3, $0, $v0	# t3 = other.den

	add	$a0, $0, $t2
	add	$a1, $0, $t3
	jal Fraction
	add	$s3, $0, $v0	# new fraction s3 = -other.num/other.den
	
	add	$a0, $0, $s0	# adding s0 with new fraction s3 == s0 - s1
	add	$a1, $0, $s3
	jal adding

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)

	jr	$ra

divide:
	#-------------------------------------------------------------
	sw	$ra, 0($sp)
	addi	$sp, $sp, -4
	
	add	$t0, $0, $a0
	add	$t1, $0, $a1
	
	add	$a0, $0, $t1
	jal	getDenominator
	add	$t2, $0, $v0	# t2 = other.den

	add	$a0, $0, $t1
	jal	getNumerator
	add	$t3, $0, $v0	# t3 = other.num

	add	$a0, $0, $t2	# new fraction s4 = other.den/ other.num
	add	$a1, $0, $t3
	jal	Fraction
	add	$s4, $0, $v0

	add	$a0, $0, $s0	# multiplying s0 with new fraction s4 == s0/s1
	add	$a1, $0, $s4	
	jal multiply

	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	
	jr	$ra
