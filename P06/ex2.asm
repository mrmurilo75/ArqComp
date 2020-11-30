	.data
_nl:	.asciiz "\n"
_msg1:	.asciiz "The result is "

	.text
_main: 
	li	$v0, 5
	syscall			#read int
	move	$s0, $v0	#save read int (s0 = upTo)
	li	$t0, 0		#(t0 = i) = 0
	li	$s1, 0		#(s1 = sum) = 0
_loop:
	bge	$t0, $s0, _end	#if( i>=upTo)break
	mul	$t1, $t0, $t0	#t1=i*i
	add	$s1, $s1, $t1	#sum = sum + t1
	addi	$t0, $t0, 1	#i++
	j	_loop		#loop
_end:
	li	$v0, 4
	la	$a0, _msg1
	syscall			#print msg1
	li	$v0, 1
	move	$a0, $s1
	syscall			#print int sum
	li	$v0, 4
	la	$a0, _nl
	syscall			#print \n
	li	$v0, 17
	li	$a0, 0
	syscall			#return 0
