	.data
_nl:	.asciiz	"\n"
size:	.word	10
array:	.word	32, 6, 51, 63, 22, 29, 91, 39, 66, 47

_main:
	.data
spc:	.asciiz	" "

	.text
	la	$a0, array
	lw	$a1, size($zero)
	jal	_bsort
	li	$t0, 0
	lw	$s0, size($zero)
while:
	bge	$t0, $s0, end_w
	li	$v0, 1
	sll	$t1, $t0, 2
	lw	$a0, array($t1)
	syscall
	li	$v0, 4
	la	$a0, spc
	syscall
	addiu	$t0, $t0, 1
	j	while
end_w:
	li	$v0, 4
	la	$a0, _nl
	syscall
	li	$v0, 10
	syscall

_bsort:
	.text
	li	$t0, 0
bs_while:
	bge	$t0, $a1, bs_end_w
	li	$t1, 0
bs_while1:
	sub	$t2, $a1, 1
	bge	$t1, $t2, bs_end_w1
	sll	$t2, $t1, 2
	add	$t2, $t2, $a0
	lw	$t3, ($t2)
	lw	$t4, 4($t2)
	bge	$t4, $t3, bs_cont
	sw	$t3, 4($t2)
	sw	$t4, ($t2)
bs_cont:
	addiu	$t1, $t1, 1
	j	bs_while1
bs_end_w1:
	addiu	$t0, $t0, 1
	j	bs_while
bs_end_w:
	jr	$ra
