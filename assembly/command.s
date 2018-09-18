	.file	1 "command.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"Options:\n\000"
	.align	2
$LC1:
	.ascii	"  -V, --version    Print version and quit.\n\000"
	.align	2
$LC2:
	.ascii	"  -h, --help       Print this information.\n\000"
	.align	2
$LC3:
	.ascii	"  -i, --input      Location of the input file.\n\000"
	.align	2
$LC4:
	.ascii	"  -o, --output     Location of the output file.\n\000"
	.align	2
$LC5:
	.ascii	"  -a, --action     Program action: encode (default) or d"
	.ascii	"ecode.\n\000"
	.align	2
$LC6:
	.ascii	"Examples:\n\000"
	.align	2
$LC7:
	.ascii	"  tp0 -a encode -i ~/input -o ~/output\n\000"
	.align	2
$LC8:
	.ascii	"  tp0 -a decode\n\000"
	.text
	.align	2
	.globl	CommandHelp
	.ent	CommandHelp
CommandHelp:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	la	$a0,$LC0
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC1
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC2
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC3
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC4
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC5
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC6
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC7
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC8
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	CommandHelp
	.size	CommandHelp, .-CommandHelp
	.rdata
	.align	2
$LC9:
	.ascii	"Version: 0.1\n\000"
	.text
	.align	2
	.globl	CommandVersion
	.ent	CommandVersion
CommandVersion:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	la	$a0,$LC9
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	CommandVersion
	.size	CommandVersion, .-CommandVersion
	.align	2
	.globl	CommandCreate
	.ent	CommandCreate
CommandCreate:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$a0,40($fp)
	la	$t9,FileCreate
	jal	$ra,$t9
	lw	$v0,40($fp)
	addu	$v0,$v0,8
	move	$a0,$v0
	la	$t9,FileCreate
	jal	$ra,$t9
	lw	$v0,40($fp)
	sb	$zero,24($v0)
	lw	$v1,40($fp)
	li	$v0,2			# 0x2
	sb	$v0,25($v1)
	lw	$v0,40($fp)
	sw	$zero,16($v0)
	lw	$v0,40($fp)
	sw	$zero,20($v0)
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	CommandCreate
	.size	CommandCreate, .-CommandCreate
	.align	2
	.globl	CommandSetInput
	.ent	CommandSetInput
CommandSetInput:
	.frame	$fp,16,$ra		# vars= 0, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,16
	.cprestore 0
	sw	$fp,12($sp)
	sw	$gp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	sw	$a1,20($fp)
	lw	$v1,16($fp)
	lw	$v0,20($fp)
	sw	$v0,16($v1)
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	CommandSetInput
	.size	CommandSetInput, .-CommandSetInput
	.align	2
	.globl	CommandSetOutput
	.ent	CommandSetOutput
CommandSetOutput:
	.frame	$fp,16,$ra		# vars= 0, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,16
	.cprestore 0
	sw	$fp,12($sp)
	sw	$gp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	sw	$a1,20($fp)
	lw	$v1,16($fp)
	lw	$v0,20($fp)
	sw	$v0,20($v1)
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	CommandSetOutput
	.size	CommandSetOutput, .-CommandSetOutput
	.rdata
	.align	2
$LC10:
	.ascii	"encode\000"
	.align	2
$LC11:
	.ascii	"decode\000"
	.align	2
$LC12:
	.ascii	"Encoding option should be encode/decode\000"
	.text
	.align	2
	.globl	CommandSetEncodeOpt
	.ent	CommandSetEncodeOpt
CommandSetEncodeOpt:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	sw	$a1,44($fp)
	lw	$a0,44($fp)
	la	$a1,$LC10
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L11
	lw	$v1,40($fp)
	li	$v0,1			# 0x1
	sb	$v0,25($v1)
	b	$L10
$L11:
	lw	$a0,44($fp)
	la	$a1,$LC11
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L13
	lw	$v0,40($fp)
	sb	$zero,25($v0)
	b	$L10
$L13:
	la	$a0,__sF+176
	la	$a1,$LC12
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$v1,40($fp)
	li	$v0,1			# 0x1
	sb	$v0,24($v1)
$L10:
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	CommandSetEncodeOpt
	.size	CommandSetEncodeOpt, .-CommandSetEncodeOpt
	.align	2
	.globl	CommandHasError
	.ent	CommandHasError
