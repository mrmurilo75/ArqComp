	.data
_sq:	.word	0:100
_nl:	.asciiz	"\n"
_msg:	.asciiz	"The result is "

	.text
_main:
	li	$v0, 5
	syscall			#read int
	move 	$s0, $v0	#save read into s0 (s0=upTo)
	li	$t0, 0
_loop:
	bge	$t0, $s0, _end
	mul	$t1, $t0, $t0
	sll	$t2, $t0, 2
	sw	$t1, _sq($t2)
	addi	$t0, $t0, 1
	j	_loop
_end:
	li	$s1, 0
	li	$t0, 0
_loop1:
	bge	$t0, $s0, _end1
	sll	$t1, $t0, 2
	lw	$t2, _sq($t1)
	add	$s1, $s1, $t2
	addi	$t0, $t0, 1
	j	_loop1
_end1:
	li	$v0, 4
	la	$a0, _msg
	syscall
	li	$v0, 1
	move 	$a0, $s1
	syscall
	li	$v0, 4
	la	$a0, _nl
	syscall
	li	$v0, 10
	syscall