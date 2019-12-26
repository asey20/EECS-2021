		.globl printFraction		
		.globl	println
		#----------------------------
		.text
printFraction:	#----------------------------
		lw	$v0, 0($a0)
		add	$a0, $0, $v0
		addi	$v0, $0, 1
		syscall				# prints numerator
 
		addi	$a0, $0, \
		addi	$v0, $0, 11
		syscall				# prints \
		
		lw	$v0, 4($a0)
		add	$a0, $0, $v0
		addi	$v0, $0, 1
		syscall				# prints denominator

		jr	$ra
println:	#----------------------------
		addi	$a0, $0, 0xA
		addi	$v0, $0, 11
		syscall
		jr	$ra