CommandHasError:
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
	sw	$zero,8($fp)
	lw	$v0,24($fp)
	lb	$v0,24($v0)
	bne	$v0,$zero,$L17
	lw	$v0,24($fp)
	lb	$v1,25($v0)
	li	$v0,2			# 0x2
	beq	$v1,$v0,$L17
	b	$L16
$L17:
	li	$v0,1			# 0x1
	sw	$v0,8($fp)
$L16:
	lw	$v0,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	CommandHasError
	.size	CommandHasError, .-CommandHasError
	.align	2
	.globl	CommandSetError
	.ent	CommandSetError
CommandSetError:
	.frame	$fp,16,$ra		# vars= 0, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,16
	.cprestore 0
	sw	$fp,12($sp)
	sw	$gp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	lw	$v1,16($fp)
	li	$v0,1			# 0x1
	sb	$v0,24($v1)
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	CommandSetError
	.size	CommandSetError, .-CommandSetError
	.align	2
	.globl	CommandProcess
	.ent	CommandProcess
CommandProcess:
	.frame	$fp,40,$ra		# vars= 0, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,36($sp)
	sw	$fp,32($sp)
	sw	$gp,28($sp)
	sw	$s0,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$s0,40($fp)
	lw	$v0,40($fp)
	lw	$a0,40($fp)
	lw	$a1,16($v0)
	la	$t9,FileOpenForRead
	jal	$ra,$t9
	sb	$v0,24($s0)
	lw	$v0,40($fp)
	lb	$v0,24($v0)
	bne	$v0,$zero,$L20
	lw	$s0,40($fp)
	lw	$v0,40($fp)
	addu	$v0,$v0,8
	lw	$v1,40($fp)
	move	$a0,$v0
	lw	$a1,20($v1)
	la	$t9,FileOpenForWrite
	jal	$ra,$t9
	sb	$v0,24($s0)
$L20:
	lw	$v0,40($fp)
	lb	$v0,24($v0)
	bne	$v0,$zero,$L21
	lw	$s0,40($fp)
	lw	$a0,40($fp)
	la	$t9,_CommandEncodeDecode
	jal	$ra,$t9
	sb	$v0,24($s0)
	lw	$a0,40($fp)
	la	$t9,FileClose
	jal	$ra,$t9
	lw	$v0,40($fp)
	addu	$v0,$v0,8
	move	$a0,$v0
	la	$t9,FileClose
	jal	$ra,$t9
	b	$L22
$L21:
	lw	$a0,40($fp)
	la	$t9,FileClose
	jal	$ra,$t9
