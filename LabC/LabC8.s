		.globl	println
		.globl	printVertical
		#-----------------------------
		.text
println:	#-----------------------------
		addi	$v0, $0, 11
		addi	$a0, $0, 0xA
		syscall
		jr	$ra
printVertical:	#-----------------------------
		addi	$sp, $sp, -8
		sw	$ra, 4($sp)
		sw	$a0, 0($sp)
		
		sgt	$t0, $a0, $0
		beq	$t0, $0, return
		addi	$t0, $0, 10		#t0 = 10
		div	$a0, $t0
		mflo	$a0
		jal	printVertical
		lw	$a0, 0($sp)
		addi	$t0, $0, 10
		div	$a0, $t0
		mfhi	$a0
		addi	$v0, $0, 1
		syscall
		jal println

return:		lw	$a0, 0($sp)
		lw	$ra, 4($sp)
		addi	$sp, $sp, 8
		jr	$ra

