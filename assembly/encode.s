	.file	1 "encode.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.data
	.align	2
	.type	encoding_table, @object
	.size	encoding_table, 64
encoding_table:
	.byte	65
	.byte	66
	.byte	67
	.byte	68
	.byte	69
	.byte	70
	.byte	71
	.byte	72
	.byte	73
	.byte	74
	.byte	75
	.byte	76
	.byte	77
	.byte	78
	.byte	79
	.byte	80
	.byte	81
	.byte	82
	.byte	83
	.byte	84
	.byte	85
	.byte	86
	.byte	87
	.byte	88
	.byte	89
	.byte	90
	.byte	97
	.byte	98
	.byte	99
	.byte	100
	.byte	101
	.byte	102
	.byte	103
	.byte	104
	.byte	105
	.byte	106
	.byte	107
	.byte	108
	.byte	109
	.byte	110
	.byte	111
	.byte	112
	.byte	113
	.byte	114
	.byte	115
	.byte	116
	.byte	117
	.byte	118
	.byte	119
	.byte	120
	.byte	121
	.byte	122
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	43
	.byte	47
	.align	2
	.type	encoding_table_size, @object
	.size	encoding_table_size, 4
encoding_table_size:
	.word	64
	.text
	.align	2
	.globl	DecodeChar
	.ent	DecodeChar
DecodeChar:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	move	$v0,$a0
	sb	$v0,8($fp)
	sb	$zero,9($fp)
$L2:
	lbu	$v0,9($fp)
	lw	$v1,encoding_table_size
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L5
	b	$L3
$L5:
	lbu	$v0,9($fp)
	lbu	$v1,encoding_table($v0)
	lb	$v0,8($fp)
	bne	$v1,$v0,$L4
	lbu	$v0,9($fp)
	sw	$v0,12($fp)
	b	$L1
$L4:
	lbu	$v0,9($fp)
	addu	$v0,$v0,1
	sb	$v0,9($fp)
	b	$L2
$L3:
	lb	$v1,8($fp)
	li	$v0,61			# 0x3d
	bne	$v1,$v0,$L7
	sw	$zero,12($fp)
	b	$L1
$L7:
	li	$v0,100			# 0x64
	sw	$v0,12($fp)
