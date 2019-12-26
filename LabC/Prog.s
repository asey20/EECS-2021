########################################################
#
#			Prog.s
#
########################################################
	.text
main:	sw	$ra, 0($sp)
	addi	$sp, $sp, -4

	addi	$s0, $0, 34	# s0 = n
	addi	$v0, $0, 5
	syscall
	add	$s1, $0, $v0	# s1 = x

	slt	$t5, $s1, $s0
	beq	$t5, $0, part2

part1:	add	$a0, $0, $s1
	add	$a1, $0, $s0
	jal	compute
	add	$a0, $0, $v0
	addi	$v0, $0, 1
	syscall
	j	done

part2:	add	$a0, $0, $s1
	jal	gar
	add     $a0, $0, $v0
	addi    $v0, $0, 1
	syscall 
	j       done

done:	addi	$sp, $sp, 4
	lw	$ra, 0($sp)
	jr	$ra

#------------------------------compute
compute:mul	$t9, $a1, $a0
	sub	$t7, $a0, $t9
	add	$v0, $0, $t7
	
#------------------------------gar
gar:	addi	$t0, $0, 1	#t0 = 1
	beq	$a0, $t0, one	#if a0 = 1
	addi	$t1, $a0, 2	#t1 = 2
	div 	$a0, $t1
	mflo	$a0
	jal	gar
	addi	$t8, $a0, 1
	add	$v0, $0, $t8	
one:	addi	$v0, $0, 0
	
########################################################

