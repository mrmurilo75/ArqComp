	.data
_label1:	.ascii "this ends on null"
_label2:	.asciiz	"I wonder whatll happen"

	.text

_main:	
	li	$t0, 0
	li	$t1, 100
_loop:
	beqz	$t1, _end
	subi	$t1, $t1, 1
	j	_loop
_end:
	li	$v0, 4
	la	$a0, _label1
	syscall
	la	$a0, _label2
	syscall
	li	$v0, 1
	move	$a0, $t1
	syscall
	li	$v0, 10
	syscall
	