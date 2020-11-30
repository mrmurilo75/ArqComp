#	Needs to fix bug on load _text (forgot to load and use as byte (aka char) and used as word (aka int) )
#	printing is working like a charm, just * fix it on _computeH *


	.data
_text:	.asciiz "This is the string to be used to generate the histogram"
_hist:	.word	0:26
_nl:	.asciiz	"\n"

	.text
_main:
	jal	_computeH
	jal	_printH
	li	$v0, 10
	syscall
		
_printH:
	.data
_msg_pH:.asciiz	" -> "

	.text
	li	$t0, 0
_loop_pH:
	li	$t1, 26
	bge	$t0, $t1, _end_pH
	addi	$a0, $t0, 97
	li	$v0, 11
	syscall
	la	$a0, _msg_pH
	li	$v0, 4
	syscall
	sll	$t1, $t0, 2
	lw	$a0, _hist($t1)
	li	$v0, 1
	syscall
	la	$a0, _nl
	li	$v0, 4
	syscall
	addiu	$t0, $t0, 1
	j	_loop_pH
_end_pH:
	jr	$ra

_computeH:
	li	$t0, 0
_loop_cH:
	lb	$t1, _text($t0)
	beqz	$t1, _end_cH
	li	$t2, 'A'
	blt	$t1, $t2, _cont_cH
	li	$t2, 'Z'
	bgt	$t1, $t2, _cont_cH
	subi	$t2, $t1, 65
	sll	$t2, $t2, 2
	lw	$t3, _hist($t2)
	addiu	$t3, $t3, 1
	sw	$t3, _hist($t2)
_cont_cH:
	li	$t2, 'a'
	blt	$t1, $t2, _cont2_cH
	li	$t2, 'z'
	bgt	$t1, $t2, _cont2_cH
	subi	$t2, $t1, 97
	sll	$t2, $t2, 2
	lw	$t3, _hist($t2)
	addiu	$t3, $t3, 1
	sw	$t3, _hist($t2)
_cont2_cH:
	addiu	$t0, $t0, 1
	j	_loop_cH
_end_cH:
	jr	$ra
