	.file	1 "file.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	FileCreate
	.ent	FileCreate
FileCreate:
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
	lw	$v0,16($fp)
	sw	$zero,0($v0)
	lw	$v0,16($fp)
	sb	$zero,4($v0)
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	FileCreate
	.size	FileCreate, .-FileCreate
	.rdata
	.align	2
$LC0:
	.ascii	"rb\000"
	.align	2
$LC1:
	.ascii	"File Open Error; %s\n\000"
	.text
	.align	2
	.globl	FileOpenForRead
	.ent	FileOpenForRead
FileOpenForRead:
	.frame	$fp,48,$ra		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	sw	$gp,36($sp)
	sw	$s0,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$v0,52($fp)
	bne	$v0,$zero,$L19
	lw	$v1,48($fp)
	la	$v0,__sF
	sw	$v0,0($v1)
	b	$L20
$L19:
	lw	$s0,48($fp)
	lw	$a0,52($fp)
	la	$a1,$LC0
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,0($s0)
	lw	$v0,48($fp)
	lw	$v0,0($v0)
	bne	$v0,$zero,$L20
	la	$t9,__errno
	jal	$ra,$t9
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$a0,24($fp)
	la	$t9,strerror
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC1
	move	$a2,$v0
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
	b	$L18
$L20:
	sw	$zero,28($fp)
$L18:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	FileOpenForRead
	.size	FileOpenForRead, .-FileOpenForRead
	.rdata
	.align	2
$LC2:
	.ascii	"wb\000"
	.text
	.align	2
	.globl	FileOpenForWrite
	.ent	FileOpenForWrite
FileOpenForWrite:
	.frame	$fp,48,$ra		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	sw	$gp,36($sp)
	sw	$s0,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$v0,52($fp)
	bne	$v0,$zero,$L23
	lw	$v1,48($fp)
	la	$v0,__sF+88
	sw	$v0,0($v1)
	b	$L24
$L23:
	lw	$s0,48($fp)
	lw	$a0,52($fp)
	la	$a1,$LC2
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,0($s0)
	lw	$v0,48($fp)
	lw	$v0,0($v0)
	bne	$v0,$zero,$L24
	la	$t9,__errno
	jal	$ra,$t9
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$a0,24($fp)
	la	$t9,strerror
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC1
	move	$a2,$v0
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
	b	$L22
$L24:
	sw	$zero,28($fp)
$L22:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	FileOpenForWrite
	.size	FileOpenForWrite, .-FileOpenForWrite
	.rdata
	.align	2
$LC3:
	.ascii	"File Close Error; %s\n\000"
	.text
	.align	2
	.globl	FileClose
	.ent	FileClose
FileClose:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	lw	$v0,56($fp)
	lw	$v1,0($v0)
	la	$v0,__sF
	beq	$v1,$v0,$L28
	lw	$v0,56($fp)
	lw	$v1,0($v0)
	la	$v0,__sF+88
	beq	$v1,$v0,$L28
	b	$L27
$L28:
	sw	$zero,32($fp)
	b	$L26
$L27:
	lw	$v0,56($fp)
	lw	$a0,0($v0)
	la	$t9,fclose
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v1,24($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L29
	la	$t9,__errno
	jal	$ra,$t9
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	lw	$a0,28($fp)
	la	$t9,strerror
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC3
	move	$a2,$v0
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
	b	$L26
$L29:
	sw	$zero,32($fp)
$L26:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	FileClose
	.size	FileClose, .-FileClose
	.align	2
	.globl	FileRead
	.ent	FileRead
FileRead:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	sw	$a2,56($fp)
	sw	$zero,24($fp)
	lw	$a0,48($fp)
	la	$t9,FileEofReached
	jal	$ra,$t9
	bne	$v0,$zero,$L31
	lw	$v0,48($fp)
	lw	$a0,52($fp)
	li	$a1,1			# 0x1
	lw	$a2,56($fp)
	lw	$a3,0($v0)
	la	$t9,fread
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,48($fp)
	lw	$v0,0($v0)
	lhu	$v0,12($v0)
	srl	$v0,$v0,5
	andi	$v0,$v0,0x1
	beq	$v0,$zero,$L31
	lw	$v1,48($fp)
	li	$v0,1			# 0x1
	sb	$v0,4($v1)
$L31:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	FileRead
	.size	FileRead, .-FileRead
	.align	2
	.globl	FileEofReached
	.ent	FileEofReached
FileEofReached:
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
	lw	$v0,16($fp)
	lb	$v0,4($v0)
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	FileEofReached
	.size	FileEofReached, .-FileEofReached
	.align	2
	.globl	FileWrite
	.ent	FileWrite
FileWrite:
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
	sw	$a2,48($fp)
	lw	$v0,40($fp)
	lw	$a0,44($fp)
	li	$a1,1			# 0x1
	lw	$a2,48($fp)
	lw	$a3,0($v0)
	la	$t9,fwrite
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	FileWrite
	.size	FileWrite, .-FileWrite
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
