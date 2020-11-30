	.data
_sq:	.word 0:100

	.text
_main:
	li 	$v0, 5
	syscall			#read int
	move 	$s0, $v0	#save read on s0 (s0=upTo)
	li	$t0, 0		#i=0 (t0=i)
_loop:
	bge	$t0, $s0, _end
	mul	$t1, $t0, $t0
	sll	$t2, $t0, 2
	sw	$t1, _sq($t2)
	addi	$t0, $t0, 1
	j	_loop
_end:
	li	$v0, 10
	syscall

	
	