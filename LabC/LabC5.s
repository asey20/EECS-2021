		.globl	MAX
		.globl	SIZE
		.globl	getCount
		.globl	setCount
		.globl	println
		#----------------------------
		.data
MAX:		.word	2147483647;
SIZE:		.byte	32;
count:		.word	0;
		#----------------------------
		.text
getCount:	#----------------------------
		lw	$v0, count($0)
		jr	$ra
setCount:	#----------------------------
		sw	$v0, count($0)
		jr	$ra
println:	#----------------------------
		addi	$a0, $0, 0xA
		addi	$v0, $0, 11
		syscall
		jr	$ra