$L1:
	lw	$v0,12($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	DecodeChar
	.size	DecodeChar, .-DecodeChar
	.align	2
	.globl	Encode
	.ent	Encode
Encode:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	sw	$a1,28($fp)
	sw	$a2,32($fp)
	lw	$v0,24($fp)
	lbu	$v0,0($v0)
	sb	$v0,8($fp)
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	lbu	$v0,0($v0)
	sb	$v0,9($fp)
	lw	$v0,24($fp)
	addu	$v0,$v0,2
	lbu	$v0,0($v0)
	sb	$v0,10($fp)
	lbu	$v0,8($fp)
	srl	$v0,$v0,2
	sb	$v0,11($fp)
	lw	$v1,32($fp)
	lbu	$v0,11($fp)
	lbu	$v0,encoding_table($v0)
	sb	$v0,0($v1)
	lbu	$v0,8($fp)
	sll	$v0,$v0,6
	sb	$v0,12($fp)
	lbu	$v0,12($fp)
	srl	$v0,$v0,2
	sb	$v0,12($fp)
	lbu	$v0,9($fp)
	srl	$v0,$v0,4
	lbu	$v1,12($fp)
	or	$v0,$v1,$v0
	sb	$v0,12($fp)
	lw	$v0,32($fp)
	addu	$v1,$v0,1
	lbu	$v0,12($fp)
	lbu	$v0,encoding_table($v0)
	sb	$v0,0($v1)
	lw	$v0,32($fp)
	addu	$v1,$v0,2
	li	$v0,61			# 0x3d
	sb	$v0,0($v1)
	lw	$v0,32($fp)
	addu	$v1,$v0,3
	li	$v0,61			# 0x3d
	sb	$v0,0($v1)
	lw	$v1,28($fp)
	li	$v0,3			# 0x3
	bne	$v1,$v0,$L9
	lbu	$v0,10($fp)
	srl	$v0,$v0,6
	sb	$v0,13($fp)
	lbu	$v0,9($fp)
	sll	$v0,$v0,4
	sb	$v0,14($fp)
	lbu	$v0,14($fp)
	srl	$v0,$v0,2
	sb	$v0,14($fp)
	lbu	$v1,13($fp)
	lbu	$v0,14($fp)
	or	$v0,$v1,$v0
	sb	$v0,13($fp)
	lw	$v0,32($fp)
	addu	$v1,$v0,2
	lbu	$v0,13($fp)
	lbu	$v0,encoding_table($v0)
	sb	$v0,0($v1)
	lbu	$v0,10($fp)
	sll	$v0,$v0,2
	sb	$v0,15($fp)
	lbu	$v0,15($fp)
	srl	$v0,$v0,2
	sb	$v0,15($fp)
	lw	$v0,32($fp)
	addu	$v1,$v0,3
	lbu	$v0,15($fp)
	lbu	$v0,encoding_table($v0)
	sb	$v0,0($v1)
	b	$L8
$L9:
	lw	$v1,28($fp)
	li	$v0,2			# 0x2
	bne	$v1,$v0,$L8
	lbu	$v0,10($fp)
	srl	$v0,$v0,6
	sb	$v0,15($fp)
	lbu	$v0,9($fp)
	sll	$v0,$v0,4
	sb	$v0,14($fp)
	lbu	$v0,14($fp)
	srl	$v0,$v0,2
	sb	$v0,14($fp)
	lbu	$v1,15($fp)
	lbu	$v0,14($fp)
	or	$v0,$v1,$v0
	sb	$v0,15($fp)
	lw	$v0,32($fp)
	addu	$v1,$v0,2
	lbu	$v0,15($fp)
	lbu	$v0,encoding_table($v0)
	sb	$v0,0($v1)
$L8:
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	Encode
	.size	Encode, .-Encode
	.align	2
	.globl	Decode
	.ent	Decode
Decode:
	.frame	$fp,64,$ra		# vars= 24, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,60($sp)
	sw	$fp,56($sp)
	sw	$gp,52($sp)
	sw	$s0,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$a1,68($fp)
	sw	$zero,32($fp)
$L13:
	lw	$v0,32($fp)
	sltu	$v0,$v0,4
	bne	$v0,$zero,$L16
	b	$L14
$L16:
	lw	$v1,32($fp)
	addu	$v0,$fp,24
	addu	$s0,$v0,$v1
	lw	$v1,64($fp)
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	lb	$v0,0($v0)
	move	$a0,$v0
	la	$t9,DecodeChar
	jal	$ra,$t9
	sb	$v0,0($s0)
	lw	$v1,32($fp)
	addu	$v0,$fp,24
	addu	$v0,$v0,$v1
	lbu	$v1,0($v0)
	li	$v0,100			# 0x64
	bne	$v1,$v0,$L15
	sw	$zero,40($fp)
	b	$L12
$L15:
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L13
$L14:
	lbu	$v0,24($fp)
	sll	$v0,$v0,2
	sb	$v0,36($fp)
	lbu	$v0,25($fp)
	srl	$v0,$v0,4
	sb	$v0,37($fp)
	lbu	$v1,36($fp)
	lbu	$v0,37($fp)
	or	$v0,$v1,$v0
	sb	$v0,36($fp)
	lw	$v1,68($fp)
	lbu	$v0,36($fp)
	sb	$v0,0($v1)
	lbu	$v0,25($fp)
	sll	$v0,$v0,4
	sb	$v0,36($fp)
	lbu	$v0,26($fp)
	srl	$v0,$v0,2
	sb	$v0,37($fp)
	lbu	$v1,37($fp)
	lbu	$v0,36($fp)
	or	$v0,$v1,$v0
	sb	$v0,37($fp)
	lw	$v0,68($fp)
	addu	$v1,$v0,1
	lbu	$v0,37($fp)
	sb	$v0,0($v1)
	lbu	$v0,26($fp)
	sll	$v0,$v0,6
	sb	$v0,36($fp)
	lw	$v0,68($fp)
	addu	$a0,$v0,2
	lbu	$v1,36($fp)
	lbu	$v0,27($fp)
	or	$v0,$v1,$v0
	sb	$v0,0($a0)
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
$L12:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,60($sp)
	lw	$fp,56($sp)
	lw	$s0,48($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	Decode
	.size	Decode, .-Decode
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
