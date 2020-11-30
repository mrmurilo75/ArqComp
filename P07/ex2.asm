	.data
_sq:	.word 	0:100
_msg: 	.asciiz	"The result is "
_nl:	.asciiz	"\n"

	.text
_main:
	li	$v0, 5
	syscall
	move	$s0, $v0
	move	$a0, $v0
	jal	_store
	li	$v0, 4
	la 	$a0, _msg
	syscall
	move	$a0, $s0
	jal	_compute
	move	$a0, $v0
	li	$v0, 1
	syscall
	li	$v0, 4
	la	$a0, _nl
	syscall
	li	$v0, 10
	syscall

_compute:
	li	$t0, 0
	li	$t1, 0
_loop_com:
	bge	$t1, $a0, _end_com
	sll	$t2, $t1, 2
	lw	$t2, _sq($t2)
	add	$t0, $t0, $t2
	addiu	$t1, $t1, 1
	j	_loop_com
_end_com:
	move 	$v0, $t0
	jr	$ra

_store:
	li	$t0, 0
_loop_sto:
	bge	$t0, $a0, _end_sto
	mul	$t1, $t0, $t0
	sll	$t2, $t0, 2
	sw	$t1, _sq($t2)
	addiu	$t0, $t0, 1
	j	_loop_sto
_end_sto:
	jr	$ra

