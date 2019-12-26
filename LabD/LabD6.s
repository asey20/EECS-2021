	.globl	SB
	.globl	append
	.globl	setCharAt
	.text
SB:	#----------------------	a0 = maximum size
	addi	$v0, $0, 9
	syscall
	sb	$0, 0($v0)	# null terminator
	jr	$ra
append:	#-----------------------a0 = reference, a1 = char
	lb 	$t0, 0($a0)

	beq	$t0, $0, flag
	sb	$a1, 1($a0)
	sb	$a1, 2($a0)
	j	end
flag:	sb	$a1, 0($a0)
	sb	$a1, 1($a0)	
end:
	jr	$ra

setCharAt:
	#------------------------ a0 = string, a1 = position, a2 = char
	
	beq	$a1, $0, first
	sb	$a2, 1($a0)
	j	end2
first:	sb	$a2, 0($a0)

end2:
	jr	$ra
