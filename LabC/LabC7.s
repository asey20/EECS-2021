		.globl println
		.globl isPrime
		#------------------------------
		.text
println:	#------------------------------
		add $v0, $0, 11
		add $a0, $0, 0xA
		syscall
		jr	$ra
isPrime:	#------------------------------
		add	$v0, $0, 1		#bolean result = true
		addi	$t0, $0, 2		#candidate = 2
		
		addi	$sp, $sp, -12		#reserve 3 regs
		sw	$a0, 8($sp)		#push a0
		sw	$ra, 4($sp)		#push ra
		sw	$t0, 0($sp)		#push candidate
		
loop:		beq	$v0, $0, return		#if result = false
 		slt	$t1, $t0, $a0
		beq	$t1, $0, return		#if candidate >= i
		add	$a1, $0, $t0
		jal	isfactor		#isfactor(a0, a1)
		nor	$v0, $v0, $0		#result = !isfactor(a0, a1)
		andi	$v0, $v0, 1
		lw	$t0, 0($sp)		#pop candidate
		addi	$t0, $0, 1		#increment candidate
		sw	$t0, 0($sp)		#push candidate
		lw	$a0, 8($sp)		#pop a0
		j	loop
return:		lw	$t0, 0($sp)		#pop t0
		lw	$ra, 4($sp)		#pop ra
		lw	$a0, 8($sp)		#pop a0
		addi	$sp, $sp, 12		#release reserved space
		jr	$ra
isfactor:	div	$a0, $a1		#t0 = a0 mod a1
		mfhi	$t0
		beq	$t0, $0, true	#if t0 = 0 return true
		addi	$v0, $0 , 0		#else false
		jr	$ra
true:		addi	$v0, $0, 1		#return true
		jr	$ra
