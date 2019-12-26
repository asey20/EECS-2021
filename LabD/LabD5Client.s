	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4
	#------------------------------------------ fraction 1
	addi	$a0, $0, 3
	addi	$a1, $0, 8
	jal	Fraction
	add	$s0, $0, $v0 # s0 holds a
	#----------------------------------------- printFraction (fraction 1)
	add	$a0, $0, $s0
	jal printFraction
	#----------------------------------------- println
	jal println	
	#----------------------------------------- fraction 2
	addi	$a0, $0, 1	
	addi	$a1, $0, 2
	jal Fraction
	add	$s1, $0, $v0 # s1 holds a
	#----------------------------------------- printFraction (fraction 2)
	add 	$a0, $0, $s1
	jal printFraction
	#----------------------------------------- fraction(temp for set)
	addi	$a0, $0, 0
	addi	$a1, $0, 0
	jal Fraction
	add	$s2, $0, $v0
	#---------------------------------------- adding
	add	$a0, $0, $s0
	add	$a1, $0, $s1
	jal adding
	#---------------------------------------- println
	jal println
	#---------------------------------------- printFraction (adding)
	add	$a0, $0, $s2
	jal printFraction
	#---------------------------------------- multiply
	add	$a0, $0, $s0
	add	$a1, $0, $s1	
	jal multiply
	#---------------------------------------- println
	jal println
	#---------------------------------------- printFraction (multiply)
	add	$a0, $0, $s2
	jal printFraction
	#---------------------------------------- subtract
	add	$a0, $0, $s0
	add	$a1, $0, $s1
	jal subtract
	#---------------------------------------- println
	jal println	
	#---------------------------------------- printFraction (subtract)
	add	$a0, $0, $s2
	jal printFraction
	#---------------------------------------- divide
	add	$a0, $0, $s0
	add	$a1, $0, $s1
	jal divide
	#---------------------------------------- println
	jal println
	#---------------------------------------- printFraction (divide)
	add	$a0, $0, $s2
	jal printFraction
	#----------------------------------------
	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra
