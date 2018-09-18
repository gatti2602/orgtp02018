	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"input\000"
	.align	2
$LC1:
	.ascii	"output\000"
	.align	2
$LC2:
	.ascii	"action\000"
	.align	2
$LC3:
	.ascii	"help\000"
	.align	2
$LC4:
	.ascii	"version\000"
	.data
	.align	2
$LC5:
	.word	$LC0
	.word	1
	.word	0
	.word	105
	.word	$LC1
	.word	1
	.word	0
	.word	111
	.word	$LC2
	.word	1
	.word	0
	.word	97
	.word	$LC3
	.word	0
	.word	0
	.word	104
	.word	$LC4
	.word	0
	.word	0
	.word	86
	.globl	memcpy
	.rdata
	.align	2
$LC6:
	.ascii	"i:o:a:hV\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,200,$ra		# vars= 152, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,200
	.cprestore 24
	sw	$ra,192($sp)
	sw	$fp,188($sp)
	sw	$gp,184($sp)
	move	$fp,$sp
	sw	$a0,200($fp)
	sw	$a1,204($fp)
	addu	$v0,$fp,32
	la	$v1,$LC5
	move	$a0,$v0
	move	$a1,$v1
	li	$a2,80			# 0x50
	la	$t9,memcpy
	jal	$ra,$t9
	lw	$v0,$LC6
	sw	$v0,112($fp)
	lw	$v0,$LC6+4
	sw	$v0,116($fp)
	lbu	$v0,$LC6+8
	sb	$v0,120($fp)
	sw	$zero,132($fp)
	sb	$zero,136($fp)
	addu	$v0,$fp,144
	move	$a0,$v0
	la	$t9,CommandCreate
	jal	$ra,$t9
	lw	$v1,200($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L18
	addu	$v0,$fp,144
	move	$a0,$v0
	la	$t9,CommandSetError
	jal	$ra,$t9
$L18:
	.set	noreorder
	nop
	.set	reorder
$L19:
	addu	$v1,$fp,112
	addu	$v0,$fp,132
	sw	$v0,16($sp)
	lw	$a0,200($fp)
	lw	$a1,204($fp)
	move	$a2,$v1
	addu	$a3,$fp,32
	la	$t9,getopt_long
	jal	$ra,$t9
	sw	$v0,128($fp)
	lw	$v1,128($fp)
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L20
	lb	$v0,136($fp)
	bne	$v0,$zero,$L20
	lw	$v0,128($fp)
	addu	$v0,$v0,-86
	sw	$v0,180($fp)
	lw	$v1,180($fp)
	sltu	$v0,$v1,26
	beq	$v0,$zero,$L29
	lw	$v0,180($fp)
	sll	$v1,$v0,2
	la	$v0,$L30
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	.cpadd	$v0
	j	$v0
	.rdata
	.align	2
$L30:
	.gpword	$L27
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L28
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L26
	.gpword	$L24
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L29
	.gpword	$L25
	.text
$L24:
	addu	$v0,$fp,144
	move	$a0,$v0
	lw	$a1,optarg
	la	$t9,CommandSetInput
	jal	$ra,$t9
	b	$L19
$L25:
	addu	$v0,$fp,144
	move	$a0,$v0
	lw	$a1,optarg
	la	$t9,CommandSetOutput
	jal	$ra,$t9
	b	$L19
$L26:
	la	$t9,CommandHelp
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sb	$v0,136($fp)
	b	$L19
$L27:
	la	$t9,CommandVersion
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sb	$v0,136($fp)
	b	$L19
$L28:
	addu	$v0,$fp,144
	move	$a0,$v0
	lw	$a1,optarg
	la	$t9,CommandSetEncodeOpt
	jal	$ra,$t9
	b	$L19
$L29:
	addu	$v0,$fp,144
	move	$a0,$v0
	la	$t9,CommandSetError
	jal	$ra,$t9
	b	$L19
$L20:
	lb	$v0,136($fp)
	beq	$v0,$zero,$L31
	sw	$zero,176($fp)
	b	$L17
$L31:
	addu	$v0,$fp,144
	move	$a0,$v0
	la	$t9,CommandHasError
	jal	$ra,$t9
	bne	$v0,$zero,$L32
	addu	$v0,$fp,144
	move	$a0,$v0
	la	$t9,CommandProcess
	jal	$ra,$t9
	b	$L33
$L32:
	la	$t9,CommandErrArg
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,176($fp)
	b	$L17
$L33:
	sw	$zero,176($fp)
$L17:
	lw	$v0,176($fp)
	move	$sp,$fp
	lw	$ra,192($sp)
	lw	$fp,188($sp)
	addu	$sp,$sp,200
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