$L22:
	lw	$v0,40($fp)
	lb	$v0,24($v0)
	move	$sp,$fp
	lw	$ra,36($sp)
	lw	$fp,32($sp)
	lw	$s0,24($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	CommandProcess
	.size	CommandProcess, .-CommandProcess
	.rdata
	.align	2
$LC13:
	.ascii	"\n\000"
	.align	2
$LC14:
	.ascii	"Longitud de archivo no es multiplo de 4\n\000"
	.align	2
$LC15:
	.ascii	"Caracteres invalidos en archivo codificado: \000"
	.align	2
$LC16:
	.ascii	"%c\000"
	.text
	.align	2
	.globl	_CommandEncodeDecode
	.ent	_CommandEncodeDecode
_CommandEncodeDecode:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sb	$zero,40($fp)
	lw	$v0,72($fp)
	lb	$v1,25($v0)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L24
$L25:
	lw	$a0,72($fp)
	la	$t9,FileEofReached
	jal	$ra,$t9
	beq	$v0,$zero,$L27
	b	$L24
$L27:
	addu	$a0,$fp,24
	move	$a1,$zero
	li	$a2,3			# 0x3
	la	$t9,memset
	jal	$ra,$t9
	lw	$a0,72($fp)
	addu	$a1,$fp,24
	li	$a2,3			# 0x3
	la	$t9,FileRead
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v0,44($fp)
	beq	$v0,$zero,$L25
	addu	$v0,$fp,32
	addu	$a0,$fp,24
	lw	$a1,44($fp)
	move	$a2,$v0
	la	$t9,Encode
	jal	$ra,$t9
	lw	$v0,72($fp)
	addu	$v0,$v0,8
	addu	$v1,$fp,32
	move	$a0,$v0
	move	$a1,$v1
	li	$a2,4			# 0x4
	la	$t9,FileWrite
	jal	$ra,$t9
	lbu	$v0,40($fp)
	addu	$v0,$v0,1
	sb	$v0,40($fp)
	lbu	$v1,40($fp)
	li	$v0,18			# 0x12
	bne	$v1,$v0,$L25
	lw	$v0,72($fp)
	addu	$v0,$v0,8
	move	$a0,$v0
	la	$a1,$LC13
	li	$a2,1			# 0x1
	la	$t9,FileWrite
	jal	$ra,$t9
	sb	$zero,40($fp)
	b	$L25
$L24:
	lw	$v0,72($fp)
	lb	$v0,25($v0)
	bne	$v0,$zero,$L30
$L31:
	lw	$a0,72($fp)
	la	$t9,FileEofReached
	jal	$ra,$t9
	bne	$v0,$zero,$L30
	lw	$a0,72($fp)
	la	$t9,CommandHasError
	jal	$ra,$t9
	bne	$v0,$zero,$L30
	addu	$v0,$fp,32
	lw	$a0,72($fp)
	move	$a1,$v0
	li	$a2,4			# 0x4
	la	$t9,FileRead
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v0,44($fp)
	beq	$v0,$zero,$L31
	lw	$v1,44($fp)
	li	$v0,4			# 0x4
	beq	$v1,$v0,$L36
	la	$a0,__sF+176
	la	$a1,$LC14
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,72($fp)
	la	$t9,CommandSetError
	jal	$ra,$t9
	b	$L31
$L36:
	lbu	$v0,40($fp)
	addu	$v0,$v0,1
	sb	$v0,40($fp)
	lbu	$v1,40($fp)
	li	$v0,18			# 0x12
	bne	$v1,$v0,$L38
	addu	$v0,$fp,48
	lw	$a0,72($fp)
	move	$a1,$v0
	li	$a2,1			# 0x1
	la	$t9,FileRead
	jal	$ra,$t9
	sb	$zero,40($fp)
$L38:
	addu	$v0,$fp,32
	move	$a0,$v0
	addu	$a1,$fp,24
	la	$t9,Decode
	jal	$ra,$t9
	beq	$v0,$zero,$L39
	sb	$zero,49($fp)
	lbu	$v1,34($fp)
	li	$v0,61			# 0x3d
	bne	$v1,$v0,$L40
	lbu	$v0,49($fp)
	addu	$v0,$v0,1
	sb	$v0,49($fp)
$L40:
	lbu	$v1,35($fp)
	li	$v0,61			# 0x3d
	bne	$v1,$v0,$L41
	lbu	$v0,49($fp)
	addu	$v0,$v0,1
	sb	$v0,49($fp)
$L41:
	lw	$v0,72($fp)
	addu	$a0,$v0,8
	lb	$v1,49($fp)
	li	$v0,3			# 0x3
	subu	$v0,$v0,$v1
	addu	$a1,$fp,24
	move	$a2,$v0
	la	$t9,FileWrite
	jal	$ra,$t9
	b	$L31
$L39:
	la	$a0,__sF+176
	la	$a1,$LC15
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,52($fp)
$L43:
	lw	$v0,52($fp)
	sltu	$v0,$v0,4
	bne	$v0,$zero,$L46
	b	$L44
$L46:
	addu	$v1,$fp,32
	lw	$v0,52($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	la	$a0,__sF+176
	la	$a1,$LC16
	move	$a2,$v0
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$v0,52($fp)
	addu	$v0,$v0,1
	sw	$v0,52($fp)
	b	$L43
$L44:
	lw	$a0,72($fp)
	la	$t9,CommandSetError
	jal	$ra,$t9
	b	$L31
$L30:
	lw	$v0,72($fp)
	lb	$v0,24($v0)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	_CommandEncodeDecode
	.size	_CommandEncodeDecode, .-_CommandEncodeDecode
	.rdata
	.align	2
$LC17:
	.ascii	"Invalid Arguments\n\000"
	.text
	.align	2
	.globl	CommandErrArg
	.ent	CommandErrArg
CommandErrArg:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	la	$a0,__sF+176
	la	$a1,$LC17
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC0
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC1
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC2
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC3
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC4
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC5
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC6
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC7
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC8
	la	$t9,fprintf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	CommandErrArg
	.size	CommandErrArg, .-CommandErrArg
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
